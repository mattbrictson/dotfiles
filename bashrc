# Start with a fresh PATH (in case we are running as a sub-shell)
PATH=$(getconf PATH)

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

if [ -x /usr/local/bin/direnv ]; then
  eval "$(/usr/local/bin/direnv hook bash)"
fi
