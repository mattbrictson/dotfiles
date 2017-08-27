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

