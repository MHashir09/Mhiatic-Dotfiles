#!/usr/bin/env bash

SCRIPTS_DIR="$HOME/.config/rofi/scripts/"

# // --  If no argument is provided, list the options -- //
if [ -z "$@" ]; then
    echo -en "\0prompt\x1fMHIA'S WORKSTATION\n"
    echo -en "󰣆  Applications\n"
    echo -en "󰸉  Wallpaper Selector\n"
    echo -en "󰅌  Clipboard\n"
    echo -en "󰕾  Volume Controller\n"
    echo -en "󰃠  Brightness Controller\n"
    echo -en "⏻  Power Menu\n"
    echo -en "󰖟  Web Apps Manager\n"
    echo -en "󰁹  Battery Options"
else
    # // -- Handle the selection -- //
    case "$@" in
        "󰣆  Applications")
            coproc ( rofi -show drun > /dev/null 2>&1 )
            ;;
       "󰸉  Wallpaper Selector")
            coproc ( "$SCRIPTS_DIR/rofi-wallpaper-selector.sh" > /dev/null 2>&1 )
            ;;
        "󰅌  Clipboard")
            coproc ( "$SCRIPTS_DIR/rofi-clipboard.sh" > /dev/null 2>&1 )
            ;;
        "󰖩  WiFi Manager")
            coproc ( "$SCRIPTS_DIR/rofi-wifi-menu.sh" > /dev/null 2>&1 )
            ;;
        "󰕾  Volume Controller")
            coproc ( "$SCRIPTS_DIR/rofi-volume-selector.sh" > /dev/null 2>&1 )
            ;;
        "󰃠  Brightness Controller")
            coproc ( "$SCRIPTS_DIR/rofi-brightness-selector.sh" > /dev/null 2>&1 )
            ;;
        "⏻  Power Menu")
            (sleep 0.2 && "$SCRIPTS_DIR/rofi-powermenu.sh") &
            ;;
        "󰖟  Web Apps Manager")
            coproc ( "$SCRIPTS_DIR/webapp-manager.sh" > /dev/null 2>&1 )
            ;;
        "󰁹  Battery Options")
            coproc ( "$SCRIPTS_DIR/rofi-battery-power-menu.sh" > /dev/null 2>&1 )
            ;;
    esac
fi

# Made by community manager MHIA(MHashir09)
