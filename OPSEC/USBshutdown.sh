#!/bin/bash

# Display the ASCII art message
echo "
 _   _ ___________     _      _            _             
| | | /  ___| ___ \   | |    | |          | |            
| | | \ |__.| |_/ / __| | ___| |_ ___  ___| |_ ___  _ __ 
| | | ||__. \ ___ \/ _\ |/ _ \ __/ _ \/ __| __/ _ \| '__|
| |_| /\__/ / |_/ / (_| |  __/ ||  __/ (__| || (_) | |   
 \___/\____/\____/ \__,_|\___|\__\___|\___|\__\___/|_|   
                                                         
                                                         "


clear

echo 'Veuillez retirer toute clé USB/appareil connecté à lordinateur.'
sleep 5

# Sauvegarde des périphériques USB avant la connexion de la clé de sécurité
before_connection=$(lsusb)

# Compter combien de périphériques USB sont connectés
initial_count=$(echo "$before_connection" | wc -l)

# Indication pour l'utilisateur de connecter la clé USB
echo 'Connectez la clé USB qui servira de clé de sécurité.'
sleep 5

# Sauvegarde des périphériques USB après la connexion de la clé de sécurité
after_connection=$(lsusb)

# Compter combien de périphériques USB sont connectés après
final_count=$(echo "$after_connection" | wc -l)

# Détecter la clé ajoutée en comparant les deux listes
if (( final_count > initial_count )); then
    # Trouver l'entrée qui a été ajoutée
    new_device=$(comm -13 <(echo "$before_connection" | sort) <(echo "$after_connection" | sort))
    echo "La clé USB suivante a été ajoutée :"
    echo "$new_device"

    # Extraire uniquement l'ID pour simplifier les vérifications
    device_id=$(echo "$new_device" | awk '{print $6}')
    echo "ID de la clé USB : $device_id"

    #met le script en arrière plan

    # S'assurer que la clé reste connectée
    while true; do
        if lsusb | grep -q "$device_id"; then
            clear
            echo "Clé USB toujours connectée."
        else
            nmcli networking off
            break
        fi
        sleep 0.1
    done
else
    echo "Aucune nouvelle clé USB détectée."
fi
