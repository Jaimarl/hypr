STATUS=$(playerctl status -p spotify)

if [ "$1" == "p" ]; then
    if [ "$STATUS" == "Playing" ]; then
        echo "<span color=\"#cba6f7\"></span>"
    else
        echo "<span color=\"#a6adc8\"></span>"
    fi
elif [ "$1" == "b" ]; then
    if [ "$STATUS" == "Playing" ]; then
        echo "<span color=\"#cba6f7\"></span>"
    else
        echo "<span color=\"#a6adc8\"></span>"
    fi
elif [ "$1" == "f" ]; then
    if [ "$STATUS" == "Playing" ]; then
        echo "<span color=\"#cba6f7\"></span>"
    else
        echo "<span color=\"#a6adc8\"></span>"
    fi
fi