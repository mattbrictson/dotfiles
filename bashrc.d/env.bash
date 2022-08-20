export CLICOLOR=1
export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
export PAGER=/usr/bin/less
export LESS=-RFX
export HOMEBREW_INSTALL_BADGE=🍵
export PATH=$BREW_PREFIX/opt/grep/libexec/gnubin:$BREW_PREFIX/sbin:$PATH
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

if [ $TERM_PROGRAM == 'Apple_Terminal' ]; then
  export EDITOR="subl -w"
  export BUNDLER_EDITOR=subl
  export GEM_EDITOR=subl
else
  export EDITOR=vim
fi
