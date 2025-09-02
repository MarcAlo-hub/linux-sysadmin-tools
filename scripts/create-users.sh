#!/bin/bash
# Crea usuarios desde archivo con input del usuario | Create users from file interactively

if [ $(id -u) -ne 0 ]; then
    echo "Ejecuta como root"
    exit 1
fi

# Pedir al usuario el nombre del archivo de usuarios
read -p "Introduce la ruta del archivo de usuarios (ej: examples/usuarios.txt): " USER_FILE

# Validar que no esté vacío y exista
if [ -z "$USER_FILE" ]; then
    echo "Error: Debes introducir un archivo."
    exit 1
fi

if [ ! -f "$USER_FILE" ]; then
    echo "Error: Archivo no encontrado: $USER_FILE"
    exit 1
fi

# Leer archivo y crear usuarios
while IFS=: read -r USER PASS; do
    if id "$USER" &>/dev/null; then
        echo "Usuario $USER ya existe"
    else
        useradd -m -s /bin/bash "$USER"
        echo "$USER:$PASS" | chpasswd
        echo "Usuario $USER creado"
    fi
done < "$USER_FILE"
