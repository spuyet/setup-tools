apt-get update;
apt-get install -y ufw;
ufw allow 80,443,22;
ufw enable;
