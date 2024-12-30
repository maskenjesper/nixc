function tmux-sessionizer --description "sessionizer"
    if test (count $argv) -eq 1
        set session_path $argv[1]
    else
        set session_path (find ~/nixc ~/nixt ~/dev ~/.config -mindepth 0 -type d | fzf)
    end

    if test -z "$session_path"
        exit 0
    end
    
    set session_name (basename "$session_path" | tr . _)

    tmux start-server

    if not tmux has-session -t=$session_name &> /dev/null
        tmux new-session -ds $session_name -c $session_path
    end

    if test -z "$TMUX"
        tmux attach-session -t $session_name
    else
        tmux switch-client -t $session_name
    end

end
