#!/bin/bash

#creamos estructura

mkdir -p $HOME/Estructura_Asimetrica/{{correo,cliente}/cartas_{1..100},correo/carteros_{1..10}}

echo "se creo estructura en el HOME del usuario"


#se valida

tree $HOME/Estructura_Asimetrica/ --noreport | pr -T -s'' -w 80 --column 4
