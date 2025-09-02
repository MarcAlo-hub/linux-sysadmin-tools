#!/bin/bash
# Instala y configura Samba con input del usuario | Install and configure Samba interactively

if [ $(id -u) -ne 0 ]; then
    echo "Ejecuta como root"
    exit 1
fi

# Pedir al usuario el nombre de usuario Samba y la contraseña
read -p "Introduce el nombre del usuario Samba (ej: root): " SAMBA_USER
read -sp "Introduce la contraseña para $SAMBA_USER: " SAMBA_PASS
echo

# Validar que no estén vacíos
if [ -z "$SAMBA_USER" ] || [ -z "$SAMBA_PASS" ]; then
    echo "Error: Usuario y contraseña son obligatorios."
    exit 1
fi

# Instalar Samba
apt update && apt install -y samba

# Hacer copia de seguridad de smb.conf
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# Configurar Samba
cat <<EOF > /etc/samba/smb.conf
[global]
   workgroup = WORKGROUP
   server string = Servidor Samba
   security = user

[Compartido]
   path = /srv/samba
   browsable = yes
