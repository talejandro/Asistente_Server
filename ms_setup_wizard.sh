#/bin/bash

#Script presentation
clear
echo "Welcome to the Minecraft Server setup wizard"
sleep 2
echo "By Talejandro"
sleep 2
clear


select=5
#User IP

cport="25565"
IP=$(ip -4 addr | sed -ne 's|^.* inet \([^/]*\)/.* scope global.*$|\1|p' | head -1)

while [ $select -ne 4 ]; 
	do

	echo "Main menu"
	echo "0. Creation of necessary files"
	echo "1. Quick setup (Basic)"
	echo "2. Advanced setup"
	echo "3. Start Server"
	echo "4. Exit"
	read -p "Select an option: " select

	case $select in

		0)
			clear

			#Verification of eula, if it does not exist, it will be created

			echo "Checking EULA file"

			EULA=$(pwd)/eula.txt
			if [ -f $EULA ]
				then
				sed -i 's/eula=false/eula=true/' eula.txt
				else
				java -Xmx1024M -Xms1024M -jar server.jar
				sed -i 's/eula=.*/eula=true/' eula.txt
			fi
			clear
			echo "Files successfully created"
			sleep 1
			clear
		;;

		1)
			clear
			echo "Quick setup"
			sleep 2
			clear

			#Modification of the server.properties file

			confirm=3

			while [ $confirm -ne 1 ]; 
				do

				read -p "Name server: " sname
				clear
				read -p "Dufficulty (easy) (nomal) (hard): " dname
				clear
				read -p "Premium server yes ->(true) no ->(false): " oname
				clear
				echo "Confirm configuration: "
				echo "Name server = $sname"
				echo "Dufficulty = $dname"
				echo "Premiun Server = $oname"
				echo "The configuration is correct?" 
				echo "1.YES"
				echo "0.NO"

				read -p "Answer: " confirm
			case $confirm in	
				0)
					echo "Please, re-enter the parameters."
					sleep 2
				;;
				1)
				;;
				*)
				echo "Invalid option, try again"
				;;
			esac
			done
			#Applying changes to server.properties
				sed -i "s/motd=.*/motd=$sname/" server.properties
				sed -i "s/difficulty=.*/difficulty=$dname/" server.properties
				sed -i "s/online-mode=.*/online-mode=$oname/" server.properties
				clear
				echo "Quick setup successful"
				sleep 3
				clear
			;;

		2)
			clear
			echo "Advanced setup"
			conf=10
			while [ $conf -ne 9 ]; do
				echo "Options : "
				echo "0. Name"
				echo "1. Game mode"
				echo "2. Difficulty"
				echo "3. Pvp"
				echo "4. Server port"
				echo "5. View Distance"
				echo "6. Simulation Distance"
				echo "7. Hardcore mode"
				echo "8. Premium mode"
				echo "9. Menu"
				read -p "Insert an option : " conf
				case $conf in
				0)
					echo "Enter name server."
					read -p "(Nombre) : " cname
					sed -i "s/motd=.*/motd=$cname/" server.properties
					clear
					echo "Option saved correctly"
					sleep 1
				;;
				1)
					echo "Enter gamemode."
					read -p "(spectator) (survival) (creative) (advenzture) : " cgame
					sed -i "s/gamemode=.*/gamemode=$cgame/" server.properties
					clear
					echo "Option saved correctly"
					sleep 1
				;;

				2)

					echo "Enter difficulty."
					read -p "(hard) (normal) (easy) : " cdiff
					sed -i "s/difficulty=.*/difficulty=$cdiff/" server.properties
					clear
					echo "Option saved correctly"
					sleep 1
				;;

				3)
					echo "Player vs Player."
					read -p "(true) (false) : " copvp
					sed -i "s/pvp=.*/pvp=$copvp/" server.properties
					clear
					echo "Option saved correctly"
					sleep 1
				;;

				4)
					echo "Enter port."
					read -p "(default: 25565): " cport
					sed -i "s/server-port=.*/server-port=$cport/" server.properties
					clear
					echo "Option saved correctly"
					sleep 1
				;;

				5)
					echo "Enter view distance."
					read -p "(numero de chunks): " cview
					sed -i "s/view-distance=.*/view-distance=$cview/" server.properties
					clear
					echo "Option saved correctly"
					sleep 1
				;;

				6)
					echo "Enter simulation distance."
					read -p "(numero de chunks): " csimu
					sed -i "s/simulation-distance=.*/simulation-distance=$csimu/" server.properties
					clear
					echo "Option saved correctly"
					sleep 1

				;;

				7)
					echo "Hardcore mode."
					read -p "(true) (false): " chard
					sed -i "s/hardcore=.*/hardcore=$chard/" server.properties
					clear
					echo "Option saved correctly"
					sleep 1
				;;

				8)
					echo "Premium mode?"
					read -p "(true) (false): "
					sed -i "s/online-mode=.*/online-mode=$oname/" server.properties	
					clear
					echo "Option saved correctly"
					sleep 1
				;;
				9)
				;;
				*)
				echo "$oname is't an option, try again!"
				;;
				esac	
			done
				sleep 2
				clear
		;;
		3)
			#run server
			clear
			echo "Run Server"
			sleep 1
			echo "Allocate RAM: "
			read -p "Enter number in M (ex: 3072M): " cram
			sleep 1
			echo "Attention!!!, you will enter on the server administration console."
			sleep 1
			echo "To stop it press Crtl + C"
			sleep 1
			echo "-----Remember connect to $IP:$cport-----"
			sleep 1
			echo "The server stars, in..."
			sleep 1
			echo "3..."
			sleep 1
			echo "2..."
			sleep 1
			echo "1..."
			


			java -Xmx$cram -Xms$cram -jar server.jar nogui
		;;
		4)
			clear
		;;
			*)
			clear
			echo "$select is't an option, try again!"
			sleep 3
			clear
	;;
	esac
done
