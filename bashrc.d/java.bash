if [ -d /System/Library/Frameworks/JavaVM.framework/Versions/1.6 ]; then
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
  export MAVEN_OPTS="-Xmx512m -XX:+HeapDumpOnOutOfMemoryError"
fi

alias gw='./gradlew --daemon'
