# Bash
All my bash projects
## Wipe.sh
Wipe.sh permet de totalement ''tuer'' un ordinateur.

Lors de l'éxecution de ce script, plusieurs choses vont arriver:
1) extinction de toute communication réseau
2) bloquage de tout les ports
3) désactivation des ports usb lors du reboot
4) désactivation de tout mode de communication avec la machine
5) désactivation de la fonction de mise en veille
6) wipe de tout les dossiers importants (4 tours)
7) mise en place d'un redémarage automatique lors du boot de l'ordinateur
8) extinction de l'ordinateur

Pour installer ce script, il faudra lancer cette commande:

`sudo apt install shred xinput xset ufw nmcli -y`
