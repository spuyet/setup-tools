with_sudo() {
    while IFS='' read -r line || [[ -n "$line" ]]; do
        line="sudo $(echo $line | sed 's/|/| sudo/g')"
        local commands+=$line
    done < $1
    echo "$commands"
}

with_ssh() {
    echo "ssh -oStrictHostKeyChecking=no $SSH 'export DOMAIN=$DOMAIN; export EMAIL=$EMAIL; $source'"
}

install() {
    path="./$1/setup.sh"
    if [ -z $SUDO ]; then source=$(cat $path); else source=$(with_sudo $path); fi
    if [ ! -z $SSH ]; then source=$(with_ssh); fi
    eval $source
}

for arg in "$@"
do
    install $arg
done
