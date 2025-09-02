# linux-admin-scripts
Scripts de automatización y administración Linux para estudiantes de FP 

## Español
**Scripts de automatización y administración Linux para estudiantes de FP.**  
Este repositorio contiene scripts en Bash para facilitar tareas comunes en sistemas Linux, orientado a estudiantes y administradores que deseen automatizar configuraciones básicas.

### Scripts incluidos
- `set-ip.sh` → Configura una dirección IP estática en la interfaz de red.
- `samba-setup.sh` → Instala y configura un servidor Samba.
- `create-users.sh` → Crea múltiples usuarios desde un archivo de texto.
- `backup.sh` → Realiza copias de seguridad comprimidas con tar.

### Requisitos
- Distribución Linux basada en Debian.
- Permisos de root para ejecutar los scripts.
- Paquetes: `samba` (para el script de Samba), `cron` (opcional para backups automáticos).

### Cómo usar cada script

Configurar IP estática:
sudo ./scripts/set-ip.sh <INTERFAZ> <IP> <GATEWAY> <DNS>
# Ejemplo:
sudo ./scripts/set-ip.sh eth0 192.168.1.100 192.168.1.1 8.8.8.8

# linux-admin-scripts
Linux admin & automation scripts for vocational students

## English
Linux admin & automation scripts for vocational students.  
This repository contains Bash scripts to simplify common Linux administration tasks, aimed at students and system administrators who want to automate basic configurations.

### Included scripts
- `set-ip.sh` → Configures a static IP address for a network interface.
- `samba-setup.sh` → Installs and configures a Samba server.
- `create-users.sh` → Creates multiple users from a text file.
- `backup.sh` → Creates compressed backups using tar.

### Requirements
- Debian-based Linux distribution.
- Root privileges to execute the scripts.
- Packages: `samba` (for the Samba script), `cron` (optional for automated backups).

### How to use each script

**1. Configure static IP:**
sudo ./scripts/set-ip.sh <INTERFACE> <IP> <GATEWAY> <DNS>
# Example:
sudo ./scripts/set-ip.sh eth0 192.168.1.100 192.168.1.1 8.8.8.8
