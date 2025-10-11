# Task1-3.Javaweb后端
有很多记录都直接注释到对应的代码旁边了，感觉比较直观。
## Task 1
感觉和task0相比有着很大的跨度，从无到有，我同时跟着黑马程序员学习Java和Javaweb,如图是正在进行中。
<a href="https://imgse.com/i/pV5yBbd"><img src="https://s21.ax1x.com/2025/09/24/pV5yBbd.png" alt="pV5yBbd.png" border="0" /></a>   
Javaweb方面使用Springboot,Maven,MySQL,Mybatis等，感觉像是拼拼图，学完（当然还有非常非常重要的Java）就可以召唤task1，再用Postman调试（前端缺失是这样的）
部分听课时记录的东西，我也比较喜欢把很多笔记和思考以注释的方式写在程序里面，非常的直观，直接。
Maven跟着教程配还是很顺利的，当初给VScode配环境变量的时候还折腾了半天，后来配这些就熟练了。起码这件事情上有一点感觉了。
MySQL中基本的SQL语句不算很多，忘了就查也慢慢就会了。
Spring boot的项目一开始有被繁杂的目录和层叠的文件惊讶到，结果发现其实做项目的时候真正在用的就是一小部分，也可以做的非常有条理，非可有明确的分工。dao,controller,service之类的分层  
第一次尝试Mybatis项目，发现知识不太够，又回去学了几天Java，第一次建立项目的时候一个下午都找不到问题在哪里，就是无法输出，展示出数据库里面的数据。y以为springboot项目运行的时候没有尝试去找数据库，结果只是日志没显示出来，加上后面的代码写错了。感觉浪费了很多时间，前面的步骤漏了一个，后面是真的有点难找，还是得细心一点。给豆包问宕机了过后才发现了这个问题。
最后发现其实已经连上了，只是日志一直没有加上后面代码写错了，导致功能无法实现。还去闲鱼找人答的疑。   
这是终于查询了一下。
<a href="https://imgse.com/i/pVI0ptK"><img src="https://s21.ax1x.com/2025/09/26/pVI0ptK.png" alt="pVI0ptK.png" border="0" /></a>
知识真的很细杂，名称也特别多，要是变量乱命名就废了
在9.28晚上，终于初步完成了Task1，这已经是我开始学习后端的第十天了。
<a href="https://imgse.com/i/pVoAqGF"><img src="https://s21.ax1x.com/2025/09/28/pVoAqGF.png" alt="pVoAqGF.png" border="0" /></a>
<a href="https://imgse.com/i/pVoAL24"><img src="https://s21.ax1x.com/2025/09/28/pVoAL24.png" alt="pVoAL24.png" border="0" /></a>
9.29号晚上，完善了参数校对和数据库异常场景。感觉去B站上面学了像try,catch这样的方法好像懂了，但是在分层的项目里面实际用起来还是有一点绕，很多细节问题都得问豆包。到了最后我以为写好了，然后让豆包评价一下发现问题还是很多的，又改了几轮。比如说insert和判断是否有问题的先后问题，我没有留意。关于删除商品里面还可以调用select来查看是否存在我觉得是比较好的，可以区分出不同的情况。其他的User，Product Order两个表就先没有写这些东西了。
<a href="https://imgse.com/i/pVoa0Mj"><img src="https://s21.ax1x.com/2025/09/29/pVoa0Mj.png" alt="pVoa0Mj.png" border="0" /></a>
顺便补提交了一下修改
<a href="https://imgse.com/i/pVoasZq"><img src="https://s21.ax1x.com/2025/09/29/pVoasZq.png" alt="pVoasZq.png" border="0" /></a>

刚学习类和方法的时候有点迷糊，因为类实在是又能当结构体一样的，又可能当函数，方法也像函数。
new-堆内存，构造函数
springboot maven mysql mybatis
@PathVariable 是从 URL 路径中获取参数（如 user/delete/7 中的 7），
 而 @RequestParam 是从 URL 的查询参数（Query String）中获取参数（如 user/delete?id=7 中的 7）。

