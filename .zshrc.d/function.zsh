function cd(){
  builtin cd "$@" && ls
}

function mkcd(){
  \mkdir "$@" && builtin cd "$@"
}
