# Run this on your trusted, personal computer

# Preallocate directories
mkdir -p ~/.ssh/homeserver/proxy ~/.ssh/homeserver/vps/sshContainer

# Create personal SSH key
ssh-keygen -t ed25519 -C "personal key for debugging" -N "" -f ~/.ssh/id_personal
# Create SSH key for proxy server
ssh-keygen -t ed25519 -C "proxy key for SSH port forwarding" -N "" -f ~/.ssh/homeserver/proxy/id_proxy

# Copy personal public key to an authorized_keys file
cat ~/.ssh/id_personal.pub >> ~/.ssh/homeserver/vps/authorized_keys

# Copy both public keys to an authorized_keys file
cat ~/.ssh/id_personal.pub >> ~/.ssh/homeserver/vps/sshContainer/authorized_keys
cat ~/.ssh/homeserver/proxy/id_proxy.pub >> ~/.ssh/homeserver/vps/sshContainer/authorized_keys

# Update file permissions (else authorisation via SSH key does not work)
chmod 600 ~/.ssh/homeserver/vps/authorized_keys
chmod 600 ~/.ssh/homeserver/vps/sshContainer/authorized_keys
