#!/bin/bash

DIRECCION="RTA_ARCHIVOS_Examen_20241011/Filtro_Basico.txt"

# creo el archivo en RTA_ARCHIVOS_Examen

touch $DIRECCION


#ingreso la direccion donde guardar la info fe memoria
echo
cat /proc/meminfo | grep 'MemTotal' >> $DIRECCION
echo
#ingreso la direccion donde guardar la info del chassis
echo
sudo dmidecode -t chassis | head -7 | tail -1 >> $DIRECCION
echo
echo "se guardo informacion en archivo Filtro_Basico.txt"
echo
echo
cat $DIRECCION


