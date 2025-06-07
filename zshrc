ZSHRCDIR="${HOME}/dotfiles/zshrc.d"
after_zsh="$ZSHRCDIR/after.zsh"

for i in $ZSHRCDIR/*; do
  if [ "$i" != $after_zsh ]; then
    [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ]  && . $i
  fi
done

. $after_zsh
