export CLICOLOR=1
export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
export PAGER=/usr/bin/less

if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
  export EDITOR="subl -w"
else
  export EDITOR=vi
fi
