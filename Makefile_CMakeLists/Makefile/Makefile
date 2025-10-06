#指定编译器
CC = gcc

#编译选项
CFLAGS = -g -O2 -Wall -Werror

#生成调试信息-二级优化-大部分警告-警告视为错误

# TODO

HDR := include
SRC := lib

all: hello

hello: hello.o add.o mu.o
	gcc hello.o add.o mu.o -o hello.exe

hello.o: hello.c $(HDR)/add.h $(HDR)/mul.h
	gcc -c hello.c -o hello.o -I$(HDR)

add.o : $(SRC)/add.c $(HDR)/add.h $(HDR)/hello.h
	gcc -c $(SRC)/add.c -o add.o -I$(HDR)

mu.o : $(SRC)/mu.c $(HDR)/add.h $(HDR)/hello.h $(HDR)/mul.h
	gcc -c $(SRC)/mu.c -o mu.o -I$(HDR)

clean:
	rm -f *.o
