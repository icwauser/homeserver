
echo "Host vps_sshContainer
  HostName 123.456.789.012
  User sshuser
  Port 2222
  IdentityFile ~/.ssh/id_personal

Host vps
  HostName 123.456.789.012
  User root
  Port 22" >> ~/.ssh/config



# Create ~/.ssh/config or replace `vps` with `root@<vps ip address>`
ssh-copy-id -i ~/.ssh/id_personal.pub vps
# Log in with credentials provided by the VPS hoster

# Add IdentityFile line to `~/.ssh/config`
echo "  IdentityFile ~/.ssh/id_personal" >> ~/.ssh/config

# Start connection
ssh vps