# start SSH port forwarding
# vps is defined in ~/.ssh/config
ssh vps -R 0.0.0.0:80:localhost:80 -R 0.0.0.0:443:localhost:443 -R 0.0.0.0:3478:localhost:3478