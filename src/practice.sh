#!/bin/bash
###############################################################################
# File: practice.sh
# Subject: Operating Systems
# Topic: Pipes, concatenations and console free
#
# Descripcion:
# Este script contiene tareas guiadas para que los estudiantes practiquen:
# - Uso de pipes (|)
# - Ejecución en segundo plano (&)
# - Encadenamiento condicional (&&)
#
# IMPORTANTE:
# - Debes completar las instrucciones del TODO.
# - Todas las salidas de los pasos deben ser guardadas en el archivo $OUT_LOG.
###############################################################################
source "../config/config.sh"
mkdir -p $OUT_DIR
echo > $OUT_LOG
# TODO
# 1. Mostrar todas las líneas que contengan la palabra "CRON"
# 2. Filtrar las líneas que mencionen "systemd"
# 3. Buscar todas las apariciones de "ssh"
# 4. Contar cuántas veces aparece la palabra "sudo"
# 5. Mostrar solo las líneas que contengan "Failed password"
# 6. Filtrar las líneas que tengan direcciones IP (usa grep con regex)
# 7. Mostrar las líneas que contengan "usb" y redirigir la salida a un archivo
# 8. Encadenar dos comandos: primero buscar "kernel", luego contar las líneas
# 9. Usar un pipe para mostrar solo las líneas con "Accepted"
# 10. Filtrar las líneas de "NetworkManager" y mostrar solo las que tengan "<warn>"
# 11. Buscar todas las líneas que contengan "root" y ordenarlas alfabéticamente
# 12. Mostrar las líneas con "CRON" y concatenar con las que tengan "logrotate"
# 13. Filtrar las líneas con "apt" y contar cuántas hay
# 14. Mostrar las líneas con "session opened" y "session closed" juntas
# 15. Usar grep para mostrar las líneas que NO contengan "systemd"
# 16. Buscar "ssh" y mostrar solo las direcciones IP (usa pipes con cut/awk)
# 17. Filtrar las líneas con "port" y contar cuántos puertos distintos aparecen
# 18. Mostrar las líneas con "Starting" y concatenar con las que tengan "Started"
# 19. Filtrar las líneas con "Stopping" y "Stopped" y guardarlas en un archivo
# 20. Encadenar: buscar "sudo" && mostrar mensaje de éxito si se encuentra
