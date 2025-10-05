# 黎康程的嵌入式学习笔记
## C语言 
**跟着B站翁恺老师和豆包老师学习，边学边写**   
**如图是九月十几号在C语言学习文件夹中的截图。**
<a href="https://imgse.com/i/pVRzGXd"><img src="https://s21.ax1x.com/2025/09/11/pVRzGXd.png" alt="pVRzGXd.png" border="0" /></a>   
**采取在实践中边写遇到无法解决的问题就边学的形式**
**如下是部分关于指针,结构体，函数和字符串的笔记**
```
#include <stdio.h>
#include <string.h>
struct 
{//这种特定形状的盒子
    int i;
    char a;//不可以在此处初始化
    int fir;
    int sec;
}t;
struct node{
   int num;
   char how[100];
};//表示一个类型，而非变量
typedef struct {
   int alpha;
   int beta[1000];
}sol;


int main(){
    char a;
    t.i=10;
    t.a='g';
    struct node r={200,"ssh"};//只有初始化的时候赋值char类型
    r.num=6;
    sol tres = {77,{1,2,3,4,5,3}};
    tres.beta[2]=99;
    printf("%d",tres.beta[2]);
    printf("%d",r.num);
    sol *here;
    here=&tres;
    printf("%d",(*here).beta[2]);//揭指针再访问
    printf("%d",here->beta[2]);
    int c=65;
    putchar(c);//输出ASCII码表中65对应的A
    int d=getchar() ;//输入的字符对应的数字为d
    printf("%d,%d",c,d);

}
```
```
#include <stdio.h>
/*
void pointer(int a[],int *b){
    printf("%d",*b);
}

int main(){
    char *s="welcome";//不可以修改，只读。表示这里有一个指针指向一个字节
    char s2[100];//数组的形式，可以修改
    int str[1000]={1,2,3,4,5};
    int *p=str;
    printf("%d\n%d\n",*p,p);
    printf("%s",s);//结果为welcome
    pointer(str,p);
}*/
/*指针初始化，char*指向随机的地方会导致程序不稳定
char**a指针指向指向其他的指针
char[][]二维数组的第二维需要有确定的长度值
char a[][10]标准的类似表格
char *a[],表示a[]每一项都是一个指针，指向外面的其他东西
*/
int main(){
    int i;
    scanf("%d",&i);
    char str[][10]={
        "January","February","March","April","May","June","July","August","September","October","November","December"
    };
    printf("%s",str[i-1]);//%s期望获取一个字符串的首地址，而不是单个字符
    return 0;
}
```
```#include<stdio.h>

void swap(int *a,int *b){//记录地址
    int temp=*a;
    *a=*b;
    *b=temp;//函数返回多个值，用指针返回。需要返回，取地址符
}
int main(){
    int x=10,y=20;
    int *p=&x;//*p为x的值，而p为x的地址
    x=6;
    //swap(&x,&y);
    printf("%d %d",*p,y);
}
```   
**在学习中，有的代码得到了优化，第一个代码时间复杂度过高，于是从**
```
#include<stdio.h>
#include<string.h>//需要提前表示是否是回文，从而避免判断每一个前缀
int divide(int a){
    int b;
    if(a%2==0){
        b=a/2;
    }
    else{
        b=(a-1)/2;
    }
    return b;
}
int sum(int a){
    int total=0;
    for(int i=0;i<a;i++){
        total+=i;
    }
    return total;
}
int main(){
    char str[2000001];
    int temp,count=0,fin=0;
    fgets(str,sizeof(str),stdin);
    
    for(int i=1;i<=(int)strlen(str);i++){
        if(str[0]!=str[i-1]){
            goto out;
        }
        temp=i;
        re:
        for(int j=0;j<temp/2;j++){
            
            if(str[j]!=str[temp-1-j]){
                fin+=count;
                count=0;
                goto out;    
            }
        }
        count++;
        temp=divide(temp);
        if(temp!=0){
            goto re;
        }
        fin=fin+count;
        count=0;
        out:;
    }
    printf("%d",fin);
    return 0;
}
```
**改到**
```
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
long long divide(long long a){
    long long b;
    if(a%2==0){
        b=a/2;
    }
    else{
        b=(a-1)/2;
    }
    return b;
}
int main(){
    static char str[2000100];
    long long p,fin=0,count=0,temp=0;
    static int is[2000100]={0};
    fgets(str,sizeof(str),stdin);
    is[0]=1;
    long long len=strlen(str);
    for(long long i=1;i<=len;i++){
        is[i-1]=1;
        for(long long j=0;j<i/2;j++){
            if(str[j]!=str[i-1-j]){
                is[i-1]=0;
                break;
            }
            
        }
    }
    for(long long i=1;i<=len;i++){
        temp=i-1;//i的长度对应的is[]中的项
        count=0;
        while(1){
            if(is[temp]==1){//这一次是，则看下一次。同时计数，除2.
                count++;
                if(temp!=0)
                    temp=divide(temp+1)-1;
                else{
                    fin+=count;
                    break;
                }
            }
            else{
                fin+=count;
                break;
            }
        }
    }
    printf("%lld",fin);
    return 0;
}
```
**有一定改善，但是时间复杂度还是很高，在之后的学习中可以继续优化**
***
## STM32
**跟着B站江协科技学习，下载配置了Keil5MDK（第一次下成C51了）。   
1，从淘宝购买了STM32的基础套件**
<a href="https://imgse.com/i/pVWx1BR"><img src="https://s21.ax1x.com/2025/09/14/pVWx1BR.jpg" alt="pVWx1BR.jpg" border="0" /></a>
**查询手册发现有如图外设如TIM，GPIO端口**
<a href="https://imgse.com/i/pVf8uGV"><img src="https://s21.ax1x.com/2025/09/15/pVf8uGV.png" alt="pVf8uGV.png" border="0" /></a>
**芯片结构在数据手册中**
<a href="https://imgse.com/i/pVf8lMF"><img src="https://s21.ax1x.com/2025/09/15/pVf8lMF.png" alt="pVf8lMF.png" border="0" /></a>
**2，HAL库，标准库：HAL库/标准库：当前主推的底层驱动库，功能全，相同外设对于统一API接口，屏蔽寄存器差异/早期STM32的官方库，每个外设对应一套独立的驱动函数，直接对寄存器操作**
### 概念
**嵌入式系统：一种嵌入在更大的设备中的专为特定功能设计的系统。常见的嵌入式设备有冰箱，洗衣机等**   
**单片机：集成芯片控制所需组件的微型计算机**
**MCU：国际通用的单片机称呼**
**STM32：ST公司制造的以ARM Cortex-M为核心的32位微型控制器（芯片），用途广泛**   
**外设：包括在芯片里面的用于支持拓展功能的硬件【和外界交互或者为芯片计算提供原料（如时间）】和外部外设如电机，显示屏**
**GPIO:通用IO口，可以输出，输入，有多种功能可以灵活配置，链接MCU和外部世界**   
**OLED:显示屏的一种，有机发光二极管**   
**EXTI:MCU内部的中断管理外设，检测到特定外部信号时中断程序**   
**TIM:即timer，计时器，用于支持处理时间相关的任务**
**PWM：一种数字信号（方波），可以通过快速切换高低电平的比例达到与模拟信号（连续变化）相似的控制效果**  
**ADC：将连续变化的模拟信号转化为单片机可以理解的离散数字信号的外设 让单片机可以感知**  
**DAC:将数字信号转换为模拟信号的外设，用于让单片机控制外部设备**   
**DMA:直接储存器访问，用于在外设和RAM之间和RAM和RAM之间传输数据的硬件。让CPU不用参与这种简单但是繁复的活动，提升CPU的工作效率**    
**串口：单片机的常用通信外设（硬件接口），可以实现串行传输，单条信号线逐位传输数据，有UART，USART等多种形式**
**同步/异步：数据沟通双方采用同一时钟信号协调传输节奏/双方无统一的时钟线，而是通过约定每秒传输的比特数和每帧数据前后添加的起始位，停止位来协调传输**  
**双工/半双工：双方同时都接收，发送数据/永远只由一方发送数据另一方接收，不能同时**
**串行/并行：以bit为单位，逐位通过单条线传输的方式/以byte或word位单位，多位同时通过多条信号线传输的方式**   
**USART:支持同步，异步通信的传输器，拓展了UART(仅异步通信)的功能**
**SPI:串行外设接口，用于单片机和外部外设的数据传输，同步通信，双工**  
**IIC:(I2C)广泛用于连接MCU和外部外设，同步通信，半双工。需要时钟线和数据线**
**寄存器：MCU内部集成的特殊储存单元，控制硬件功能，对寄存器读写就是配置硬件**
**API：预先定义的函数或者协议，用于隐藏对寄存器的操作从而简化开发**

