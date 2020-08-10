# remap prefix from 'C-b' to 'C-f'
unbind C-b
set-option -g prefix C-f
bind-key C-f send-prefix

# Set copy mode to vi key bindings
setw -g mode-keys vi

# open new windows/panes in same dir
bind c new-window -c "#{pane_current_path}"
# split panes using | and -
bind v split-window -h -c "#{pane_current_path}"
bind s split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# b to go to previous window
bind-key b last-window

# switch panes using vim keys
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# choose session with o
bind-key o choose-session

# Enable mouse mode
set -g mouse on

# Renumber windows with f
bind f move-window -r

# reload config file
bind r source-file ~/.tmux.conf

# 12 hour clock
setw -g clock-mode-style 12

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

set-option -g default-terminal "screen-256color"
set-option -gw xterm-keys on

######################
### DESIGN CHANGES ###
######################
set -g status-justify left
set -g status-interval 2
set -g message-command-style fg=blue,bg=black
setw -g window-status-format " #F#I:#W#F "
setw -g window-status-current-format " #F#I:#W#F "
setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none
setw -g clock-mode-colour colour135
setw -g mode-style bg=colour6,fg=colour0,bold,fg=colour196,bg=colour238
set -g pane-border-style fg=black,bg=colour235,fg=colour238
set -g pane-active-border-style fg=brightred,bg=colour236,fg=colour51
set -g status-position bottom
set -g status-style bg=default,fg=colour12,bg=colour234,fg=colour137,dim
set -g status-left '#[fg=colour233,bg=colour241,bold] #S '
set -g status-right '#[fg=colour233,bg=colour241,bold] %m/%d #[fg=colour233,bg=colour245,bold] %I:%M%p '
set -g status-right-length 50
set -g status-left-length 20
setw -g window-status-current-style bg=colour0,fg=colour11,dim,fg=colour81,bg=colour238,bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '
setw -g window-status-style bg=green,fg=black,reverse,fg=colour138,bg=colour235,none
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
setw -g window-status-bell-style bold,fg=colour255,bg=colour1
set -g message-style fg=black,bg=yellow,bold,fg=colour232,bg=colour166
