#!/bin/zsh
input=$(cat)
 
MODEL=$(jq -r '.model.display_name' <<< "$input")
COST=$(jq -r '.cost.total_cost_usd // 0' <<< "$input")
DURATION_MS=$(jq -r '.cost.total_api_duration_ms // 0' <<< "$input")
 
printf -v COST_FMT '$%.2f' "$COST"
 
integer secs=DURATION_MS/1000
if (( secs >= 3600 )); then
  printf -v DURATION_FMT '%d:%02d:%02d' secs/3600 secs/60%60 secs%60
else
  printf -v DURATION_FMT '%d:%02d' secs/60 secs%60
fi
 
print -r -- "$MODEL | $COST_FMT | $DURATION_FMT"
