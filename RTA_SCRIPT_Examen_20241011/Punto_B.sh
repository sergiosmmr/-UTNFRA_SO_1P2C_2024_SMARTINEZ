#!/bin/bash

DISCO=$(sudo fdisk -l | grep '10 GiB' | awk '{print $2}' | awk -F ':' '{print $1}')

echo "Particionando disco: $DISCO"
echo

sudo fdisk $DISCO << EOF
n
e
1


n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M

w
EOF

echo
echo "Particiones Creadas!"

sudo fdisk -l $DISCO

# Formateo de Particiones
echo "Formateando Particiones..."
for i in {5..14} 
do
	DISCO_ACTUAL=${DISCO}${i}
	echo "Formateando Particion: ${DISCO_ACTUAL}"
	sudo mkfs.ext4 -F ${DISCO_ACTUAL}
done

#montaje
echo "Montando_Particiones......"

# agrego en /etc/fstab las rutas

echo "${DISCO}1 /Examenes-UTN/profesores ext4 default 0 0" | sudo tee -a /etc/fstab

echo "${DISCO}5 /Examenes-UTN/alumno_1/parcial_1 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}6 /Examenes-UTN/alumno_1/parcial_2 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}7 /Examenes-UTN/alumno_1/parcial_3 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}8 /Examenes-UTN/alumno_2/parcial_1 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}9 /Examenes-UTN/alumno_2/parcial_2 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}10 /Examenes-UTN/alumno_2/parcial_3 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}11 /Examenes-UTN/alumno_3/parcial_1 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}12 /Examenes-UTN/alumno_3/parcial_2 ext4 default 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}13 /Examenes-UTN/alumno_3/parcial_3 ext4 default 0 0" | sudo tee -a /etc/fstab


# Montar todo lo de fstab

sudo systemctl daemon-reload
sudo mount -a
