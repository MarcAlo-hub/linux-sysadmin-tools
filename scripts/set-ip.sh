#!/bin/bash
# Configura IP estática con input del usuario | Set static IP with user input

if [ $(id -u) -ne 0 ]; then
    echo "Ejecuta como root"
    exit 1
fi

# Pedir al usuario los datos
read -p "Introduce el nombre de la interfaz (ej: eth0): " IFACE
read -p "Introduce la IP estática (ej: 192.168.1.100): " IP
read -p "Introduce la puerta de enlace (ej: 192.168.1.1): " GATEWAY
read -p "Introduce el DNS (ej: 8.8.8.8): " DNS

# Comprobar que no estén vacíos
if [ -z "$IFACE" ] || [ -z "$IP" ] || [ -z "$GATEWAY" ] || [ -z "$DNS" ]; then
    echo "Error: Todos los campos son obligatorios."
    exit 1
fi

# Crear configuración de red
cat <<EOF > /etc/network/interfaces
auto $IFACE
iface $IFACE inet static
    address $IP
    netmask 255.255.255.0
    gateway $GATEWAY
    dns-nameservers $DNS
EOF

# Reiniciar la red
systemctl restart networking
echo "IP configurada en $IFACE: $IP"
