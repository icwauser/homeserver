# create service for starting SSH port forwarding
# ssh sshuser@vps -p 2222 -R 0.0.0.0:80:localhost:80 -R 0.0.0.0:443:localhost:443 -R 0.0.0.0:3478:localhost:3478
sudo echo '# Contents of /etc/systemd/system/sshPortForwarding.service
[Unit]
Description=Enable SSH Port Forwarding to VPS SSH server
After=network.target

[Service]
Type=simple
Restart=always
ExecStart=/usr/local/bin/6_npmContainer_onBoot.sh

[Install]
WantedBy=multi-user.target' >> /etc/systemd/system/sshPortForwarding.service
sudo echo '# start SSH port forwarding
# vps is defined in ~/.ssh/config
ssh vps -R 0.0.0.0:80:localhost:80 -R 0.0.0.0:443:localhost:443 -R 0.0.0.0:3478:localhost:3478' >> /usr/local/bin/6_npmContainer_onBoot.sh

# enable and start service
sudo systemctl daemon-reload
sudo systemctl enable sshPortForwarding.service
systemctl start sshPortForwarding.service
