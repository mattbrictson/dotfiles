if [ -x /opt/homebrew/bin/brew ]; then
  BREW_PREFIX=/opt/homebrew
else
  BREW_PREFIX=/usr/local
fi

export PATH=$BREW_PREFIX/bin:$PATH

if [ -x $BREW_PREFIX/bin/mise ]; then
  eval "$(mise activate bash)"
fi

# Custom bashrc sources are stored in ~/.bashrc.d
if [[ -d $HOME/.bashrc.d ]] ; then
  for config in "$HOME"/.bashrc.d/*.bash ; do
    . "$config"
  done
fi
unset -v config

# Custom binaries are stored in ~/.bin
if [ -d ~/.bin ]; then
  export PATH=~/.bin:$PATH
fi

if [ -x "$BREW_PREFIX/bin/zoxide" ]; then
  eval "$(zoxide init --cmd j bash)"
fi

unset -v BREW_PREFIX
