#!/bin/bash
#####################################################
# Name: Bash CheatSheet for Mac OSX
# 
# A little overlook of the Bash basics
#
# Usage:
#
# Author: J. Le Coupanec
# Translator: Linka
# Date: 2014/11/04
#####################################################


# 0. 快捷键.

  # 移动光标相关
  CTRL+A  # 移动光标到行头
  CTRL+E  # 移动光标到行尾
  CTRL+B  # 向行头移动一个字符位
  CTRL+F  # 向行尾移动一个字符位

  CTRL+R  # 向行头搜索
  CTRL+S  # 向行尾搜索

  CTRL+XX # 光标在行头与行尾之间切换

  # 编辑指令相关
  DELETE  # 删除光标指示的字符
  CTRL+D  # 删除光标指示的字符 或者 退出当前会话
  CTRL+W  # 删除光标位前一个单词，如：ls --help -> ls --
  CTRL+K  # 删除光标位到行尾段的所有字符，配合CTRL+A可以删除整行字符
  CTRL+U  # 删除整行

  CTRL+P  # 上一条指令历史记录
  CTRL+N  # 下一条指令历史记录
  CTRL+Y  # 恢复最近一次删除的内容

  CTRL+T  # 调换前面两个字符，如：ls -> sl
  !!      # 重新执行上一条命令

  # 执行指令相关
  CTRL+J  # 与回车键相同
  CTRL+M  # 与回车键相同
  CTRL+O  # 与回车键相同, 然后显示下一行在历史文件中

  # 终止指令相关
  CTRL+C  # 终止当前输入指令
  CTRL+G  # 终止当前编辑行并触发控制台闹铃
  CTRL+Z  # 暂停当前指令，可以通过fg或bg指令恢复
  exit    # 退出当前会话

  # 额外操作
  CTRL+L  # 整理界面，将当前行显示在控制台的起始行


# 1. Bash 基础知识.

export              # 显示所有环境变量

echo $SHELL         # 显示当前使用的Shell程序
echo $BASH_VERSION  # 显示bash的版本号

bash                # 使用bash执行shell指令 (通过exit返回默认shell程序)
whereis bash        # 打印bash程序文件路径

clear               # 清屏


# 1.1. 文件指令.


ls                            # 列出当前目录所有文件
ls -l                         # 列出当前目录所有文件详细信息，zsh下一般映射为ll指令
ls -a                         # 列出当前目录所有文件，包括隐藏文件
ln -s <filename> <link>       # 为文件创建一个符号链接
touch <filename>              # 创建或更新指定文件
cat > <filename>              # 将标准输入流的内容保存到文件中
more <filename>               # 显示文件开头的一部分 (通过空格键移动 或 按下q键退出)
head <filename>               # 输出文件的前10行内容
tail <filename>               # 输出文件的最后10行内容 (常用的方法是使用-f选项，动态监听日志文件的变化)
emacs <filename>              # 使用emacs程序创建和编辑文件
mv <source> <target>          # 移动文件
cp <source> <target>          # 拷贝文件
rm <filename>                 # 删除文件
diff <filename1> <filename2>  # 对比两个文件，并显示其中差异的部分
wc <filename>                 # 文本统计，输出(line) (word) (character) (filename)的信息
chmod -options <filename>     # 更改文件权限，可通过ls -l查看文件当前权限
gzip <filename>               # 以gzip方式压缩文件
gunzip <filename>             # 以gzip方式解压文件
gzcat <filename>              # 不实际解压gzip文件来查看里面的内容
lpr <filename>                # 打印指定文件
lpq                           # 检查打印机队列
lprm <jobnumber>              # 从打印队列中移除指定任务
grep <pattern> <filenames>    # 在文件中搜索匹配内容
grep -r <pattern> <dir>       # 在目录中递归搜索匹配内容目录指令

genscript                     # converts plain text files into postscript for printing and gives you some options for formatting
dvips <filename>              # print .dvi files (i.e. files produced by LaTeX)


# 1.2. 目录指令.


mkdir <dirname>  # 创建目录
cd               # 返回home目录
cd <dirname>     # 变更工作目录
pwd              # 打印工作目录路径


# 1.3. SSH, 系统信息 & 网络指令.


ssh user@host            # 连接到主机的指定用户
ssh -p <port> user@host  # 使用特定端口连接到主机的指定用户
ssh-copy-id user@host    # 添加你的ssh密钥到主机中来启用无密码登录

whoami                   # 返回你的用户名
passwd                   # 变更你的密码
quota -v                 # 显示你的磁盘配额
date                     # 显示当前日期和时间
cal                      # 显示当月日历
uptime                   # 显示当前正常运行时间
w                        # 显示谁在线
finger <user>            # 显示指定用户信息
uname -a                 # 显示内核信息
man <command>            # 查看指定指令的用户手册
df                       # 显示磁盘占用情况
du <filename>            # 显示指定文件或目录占用情况 (du -s 显示当前文件夹的占用大小)
last <yourUsername>      # 列出指定用户的登录信息
ps -u yourusername       # 列出指定用户的进程信息
kill <PID>               # 通过PID终止某一进程
killall <processname>    # 终止名为processname的相关进程
top                      # 显示当前活动进程信息
bg                       # 列出暂停的或者后台任务; 恢复一个暂停的任务到后台
fg                       # 切换最近的任务到前台
fg <job>                 # 切换指定任务到前台

