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

function startup-tmux(){
  if [[ -n $TMUX || $- != *l* ]]; then
    return
  fi

  if [ "$TERM_PROGRAM" = "vscode" ]; then
    session_name="vscode"
  else
    session_name="main"
  fi

  if tmux has-session -t "$session_name" 2>/dev/null; then
    if [[ "$PWD" != "$HOME" ]]; then
      tmux new-window -t "$session_name" -c "$PWD"
    fi
    tmux attach-session -t "$session_name"
  else
    tmux new-session -s "$session_name"
  fi
}
