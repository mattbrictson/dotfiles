if [[ $- == *i* ]]
then
  if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
  fi
  # Follow these instructions to enable Heroku CLI Autocomplete
  # https://devcenter.heroku.com/articles/heroku-cli-autocomplete
  CLI_ENGINE_AC_BASH_SETUP_PATH=~/Library/Caches/heroku/completions/bash_setup
  if [ -f $CLI_ENGINE_AC_BASH_SETUP_PATH ]; then
    . $CLI_ENGINE_AC_BASH_SETUP_PATH
  fi
fi

# Enable "s" alias to auto-complete just like "git switch"
__git_complete s _git_switch
