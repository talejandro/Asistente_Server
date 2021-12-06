#/bin/bash

#Presentacion del script

clear

echo "Bienvenido al asistente de configuracion"
sleep 2
echo "Desarrollado por Mi >:D"
sleep 2

clear



#Verificacion de aceptacion de eula, en caso de no existir se creara

EULA=~/script/eula.txt

if [ -f $EULA ]
	then

	sed -i 's/eula=false/eula=true/' eula.txt

	else
	java -Xmx1024M -Xms1024M -jar server.jar
	sed -i 's/eula=false/eula=true/' eula.txt
fi


clear

#Modificacion del archivo server.properties

echo "Se procedera a la configuracion del servidor "
sleep 3

clear
read -p "Escriba el Nombre de su servidor: " sname
clear
read -p "Escriba la dificultad (easy) (nomal) (hard): " dname
clear
read -p "Servidor premium si ->(true) no ->(false): " oname
clear
read -p "Escriba el puerto a utilizar: " pname
clear
read -p "Escriba la distancia de vision (en chunks): " vname
clear
read -p "Escriba la distancia de simulacion (en chuks): " xname
clear

echo "Confirme configuracion: "

echo "Nombre servidor = $sname"
echo "Dificultad = $dname"
echo "Servidor Premium = $oname"
echo "Puerto = $pname"
echo "Distancia de Vision = $vname chunks"
echo "Distancia de Simulacion = $xname chuks"

read -p "Los parametros son correctos? (y o n): " confirm

confirmn="n"
confirmy="y"

if [ $confirm = $confirmn ]
	then
#reiniciar script
	else

		if [$confirm = $confirmy]
			then
			echo "Configuracion lista"
			else
			echo "shupala"
		fi
fi
