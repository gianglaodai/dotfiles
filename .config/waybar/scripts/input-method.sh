#!/bin/sh

function show_input_method {
  ENGINE = $(fcitx5-remote -n)
  case $ENGINE in
    "keyboard-us")
      ICON="EN"
      ;;
    "unikey")
      ICON="VN"
      ;;
    *)
      ICON="?"
      ;;
  esac
  echo "{\"text\": \"$ICON\", \"tooltip\": \"$ENGINE\"}"
}

function toggle_input_method {
  ENGINE = $(fcitx5-remote -n)
  if ["$ENGINE" = "keyboard-us"]; then
    fcitx5-remote -s "unikey"
  else
    fcitx5-remote -s "keyboard-us"
  fi
}

if ["$1" == "toggle"]; then
  toggle_input_method
else 
  show_input_method
fi
