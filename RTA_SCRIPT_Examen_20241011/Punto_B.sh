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

