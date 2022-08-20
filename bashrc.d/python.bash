# You will need to:
#   brew install python2
#   syspip install --upgrade virtualenv
#   syspip install --upgrade virtualenvwrapper
#   mkdir ~/.virtualenvs

if [[ $- == *i* ]]
then
  if [ -d ~/.virtualenvs ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export VIRTUALENV_DISTRIBUTE=true
    export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
    export PIP_REQUIRE_VIRTUALENV=true
    export VIRTUALENVWRAPPER_PYTHON=$BREW_PREFIX/bin/python

    wrapper_sh=$BREW_PREFIX/bin/virtualenvwrapper.sh
    [[ -f $wrapper_sh ]] && . $wrapper_sh

    syspip(){
      PIP_REQUIRE_VIRTUALENV="" pip "$@"
    }
  fi
fi
