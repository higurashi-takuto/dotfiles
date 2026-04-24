function ss(){
  ID="`tmux list-sessions`"
  create_new_session="Create New Session"
  if [[ -n "$ID" ]]; then
    ID="$ID\n${create_new_session}: $1"
  else
    ID="${create_new_session}: $1"
  fi
  ID="`echo $ID | fzf | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    if [[ -n "$TMUX" ]]; then
      if [[ -n "$1" ]]; then
        tmux new-session -d -s "$1"
        tmux switch-client -t "$1"
      else
        tmux new-session -d
        new_session=$(tmux list-sessions -F "#{session_name}" | tail -1)
        tmux switch-client -t "$new_session"
      fi
    else
      if [[ -n "$1" ]]; then
        tmux new-session -s "$1"
      else
        tmux new-session
      fi
    fi
  elif [[ -n "$ID" ]]; then
    if [[ -n "$TMUX" ]]; then
      tmux switch-client -t "$ID"
    else
      tmux attach-session -t "$ID"
    fi
  fi
}

function c(){
  if ! pgrep -xq iTerm2; then
    echo "c: iTerm2 is not running" >&2
    return 1
  fi

  osascript \
    -e 'on run argv' \
    -e '  set dirPath to item 1 of argv' \
    -e '  set shellPath to item 2 of argv' \
    -e '  set launchCmd to "env CLAUDE_SKIP_TMUX=1 " & quoted form of shellPath & " -l"' \
    -e '  set runCmd to "cd " & quoted form of dirPath & " && claude"' \
    -e '  tell application "iTerm2"' \
    -e '    tell current window' \
    -e '      create tab with default profile command launchCmd' \
    -e '      tell current session of current tab' \
    -e '        write text runCmd' \
    -e '      end tell' \
    -e '    end tell' \
    -e '  end tell' \
    -e 'end run' \
    -- "$PWD" "$SHELL" > /dev/null
}

function startup-tmux(){
  if [[ -n $TMUX || $- != *l* || -n $CLAUDE_SKIP_TMUX ]]; then
    return
  fi

  if [ "$TERM_PROGRAM" = "vscode" ]; then
    session_name="vscode"
  else
    session_name="main"
  fi

  if tmux has-session -t "$session_name" 2>/dev/null; then
    if [[ "$PWD" != "$HOME" ]] && [[ "$PWD" != "/" ]]; then
      tmux new-window -t "$session_name" -c "$PWD"
    fi
    tmux attach-session -t "$session_name"
  else
    tmux new-session -s "$session_name"
  fi
}
