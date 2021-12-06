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

while [ $select -ne 4 ]; 
	do

	echo "Opciones"
	echo "0. Creacion de archivos necesarios"
	echo "1. Configuracion Rapida (Basica)"
	echo "2. Configuracion Avanzada"
	echo "3. Iniciar Servidor"
	echo "4. Exit"
	read -p "Seleccione su funcion: " select

	case $select in

		0)
			clear

			#Verificacion de aceptacion de eula, en caso de no existir se creara

			echo "Verificando existencia EULA"

			EULA=$(pwd)/eula.txt
			if [ -f $EULA ]
				then
				sed -i 's/eula=false/eula=true/' eula.txt
				else
				java -Xmx1024M -Xms1024M -jar server.jar
				sed -i 's/eula=.*/eula=true/' eula.txt
			fi
			clear
			echo "Archivos creados exitosamente"
			sleep 1
			clear
		;;

		1)
			clear
			echo "Configuracion Rapida"
			sleep 2
			clear

			#Modificacion del archivo server.properties

			confirm=1

			while [ $confirm -ne 0 ]; 
				do

				read -p "Escriba el Nombre de su servidor: " sname
				clear
				read -p "Escriba la dificultad (easy) (nomal) (hard): " dname
				clear
				read -p "Servidor premium si ->(true) no ->(false): " oname
				clear
				echo "Confirme configuracion: "
				echo "Nombre servidor = $sname"
				echo "Dificultad = $dname"
				echo "Servidor Premium = $oname"
				echo "Los parametros son correctos?" 
				echo "1.Incorrectos"
				echo "0.Correctos"

				read -p "Ingrese su respuesta: " confirm
			case $confirm in	
				1)
					echo "Porfavor reingrese los parametros."
					sleep 2
				;;
				0)
				;;
				*)
				echo "Opcion Invalida, intente nuevamente"
				;;
			esac
			done
			#Aplicacion de cambios en server.properties
				sed -i "s/motd=.*/motd=$sname/" server.properties
				sed -i "s/difficulty=.*/difficulty=$dname/" server.properties
				sed -i "s/online-mode=.*/online-mode=$oname/" server.properties
				clear
				echo "Configuracion inicial exitosa, si desea realice la configuracion avanzada si no ya esta disponible para jugar!"
				sleep 5
				clear
			;;

		2)
			clear
			echo "Configuracion Avanzada"
			conf=8
			while [ $conf -ne 0 ]; do
				echo "parametros a modificar: "
				echo "0. motd"
				echo "1. gamemode"
				echo "2. difficulty"
				echo "3. pvp"
				echo "4. server-port"
				echo "5. view-distance"
				echo "6. simulation-distance"
				echo "7. hardcore"
				echo "8. Menu"
				read -p "Ingrese opcion: " conf
				case $conf in
				0)
					echo "Ingrese nombre del servidor"
					read -p "(Nombre) : " cname
					sed -i "s/motd=.*/motd=$cname/" server.properties
					clear
					echo "Opcion guardada correctamente"
					sleep 1
				;;
				1)
					echo "Ingrese modo de juego"
					read -p "(spectator) (survival) (creative) (adventure) : " cgame
					sed -i "s/gamemode=.*/gamemode=$cgame/" server.properties
					clear
					echo "Opcion guardada correctamente"
					sleep 1
				;;

				2)

					echo "Ingrese dificultad"
					read -p "(hard) (normal) (easy) : " cdiff
					sed -i "s/difficulty=.*/difficulty=$cdiff/" server.properties
					clear
					echo "Opcion guardada correctamente"
					sleep 1
				;;

				3)
					echo "Player vs Player"
					read -p "(true) (false) : " copvp
					sed -i "s/pvp=.*/pvp=$copvp/" server.properties
					clear
					echo "Opcion guardada correctamente"
					sleep 1
				;;

				4)
					echo "Ingrese puerto a utilizar"
					read -p "(default: 25565) : " cport
					sed -i "s/server-port=.*/server-port=$cport/" server.properties
					clear
					echo "Opcion guardada correctamente"
					sleep 1
				;;

				5)
					echo "Ingrese distancia de renderizado"
					read -p "(numero de chunks) : " cview
					sed -i "s/view-distance=.*/view-distance=$cview/" server.properties
					clear
					echo "Opcion guardada correctamente"
					sleep 1
				;;

				6)
					echo "Ingrese distancia de simulacion"
					read -p "(numero de chunks) : " csimu
					sed -i "s/simulation-distance=.*/simulation-distance=$csimu/" server.properties
					clear
					echo "Opcion guardada correctamente"
					sleep 1
				;;

				7)
					echo "Activar modo hardcore?"
					read -p "(true) (false): " chard
					sed -i "s/hardcore=.*/hardcore=$chard/" server.properties
					clear
					echo "Opcion guardada correctamente"
					sleep 1
				;;

				8)	
				;;

				*)
				echo "Ingrese una ocion valida"
				;;
				esac	
			done
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