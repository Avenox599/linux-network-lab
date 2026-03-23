# Linux Network Lab

## Description
This project demonstrates how to create a network between two Linux virtual machines and enable communication using ping and SSH.

---

## Lab Setup

### 1. Virtual Machines Creation
Two Linux virtual machines were created using VirtualBox.

Each VM has two network interfaces:
- NAT: for internet access
- Internal Network: for communication between VMs

---

### 2. Network Configuration

Before assigning static IP addresses, I scanned the network to check available IPs:

```bash
sudo nmap -sn <gateway_ip>
```
If nmap is not installed:
```bash
sudo apt install nmap
```
VM1 Configuration
```bash
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      addresses:
        - 192.168.43.1/24
```
#### VM2 Configuration
```bash
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      addresses:
        - 192.168.43.3/24
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]
```
### 3. SSH Configuration
Install SSH on both machines:
```bash
sudo apt install openssh-server
sudo systemctl start ssh
```
Then connect from VM1:
```bash
ssh emmanuel@192.168.43.3
```
### 4. Connectivity Test
Ping test:
```bash
ping 192.168.43.1
```
Result:
  Successful communication between both machines

### Screenshots

### Tools Used
Linux Mint
VirtualBox
Nmap
OpenSSH
# Author

Emmanuel