### 加分项   
简单配置了一下，包括application.properties,pom.xml里面的依赖，和一个配置类，然后就可以使用了。第一次查询没有缓存需要查询数据库，但是产生缓存，后面就缓存可以覆盖而没有调用数据库说明缓存成功。不缓存null防止错误的缓存出现在根本不存在数据的地方。
<a href="https://imgse.com/i/pV7pnmV"><img src="https://s21.ax1x.com/2025/10/04/pV7pnmV.png" alt="pV7pnmV.png" border="0" /></a>
这个配置类里面连@Bean都没有，比较独特，因为此处不需要修改默认的配置，从而也不需要修改自动创建的bean
需要注意的是要把每一个接口对应不同的key，要不然就混起来了没法用
目前后端还没上线，上线的时候这个可能还得改动。

***

## Task2

今天先从筛选下手，发现配置的xml文件总是会报错（图里面那些报错就都是），但是运行没有影响，接口测试也都是正确的。经过查找，发现这种有可能就是idea的误报了。又下载了mybatisX插件，那个鸟感觉好丑。本来想把价格区间上面的都整合到动态sql里面，奈何区间需要两个参数，最好是挨着传入，这样就让@ResquestBody接收的Product类型非常尴尬，于是分开了。同时又给Product那一路加上了ProductService接口，达到了controller调用service层接口，从而调用这个接口对应的implement实现类，最后再由实现类去调用mapper接口，完成和数据库的交流。结构更加明确。
<a href="https://imgse.com/i/pVTCUNF"><img src="https://s21.ax1x.com/2025/09/30/pVTCUNF.png" alt="pVTCUNF.png" border="0" /></a>
国庆节快乐！今天学了一部分的登录，JWT令牌的基本操作，还没有能够完整得实现登录的操作。感觉这一部分有更多东西都是在调用已经写好的程序。需要引入三个依赖，还需要打入一个至少32个字节的密钥，这一点和教程其实不太一样。项目的文件越来越多了，看着也是小有一点成就感。
<a href="https://imgse.com/i/pVTKFIA"><img src="https://s21.ax1x.com/2025/10/01/pVTKFIA.png" alt="pVTKFIA.png" border="0" /></a>
加入了filter和interceptor，完成了登录功能，感觉这一部分大量的调用了现成的方法。接下来需要去了解表关联逻辑。学习多表设计的时候才发现之前有时候删除数据表格报错的原因是因为有外键   
**发现一不小心把Task2的下单和Task3的登录记岔了，先学了登录了**
一对多是通过外键，将主表中的一项与从表中的外键相接，通过从表中外键项数据的重复达到主表一对从表多的效果。而多对多由于无法之间用外键实现，把外键安在任意一方都只能达到一对多的效果，需要一个中间表，就像下面这样。
|自身的id序号|对应A表一项的外键|对应B表一项的外键|
|:---:|:---:|:---:|
||||   
从而完成多对多，因为中间表A，B表两列数据都可以相互重复，随意对应。

这样的表之间的关联是根据现实中的关联设定的，可以让删除等操作相互关联，减少错误，增加效率
但是目前物理外键的具有很多弊端，实际上使用较少

用户下单商品和收藏商品都属于多对多，即一个商品可以被多个用户购买/收藏，一个用户也可以购买多个商品。   
下单。先是发现只有使用xml文件配置才可以达成同时改商品状态和添加订单的操作。同时，这样的xml配置文件又需要两个mapper中的方法，于是我选择在controller中调用两个service层中的方法。想好了这些，就比较顺利了。但是还有一个问题，我发现确保只有商品没有被售出的时候才能下单是一个问题，也需要处理
<a href="https://imgse.com/i/pVTTxsJ"><img src="https://s21.ax1x.com/2025/10/03/pVTTxsJ.png" alt="pVTTxsJ.png" border="0" /></a>
最后通过在mapper中专门搞出一个查询状态的方法解决，经过接口测试，达成了下单功能。