ping <host>              # ping指定主机地址
whois <domain>           # 获取指定域名的whois信息
dig <domain>             # 获取指定域名的dns信息
dig -x <host>            # 逆转查找主机地址
wget <file>              # 下载文件


# 2. 基础Shell编程.


# 2.1. Variables.


varname=value                # 定义变量
varname=value command        # 为特定子进程定义一个变量
echo $varname                # 检查变量的值
echo $$                      # 打印当前shell程序的进程ID
echo $!                      # 打印最近调用的后台任务进程ID
echo $?                      # 显示最近执行指令的退出状态码
export VARNAME=value         # 定义一个环境变量 (对于子进程同样有效)

array[0] = val               # 多种方式定义数组
array[1] = val
array[2] = val
array=([2]=val [0]=val [1]=val)
array(val val val)

${array[i]}                  # 显示数组指定索引的值. 如果不提供索引值, 默认为0
${#array[i]}                 # 显示指定数组元素值的长度. 如果不提供索引值, 默认为0
${#array[@]}                 # 显示数组长度

declare -a                   # 将变量看作数组
declare -f                   # 显示所有自定义函数，包括名称和函数体
declare -F                   # 仅显示函数名
declare -i                   # 将变量看作整数
declare -r                   # 将变量设为只读
declare -x                   # 将变量设为环境变量，类似于export

${varname:-word}             # 如果变量名存在或者不为空，返回它的值；否则返回word
${varname:=word}             # 如果变量名存在或者不为空，返回它的值；否则将其设为word并返回
${varname:?message}          # 如果变量名存在或者不为空，返回它的值；否则打印变量名，并提示信息终止当前指令或脚本
${varname:+word}             # 如果变量名存在或者不为空，返回它的值；否则返回空
${varname:offset:length}     # 提取子字符串

${variable#pattern}          # 如果变量值开头与模式匹配，删除最短匹配的部分返回剩余的部分
${variable##pattern}         # 如果变量值开头与模式匹配，删除最长匹配的部分返回剩余的部分
${variable%pattern}          # 如果变量值结尾与模式匹配，删除最短匹配的部分返回剩余的部分
${variable%%pattern}         # 如果变量值结尾与模式匹配，删除最长匹配的部分返回剩余的部分
filename="${fspec##*/}"      # 提取文件名
dirname="${fspec%/*}"        # 提取目录路径

${variable/pattern/string}   # 最长匹配的部分替换字符串. 仅替换第一个匹配的地方
${variable//pattern/string}  # 最长匹配的部分替换字符串. 所有匹配的地方都会替换

${#varname}                  # 返回变量值的长度

*(patternlist)               # 匹配0个或多个给定的模式
+(patternlist)               # 匹配1个或多个给定的模式
?(patternlist)               # 匹配0个或1个给定的模式
@(patternlist)               # 完全匹配1个给定的模式
!(patternlist)               # 匹配任何一种不是给定模式的内容

$(UNIX command)              # 指令替代: 执行该指令并返回到标准输出流中


# 2.2. Functions.
# The function refers to passed arguments by position (as if they were positional parameters), that is, $1, $2, and so forth.
# $@ is equal to "$1" "$2"... "$N", where N is the number of positional parameters. $# holds the number of positional parameters.

# 函数的参数可以通过如$1,$2的方式来获取
# $@ 相当于"$1" "$2"... "$N"，即函数参数列表。
# $# 可以获取传入参数的个数

functname() {
  shell commands
}

unset -f functname  # 删除一个函数定义
declare -f          # 显示当前会话中定义的所有函数


# 2.3. Flow Control.


statement1 && statement2  # 与操作
statement1 || statement2  # 或操作

-a                        # 在测试表达式中的与操作
-o                        # 在测试表达式中的或操作

str1=str2                 # str1 与 str2 匹配
str1!=str2                # str1 与 str2 不匹配
str1<str2                 # str1 小于 str2
str1>str2                 # str1 大于 str2
-n str1                   # str1 不为null (长度大于0)
-z str1                   # str1 为null (长度为0)

-a file                   # 文件存在
-d file                   # 文件存在并且是一个目录
-e file                   # 文件存在; same -a
-f file                   # 文件存在并且是一个常规文件 (i.e., 不是目录或者其他特殊类型文件)
-r file                   # 有可读权限
-r file                   # 文件存在并且不为空
-w file                   # 有可写权限
-x file                   # 有可执行权限, 如果是目录就是有可搜索权限
-N file                   # 在上次读取以后，文件修改过
-O file                   # 属于你的文件
-G file                   # 文件的用户组ID与你匹配
file1 -nt file2           # file1 比 file2 新
file1 -ot file2           # file1 比 file2 旧

-lt                       # 小于
-le                       # 小于等于
-eq                       # 等于
-ge                       # 大于等于
-gt                       # 大于
-ne                       # 不等于

if condition
then
  statements
[elif condition
  then statements...]
[else
  statements]
fi

for x := 1 to 10 do
begin
  statements
end

for name [in list]
do
  statements that can use $name
done

for (( initialisation ; ending condition ; update ))
do
  statements...
done

case expression in
  pattern1 )
    statements ;;
  pattern2 )
    statements ;;
  ...
esac

select name [in list]
do
  statements that can use $name
done

while condition; do
  statements
done

until condition; do
  statements
done


# 3. Command-Line Processing Cycle.（命令行处理循环）


# The default order for command lookup is functions, followed by built-ins, with scripts and executables last.
# There are three built-ins that you can use to override this order: `command`, `builtin` and `enable`.

command  # removes alias and function lookup. Only built-ins and commands found in the search path are executed
builtin  # looks up only built-in commands, ignoring functions and commands found in PATH
enable   # enables and disables shell built-ins

eval     # takes arguments and run them through the command-line processing steps all over again


# 4. Input/Output Redirectors.


cmd1|cmd2  # pipe; takes standard output of cmd1 as standard input to cmd2
> file     # directs standard output to file
< file     # takes standard input from file
>> file    # directs standard output to file; append to file if it already exists
>|file     # forces standard output to file even if noclobber is set
n>|file    # forces output to file from file descriptor n even if noclobber is set
<> file    # uses file as both standard input and standard output
n<>file    # uses file as both input and output for file descriptor n
<<label    # here-document
n>file     # directs file descriptor n to file
n<file     # takes file descriptor n from file
n>>file    # directs file description n to file; append to file if it already exists
n>&        # duplicates standard output to file descriptor n
n<&        # duplicates standard input from file descriptor n
n>&m       # file descriptor n is made to be a copy of the output file descriptor
n<&m       # file descriptor n is made to be a copy of the input file descriptor
&>file     # directs standard output and standard error to file
<&-        # closes the standard input
>&-        # closes the standard output
n>&-       # closes the ouput from file descriptor n
n<&-       # closes the input from file descripor n


# 5. Process Handling.


# To suspend a job, type CTRL+Z while it is running. You can also suspend a job with CTRL+Y.
# This is slightly different from CTRL+Z in that the process is only stopped when it attempts to read input from terminal.
# Of course, to interupt a job, type CTRL+C.

myCommand &  # runs job in the background and prompts back the shell

jobs         # lists all jobs (use with -l to see associated PID)

fg           # brings a background job into the foreground
fg %+        # brings most recently invoked background job
fg %-        # brings second most recently invoked background job
fg %N        # brings job number N
fg %string   # brings job whose command begins with string
fg %?string  # brings job whose command contains string

kill -l      # returns a list of all signals on the system, by name and number
kill PID     # terminates process with specified PID

ps           # prints a line of information about the current running login shell and any processes running under it
ps -a        # selects all processes with a tty except session leaders

trap cmd sig1 sig2  # executes a command when a signal is received by the script
trap "" sig1 sig2   # ignores that signals
trap - sig1 sig2    # resets the action taken when the signal is received to the default

disown <PID|JID>    # removes the process from the list of jobs

wait                # waits until all background jobs have finished


# 6. Tips and Tricks.


# set an alias
cd; nano .bash_profile
> alias gentlenode='ssh admin@gentlenode.com -p 3404'  # add your alias in .bash_profile

# to quickly go to a specific directory
cd; nano .bashrc
> shopt -s cdable_vars
> export websites="/Users/mac/Documents/websites"

source .bashrc
cd websites


# 7. Debugging Shell Programs.


bash -n scriptname  # don't run commands; check for syntax errors only
set -o noexec       # alternative (set option in script)

bash -v scriptname  # echo commands before running them
set -o verbose      # alternative (set option in script)

bash -x scriptname  # echo commands after command-line processing
set -o xtrace       # alternative (set option in script)

trap 'echo $varname' EXIT  # useful when you want to print out the values of variables at the point that your script exits

function errtrap {
  es=$?
  echo "ERROR line $1: Command exited with status $es."
}

trap 'errtrap $LINENO' ERR  # is run whenever a command in the surrounding script or function exists with non-zero status 

function dbgtrap {
  echo "badvar is $badvar"
}

trap dbgtrap DEBUG  # causes the trap code to be executed before every statement in a function or script
# ...section of code in which the problem occurs...
trap - DEBUG  # turn off the DEBUG trap

function returntrap {
  echo "A return occured"
}

trap returntrap RETURN  # is executed each time a shell function or a script executed with the . or source commands finishes executing
