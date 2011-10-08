###########
# Aliases #

alias b='bundle exec'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias get='git'
alias ls='ls -hFG'
alias l='ls'
alias la='ls -la'
alias ll='ls -l'
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'

# Use Apple's man page viewer if we are on a local console
if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
  function man {
    open x-man-page://$1
  }
fi

###########################
# History and Completions #

export HISTIGNORE="&:ls:l:la:ll:exit"
bind '"\e[A"':history-search-backward # up arrow
bind '"\e[B"':history-search-forward  # down arrow

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

###################
# Git PS1 Support #

export GIT_PS1_SHOWDIRTYSTATE=true     # '*' for unstaged changes, '+' for staged
export GIT_PS1_SHOWSTASHSTATE=true     # '$' if smth is stashed
export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files

#######
# PS1 #

export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
# Only show last 2 directories that make up the current path
export PROMPT_DIRTRIM=2

# Omit the hostname from PS1 if we are on the local console
hostname=""
if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
  hostname=" `hostname -s` "
fi
export PS1='\[\e[0;30;43m\]$hostname\[\e[0m\]\[\e[1m\]\w\[\e[0m\]$(__git_ps1 " (%s)")\[\e[1m\]$ \[\e[0m\]'

#############
# Mac Ports #

if [ -x /opt/local/bin/port ]; then
  export MANPATH=/opt/local/share/man:$MANPATH
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH
fi

##############
# Postgresql #

if [ -d /opt/local/lib/postgresql83/bin ]; then
  export PATH=/opt/local/lib/postgresql83/bin:$PATH
fi

########
# Ruby #

if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Shortcut for `bundle exec rails` and `bundle exec rake`
function r() {
  if [[ "g|generate|c|console|s|server|db|dbconsole|new" =~ $1 ]]; then
    bundle exec rails $@
  else
    bundle exec rake $@
  fi
}

#####################
# Python virtualenv #

if [ -d $HOME/.virtualenvs ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
fi
if [ -f /usr/local/bin/virtualenvwrapper_bashrc ]; then
  . /usr/local/bin/virtualenvwrapper_bashrc
fi

##############
# Subversion #

if [ -x $HOME/bin/edit ]; then
  export SVN_EDITOR=$HOME/bin/edit
fi

####################
# Java Environment #

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
export MAVEN_OPTS="-Xmx512m -XX:+HeapDumpOnOutOfMemoryError"

#################
# Oracle Client #

# Assume Oracle Instant Client is installed in /opt/custom/oracle
if [ -d /opt/custom/oracle ]; then
  export ORACLE_CLIENT_HOME=/opt/custom/oracle
  export PATH=$ORACLE_CLIENT_HOME:$PATH
  export DYLD_LIBRARY_PATH=$ORACLE_CLIENT_HOME
  export NLS_LANG=AMERICAN_AMERICA.UTF8
  export TWO_TASK=DEVDB
  export SQLPATH=${ORACLE_CLIENT_HOME}
  
  # User scripts can be placed in ~/Library/Oracle/
  if [ -d ${HOME}/Library/Oracle/ ]; then
    export SQLPATH=${SQLPATH}:${HOME}/Library/Oracle/Scripts
    export TNS_ADMIN=${HOME}/Library/Oracle/Admin
  fi
fi

##################
# Custom Scripts #

if [ -d $HOME/Library/bin ]; then
  export PATH=$HOME/Library/bin:$PATH
fi  
