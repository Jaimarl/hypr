MONITOR="$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')"
DATE="$(date '+%Y-%m-%d_%H.%M.%S')"
MODE="$1"

mkdir -p ~/Videos
cd ~/Videos

if [[ "$MODE" == "region" ]]; then
    wf-recorder -g "$(slurp)" -f './recording_'"$DATE"'.mp4' -c h264_nvenc
elif [[ "$MODE" == "screen" ]]; then
    wf-recorder -o "$MONITOR" -f './recording_'"$DATE"'.mp4' --audio=mono_output.monitor -c h264_nvenc
else
    exit 1
fi