#!/bin/bash

declare -A seen_windows

niri msg event-stream | while read -r line; do
    if echo "$line" | grep -q "Window opened or changed"; then
        app_id=$(echo "$line" | grep -oP 'app_id: Some\("\K[^"]+' | head -1)
        window_id=$(echo "$line" | grep -oP '\bid: \K[0-9]+' | head -1)

        [[ -n "${seen_windows[$window_id]}" ]] && continue

        case "$app_id" in
            "helium"|"helium-browser")
                seen_windows[$window_id]=1
                sleep 0.5 && niri msg action move-window-to-workspace --window-id "$window_id" 1 && niri msg action focus-workspace 1 &
                ;;
            "kitty")
                seen_windows[$window_id]=1
                sleep 0.5 && niri msg action move-window-to-workspace --window-id "$window_id" 2 && niri msg action focus-workspace 2 &
                ;;
            "mpv")
                seen_windows[$window_id]=1
                sleep 0.5 && niri msg action move-window-to-workspace --window-id "$window_id" 3 && niri msg action focus-workspace 3 &
                ;;
            "discord")
                seen_windows[$window_id]=1
                sleep 0.5 && niri msg action move-window-to-workspace --window-id "$window_id" 4 && niri msg action focus-workspace 4 &
                ;;
            "spotify")
                seen_windows[$window_id]=1
                sleep 0.5 && niri msg action move-window-to-workspace --window-id "$window_id" 4 && niri msg action focus-workspace 4 &
                ;;
        esac
    fi
done
