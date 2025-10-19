#!/bin/bash

set -eo pipefail

IMAGE="lkc2006/platform-app:v1"
MYSQL_ROOT_PASSWORD="123456"

info() { echo -e "\033[1;34m[INFO] $*\033[0m"; }
success() { echo -e "\033[1;32m[SUCCESS] $*\033[0m"; }
error() { echo -e "\033[1;31m[ERROR] $*\033[0m" >&2; exit 1; }

main(){
    
    
    mkdir -p tradeplatformLKC
    cd tradeplatformLKC

    cat > docker-compose.yml <<EOF
version: '3.8'

services:
  mysql:
    image: mysql:8.0.30
    container_name: mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: "$MYSQL_ROOT_PASSWORD"
      MYSQL_DATABASE: tradeplatform
    networks:
        - platform-network
  redis:
    image: redis:8.2.2
    container_name: redis
    restart: always
    networks:
      - platform-network
  app:
    image: "$IMAGE"
    container_name: platform1
    restart: always
    ports:
        - "8080:8080"
    depends_on:
      - mysql
      - redis
    environment:
      SPRING_DATASOURCE_URL: jdbc:mysql://mysql:3306/tradeplatform?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true
      SPRING_DATASOURCE_USERNAME: root
      SPRING_DATASOURCE_PASSWORD: "$MYSQL_ROOT_PASSWORD"
      SPRING_REDIS_HOST: redis
      SPRING_REDIS_PORT: 6379
    networks:
      - platform-network

networks:
  platform-network:
    driver: bridge
EOF

docker compose up -d

sleep 10

docker exec mysql mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "
create database if not exists tradeplatform character set utf8mb4;
use tradeplatform;
CREATE TABLE \`user\` (
  \`id\` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  \`username\` varchar(50) NOT NULL COMMENT '用户名',
  \`password\` varchar(100) NOT NULL COMMENT '密码(BCrypt加密)',
  \`role\` varchar(20) NOT NULL COMMENT '角色:ADMIN/USER',
  \`phone\` varchar(20) DEFAULT NULL COMMENT '手机号',
  \`create_time\` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  \`update_time\` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (\`id\`),
  UNIQUE KEY \`uk_username\` (\`username\`) COMMENT '用户名唯一索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

CREATE TABLE \`product\` (
  \`id\` bigint NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  \`title\` varchar(100) NOT NULL COMMENT '商品标题',
  \`description\` text COMMENT '商品描述',
  \`type\` varchar(20) NOT NULL COMMENT '类型:二手物品/代取需求',
  \`price\` decimal(10,2) NOT NULL COMMENT '价格',
  \`status\` varchar(20) NOT NULL COMMENT '状态:未售出/已售出',
  \`publisher_id\` bigint NOT NULL COMMENT '发布者ID',
  \`publish_time\` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  \`update_time\` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (\`id\`),
  KEY \`idx_publisher\` (\`publisher_id\`) COMMENT '发布者索引',
  KEY \`idx_status_type\` (\`status\`,\`type\`) COMMENT '状态类型联合索引',
  CONSTRAINT \`fk_product_user\` FOREIGN KEY (\`publisher_id\`) REFERENCES \`user\` (\`id\`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品信息表';

CREATE TABLE \`product_order\` (
  \`id\` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  \`product_id\` bigint NOT NULL COMMENT '商品ID',
  \`buyer_id\` bigint NOT NULL COMMENT '买家ID',
  \`status\` varchar(20) NOT NULL COMMENT '订单状态:已下单/已取消',
  \`create_time\` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  \`update_time\` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (\`id\`),
  KEY \`idx_product\` (\`product_id\`) COMMENT '商品索引',
  KEY \`idx_buyer\` (\`buyer_id\`) COMMENT '买家索引',
  CONSTRAINT \`fk_order_product\` FOREIGN KEY (\`product_id\`) REFERENCES \`product\` (\`id\`) ON DELETE CASCADE,
  CONSTRAINT \`fk_order_user\` FOREIGN KEY (\`buyer_id\`) REFERENCES \`user\` (\`id\`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单信息表';

insert into \`user\` (username,password, role, phone, create_time, update_time) 
values ('you','\$2a\$10\$ot5f.IYkQO7WKI6Vo1cGpuT3Gz9iU6nYOb7ix6EkDRNd3.z0AXXpm','ADMIN','12345678901',now(),now());"
    
}

main