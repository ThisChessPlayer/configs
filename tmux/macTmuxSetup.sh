#!/bin/bash

if [[ -z "$TMUX" ]]; then
	#start new tmux session, split windows properly
	tmux new-session -d -s session1
	tmux split-window -h -l 170
	tmux split-window -t 1 -h -l 85
	tmux split-window -t 0 -h -l 85
	tmux split-window -t 0 -v
	tmux split-window -t 0 -v

	#resize panes
	tmux resize-pane -t 0 -y 13
        tmux resize-pane -t 1 -y 4

	#start programs
	tmux send-keys -t 0 calcurse enter
	tmux send-keys -t 1 htop enter
	tmux send-keys -t 2 ls enter

	#attach tmux session
	tmux -2 attach-session -d
fi
