#!/bin/bash

function atualizacao () {
	
	echo "# Iniciando atualização" 
	sleep 2

	echo " # 25% da atualização"
	echo "25"
	sleep 2
	
	echo "# 50% da atualização" 
	echo "50"
	sleep 1
	
	echo "# 75% da atualização" 
	echo "75"
	sleep 2
	
	echo "# 99% da atualização" 
	echo "99"
	sleep 2

	echo "# Atualização completa"
	sleep 2
	echo "100"
}


ESCOLHA=$(zenity --list --title="Atualização do Sistema" --text="Como deseja atualizar o sistema?" \
	--radiolist \
	--column "Marcar" \
	--column "Forma de Atualização" \
	FALSE "Interface" TRUE "Terminal")

if [ $ESCOLHA = "Interface" ]
then
	zenity --info --text="Você escolheu $ESCOLHA"
	atualizacao | zenity --progress --title="Atualização da Máquina" --auto-close | apt-get update
	zenity --info --text="Sistema atualizado!"
	exit 0
else
	apt-get update
	echo
	echo Sistema atualizado
fi
