function wp
    set STATE_DIR "$HOME/.local/state/wallpaper"
    set STATE_FILE "$STATE_DIR/state"

    mkdir -p $STATE_DIR

    set DAY_WALL "$HOME/Pictures/Wallpapers/F37-01-day.jpg"
    set NIGHT_WALL "$HOME/Pictures/Wallpapers/F37-01-night.jpg"

    switch $argv[1]
        case day
            set MODE day
        case night
            set MODE night
        case restore
            if test -f $STATE_FILE
                set MODE (cat $STATE_FILE)
            else
                set HOUR (date +%H)
                if test $HOUR -ge 7 -a $HOUR -lt 17
                    set MODE day
                else
                    set MODE night
                end
            end
        case '*'
            set HOUR (date +%H)
            if test $HOUR -ge 7 -a $HOUR -lt 17
                set MODE day
            else
                set MODE night
            end
    end

    echo $MODE > $STATE_FILE

    pgrep -x swww-daemon >/dev/null; or swww-daemon &
    sleep 0.3

    if test $MODE = day
        set WALL $DAY_WALL
    else
        set WALL $NIGHT_WALL
    end

    swww img $WALL --transition-type fade
    matugen image $WALL
end

