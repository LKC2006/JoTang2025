# Makefile&CMakeLists

## 写一份笔记，描述 从 C 源码到可执行文件的完整流程。
**见此文件夹下C_to_exe.md**

## 在我们提供的 GitHub 仓库中完成指定的 Task。

**任务1**
对compile_process/demo.c文件尝试进行预处理，编译，汇编，链接步骤，查看每一个步骤对应的输出文件（理解不同步骤的作用），并将每一步的结果保存

demo.c代码是通过循环输出一个数组的各项,在前面各项中间输出空格，并在最后一项后面换行(写的有点独特)
图片中demo.c   

预处理得demo.txt（或者demo.i,但是经过我的观察，文件内容没有区别）（实际上不产生新文件，不过可以通过txt查看）   
这一段上面的#include展开后非常长，但是下面还是没有什么改变
<a href="https://imgse.com/i/pV7V7jg"><img src="https://s21.ax1x.com/2025/10/05/pV7V7jg.png" alt="pV7V7jg.png" border="0" /></a>
编译得demo.s(即汇编语言)（变短了，因为#include展开结果中不需要的内容被舍弃了）
<a href="https://imgse.com/i/pV7VbuQ"><img src="https://s21.ax1x.com/2025/10/05/pV7VbuQ.png" alt="pV7VbuQ.png" border="0" /></a>
汇编得demo.o(即。obj机器语言，二进制)（用字符串的打开方式打开二进制文件获得乱码）
<a href="https://imgse.com/i/pV7VLHs"><img src="https://s21.ax1x.com/2025/10/05/pV7VLHs.png" alt="pV7VLHs.png" border="0" /></a>
链接最终得demo.exe，可执行文件，输出1 2 3 4 5

<a href="https://imgse.com/i/pV7VRHA"><img src="https://s21.ax1x.com/2025/10/05/pV7VRHA.png" alt="pV7VRHA.png" border="0" /></a>
文件附在文件夹中

**任务2**
对MakeFile文件夹中的多文件写一个简单的makefile，要求能通过在终端输入

make
得到最终多文件的可执行文件

make clean
能删除生成的 .o，.out文件

这一步是你理解 C/C++ 这类编译型语言 的基础哦～顺便也可以拿来和 Python 这类解释型语言 做个对比：
编译型语言：需要先经过“编译 → 汇编 → 链接”等步骤，把源代码翻译成机器能直接运行的二进制程序，执行速度快，但调试起来可能稍麻烦。
解释型语言：代码通常不需要提前编译，由解释器一行行读取、执行，开发效率高、调试灵活，但运行速度可能会慢一些。
:bulb: 思考一下：

## 为什么 C 程序通常跑得比 Python 快？



## 为什么很多团队会选择 “C++ 写核心逻辑，Python 负责调度” 的混合模式？



## 解释型语言真的就不用编译吗？（提示：其实 Python 也会先转成字节码 .pyc 再执行哟～）



将你的回答写进笔记里哦~

注：所有的文字提交时用 Markdown 文档，并取为清晰的命名，附带截图 + 说明。