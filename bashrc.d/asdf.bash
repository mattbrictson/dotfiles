if [ -f /usr/local/opt/asdf/asdf.sh ]; then
  source /usr/local/opt/asdf/asdf.sh

  [ -d $HOME/.asdf/plugins/nodejs ] || asdf plugin-add nodejs
  [ -d $HOME/.asdf/plugins/ruby ] || asdf plugin-add ruby
fi
