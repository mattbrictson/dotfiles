export CLICOLOR=1
export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
export PAGER=/usr/bin/less
export LESS=-RFX

if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
  export EDITOR="subl -w"
  export BUNDLER_EDITOR=subl
  export GEM_EDITOR=subl
else
  export EDITOR=vi
fi
