apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-commonl;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -;
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
apt-get update;
apt-get -y install docker-ce docker-ce-cli containerd.io;
docker run hello-world;
usermod -aG docker $USER;
