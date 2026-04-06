#!/usr/bin/env bash
# Claude Code status line — inspired by Powerlevel10k segments:
# dir | vcs (git branch) | model | context usage | rate limits

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Shorten home directory to ~
home="$HOME"
short_dir="${cwd/#$home/\~}"

# Git branch (skip optional locks to be safe in concurrent environments)
git_branch=""
if git_out=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null); then
  git_branch=" \033[38;5;141m$git_out\033[0m"
elif git_out=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" rev-parse --short HEAD 2>/dev/null); then
  git_branch=" \033[38;5;141m${git_out}\033[0m"
fi

# Directory
dir_part="\033[38;5;33m${short_dir}\033[0m"

# Model
model_part=""
[ -n "$model" ] && model_part=" \033[38;5;208m${model}\033[0m"

# Context usage
ctx_part=""
if [ -n "$used_pct" ]; then
  used_int=$(printf '%.0f' "$used_pct")
  if [ "$used_int" -ge 75 ]; then
    ctx_color="38;5;196"  # red
  elif [ "$used_int" -ge 50 ]; then
    ctx_color="38;5;214"  # orange
  else
    ctx_color="38;5;243"  # dim grey
  fi
  ctx_part=" \033[${ctx_color}mctx:${used_int}%\033[0m"
fi

# Rate limits
rate_part=""
if [ -n "$five_pct" ]; then
  five_int=$(printf '%.0f' "$five_pct")
  if [ "$five_int" -ge 75 ]; then
    five_color="38;5;196"  # red
  elif [ "$five_int" -ge 50 ]; then
    five_color="38;5;214"  # orange
  else
    five_color="38;5;243"  # dim grey
  fi
  five_reset_fmt=""
  if [ -n "$five_reset" ]; then
    five_reset_fmt=$(date -r "$five_reset" "+%H:%M" 2>/dev/null || echo "")
    [ -n "$five_reset_fmt" ] && five_reset_fmt=" \033[38;5;239mreset@${five_reset_fmt}\033[0m"
  fi
  rate_part=" \033[${five_color}m5h:${five_int}%\033[0m${five_reset_fmt}"
fi
if [ -n "$week_pct" ]; then
  week_int=$(printf '%.0f' "$week_pct")
  if [ "$week_int" -ge 75 ]; then
    week_color="38;5;196"  # red
  elif [ "$week_int" -ge 50 ]; then
    week_color="38;5;214"  # orange
  else
    week_color="38;5;243"  # dim grey
  fi
  week_reset_fmt=""
  if [ -n "$week_reset" ]; then
    week_reset_fmt=$(date -r "$week_reset" "+%a %H:%M" 2>/dev/null || echo "")
    [ -n "$week_reset_fmt" ] && week_reset_fmt=" \033[38;5;239mreset@${week_reset_fmt}\033[0m"
  fi
  rate_part="${rate_part} \033[${week_color}m7d:${week_int}%\033[0m${week_reset_fmt}"
fi

printf '%b\n' "${dir_part}${git_branch}${model_part}${ctx_part}${rate_part}"
