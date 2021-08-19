#!/bin/bash

# Script para realizar a atualização do sistema Linux via interface gráfica ou diretamente pelo terminal
# Para interface gráfica, utilizado o zenity
# Criado em: 13/08/2021
# Criado por: Jacqueline Rodrigues
# Contato: jacs.rodriguess@gmail.com

# Barra de processo da atualização
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


# Opção de escolha para iniciar a atualização
ESCOLHA=$(zenity --list --title="Atualização do Sistema" --text="Como deseja atualizar o sistema?" \
	--radiolist \
	--column "Marcar" \
	--column "Forma de Atualização" \
	FALSE "Interface" TRUE "Terminal")

if [ $ESCOLHA = "Interface" ]
then
	# Barra de processo da atualização, juntamente com o comando para atualização da máquina (apt-get update)
	zenity --info --text="Você escolheu $ESCOLHA"
	atualizacao | zenity --progress --title="Atualização da Máquina" --auto-close | apt-get update
	zenity --info --text="Sistema atualizado!"
	exit 0
else
	# Atualização diretamente via terminal
	apt-get update
	echo
	echo Sistema atualizado
fi

# Fim do script
