#!/usr/bin/env bash

proj_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
install_by_path() {
  mkdir -p "$(dirname "$1")"
  cp -frT "$proj_path" "$1"
  echo "已复制: $proj_path 到 $1"
}
install_for_ibus() {
  install_by_path "$HOME/.config/ibus/rime"
}
install_for_fcitx5() {
  install_by_path "$HOME/.local/share/fcitx5/rime"
}

if [ "$1" == "ibus" ]; then
  method=1
elif [ "$1" == "fcitx5" ]; then
  method=2
else
  read -p "请选择你使用的输入法的序号: (1)ibus (2)fcitx5. 默认: 全部: " method
fi

case $method in
1) echo
    install_for_ibus
    ;;
2) echo
    install_for_fcitx5
    ;;
*) echo
    install_for_ibus
    install_for_fcitx5
    ;;
esac
