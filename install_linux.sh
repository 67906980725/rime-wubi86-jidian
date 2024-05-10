#!/usr/bin/env bash

proj_path="$(dirname "$0")"
proj_path="$(realpath -e "$proj_path")"
install_by_path() {
  mkdir -p "$(dirname "$1")"
  #ln -s "$proj_path" "$1"
  #echo "已创建软链接: $1 -> $proj_path"
  cp -frT "$proj_path" "$1"
  echo "已复制: $proj_path 到 $1"
}
install_for_ibus() {
  install_by_path "$HOME/.config/ibus/rime"
}
install_for_fcitx5() {
  install_by_path "$HOME/.local/share/fcitx5/rime"
}

read -p "请选择你使用的输入法的序号: (1)ibus (2)fcitx5. 默认: 全部: " method
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
