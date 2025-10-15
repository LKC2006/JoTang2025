# 黎康程的后端学习笔记 焦糖2025
## 写在前面
开学时，我在选择方向的的时候，发现自己对嵌入式（发现焦糖并没有）和后端比较感兴趣，对焦糖工作室也是心向往之，于是决定都尝试一下。在9月17日，我完成了一个工作室的嵌入式招新题，然后从C语言和Keil5转向了Java，Javaweb,从新从零基础开始。前面花了半个月在其他方向上也许算是一个劣势，但是我还是决定要尝试一下，证明自己的学习能力。

### Github地址 https://github.com/LKC2006/JoTang2025

**嵌入式的学习笔记一并提交**
***
## 科学上网  
**已经解决（手机+电脑），招新答题都在Github上了**
***
## markdown
**这几份学习笔记即本人学习成果。**   
(学的还不是很深入)
***
## Git
最开始建立仓库的时候还一不小心建错了地方，还找了半天才找到，删掉重建，把几个主要的代码文件夹都建了。主要就是git是个隐藏的文件，比较容易搞混忘记放在哪里,从而出现混乱.和GitHub上面的仓库连起来后以后就很方便了。
Idea那边就非常顺利了。
<a href="https://imgse.com/i/pV7EZZR"><img src="https://s21.ax1x.com/2025/10/05/pV7EZZR.png" alt="pV7EZZR.png" border="0" /></a>
Idea写后端项目的时候，每天提交推送。最后将后端项目的仓库作为子仓库加入招新题记录仓库（就是上面那个地址）

VScode，主要用于写CMakelists,Markdown等，同样一直通过提交推送同步到招新题记录仓库:
<a href="https://imgchr.com/i/pVqnNX6"><img src="https://s21.ax1x.com/2025/10/15/pVqnNX6.png" alt="pVqnNX6.png" border="0" /></a>
<a href="https://imgchr.com/i/pVquvsP"><img src="https://s21.ax1x.com/2025/10/15/pVquvsP.png" alt="pVquvsP.png" border="0" /></a>
这个VScode还有bug不写commit message就提交不上去，搜了一下才发现有这种bug。
***

## VMware虚拟机
这个我是听计算机导论的老师建议先装就在看到这道题之前先装了，没有留下截图，只能在此贴一张图了（这很不幸了）。过程一开始是Ubuntu下载极为缓慢，后来换了个地方就解决了，也许是科学上网的原因。其实整个过程跟着B站的教程来还是比较顺利的。这个虚拟机的界面分辨率不是很高。
首先下载终于免费的VMware（从Broadcom官网注册后下载），和最新的LTS的Ubuntu，在安装过后创建虚拟机（一开始忘记用管理员身份了，不过很快发现了这个问题），我分配了8GB内存和40GB的虚拟磁盘（有点低配但是官方推荐好像更低），之后安装操作系统也就是用上了Linux（还需要找一个.iso文件）就大功告成了。
之前在windows上面把AlibabaProtect.exe删掉可谓大费周章，之前一不小心下错了一个软件，直接出现了奇怪的壁纸，虚拟机像一个零成本的Linux电脑，就更加自由了。
<a href="https://imgse.com/i/pV5ykHs"><img src="https://s21.ax1x.com/2025/09/24/pV5ykHs.png" alt="pV5ykHs.png" border="0" /></a>

### 加分项

首先在虚拟机上下载ssh
<a href="https://imgchr.com/i/pVqnt6x"><img src="https://s21.ax1x.com/2025/10/15/pVqnt6x.png" alt="pVqnt6x.png" border="0" /></a>
在windows主机配置，跳过两次输入密码，再把公钥传给Ubuntu就得到了
<a href="https://imgchr.com/i/pVqnJpR"><img src="https://s21.ax1x.com/2025/10/15/pVqnJpR.png" alt="pVqnJpR.png" border="0" /></a>
这样就可以免密进入Ubuntu系统了


VScode Remote-ssh配置
插件默认就是下好的，更改一下配置文件
<a href="https://imgchr.com/i/pVqn3tJ"><img src="https://s21.ax1x.com/2025/10/15/pVqn3tJ.png" alt="pVqn3tJ.png" border="0" /></a>
然后连接，就可以在VScode上面访问虚拟机的文件了
<a href="https://imgchr.com/i/pVqn8h9"><img src="https://s21.ax1x.com/2025/10/15/pVqn8h9.png" alt="pVqn8h9.png" border="0" /></a>
***

## Makefile&CMakeLists
### 这个比较多，在另一份.md文件中
***
## Task0
配置Idea,在学信网信息出来过后申请了教育包并拿下一年了。Spring boot项目一出来就是层层叠叠的文件，一开始着实有点令人头大，但是实际项目的制作就在一个文件夹里面分层再定义类。感觉Java和C在结构上还是有区别，Java在一个项目内相互引用，单位更大，更灵活。
<a href="https://imgse.com/i/pV5y0DH"><img src="https://s21.ax1x.com/2025/09/24/pV5y0DH.png" alt="pV5y0DH.png" border="0" /></a>
这个Spring很有意思
<a href="https://imgse.com/i/pV5yn3T"><img src="https://s21.ax1x.com/2025/09/24/pV5yn3T.png" alt="pV5yn3T.png" border="0" /></a>

## 之后的学习笔记请见Task1-3（和X）的md文件，在后端的文件夹中
***

## 写在后面
一路走来，我感觉我真是有突破自己了，一开始看到这些招新题，我内心真的感觉没点基础真没法做，但是慢慢尝试起来，十天，二十天，也就能做出一定的完成度了。还好去尝试了一下，还挺有成就感的。这一次尝试让我对后端了解更加深入，也更有兴趣了，希望可以加入焦糖工作室，去继续探索计算机的世界。

**为什么要把嵌入式的笔记一同带上？**
因为我相信在招新过程中展现自己的学习能力和态度更加重要，毕竟这只是一个半月，和后面的时间相比太短了，学的也太浅了。