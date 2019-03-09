echo "Starting to install nginx on: $2"

ssh $1@$2 << HERE
    sudo apt update
    sudo apt-get install -y nginx
    sudo ufw allow '80'
    sudo ufw allow '443'
    sudo ufw allow '22'
HERE
