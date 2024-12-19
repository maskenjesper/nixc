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

bind \co lfcd

bind \ce 'tmux-sessionizer'

bind \cn 'vim .'
function vv
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

function dn
    just -g devnew
end
function tm 
    tmux attach
end
function cls
    clear
end
function uwu
    systemd-cat -t uwsm_start uwsm start default
end
function lg
    lazygit
end
