#!/usr/bin/env bash

down() {
brightnessctl set 10%-
brightness=$(brightnessctl g)
dunstify -a "BRIGHTNESS" "Decreasing to $brightness%" -h int:value:"$brightness" -i display-brightness-symbolic -r 96000 -u normal
}

up() {
brightnessctl set 10%+
brightness=$(brightnessctl g)
dunstify -a "BRIGHTNESS" "Increasing to $brightness%" -h int:value:"$brightness" -i display-brightness-symbolic -r 96000 -u normal
}

case "$1" in
  up) up;;
  down) down;;
esac
