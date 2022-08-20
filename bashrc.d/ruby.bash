if [ -x $BREW_PREFIX/bin/rbenv ]; then
  eval "$(rbenv init -)"
fi

export PATH=".git/safe/../../bin:$PATH"
export PATH="$HOME/Library/Qt5.5.0/5.5/clang_64/bin:$PATH"
export PATH="$BREW_PREFIX/opt/mysql@5.7/bin:$PATH"
export RUBY_CONFIGURE_OPTS="--with-jemalloc--prefix=$BREW_PREFIX --with-openssl-dir=$BREW_PREFIX/opt/openssl@1.1"

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

# Search all bundler dependencies for a given pattern
# Courtesy of https://everydayrails.com/2018/06/11/bundler-shortcuts.html
function bs() {
  rg "$1" $(bundle list --paths)
}

alias rgen="~/.bin/rails_generate_and_open"

eval "$(tomo completion-script)"
