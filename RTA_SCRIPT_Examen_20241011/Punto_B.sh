#!/bin/bash

# Creo las particones

DISCO=$(sudo fdisk -l | grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

echo "Disco: $DISCO"

sudo fdisk $DISCO << EOF
n
e


+10GB

n
l

+1GB
n
l

+1GB
n
l

+1GB
n
l

+1GB
n
l

+1GB
n
l

+1GB
n
l

+1GB
n
l

+1GB
n
l

+1GB
w
EOF

echo
echo "asi quedaron las particiones"
echo

sudo fdisk -l $DISCO

#formateo
sudo mkfs.ext4 ${DISCO}5
sudo mkfs.ext4 ${DISCO}6
sudo mkfs.ext4 ${DISCO}7
sudo mkfs.ext4 ${DISCO}8
sudo mkfs.ext4 ${DISCO}9
sudo mkfs.ext4 ${DISCO}10
sudo mkfs.ext4 ${DISCO}11
sudo mkfs.ext4 ${DISCO}12
sudo mkfs.ext4 ${DISCO}13
sudo mkfs.ext4 ${DISCO}1

#montaje
echo "Montando_Particiones......"

INDICE_DISCO=5
for carpeta in alumno_1/parcial_1 alumno_1/parcial_2 alumno_1/parcial_3 alumno_2/parcial_1 alumno_2/parcial_2 alumno_2/parcial_3 alumno_3/parcial_1 alumno_3/parcial_2 alumno_3/parcial_3 profesores
do
	DISPOSITIVO=${DISCO}${INDICE_DISCO}
	DIR="/Examenes-UTN/${carpeta}"

	echo "Montando disco ${DISCO_A_MONTAR} en ${DIRECTORIO}"
	echo
	
	echo "${DISPOSITIVO}   ${DIR}   ext4     defaults      0        0" | sudo tee -a /etc/fstab 
	
	# Aumento contador de disco

	INDICE_DISCO=$((INDICE_DISCO+1))
done

# Montar todo lo de fstab
sudo systemctl daemon-reload
sudo mount -a
