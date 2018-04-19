# VimForCpp
## 支持环境
Centos7 x86_64

## 安装方法

  curl -sLf https://gitee.com/HGtz2222/VimForCpp/raw/master/install.sh -o /tmp/install.sh && bash /tmp/install.sh

## 快速使用
### 普通模式下快捷键
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

### 插入模式下快捷键
jk          回到普通模式并保存
H J K L     快速移动窗口
<space>T    快速切换.c文件和.h文件
<space>e [filename] 以标签页打开文件
