# Task1-3.Javaweb
## Task 1
感觉和task0相比有着很大的跨度，从无到有，我同时跟着黑马程序员学习Java和Javaweb,如图是正在进行中。
<a href="https://imgse.com/i/pV5yBbd"><img src="https://s21.ax1x.com/2025/09/24/pV5yBbd.png" alt="pV5yBbd.png" border="0" /></a>   
Javaweb方面使用Springboot,Maven,MySQL,Mybatis等，感觉像是拼拼图，学完（当然还有非常非常重要的Java）就可以召唤task1，再用Postman调试（前端缺失是这样的）
部分听课时记录的东西，我也比较喜欢把很多笔记和思考以注释的方式写在程序里面，非常的直观，直接。
Maven跟着教程配还是很顺利的，当初给VScode配环境变量的时候还折腾了半天，后来配这些就熟练了。起码这件事情上有一点感觉了。
MySQL我还是比较惊奇这样就是一个数据库的。基本的SQL语句不算很多，忘了就查也慢慢就会了。
Spring boot的项目一开始有被繁杂的目录和层叠的文件惊讶到，结果发现其实做项目的时候真正在用的就是一小部分，也可以做的非常有条理，非可有明确的分工。dao,controller,service之类的分层  
第一次尝试Mybatis项目直接被拉回去学了几天Java，第一次建立项目的时候一个下午都找不到问题在哪里，就是无法输出，展示出数据库里面的数据。y以为springboot项目运行的时候没有尝试去找数据库，结果只是日志没显示出来，加上后面的代码写错了。感觉浪费了很多时间，前面的步骤漏了一个，后面是真的有点难找，还是得细心一点。给豆包问宕机了过后才发现了这个问题。
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
### Java(其实很多笔记都是写在代码中的，那样我感觉更加直观)
刚学习类和方法的时候有点迷糊，因为类实在是又能当结构体一样的，又可能当函数，方法也像函数。
方法是程序当中最小的执行单元
方法名字，第一个单词小写后面首字母大写
方法的调用 method（）
类似C中函数
Java文件最多只能包含一个public类，且类名必须与文件名相同，对于private类，可以有多个
方法的重载关系，仅关注方法名和形参。可以使得同样名字的方法适用于更多的情况
new-堆内存，构造函数
面向对象（拿/找）
类同时具有结构体和函数的特性
springboot maven mysql mybatis
Javabean类，不写main方法，描述一类事物
测试类，存在main方法，主
对象代表什么，就需要封装对应的数据。面向对象，人观摩，则是门的方法。面向对象封装数据和行为
Getter，Setter类似两个函数，写在含private的数据层中，需要的时候从外部调用。多用实例方法。
this,方法调用者的地址（一般是外部的调用方法的地址值），类似被隐藏的变量
构造方法和setter类似，setter更加灵活。可以重载，空参和有参
static静态变量，可以使得一个类的所有对象一次赋值。public static name;类.变量=   
静态方法,一般在工具类中,方便调用.私有化构造方法。不能访问非静态，从而没有this关键字
接口，方法的抽象，一种规则
IOC,控制反转
DI,依赖注入
Bean对象，IOC容器中创建管理的对象（这些暂时没搞懂）
抽象类，有抽象方法，只定义，不做事。
### Javaweb
Mybatis Java程序操作数据库
***
## Task2



***
## Task3


***