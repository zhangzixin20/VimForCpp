#!/usr/bin/sh
# 切换到 root 用户, 并且触发安装脚本
install_user_home=$HOME

function SwitchRoot() {
  echo "尝试切换到 root 用户, 请输入 root 密码:"
  su -c "curl -sLf https://gitee.com/HGtz2222/VimForCpp/raw/master/start.sh -o /tmp/start.sh && bash -x /tmp/start.sh $install_user_home"
}

# 切换到 root 用户
SwitchRoot

