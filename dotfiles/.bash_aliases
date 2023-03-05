#!/bin/bash

# system shortcuts
cdl() { cd "${1}"; ls; }
alias pstree='ps -ejH'
alias goodnight='sudo systemctl hibernate'

# applications
alias obsidian='~/Obsidian-0.15.9.AppImage >> /dev/null &'
alias snash='~/Fun/bashtest/snash/snash.sh'
alias clock="watch -n1 \"date '+%D %T'|figlet -k\""
alias ytdl='youtube-dl -x'
alias mp3-dl='youtube-dl -f bestaudio -x'
alias sudokusolver='cd ~/IdeaProjects/Sudoku/out/production/Sudoku/;java Sudoku'

# tum
alias sshtum='ssh ensel@lxhalle.in.tum.de -X'

# fun
alias advice='fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n 1) | l>'
alias tellme='fortune > tttemppp; (festival --tts tttemppp &); sleep 3; cat ttt>'
