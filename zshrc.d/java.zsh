export JAVA_OPTS="-Xms256M -Xmx2048M -XX:+HeapDumpOnOutOfMemoryError"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[ -f $HOME/.sdkman/bin/sdkman-init.sh ] && source $HOME/.sdkman/bin/sdkman-init.sh
