
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
