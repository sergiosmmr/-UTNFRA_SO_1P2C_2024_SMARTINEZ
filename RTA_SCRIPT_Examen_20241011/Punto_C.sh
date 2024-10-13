#!/bin/bash
exit
echo
echo "Para ejecutar:   ./1_for_lista.sh  2_for_cmd_lista.txt"
echo

LISTA=$1
USUARIO_HAS=$2
HASH=$($ sudo grep $USUARIO_HASH /etc/shadow |awk -F ':' '{print $2}')

sudo mkdir -p /datos/dir-home

ANT_IFS=$IFS
IFS=$'\n'
for LINEA in `cat $LISTA |  grep -v ^#`
do
	USUARIO=$(echo  $LINEA |awk -F ',' '{print $1}')
	GRUPO=$(echo  $LINEA |awk -F ',' '{print $2}')
	DIR_HOME=$(echo $Linea |awk -F ',' ' '{print $3})
	echo "Creo User: $USUARIO en $GRUPO con Home: $DIR_HOME"
	sudo groupaad $GRUPO
	sudo useradd -m -s /bin/bash -G $GRUPO -p "$HASH" -d $DIR_HOME $USUARIO
	echo "----------------------------"
	echo
done
IFS=$ANT_IFS
