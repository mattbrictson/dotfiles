if [ -f /usr/local/opt/asdf/asdf.sh ]; then
  source /usr/local/opt/asdf/asdf.sh

  [ -d $HOME/.asdf/plugins/gradle ] || asdf plugin-add gradle
  [ -d $HOME/.asdf/plugins/java ] || asdf plugin-add java
  [ -d $HOME/.asdf/plugins/maven ] || asdf plugin-add maven https://github.com/mattbrictson/asdf-maven
  [ -d $HOME/.asdf/plugins/nodejs ] || asdf plugin-add nodejs
  [ -d $HOME/.asdf/plugins/ruby ] || asdf plugin-add ruby

  source ~/.asdf/plugins/java/asdf-java-wrapper.bash
fi