### 加分项
实现接入支付平台的方法。   
首先了解一下整个支付的流程。   
一般而言，需要和平台签约才可以直接这样使用。否则只能对接个人收款二维码，或者中间方*但容易跑路等*。
1，**前端发起支付，后端创建订单。**   
2，**后端调用支付***如微信支付宝***平台提供的SDK下单接口从而调用支付的API接口，**   
**通过商户签名，平台验证签名的方式防伪，微信是比对后端传来参数用密钥处理结果和签名是否一致，而支付宝此处是用公钥验证商家私钥加密的下单请求是否真实未被篡改。   
如果无误，支付平台返回支付所需的参数，拉起支付，前端调用付款界面。**   
3，**用户支付，支付平台再次跳转到前端支付结果页面，支付平台给前端提供一些状态参数***支付是否成功等，这些参数绝大多数时候正确，但是也有出错的可能性，因此这个仅仅作为参考，不能作为结果直接向用户展示支付是否成功*，**前端根据这些参数跳转到相应页面***即一般如支付中的页面***并向后端传递支付参数。此时支付结果只有第支付平台知道，支付平台会自动回调支付结果给后端***回调慢后端就会主动查询参数*，**同时再次用密钥验证，帮助商家确认结果是由支付平台传来且未被篡改，支付宝这一次变成用公钥加密，只有商户的私钥可以解开，微信则与前面类似。后端判断支付状态，更新状态，后端对比回调或查询的结果***即真实的结果***和前端传递的结果，不一致就会纠正显示结果，向用户通知实际支付情况，同时执行相应操作，如支付成功则改变数据库中订单状态。**   
4，**定时需要对比后端订单和支付平台账单来确保正确性。**   

再看一下开发的流程   
1，**注册商户账号，开通支付产品，获得支付接口权限，测试时使用沙箱~即不涉及资金流动的独立测试版本**（支付平台的接口地址，申请资质。获取相关参数，如商户号，密钥（微信对称，支付宝不对称）（或者证书，作用与密钥类似）**并向支付平台提供回调地址，用于得到支付平台返回的支付结果等**   
2，**将SDK**（支付平台提供的开发工具箱，已经集成了生成签名，调用支付API，解析返回结果，处理异常功能）**加入项目中，并配置参数**（如密钥，商户账号，平台支付接口地址）。**创建沙箱环境用于开发测试**  
3，**开发后端自身的创建订单接口，**（功能包括接受前端参数，内部逻辑判断订单是否合理，把订单加入数据库，并使用SDK生成签名并向支付平台发起请求，在支付后，用SDK处理平台返回结果得到支付是否成功的结果）
4，**开发可以验证SDK解析得到的回调参数的后端功能，分别对比各个参数和数据库中的是否一致，并向支付平台返回结果，开发业务逻辑**（如成功则更新订单状态，向前端返回结果）   
5，**细节问题，如支付平台回调失败或缓慢时需要向支付平台主动查询支付状态**（传入订单号，解析结果），**对数据库中的密码加密，异常处理等**   
6，**测试功能，使用单独的沙箱商户账号和沙箱密钥，保证逻辑没有漏洞，可以正常与支付平台协作。**   
7，**上线，更改配置，如商户号，密钥替换为正式的，配置正式的平台支付接口地址和回调地址。定时监控，如果有问题及时解决。**    
***
## Task3
登录见Task2中
登录以外，问题真是一个接着一个。首先理清逻辑，先鉴别用户是不是是否USER，是的话再去看解码的token里面的id和各项操作是否符合，如新增，删除商品时的publisher_id,查询如何返回200/201/401/403状态码后，就有了这样的雏形
```
    @RequestMapping("/product/create")
    public ResponseEntity<String> insert(@RequestBody Product product,
                                         @RequestHeader(value = "token", required = false) String token) throws SQLException {
        //鉴权
        Claims claims = JwtUtils.parseToken(token);
        Integer id = claims.get("id",Integer.class);
        String role = productService.selectRole(id);
        if(!StringUtils.hasLength(token)){
            return ResponseEntity.status(401).body("401未授权");
        }
        if(role.equals("USER")){//不可以用==比较地址
            if(product.getPublisher_id() != id){
                return ResponseEntity.status(403)
                        .body("403权限不足");
            }
        }

        int i = productService.insert(product);

        return ResponseEntity.status(201)
                .body(i + "Product(s) Created");

    }
```
但是问题并没有结束。还需要结合之前的拦截器来看，拦截器已经会拦截掉不存在token或者不合规的token了，所以实际上401的判断应该是在那里进行，可以删去这里面的401部分，controller层中只是判断一下是否越界。前面写的拦截器的try catch逻辑中由于必须用return false来结束这一段的判断逻辑，导致并不好直接返回状态码。加上这个东西需要的返回类型和正常的String不同，就更加麻烦了。
最后发现可以直接用这个东西加在拦截器里面。
`response.setStatus(401);`
所以还是得说这一块内容，调用的现成方法还是太多了。

