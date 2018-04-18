#!/usr/bin/sh
function PreWork() {
  echo "尝试切换到 root 用户, 请输入 root 密码:"
  su
}

function CheckArg() {
  if [ $HOME != "/root" ]; then
    echo "安装失败! 请先切换到 root 用户再执行安装脚本! "
    exit 1
  fi
  if [ $# -lt 1 ]; then
    echo "安装失败! 使用方法 ./install.sh [用户名]"
    exit 1
  fi
  user=$1
  if [ ! -d /home/$user ]; then
    echo "安装失败! 用户名: $user 不存在!"
    exit 1
  fi
  echo "参数检测完毕!"
}

function CheckEnv() {
  # 检查操作系统版本是否 ok
  version_ok=`uname -a | awk { if (index($0, "el7.x86_64") > 0) print 1; else print 0;}`
  if [ $version_ok -eq 0 ]; then
    echo "操作系统版本不支持! 目前只支持 centos7 x86_64!"
    exit 1
  fi
  # 安装 git
  git --version
  if [ $? -ne 0 ]; then
    echo "未安装 git, 尝试安装 git"
    yum -y install git
  fi
  git --version
  if [ $? -ne 0 ]; then
    echo "git 安装失败!"
    exit 1
  fi
  # 安装 neovim
  nvim --version
  if [ $? -ne 0 ]; then
    echo "未安装 neovim, 尝试安装 neovim"
    yum -y install epel-release
    yum install -y neovim.x86_64 python2-neovim.noarch
  fi
  nvim --version
  if [ $? -ne 0 ]; then
    echo "neovim 安装失败!"
    exit 1
  fi
  # 敲下 vim 命令实际启动了 nvim
  grep -q "nvim" /etc/bashrc
  if [ $? -ne 0 ]; then
    echo 'alias vim="nvim"' >> /etc/bashrc
    source /etc/bashrc
  fi
  echo "环境检测完毕!"
}

function DownloadPlugin() {
  cur_dir=`pwd`"/bundle/"
  git clone https://gitee.com/HGtz2222/vim-plugin-fork.git /tmp/
  mv /tmp/vim-plugin-fork/* $cur_dir
  if [ $? -ne 0 ]; then
    echo "插件下载出错!"
    exit 1
  fi
  rm -rf /tmp/vim-plugin-fork/
  echo "插件下载完毕"
}

function LinkDir() {
  user=$1
  today=`date +%m%d`
  mkdir -p /home/$user/.config
  root_dir=`pwd`
  ln -s $root_dir/vim /home/$user/.config/nvim
}

# 0. 需要先切换到 root 用户下
PreWork
# 1. 通过参数指定安装到哪个用户中
CheckArg $1
# 2. 检查并安装依赖的软件
CheckEnv
# 3. 从码云上下载依赖的插件
DownloadPlugin
# 4. 备份对应用户的 .vim 目录, 并且建立好连接, 并修改文件权限
LinkDir $1
