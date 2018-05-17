#!/usr/bin/sh
install_user_home=$1
vimforcpp_home=$install_user_home/.VimForCpp

function InstallEnv() {
  # 检查操作系统版本是否 ok
  version_ok=`uname -a | awk '{ if (index($0, "el7.x86_64") > 0) print 1; else print 0;}'`
  if [ $version_ok -eq 0 ]; then
    echo "操作系统版本不支持! 目前只支持 centos7 x86_64!"
    exit 1
  fi
  # 安装 git
  git --version > /dev/null
  if [ $? -ne 0 ]; then
    echo "未安装 git, 尝试安装 git"
    yum -y install git
  fi
  git --version > /dev/null
  if [ $? -ne 0 ]; then
    echo "git 安装失败!"
    exit 1
  fi
  # 安装 neovim
  echo "尝试安装 neovim"
  yum -y install epel-release
  yum install -y neovim.x86_64 python2-neovim.noarch
  nvim --version
  if [ $? -ne 0 ]; then
    echo "neovim 安装失败!"
    exit 1
  fi
  # 敲下 vim 命令实际启动了 nvim
  touch $install_user_home/.bashrc
  grep -q "nvim" $install_user_home/.bashrc
  if [ $? -ne 0 ]; then
    echo 'alias vim="nvim"' >> $install_user_home/.bashrc
  fi
  # 安装 ctags
  yum -y install ctags
  echo "环境检测完毕!"
}

function DownloadVimConfig() {
  if [ -d $vimforcpp_home ]; then
    rm -rf $vimforcpp_home
  fi
  git clone https://gitee.com/HGtz2222/VimForCpp.git $vimforcpp_home
  if [ $? -ne 0 ]; then
    echo "Vim 配置下载出错!"
    exit 1
  fi
  echo "Vim 配置下载完毕"
}

function GetWhiteList() {
  # 分析 init.vim 中的插件列表, 获取到白名单内容, 并写入到 git 的对应文件中
  initvim=$1/vim/base.vim
  whitelist=$2/.git/info/sparse-checkout
  awk -F "[/\']" '{ if (index($1, "Plug") == 1) print $3; }' $initvim > $whitelist
  if grep -q "YouCompleteMe" $whitelist; then
    # 发现白名单中包含了 YCM, 则把对应的动态库的白名单也放进去.
    # TODO 后续考虑根据操作系统版本来决定下载哪个库
    echo "YCM.so" >> $whitelist
  fi
}

function DownloadPlugin() {
  bundle_dir=$vimforcpp_home/vim/bundle
  mkdir -p $bundle_dir
  cd $bundle_dir
  git init
  git remote add -f origin https://gitee.com/HGtz2222/vim-plugin-fork.git
  git config core.sparsecheckout true 
  GetWhiteList $vimforcpp_home $bundle_dir
  git pull origin master  
  cp $bundle_dir/YCM.so/el7.x86_64/* $bundle_dir/YouCompleteMe/third_party/ycmd/
  if [ $? -ne 0 ]; then
    echo "插件下载失败!"
    exit 1
  fi
  echo "插件下载完毕!"
}

function LinkDir() {
  # 先备份原有的 vim 配置文件
  today=`date +%m%d`
  mv $install_user_home/.vim $install_user_home/.vim.bak_${today} 2>/dev/null
  mv $install_user_home/.vimrc $install_user_home/.vimrc.bak_${today} 2>/dev/null
  mv $install_user_home/.ycm_extra_conf.py $install_user_home/.ycm_extra_conf.py.bak_${today} 2>/dev/null

  # 创建需要的软连接
  mkdir -p $install_user_home/.config
  rm -f $install_user_home/.config/nvim
  ln -s $vimforcpp_home/vim $install_user_home/.config/nvim
  ln -s $vimforcpp_home/vim $install_user_home/.vim
  ln -s $vimforcpp_home/vim/init.vim $install_user_home/.vimrc
  ln -s $vimforcpp_home/ycm_extra_conf.py $install_user_home/.ycm_extra_conf.py
  
  # 修改文件拥有者, 获得权限
  install_user=`echo $install_user_home | awk -F '/' '{print $3}'`
  chown -R $install_user:$install_user $vimforcpp_home
  chown -R $install_user:$install_user $install_user_home/.config/nvim
  chown -R $install_user:$install_user $install_user_home/.vim
  chown -R $install_user:$install_user $install_user_home/.vimrc
  chown -R $install_user:$install_user $install_user_home/.ycm_extra_conf.py
}
# 1. 检查并安装依赖的软件
InstallEnv
# 2. 从码云上下载 vim 配置
DownloadVimConfig
# 3. 从码云上下载依赖的插件
DownloadPlugin
# 4. 备份对应用户的 .vim 目录, 并且建立好连接, 并修改文件权限
LinkDir
echo '安装成功! 请手动执行 "source ~/.bashrc" 或者重启终端, 使 vim 配置生效!'
