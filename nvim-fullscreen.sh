#!/bin/bash

# install wmctrl using: <sudo apt install wmctrl>
# then make executable, symlink to chosen directory, example: ~/bin/nvim-fullscreen.sh
# and add to .bashrc: alias nvim="~/bin/nvim-fullscreen.sh"

nvim "$@" &
case "$XDG_SESSION_TYPE" in
    wayland)
        hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = "fullscreen", action = "set" })'
        ;;
    x11)
        wmctrl -r :ACTIVE: -b add,fullscreen
        ;;
    *)
        printf 'Unknown session type: %s\n' "$XDG_SESSION_TYPE" >&2
        exit 1
        ;;
esac
wait    

