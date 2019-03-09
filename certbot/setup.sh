echo "Starting to install certbot on: $2"

ssh -tt $1@$2 << HERE
    sudo apt-get install -y certbot python-certbot-nginx
    sudo certbot --nginx -n -m $3 --agree-tos -d $4
HERE
