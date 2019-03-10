export TOP_PID=$$

with_sudo() {
    while IFS='' read -r line || [[ -n "$line" ]]; do
        line="sudo $(echo $line | sed 's/|/| sudo/g')"
        local commands+=$line
    done < $1
    echo "$commands"
}

with_ssh() {
    echo "ssh -oStrictHostKeyChecking=no $SSH '$source'"
}

with_env() {
    while IFS='' read -r var || [[ -n "$var" ]]; do
        if [ -z ${!var} ]; then raise_error "The $var environment variable is missing, aborting..."; fi
        if [ ! -z $SSH ]; then source="export $var=${!var}; $source"; fi
    done < $1
    echo "$source"
}

raise_error() {
    echo $1 1>&2
    kill -s TERM $TOP_PID
}

install() {
    setup="./$1/setup.sh"
    env="./$1/env"

    if [ -z $SUDO ]; then source=$(cat $setup); else source=$(with_sudo $setup); fi
    if [ -e $env ]; then source=$(with_env $env); fi
    if [ ! -z $SSH ]; then source=$(with_ssh); fi
    eval $source
}

for arg in "$@"
do
    install $arg
done
