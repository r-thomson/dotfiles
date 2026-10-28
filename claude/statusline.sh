#!/bin/zsh
input=$(cat)

MODEL=$(jq -r '.model.display_name' <<< "$input")
COST=$(jq -r '.cost.total_cost_usd // 0' <<< "$input")
DURATION_MS=$(jq -r '.cost.total_api_duration_ms // 0' <<< "$input")
FIVE_HOUR_PCT=$(jq -r '.rate_limits.five_hour.used_percentage // 0' <<< "$input")
SEVEN_DAY_PCT=$(jq -r '.rate_limits.seven_day.used_percentage // 0' <<< "$input")

printf -v COST_FMT '$%.2f' "$COST"

integer secs=DURATION_MS/1000
if (( secs >= 3600 )); then
  printf -v DURATION_FMT '%d:%02d:%02d' secs/3600 secs/60%60 secs%60
else
  printf -v DURATION_FMT '%d:%02d' secs/60 secs%60
fi

float usage='FIVE_HOUR_PCT > SEVEN_DAY_PCT ? FIVE_HOUR_PCT : SEVEN_DAY_PCT'
printf -v USAGE_FMT '%.0f%%' usage

USAGE_ICONS=(○ ◔ ◑ ◕ ●)
integer usage_slice='usage < 100 ? usage / 20 : 4'
USAGE_ICON=$USAGE_ICONS[usage_slice+1]

print -r -- "$MODEL | ⏱ $DURATION_FMT | $COST_FMT | $USAGE_ICON $USAGE_FMT"
