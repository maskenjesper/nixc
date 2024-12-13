if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

bind \ce '~/.scripts/tmux-sessionizer.sh'
bind \cn 'vim .'

# just global
function jj
    just -g $1
end
function jjl
    just -gl
end
function jjs
    just -g sync
end

# Aliases
alias dn='just -g devnew'
alias ls='ls --color'
alias nv=nvim
alias tm='tmux attach'
alias tk='tmux kill-server'
alias ti='tmux new -s home'
alias cls=clear
alias uwu='systemd-cat -t uwsm_start uwsm start default'
