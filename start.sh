#!/usr/bin/sh
install_user_home=$1

function InstallEnv() {
  # 检查操作系统版本是否 ok
  version_ok=`uname -a | awk '{ if (index($0, "el7.x86_64") > 0) print 1; else print 0;}'`
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
    # source /etc/bashrc
  fi
  echo "环境检测完毕!"
}

function DownloadVimConfig() {
  if [ -d ./VimForCpp ]; then
    rm -rf ./VimForCpp
  fi
  git clone https://gitee.com/HGtz2222/VimForCpp.git
  if [ $? -ne 0 ]; then
    echo "Vim 配置下载出错!"
    exit 1
  fi
  echo "Vim 配置下载完毕"
}

function DownloadPlugin() {
  if [ -d /tmp/vim-plugin-fork ]; then
    rm -rf /tmp/vim-plugin-fork
  fi
  target_dir=`pwd`"/VimForCpp/vim/bundle/"
  git clone https://gitee.com/HGtz2222/vim-plugin-fork.git /tmp/vim-plugin-fork
  mv /tmp/vim-plugin-fork/* $target_dir
  if [ $? -ne 0 ]; then
    echo "插件下载出错!"
    exit 1
  fi
  rm -rf /tmp/vim-plugin-fork/
  echo "插件下载完毕"
}

function LinkDir() {
  mkdir -p $install_user_home/.config
  rm -f $install_user_home/.config/nvim
  target_dir=`pwd`"/VimForCpp"
  ln -s $target_dir/vim $install_user_home/.config/nvim
  
  # 修改文件拥有者, 获得权限
  install_user=`echo $install_user_home | awk -F '/' '{print $3}'`
  chown -R $install_user:$install_user $target_dir
  chown -R $install_user:$install_user $install_user_home/.config/nvim
}
# 1. 检查并安装依赖的软件
InstallEnv
# 2. 从码云上下载 vim 配置
DownloadVimConfig
# 3. 从码云上下载依赖的插件
DownloadPlugin
# 4. 备份对应用户的 .vim 目录, 并且建立好连接, 并修改文件权限
LinkDir
echo '安装成功! 请手动执行 "source /etc/bashrc" 使 vim 配置生效!'
