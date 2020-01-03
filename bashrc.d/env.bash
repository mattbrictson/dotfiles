export CLICOLOR=1
export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
export PAGER=/usr/bin/less
export LESS=-RFX
export GIT_DUET_CO_AUTHORED_BY=1
export GIT_DUET_SECONDS_AGO_STALE=30
export HOMEBREW_INSTALL_BADGE=🍵
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH

if [ $TERM_PROGRAM == 'Apple_Terminal' ]; then
  export EDITOR="subl -w"
  export BUNDLER_EDITOR=subl
  export GEM_EDITOR=subl
else
  export EDITOR=vim
fi
