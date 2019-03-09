apt-get install -y certbot python-certbot-nginx;
certbot --nginx -n -m $EMAIL --agree-tos -d $DOMAIN;
