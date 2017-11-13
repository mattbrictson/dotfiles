if [ -x /usr/local/bin/rbenv ]; then
  eval "$(rbenv init -)"
fi

export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH=".git/safe/../../bin:$PATH"

# OS X has its own way of setting LANG, but only at the console.
# By declaring here in .bashrc, daemons like Pow will also pick it up.
export LANG=en_US.UTF-8

# Use Homebrew's terminal-notifier, which is much faster than Ruby's.
if [ -x /usr/local/bin/terminal-notifier ]; then
  export TERMINAL_NOTIFIER_BIN=/usr/local/bin/terminal-notifier
fi

# Shortcut for `bundle exec rails` and `bundle exec rake`.
# If bin/rails and bin/rake are available, use them instead as they are much
# faster to execute than `bundle exec`.
function r() {
  if [[ "g|generate|d|destroy|c|console|s|server|db|dbconsole|r|runner|new" =~ $1 ]]; then
    if [ -x bin/rails ]; then
      bin/rails "$@"
    elif [ -x script/rails ]; then
      script/rails "$@"
    elif [ -f Gemfile.lock ]; then
      bundle exec rails "$@"
    else
      rails "$@"
    fi
  else
    if [ -x bin/rake ]; then
      bin/rake "$@"
    elif [ -x script/rake ]; then
      script/rake "$@"
    elif [ -f Gemfile.lock ]; then
      bundle exec rake "$@"
    else
      rake "$@"
    fi
  fi
}

alias rg="~/.bin/rails_generate_and_open"
