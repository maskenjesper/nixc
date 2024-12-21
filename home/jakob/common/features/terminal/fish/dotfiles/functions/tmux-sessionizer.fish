
function tmux-sessionizer
    if test (count $argv) -eq 1
        set selected $argv[1]
    else
        set selected (find ~/nixc ~/nixm ~/nixt ~/notes ~/todo ~/dev ~/.config -mindepth 0 -type d | fzf)
    end

    if test -z "$selected"
        exit 0
    end

    set selected_name (basename "$selected" | tr . _)
    set tmux_running (pgrep tmux)

    if test -z "$TMUX" -a -z "$tmux_running"
        echo "No tmux running"
        tmux new-session -s $selected_name -c $selected
        exit 0
    end

    if not tmux has-session -t=$selected_name ^/dev/null
        echo "Session exists"
        tmux new-session -ds $selected_name -c $selected
    end

    echo "Switch"

    tmux switch-client -t $selected_name
end
