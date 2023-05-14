#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu"
theme='style'

# CMDs
lastlogin="`last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7`"
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

 # Options
hibernate=''
#shutdown='⏼'
shutdown=''
#reboot='⟳'
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
  rofi -dmenu \
    -p " $USER@$host" \
    -mesg " Uptime: $uptime" \
    -theme ${dir}/${theme}.rasi
  }

# Confirmation CMD
confirm_cmd() {
  rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
    -theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 2; lines: 1;}' \
    -theme-str 'element-text {horizontal-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -dmenu \
    -p 'Confirmation' \
    -mesg 'Are you sure?' \
    -theme ${dir}/${theme}.rasi
  }

# Ask for confirmation
confirm_exit() {
  echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}

do_shutdown() {
  systemctl poweroff
}

do_reboot() {
  systemctl reboot
}

do_hibernate() {
  systemctl hibernate
}

do_suspend() {
  systemctl suspend
}

do_logout() {
  exit-session
}

do_lock() {
  if [[ -x '/usr/local/bin/tlock' ]]; then
    tlock
  elif [[ -x '/usr/bin/betterlockscreen' ]]; then
    betterlockscreen -l
  elif [[ -x '/usr/bin/i3lock' ]]; then
    i3lock
  fi
}

# Execute Command
run_cmd() {
  selected="$(confirm_exit)"
  if [[ "$selected" == "$yes" ]]; then
    if [[ $1 == '--shutdown' ]]; then
      do_shutdown
    elif [[ $1 == '--reboot' ]]; then
      do_reboot
    elif [[ $1 == '--hibernate' ]]; then
      do_hibernate
    elif [[ $1 == '--suspend' ]]; then
      do_suspend
    elif [[ $1 == '--logout' ]]; then
      do_logout
    elif [[ $1 == '--lock' ]]; then
      do_lock
    fi
  else
    exit 0
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
  $shutdown)
    run_cmd --shutdown
    ;;
  $reboot)
    run_cmd --reboot
    ;;
  $hibernate)
#   run_cmd --hibernate
    do_hibernate
    ;;
  $suspend)
#   run_cmd --suspend
    do_suspend
    ;;
  $logout)
    run_cmd --logout
    ;;
  $lock)
#   run_cmd --lock
    do_lock
    ;;
esac
