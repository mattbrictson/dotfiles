export CLICOLOR=1
export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
export PAGER=/usr/bin/less
export LESS=-RFX
export GIT_DUET_CO_AUTHORED_BY=1
export GIT_DUET_SECONDS_AGO_STALE=30
export HOMEBREW_INSTALL_BADGE=🍵
export PATH=/usr/local/opt/grep/libexec/gnubin:/usr/local/sbin:$PATH
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

if [ $TERM_PROGRAM == 'Apple_Terminal' ]; then
  export EDITOR="subl -w"
  export GIT_EDITOR="subl-commit-editor"
  export BUNDLER_EDITOR=subl
  export GEM_EDITOR=subl
else
  export EDITOR=vim
fi
