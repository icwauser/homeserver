# Download new package list and ensure having Docker and Git installed
sudo apt update && sudo apt install -y docker.io docker-compose git

# Create a directory for docker files
mkdir ~/docker/
cd ~/docker/

# Clone scripts of this tutorial
git config --global user.name "private home server"
git config --global user.email "none@all.com"
git clone git@github.com/icwauser/homeserver.git
cd homeserver/proxy/
chmod 600 ssh/config
chmod 600 ssh/id_proxy
chmod 600 ssh/id_proxy.pub
chmod 600 ssh/known_hosts

# note: If not already done, remove the public key from id_proxy.pub in the file ~/.ssh/authorized_keys

# Install docker container(s) with proxy container
/bin/bash proxy_sshSetup.sh # copy relevant files to their destination, e.g. ssh key id_proxy to ./ssh/id_proxy
sudo docker-compose up -d

