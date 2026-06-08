#!/bin/bash

SAVE_DIR="$HOME/Videos/ScreenRecordings"
PID_FILE="/tmp/screenrec.pid"
PAUSE_FILE="/tmp/screenrec.pause"

mkdir -p "$SAVE_DIR"

case "$1" in
  toggle)
    if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
      kill "$(cat "$PID_FILE")"
      rm -f "$PID_FILE" "$PAUSE_FILE"
      notify-send "Screen Recorder" "Recording stopped"
    else
      REGION=$(slurp) || exit 1
      OUTPUT="$SAVE_DIR/$(date +%Y-%m-%d_%H-%M-%S).mp4"
      wf-recorder -g "$REGION" -f "$OUTPUT" &
      echo $! > "$PID_FILE"
      notify-send "Screen Recorder" "Recording started"
    fi
    ;;

  pause)
    [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null || exit 1
    if [ -f "$PAUSE_FILE" ]; then
      kill -CONT "$(cat "$PID_FILE")"
      rm -f "$PAUSE_FILE"
      notify-send "Screen Recorder" "Recording resumed"
    else
      kill -STOP "$(cat "$PID_FILE")"
      touch "$PAUSE_FILE"
      notify-send "Screen Recorder" "Recording paused"
    fi
    ;;
esac
