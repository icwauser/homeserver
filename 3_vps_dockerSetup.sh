# Download new package list and install Docker
apt update && apt install -y docker.io

# Install OpenSSH server
# Update PUBLIC_KEY_URL to match your file URL or GitHub user name
docker pull linuxserver/openssh-server:latest
docker run -d \
  -p 0.0.0.0:80:80     -p 0.0.0.0:443:443 \
  -p 0.0.0.0:2222:2222 -p 0.0.0.0:3478:3478 \
  -e DOCKER_MODS='linuxserver/mods:openssh-server-ssh-tunnel|linuxserver/mods:openssh-server-mod2' \
  -v /private-backup/docker/openssh-server/config:/config \
  -e USER_NAME=sshuser -e SUDO_ACCESS=true \
  -e PUBLIC_KEY_URL=https://github.com/icwauser.keys \
  -e PUID=1000 -e PGID=1000 -e TZ=MET \
  --name ssh4ports --hostname ssh4ports \
  linuxserver/openssh-server
