fpath=(~/.zshrc.d $fpath)
# eval "$(op completion zsh)"; compdef _op op
if type brew &>/dev/null; then
  export fpath=(${HOMEBREW_PREFIX}/share/zsh-completions $fpath)

  autoload -Uz compinit
  compinit
fi
