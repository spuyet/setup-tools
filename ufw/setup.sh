apt-get update;
apt-get install -y ufw;
ufw allow $PORTS;
ufw enable;
