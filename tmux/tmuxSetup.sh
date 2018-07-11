#!/bin/bash

if [[ -z "$TMUX" ]]; then
	#start new tmux session, split windows properly
	tmux new-session -d -s session1
	tmux split-window -h -l 170
	tmux split-window -t 1 -h -l 85
	tmux split-window -t 0 -v
	tmux split-window -t 0 -v

	#resize panes
	tmux resize-pane -t 0 -y 5
	#tmux resize-pane -t 3 -y 4

	#tmux resize-pane -t 0 -L 15
	#tmux resize-pane -t 1 -L 15
	#tmux resize-pane -t 2 -L 15
	#tmux resize-pane -t 3 -L 15
	#tmux resize-pane -t 5 -L 34

	#tmux resize-pane -t 0 -U 9
	#tmux resize-pane -t 1 -D 3
	#tmux resize-pane -t 2 -U 21
	#tmux resize-pane -t 3 -D 2
	
	#start programs
	tmux send-keys -t 0 htop enter enter
	tmux send-keys -t 3 ls enter

	#attach tmux session
	tmux -2 attach-session -d
fi
