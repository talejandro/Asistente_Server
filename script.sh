#/bin/bash

#Presentacion del script

clear
echo "Bienvenido al asistente de configuracion"
sleep 2
echo "Desarrollado por Mi >:D"
sleep 2
clear


select=0
#ip del cliente

IP=$(ip -4 addr | sed -ne 's|^.* inet \([^/]*\)/.* scope global.*$|\1|p' | head -1)

while [ $select -ne 4 ]; do

echo "Opciones"
echo "1. Configuracion inicial (Basica)"
echo "2. Configuracion Avanzada"
echo "3. Iniciar Servidor"
echo "4. Exit"
read -p "Seleccione su funcion: " select

	case $select in

	1)
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

		confirm="n"
		confirmn="n"
		confirmy="y"
		until [ $confirm = $confirmy ]
			do
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
			done
		#Aplicacion de cambios en server.properties

		sed -i "s/motd=.*/motd=$sname/" server.properties
		sed -i "s/difficulty=.*/difficulty=$dname/" server.properties
		sed -i "s/online-mode=.*/donline-mode=$oname/" server.properties
		sed -i "s/server-port=.*/server-port=$pname/" server.properties
		sed -i "s/view-distance=.*/view-distance=$vname/" server.properties
		sed -i "s/simulation-distance=.*/simulation-distance=$xname/" server.properties
		clear
		echo "Configuracion inicial exitosa, si desea realice la configuracion avanzada si no ya esta disponible para jugar!"
		sleep 5
		clear
	;;

	2)
		clear
		echo "opcion 2"
		sleep 5
		clear
	;;
	3)
		clear
		echo "opcion 3"
		sleep 5
		clear
	;;
	4)
		;;
	*)
		clear
		echo "$select no es una opcion, intente nuevamente"
		sleep 5
		clear
	;;
esac

done
