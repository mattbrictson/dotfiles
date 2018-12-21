if [ -d /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home ]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
  export MAVEN_OPTS="-Xmx512m -XX:+HeapDumpOnOutOfMemoryError"
fi

export JAVA_OPTS="-Xms256M -Xmx2048M -XX:+HeapDumpOnOutOfMemoryError"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/bmartin/.sdkman"
[ -f /Users/bmartin/.sdkman/bin/sdkman-init.sh ] && source /Users/bmartin/.sdkman/bin/sdkman-init.sh
