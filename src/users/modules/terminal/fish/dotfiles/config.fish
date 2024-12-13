if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

function neovidecloseterminal
    neovide $argv
    exit
end

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

bind \ce '~/.scripts/tmux-sessionizer.sh'
bind \cn 'nvim .'
alias 'f=~/.scripts/tmux-sessionizer.sh'
alias 'naut=nautilus $(pwd)'
alias 'thun=thunar'
alias nv=nvim
alias neo="neovidecloseterminal"
alias gis='git status'
alias gia='git add --all'
alias tm='tmux attach'
alias tk='tmux kill-server'
alias ti='tmux new -s home'
alias cls=clear
