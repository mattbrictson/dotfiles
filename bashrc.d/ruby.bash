if [ -x "$BREW_PREFIX/bin/rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - --no-rehash)"
fi

export PATH=".git/safe/../../bin:$PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$BREW_PREFIX/opt/openssl@3"

export TESTOPTS="--pride"

# OS X has its own way of setting LANG, but only at the console.
# By declaring here in .bashrc, daemons like Pow will also pick it up.
export LANG=en_US.UTF-8

# Use Homebrew's terminal-notifier, which is much faster than Ruby's.
if [ -x $BREW_PREFIX/bin/terminal-notifier ]; then
  export TERMINAL_NOTIFIER_BIN=$BREW_PREFIX/bin/terminal-notifier
fi

# Shortcut for running `rails` or `rake`, based on a simple heuristic
# to determine which command is appropriate.
function r() {
  if [ $# -eq 0 ] || [ ! -x bin/rails ]; then
    if [ -x bin/rake ]; then
      bin/rake "$@"
    elif [ -f Gemfile.lock ]; then
      bundle exec rake "$@"
    else
      rake "$@"
    fi
  else
    bin/rails "$@"
  fi
}

# Shortcut to start the test watcher appropriate for the project
function w() {
  if [ -x bin/mt ]; then
    bin/mt --watch "$@"
  else
    retest --notify "$@"
  fi
}

# Search all bundler dependencies for a given pattern
# Courtesy of https://everydayrails.com/2018/06/11/bundler-shortcuts.html
function bs() {
  rg "$1" $(bundle list --paths)
}

alias rgen="~/.bin/rails_generate_and_open"
alias routes="bin/rails routes -g '^/(?!rails/active_storage|rails/action_mailbox|rails/conductor|(recede|resume|refresh)_historical_location).*$'"

eval "$(tomo completion-script)"