### 实操   
**3.成功配置Keil5，创立工程**
<a href="https://imgse.com/i/pVWx28S"><img src="https://s21.ax1x.com/2025/09/14/pVWx28S.png" alt="pVWx28S.png" border="0" /></a>
**4，GPIO端口**   
**输入包括上拉输入，下拉输入，浮空输入，模拟输入。上拉输入通过接入vdd提供3.3V的默认高电平，而下拉输入则只是接入默认0V低电平的vss，浮空输入表示两者都不接入，完全依靠外部电路输入。和前面三个需要施密特触发器把模拟信号转化为数字信号不同，模拟输入直接输入模拟信号**   
**输出包括推挽输出，开漏输出和二者的复用模式。推挽输出分别利用P-MOS,N-MOS，可以分别输出高电平和低电平，可以利用芯片提供的3.3V电压驱动外设；开漏输出仅仅利用N-MOS达到形成短路或者低电平的效果，低电平时可以依靠外部电压形成电流驱动外设。二者的复用模式都是表示输出信号来自于片上外设而非芯片。**
**5，板载小灯闪烁：项目附在文件夹中**
**6&8，在对照手册用寄存器点亮LED的过程中，配置了RCC_APB2ENR（AHB 总线外设时钟使能寄存器）（使能时钟）,GPIOA_CRL（端口配置低寄存器）（控制输出模式以及输出的速度）,GPIOA_ODR（端口输出数据寄存器）
（控制输出电平）（项目附在文件夹中）**  
<a href="https://imgse.com/i/pVfMiJU"><img src="https://s21.ax1x.com/2025/09/15/pVfMiJU.png" alt="pVfMiJU.png" border="0" /></a>
**7，Keil5调试模式，查看寄存器的值**
<a href="https://imgse.com/i/pVfGb0H"><img src="https://s21.ax1x.com/2025/09/15/pVfGb0H.png" alt="pVfGb0H.png" border="0" /></a>
**9，流水灯项目附在文件夹中（第8项在第6项处）**
**10，多种方式流水灯，尝试通过仅通过寄存器点流水灯，工程附在文件夹中**
**11，STM32开发是嵌入式开发的一种，但是嵌入式开发还包括基于微处理器等的开发。STM32用途最为广泛，但是有的时候我们会需要开发更高要求的嵌入式系统，需要使用其他的芯片。嵌入式工程师岗位包括单片机工程师，物联网嵌入式工程师，Linux驱动工程师，Linux应用工程师，Qt工程师和芯片设计验证工程师。** 这部分太多看不懂的东西了
|  |编程语言|系统|工具|其他|  
|:----:|:-----:|:-----:|:-----:|:-----:|
|单片机工程师|C，C++，汇编语言|Linux，RTOS应用开发|Makefile,CMake|掌握特定协议|
|物联网嵌入式工程师|C，C++，Python|RTOS，Linux|通信技术如蓝牙|物联网协议，安全|
|嵌入式AI工程师|C，C++|Linux|图像采集，语音处理等|模型部署|
|Linux驱动工程师|C，汇编语言|Linux|示波器，内核配置工具等|阅读芯片手册，了解接口协议|
|Linux应用工程师|C，C++，Python|Linux|Makefile,CMake,GDB等|掌握协议|
|Qt工程师|C++，C|Linux，RTOS|Qt Creator,CMake,GDB|Qt模块，UI,数据库，嵌入式设备，各种适配|
|芯片验证设计工程师|SystemVerilog,Verilog,Python||仿真工具，波形查看器|芯片领域知识，测试能力，UVM|
### 一道题的记录
**一些情况非常简单，只需要构造电平差就可以解决，但是对于1，3，5，7，9号灯同时点亮的情况却因为LED不能反向点亮难以实现。于是尝试用不断循环快速切换的方式，终究感觉硬件的落实和软件的构思还是难以达到同样的效果。部分工程已经附在文件夹中**
<a href="https://imgse.com/i/pVfbbrt"><img src="https://s21.ax1x.com/2025/09/16/pVfbbrt.jpg" alt="pVfbbrt.jpg" border="0" /></a>
***