问题还没有结束，发现这样查的学的有点半吊子，导致直接这样子会使拦截器里面返回401时result类型的JSON，而controller里面的403就只有一个403权限不足，应该要统一成result类型才行。不过这改一下body里面就好了
```
    //新增商品信息
    @RequestMapping("/product/create")
    public ResponseEntity<String> insert(@RequestBody Product product,
                                         @RequestHeader(value = "token") String token) throws SQLException {
        //鉴权
        Claims claims = JwtUtils.parseToken(token);
        Integer id = claims.get("id",Integer.class);
        String role = productService.selectRole(id);
        if(role.equals("USER")){//不可以用==比较地址
            if(product.getPublisher_id() != id){
                Result error = Result.fail("403权限不足");
                //目前仍然不是json且无法自动转换
                String notlogin = JSONObject.toJSONString(error);
                return ResponseEntity.status(403)
                        .body(notlogin);
            }
        }

        int i = productService.insert(product);
        Result success = Result.complete(i + "个商品201添加成功");
        String insert = JSONObject.toJSONString(success);
        return ResponseEntity.status(201)
                .body(insert);
    }
```
那么这个就是添加商品的controller部分了，剩下的就是把其他的也整一下这个鉴权功能，应该就不会有什么实质性的问题了。
之前的表格product_order里面只有product_id和buyer_id,删除订单鉴权的时候需要创造一个方法让controller调用来判断是不是卖家在取消订单，通过product_id查询product表中的publisher_id，再从token中获得操作者的id，和买卖双方比较，都不一样就要返回403了。还有一个逻辑就是下单的时候不能买自己的东西，这个相对容易。


### 加分项
这只需要用户填一下用户名和手机号就可以了，密码默认123456，角色默认USER,其实和添加新项没什么区别。另外需要注意拦截器不能把注册接口拦截了。中间判断手机号位数是11，不是就throw。   
管理员改用户的role和之前的鉴权挺类似的。
BCrypt这个本来想直接引入Spring Security,结果这个东西有默认认证，会自己生成一个密码，后续访问后端还得携带这个密码，导致这样子访问后端很不方便，解决方案暂时看起来没有头绪，于是打算单纯用BCrypt加密一下，不引入Spring Security了。只引入jbcrypt依赖的方法没有Spring Security杂七杂八的问题，基本上就是使用hashpw(),checkpw()两个方法，处理一下注册和登录就可以了，还是比较顺利的。

***
## TaskX

### 47.109.204.208 公网IP

整个过程高度依赖AI帮我分析，实在是进入知识盲区了，问题太多了，感觉卡到了很偏僻的bug。

