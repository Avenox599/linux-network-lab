
            
Pour pouvoir créer ce Lab il faut passer par les étapes suivantes:

- La création des deux VMs (Linux)
- Faire une configuration réseau qui permettra aux deux VMs de se voir sur internet
- Enfin, les connecter ensemble via le ssh (Secure Schell)

1. La création des deux VMs:
# Pour ce Lab j'ai choisi Virutual Box pour virtualiser mes VMs.
Tout d'abord, on crée les VMs comme on a l'habitude les créees. Sauf que, au niveau du Network il faut avoir deux cartes réseaux, donc la première carte sera un NAT (Network Addresses Transition) qui permettra à nos VMs de se connecter à internet (sur Virutal Box le NAT est déjà configurer par défaut comme première carte réseau) et une deuxième carte réseau qui sera Internal Network qui permettra à nos VMs d'avoir un espace en interne.

2. Réalisation de la configuration réseau des deux machines:
# Pour ce Lab j'ai choisi Linux_Mint pour les deux VMs donc, la configuration réseau se fera avec Netplan.
Avant de commemcer à configurer le réseau il faut tout d'abord, connaitre les adresses ip déjà distribuer par le DHCP (Dynamic Host configuration Protocle) afin d'être en mesure d'attribuer une adresse ip statique qui n'est pas encore utiliser par le DHCP à nos VMs. Pour voir les fameuses adresse ip en utilisation on tape la commande suivant dans le terminal : sudo nmap -sn <ip de la paserelle>. Si ça ne fonction pas, essaiyer d'installer le packet nmap (sudo apt install nmap) parce qu'il n'est pas installer par défaut sur certain distribution.
Une fois que tout ceci est on place en peut configurer le réseau des deux VMs.

Pour la première VM (VM1) voici la configuration réseau à faire:
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      addresses:
        - 192.168.43.1/24

Pour la deuxième VM (VM2) voici la configuration réseau à faire:
# Let NetworkManager manage all devices on this system
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

3. Connexion via le ssh:
Pour les connecter via un ssh, j'ai installé le packet openssh-server sur les deux VMs puis je l'ai activer toujours sur les deux VMs en faisant : systemctl strat ssh
Une fois ceci fait, j'ai tapé sur la VM1 : ssh emmanuel@192.168.43.3


