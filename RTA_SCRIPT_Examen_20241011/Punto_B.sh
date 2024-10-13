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
sudo mount ${DISCO}5 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount ${DISCO}6 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount ${DISCO}7 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount ${DISCO}8 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount ${DISCO}9 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount ${DISCO}11 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount ${DISCO}12 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount ${DISCO}13 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount ${DISCO}14 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
rudo mount ${DISCO}15 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