使用阿里云的免费试用。使用PuTTY来操作服务器。
内容涉及jar包的打包上传，在服务器中配置Java环境，MySQL，Redis。
一开始，用maven打包的时候就遇到了问题，后来发现是项目使用JDK17，但是一开始给系统变量配置的是25，修改统一为25后还是有问题。
lombok的依赖连同它的各种方法（log等）全部报错，更新版本等方法都没有用。实在是被卡住了，问AI，AI的方法都尝试过了也解决不了，于是我就选择把这个全部注释掉了，也只能不输出日志，补全了getter/setter方法和构造方法。   
然后就可以打包为jar包了，第一次运行
<a href="https://imgchr.com/i/pVHp32d"><img src="https://s21.ax1x.com/2025/10/08/pVHp32d.png" alt="pVHp32d.png" border="0" /></a>
但是运行完了还需要配置其他的。Java和redis都是比较正常的，我使用了外部配置文件来覆盖原来jar包里面的application.properties（这样可以少传一次jar包偷个懒）但是在MySQL卡了很久。一直连不上数据库。
<a href="https://imgchr.com/i/pVHpM5D"><img src="https://s21.ax1x.com/2025/10/08/pVHpM5D.png" alt="pVHpM5D.png" border="0" /></a>
后来发现是服务器中登录方式必须要改为密码（这还是尝试过很多可能AI给出的结果）
然后终于是好了
<a href="https://imgchr.com/i/pVHpKUO"><img src="https://s21.ax1x.com/2025/10/08/pVHpKUO.png" alt="pVHpKUO.png" border="0" /></a>
整个过程真是跌宕起伏。说实话这个过程有点复杂，我基本上就是跟着步骤来，大部分操作我根本就没见过。第一次纯用这个命令行来操作操作系统，确实是挺快的，但是需要习惯一下。

第二天又出现问题，排查了半天发现数据库被人偷了，密码设置太简单123456，得重新建一下
<a href="https://imgchr.com/i/pVHdYZ9"><img src="https://s21.ax1x.com/2025/10/10/pVHdYZ9.png" alt="pVHdYZ9.png" border="0" /></a>
<a href="https://imgchr.com/i/pVHdNI1"><img src="https://s21.ax1x.com/2025/10/10/pVHdNI1.png" alt="pVHdNI1.png" border="0" /></a>
说来也是够神奇的，我这点破数据库都有人要，还要0.0068比特币，五六千。不过这数据库基本上是空的，删了重建，换个密码


redis始终有问题。是它的客户端lettuce的适配问题。感觉问题好偏僻，排查了好几个小时。最后用豆包的办法算是解决了redis，加了一个配置类。过程真的好离谱。
<a href="https://imgchr.com/i/pVHdwRK"><img src="https://s21.ax1x.com/2025/10/10/pVHdwRK.png" alt="pVHdwRK.png" border="0" /></a>
<a href="https://imgchr.com/i/pVHd0xO"><img src="https://s21.ax1x.com/2025/10/10/pVHd0xO.png" alt="pVHd0xO.png" border="0" /></a>

但是又出现了cannot serialize的问题，一波未平一波又起。和localdatetime有关的查询都用不了，其他的没问题
<a href="https://imgchr.com/i/pVHd6Zd"><img src="https://s21.ax1x.com/2025/10/10/pVHd6Zd.png" alt="pVHd6Zd.png" border="0" /></a>
又配置了Jackson.conf文件来解决localdatetime，但是还是有这样的问题

还需要配置redis的序列化器，这一块需要更深入了解一下。把这个当Task1附加题做的时候一下就搞好了，导致没深入想这些事情。配置好后就到了下一步。

发现这个服务器莫名其妙变成了redis的从接口，需要再设置一下。

最终测试了一些接口，应该是正常的。关闭我的PuTTY后也可以自己在服务器上运行。也算是上线了。
<a href="https://imgchr.com/i/pVHL2uT"><img src="https://s21.ax1x.com/2025/10/11/pVHL2uT.png" alt="pVHL2uT.png" border="0" /></a>

### 加分项
配置了防火墙
只开放了几个端口
<a href="https://imgchr.com/i/pVHpZK1"><img src="https://s21.ax1x.com/2025/10/08/pVHpZK1.png" alt="pVHpZK1.png" border="0" /></a>
<a href="https://imgchr.com/i/pVHpmb6"><img src="https://s21.ax1x.com/2025/10/08/pVHpmb6.png" alt="pVHpmb6.png" border="0" /></a>
两边都有进行设置如图。


前面防火墙一不小心把22接口忘了，后面用服务器自身的云助手补充了命令。同时，redis可以不用开。



***