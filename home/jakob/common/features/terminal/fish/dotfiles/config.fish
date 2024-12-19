#if status is-login
#    if uwsm check may-start && uwsm select
#        exec systemd-cat -t uwsm_start uwsm start default
#    end
#end

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

function lfcd --description "lf but it changes directory"
    set tmp (mktemp)
    lf --last-dir-path="$tmp" $argv
    if test -f $tmp
        set dir (cat $tmp)
        rm -f $tmp
        if test -d $dir -a $dir != (pwd)
            cd $dir
        end
    end
end

bind \ce '~/.scripts/tmux-sessionizer.sh'
function tm
    ~/.scripts/tmux-sessionizer.sh
end
bind \cn 'vim .'
function vi 
    vim . 
end

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
alias lg='lazygit'
