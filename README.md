# VimForCpp
## 特点
本项目特点:
>* 安装速度快(使用码云而不是github作为源). 网络畅通情况下, 2分钟内完成 vim 插件安装
>* 无需编译直接使用 YouComplete(直接下载预编译好的 ycm\_core.so). 
>* 一键式安装. 真正做到一键式安装. 不光能一键式安装 Vim 配置, 同时也会安装依赖的程序(包括 git, neovim)

## 支持环境
目前只支持 Centos7 x86_64. 后面会考虑 Ubuntu 等发行版的支持.

## 安装方法

在 shell 中执行指令: 

  curl -sLf https://gitee.com/HGtz2222/VimForCpp/raw/master/install.sh -o /tmp/install.sh && bash /tmp/install.sh

需要按照提示输入 root 密码. 您的 root 密码不会被上传, 请放心输入.

## 快速使用

### 普通模式下快捷键

```
  <F5>        快速运行(仅限单个文件)
  <F6>        打开函数列表
  <F7>        打开文件管理器
  <F8>        文档注释
  <F11>       检查文件编译错误(仅限 c++)
  <ctrl+j>    尝试匹配代码片段
  <ctrl+k>    跳转到函数声明/定义
  <ctrl+l>    返回到之前的代码
  <;+m>       高亮/取消高亮光标下的文本
  <zz>        快速折叠/取消折叠代码
```

### 插入模式下快捷键

```
  jk          回到普通模式并保存
  H J K L     快速移动窗口
  <space>T    快速切换.c文件和.h文件
  <space>e    以标签页打开文件
```

### 可视模式下快捷键

```
  <           向左缩进
  >           向右缩进
  S+(         给选中文本外面加一层括号(带空格)
  S+)         给选中文本外面加一层括号(不带空格)
```

## 关于图标显示
基于 vim-devicons 展示图标. 
vim-devicons依赖 Nerd Font 

<a href="https://github.com/ryanoasis/nerd-fonts">nerd-fonts</a>

如果使用 xshell 登录 Linux, 需要在 Windows 上安装 nerd-fonts. 并且在 xshell 中设置字体为 nerd-fonts. 但是由于 xshell 只支持等宽字体, 因此 nerd-fonts 中大部分字体是不能被 xshell 识别的. 
此处我找到了几个可以使用的 nerd-fonts. 其他的没有进一步测试.

<a href="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.otf">DroidSansMono</a>

其他字体可以参考文件  **xshell可用字体** 

