if [ -d ~/.rbenv ]; then
  export PATH=~/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
  alias br='bundle install -j4 && rbenv rehash'
fi

# OS X has its own way of setting LANG, but only at the console.
# By declaring here in .bashrc, daemons like Pow will also pick it up.
export LANG=en_US.UTF-8

# Shortcut for `bundle exec rails` and `bundle exec rake`.
# If bin/rails and bin/rake are available, use them instead as they are much
# faster to execute than `bundle exec`.
function r() {
  if [[ "g|generate|c|console|s|server|db|dbconsole|r|runner|new" =~ $1 ]]; then
    if [ -x bin/rails ]; then
      bin/rails "$@"
    elif [ -x script/rails ]; then
      script/rails "$@"
    else
      rails "$@"
    fi
  else
    if [ -x bin/rake ]; then
      bin/rake "$@"
    elif [ -x script/rake ]; then
      script/rake "$@"
    else
      rake "$@"
    fi
  fi
}
