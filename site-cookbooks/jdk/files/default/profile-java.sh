JAVA_PATH=`readlink -m $(which java)`
export JAVA_HOME=${JAVA_PATH%/*/*}
