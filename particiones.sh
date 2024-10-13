#!/bin/bash

sudo fdisk /dev/sdc << EOF  
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

sudo wkfs.ext4 /dev/sdc5
sudo wkfs.ext4 /dev/sdc6

exit
