#!/bin/zsh
zmodload zsh/datetime
input=$(cat)

CONTEXT_PCT=$(jq -r '.context_window.used_percentage // 0' <<< "$input")
MODEL=$(jq -r '.model.display_name' <<< "$input")
DURATION_MS=$(jq -r '.cost.total_api_duration_ms // 0' <<< "$input")
COST=$(jq -r '.cost.total_cost_usd // 0' <<< "$input")
FIVE_HOUR_PCT=$(jq -r '.rate_limits.five_hour.used_percentage // 0' <<< "$input")
FIVE_HOUR_RESET=$(jq -r '.rate_limits.five_hour.resets_at // 0' <<< "$input")
SEVEN_DAY_PCT=$(jq -r '.rate_limits.seven_day.used_percentage // 0' <<< "$input")
SEVEN_DAY_RESET=$(jq -r '.rate_limits.seven_day.resets_at // 0' <<< "$input")

BARS=(' ' ▁ ▂ ▃ ▄ ▅ ▆ ▇ █)
PIES=(○ ◔ ◑ ◕ ●)

integer context_slice='CONTEXT_PCT < 100 ? CONTEXT_PCT / 20 : 4'
CONTEXT_ICON=$PIES[context_slice+1]

format_window() {
  integer reset_at=$2
  integer secs='reset_at > EPOCHSECONDS ? reset_at - EPOCHSECONDS : 0'
  local remaining
  if (( secs >= 86400 )); then
    printf -v remaining '%dd%dh' secs/86400 secs/3600%24
  elif (( secs >= 3600 )); then
    printf -v remaining '%dh%dm' secs/3600 secs/60%60
  else
    printf -v remaining '%dm' secs/60
  fi
  printf '%.0f%% (%s)' "$1" "$remaining"
}

usage_bar() {
  integer level="$1 < 100 ? ($1 * 8 + 50) / 100 : 8"
  print -rn -- "$BARS[level+1]"
}

integer secs=DURATION_MS/1000
if (( secs >= 3600 )); then
  printf -v DURATION_FMT '%d:%02d:%02d' secs/3600 secs/60%60 secs%60
else
  printf -v DURATION_FMT '%d:%02d' secs/60 secs%60
fi

printf -v COST_FMT '$%.2f' "$COST"

USAGE_BARS=$'\e[100m'$(usage_bar $FIVE_HOUR_PCT)$(usage_bar $SEVEN_DAY_PCT)$'\e[49m'
FIVE_HOUR_FMT=$(format_window $FIVE_HOUR_PCT $FIVE_HOUR_RESET)
SEVEN_DAY_FMT=$(format_window $SEVEN_DAY_PCT $SEVEN_DAY_RESET)

print -r -- "$CONTEXT_ICON $MODEL | ⏱ $DURATION_FMT | $COST_FMT | $USAGE_BARS $FIVE_HOUR_FMT $SEVEN_DAY_FMT"
