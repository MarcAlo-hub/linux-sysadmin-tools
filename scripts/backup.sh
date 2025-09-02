#!/bin/bash
# Backup automático con tar usando input del usuario | Automated backup using tar interactively

# Pedir al usuario las rutas
read -p "Introduce la ruta de origen (ej: /home/usuario): " SRC
read -p "Introduce la ruta de destino para el backup (ej: /tmp/backups): " DEST

# Validar que no estén vacías
if [ -z "$SRC" ] || [ -z "$DEST" ]; then
    echo "Error: Debes indicar rutas de origen y destino."
    exit 1
fi

# Validar que la carpeta de origen exista
if [ ! -d "$SRC" ]; then
    echo "Error: Directorio de origen no encontrado: $SRC"
    exit 1
fi

# Crear carpeta de destino si no existe
mkdir -p "$DEST"

# Crear backup comprimido
DATE=$(date +%F_%H-%M-%S)
tar -czvf "$DEST/backup_$DATE.tar.gz" "$SRC"

echo "Backup realizado correctamente: $DEST/backup_$DATE.tar.gz"
