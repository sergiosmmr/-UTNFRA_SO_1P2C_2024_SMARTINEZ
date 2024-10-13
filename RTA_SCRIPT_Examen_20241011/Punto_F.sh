#!/bin/bash

ARCHIVO="RTA_ARCHIVOS_Examen_20241011/Filtro_Avanzado.txt"
#curl -s ifconfig.me | awk '{print $1}' >> RTA_ARCHIVOS_Examen_20241011/Filtro_Avanzado.txt

# Creo archivo Filtr_Avanzado.txt
touch $ARCHIVO

echo "Se creó el archivo $ARCHIVO"

#informacion de mi IP pública

echo "Mi IP Publica es: $(curl -s ifconfig.me | awk '{print $1}')" >> $ARCHIVO

# Inserto mi nombre de usuario
MI_USUARIO=$(whoami)
echo "Mi usuario es: $MI_USUARIO" >> $ARCHIVO

echo
# Inserto el Hash de mi usuario
MI_HASH=$(sudo cat /etc/shadow | grep $MI_USUARIO | awk -F ':' '{print $2}')
echo "El Hash de mi Usuario es: $MI_HASH" >> $ARCHIVO

# Inserto la URL de mi repositorio de Git
MI_REPOSITORIO=$(git remote get-url origin)
echo "La URL de mi repositorio es: $MI_REPOSITORIO" >> $ARCHIVO
echo
# Imprimo el contenido del archivo Filtro_Avanzado.txt
cat $ARCHIVO
