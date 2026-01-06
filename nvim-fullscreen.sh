#!/bin/bash

# install wmctrl using: <sudo apt install wmctrl>
# then make executable, symlink to chosen directory, example: ~/bin/nvim-fullscreen.sh
# and add to .bashrc: alias nvim="~/bin/nvim-fullscreen.sh"

nvim "$@" &
wmctrl -r :ACTIVE: -b add,fullscreen
wait    

