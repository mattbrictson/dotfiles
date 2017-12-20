export CLICOLOR=1
export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
export PAGER=/usr/bin/less
export LESS=-RFX

if [ $Apple_PubSub_Socket_Render ]; then
  export EDITOR="code"
  export BUNDLER_EDITOR=code
  export GEM_EDITOR=code
else
  export EDITOR=vi
fi
