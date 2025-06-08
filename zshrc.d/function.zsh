function cd() {
  builtin cd "$@" && ls
}

function mkcd() {
  \mkdir "$@" && builtin cd "$@"
}

function venv(){
  if [ ! -d .venv ]; then
    python -m venv .venv
  fi

  source .venv/bin/activate
}
