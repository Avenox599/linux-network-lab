#!/bin/bash
#!/bin/bash

echo "Installing OpenSSH server..."
sudo apt update
sudo apt install openssh-server -y

echo "Starting SSH service..."
sudo systemctl start ssh

echo "Done."
