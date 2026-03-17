if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias n "nvim"
alias c="clear"
alias tp="~/Programming/tmux-fzf.sh"
set -U fish_greeting

zoxide init fish | source

if not set -q TMUX
    set sessions (tmux list-sessions -F "#{session_name}" 2>/dev/null)
    if test (count $sessions) -gt 0
        tmux attach
    else
        tmux new -s main
    end
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
