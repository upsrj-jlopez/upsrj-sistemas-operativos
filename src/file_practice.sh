#!/bin/bash
###############################################################################
# File: file_practice.sh
# Subject: Operating Systems
# Topic: File Management Practice in Linux (Ubuntu 22.04)
#
# Description:
# This script sets controlled tasks for practicing file management in Linux.
# Students must:
# - Create and inspect files
# - Explore editors (vi, vim, nano)
# - Experiment with stdin, stdout, stderr
# - Configure permissions based on a textual requirement
#
# IMPORTANT:
# - Students must complete the missing commands.
# - Do NOT require user interaction in the script itself.
# - All analysis must be written using echo statements.
###############################################################################

OUT_DIR="../out"
LOG_FILE="${OUT_DIR}/file_practice.log"

mkdir -p "${OUT_DIR}"
: > "${LOG_FILE}"

###############################################################################
# Student identification
###############################################################################
GITHUB_USER="jesus"

echo "================ FILE MANAGEMENT PRACTICE =================" >> "${LOG_FILE}"
echo "Author (GitHub): ${GITHUB_USER}" >> "${LOG_FILE}"
echo "System: Ubuntu 22.04" >> "${LOG_FILE}"
echo "Date: $(date)" >> "${LOG_FILE}"
echo "===========================================================" >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION A: File Creation
###############################################################################
echo "=== SECTION A: FILE CREATION ===" >> "${LOG_FILE}"


# Crear el archivo practice.txt
touch practice.txt

# Registrar su metadata en el log
ls -l practice.txt >> "${LOG_FILE}"

# Repetir la operación para observar cambios en la marca de tiempo
sleep 60
touch practice.txt
ls -l practice.txt >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo "El comando 'touch' crea el archivo si no existe, o actualiza su marca de tiempo si ya existe." >> "${LOG_FILE}"
echo "En el listado de 'ls -l' se observan los campos: permisos, propietario, grupo, tamaño y fecha/hora de última modificación." >> "${LOG_FILE}"
echo "Al ejecutar 'touch' nuevamente, el tamaño del archivo no cambia (sigue en 0 bytes), pero la marca de tiempo de modificación se actualiza." >> "${LOG_FILE}"
echo "Esto permite verificar cómo Linux gestiona los metadatos de los archivos sin necesidad de escribir contenido." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"


###############################################################################
# SECTION B: File Editing
###############################################################################
echo "=== SECTION B: FILE EDITING ===" >> "${LOG_FILE}"

# Editar el archivo practice.txt con un editor
# (este paso es manual: el alumno abre el archivo con nano, vi o vim)
# Ejemplo: nano practice.txt
# Se agrega la línea "Este archivo fue editado con nano"
# Se guarda con CTRL+O y se sale con CTRL+X

# Registrar en el log que se usó nano y cómo se guardó
echo "Editor utilizado: nano" >> "${LOG_FILE}"
echo "Acciones: Se escribió la línea 'Este archivo fue editado con nano', se guardó con CTRL+O y se salió con CTRL+X" >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo "Nano es un editor sencillo y amigable, con atajos visibles en pantalla. Guardar y salir requiere combinaciones de teclas (CTRL+O, CTRL+X)." >> "${LOG_FILE}"
echo "Vi y Vim son más potentes pero requieren conocer los modos: para guardar y salir se usa ':wq'." >> "${LOG_FILE}"
echo "La diferencia principal es la curva de aprendizaje: nano es inmediato, mientras que vi/vim ofrecen más funcionalidades pero requieren práctica." >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"


###############################################################################
# SECTION C: File Descriptors (stdin=0, stdout=1, stderr=2)
###############################################################################
echo "=== SECTION C: FILE DESCRIPTORS ===" >> "${LOG_FILE}"

# Task:
# - Redirect normal output to the log (stdout).
# - Redirect an error message to the log (stderr).
# - Use stdin redirection to count lines in practice.txt.
# - Record the outputs.

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
# Explain what each descriptor represents and how redirection works.
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION D: File Permissions
###############################################################################
echo "=== SECTION D: FILE PERMISSIONS ===" >> "${LOG_FILE}"

# Task:
# The file practice.txt must have the following access rules:
# - The owner can read and write the file.
# - The group can only read the file.
# - Others should have no access at all.
#
# Students must:
# - Inspect current permissions of practice.txt.
# - Modify them to match the description above.
# - Record before/after states in the log.

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
# Deduce the correct permission mask from the description.
# Explain why each category (user/group/others) has those rights.
echo "" >> "${LOG_FILE}"

###############################################################################
echo "================ END OF PRACTICE =================" >> "${LOG_FILE}"