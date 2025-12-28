function y
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi --cwd-file="$tmp" $argv
    if test -f "$tmp"
        set -l cwd (cat "$tmp")
        rm "$tmp"
        if test -d "$cwd"
            cd "$cwd"
        end
    end
end

