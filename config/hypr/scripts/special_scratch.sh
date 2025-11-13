SPECIAL=$(hyprctl -j monitors | jq --raw-output '.[] | select(.focused==true).specialWorkspace.name | split(":") | if length > 1 then .[1] else "" end')

case "$1" in
    open-scratch)
        if [ -n "$SPECIAL" ]; then
            hyprctl dispatch togglespecialworkspace "$SPECIAL"
        fi
        pypr toggle "$2"
    ;;
    open-special)
        if [[ -z "$SPECIAL" ]]; then
            pypr hide \*
            hyprctl dispatch workspace special:"$2"
        else
            if [ "$SPECIAL" == "$2" ]; then
                hyprctl dispatch togglespecialworkspace "$SPECIAL"
            else
                hyprctl dispatch workspace special:"$2"
            fi
        fi
    ;;
    close)
        if [ -n "$SPECIAL" ]; then
            hyprctl dispatch togglespecialworkspace "$SPECIAL"
        fi
        pypr hide \*
    ;;
esac