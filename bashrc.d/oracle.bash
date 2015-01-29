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
