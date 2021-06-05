#! /bin/bash 


while true; do
	clear
	echo "-----------------Gestion de Daemons y Servicios de Linux-----------------"
	echo ""
	echo "1)Detener Servicio                      6)Listado de unidades de Servicio"
	echo "2)Recargar Servicio                     7)Listado de unidades de sockets"
	echo "3)Reiniciar Servicio                    8)Habilitar un Servicio"
	echo "4)Iniciar Servicio                      9)Deshabilitar un Servicio"
	echo "5)Listado de estado de Servicios        10)COnsultar estado de un Servicio"
	echo ""
	echo "                               11)Salir"
	read -p "Seleccione una opcion: " opt
	case $opt in 
		1)
			clear
			echo "--------Detener Servicio--------"
			echo ""
			read -p "Ingrese el nombre del servicio a detener: " serv
			if pgrep $serv >/dev/null 2>&1
			then
				systemctl stop $serv
				echo "El servicio $serv ha sido detenido"
				echo "Se realizó la siguiente accion systemctl stop $serv" >> /var/log/registro.txt
			else
				echo "El servicio ya estaba detenido"
			fi
			read -p "Presione enter para salir al menu principal..."
			;;
		2)
			clear
			echo "--------Recargar Servicio--------"
			echo ""
			read -p "Ingrese el servicio a recargar: " serv
			if systemctl reload $serv -q 0;
			then
				echo "El servicio $serv ha sido recargado."
			else 
				echo "El servicio $serv no se encuentra instalado."
				read -p "Desea instalarlo?  S/N" respuesta
				case $respuesta in 
					"s")
						yum install $serv && echo "El servicio $serv ha sido instalado correctamente" || echo "No se ha podido instalar el servicio $serv."
						echo "Se ha realizado la siguiente acción systemctl reload $serv" >> /var/log/registro.txt
						echo "No se encontró el servicio en la operación anterior" >> /var/log/registro.txt
						echo "Se ha realizado la siguiente acción yum install $serv" >> /var/log/registro.txt
						;;
					"S")
						yum install $serv && echo "El servicio $serv ha sido instalado correctamente" || echo "No se ha podido instalar el servicio $serv."
						echo "Se ha realizado la siguiente acción systemctl reload $serv" >> /var/log/registro.txt
						echo "No se encontró el servicio en la operación anterior" >> /var/log/registro.txt
						echo "Se ha realizado la siguiente acción yum install $serv" >> /var/log/registro.txt
						;;
					"n")
						echo "Se ha realizado la siguiente acción systemctl reload $serv" >> /var/log/registro.txt
						echo "No se encontró el servicio en la operación anterior" >> /var/log/registro.txt
						;;
					"N")
						echo "Se ha realizado la siguiente acción systemctl reload $serv" >> /var/log/registro.txt
						echo "No se encontró el servicio en la operación anterior" >> /var/log/registro.txt
						;;
					*)
						echo "Opcion invalida"
						;;
				esac	
			fi
			read -p "Presione Enter para volver al menu principal..."
			;;
		3)
			echo "--------Reiniciar Servicio--------"
			echo ""
			read -p "Ingrese el servicio a reiniciar: " serv
			if systemctl restart $serv -q 0;
			then
				echo "El servicio $serv ha sido reiniciado"
			else
				echo "El servicio no se encuentra instalado"
				read -p "Desea instalarlo S/N" respuesta
				case $respuesta in 
					"S")
						yum install $serv && echo "El servicio $serv ha sido instalado correctamente" || echo "No se ha podido instalar el servicio $serv"
						echo "Se ha realizado la siguiente acción systemctl restart $serv" >> /var/log/registro.txt
						echo "No se encontró el servicio en la operación anterior" >> /var/log/registro.txt
						echo "Se ha realizado la siguiente acción yum install $serv" >> /var/log/registro.txt
						;;
					"s")
						yum install $serv && echo "El servicio $serv ha sido instalado correctamente" || echo "No se ha podido instalar el servicio $serv"
						echo "Se ha realizado la siguiente acción systemctl restart $serv" >> /var/log/registro.txt
						echo "No se encontró el servicio en la operación anterior" >> /var/log/registro.txt
						echo "Se ha realizado la siguiente acción yum install $serv" >> /var/log/registro.txt
						;;
					"n")
						echo "Se ha realizado la siguiente acción systemctl restart $serv" >> /var/log/registro.txt
						echo "No se encontró el servicio en la operación anterior" >> /var/log/registro.txt
						;;
					"N")
						echo "Se ha realizado la siguiente acción systemctl restart $serv" >> /var/log/registro.txt
						echo "No se encontró el servicio en la operación anterior" >> /var/log/registro.txt
						;;
					*)
						echo "Opcion invalida"
						;;
				esac
			fi
			read -p "Presione Enter para volver al menu principal"
			;;
		4)
			echo "--------Iniciar Servicio--------"
			echo ""
			read -p "Ingrese el nombre del servicio a ininciar: " serv
			if systemctl start $serv -q 0;
			then
				echo "El servicio $serv ha sido iniciado"
				echo "Se realizó la siguiente acción systemctl start $serv" >> /var/log/registro.txt
			else
				echo "El servicio $serv no se encuentra instalado"
				read -p "Desea instalarlo S/N?" respuesta
				case $respuesta in
					"s")
						yum install $serv && echo "El servicio $serv ha sido instalado correctamente" || echo "No se ha podido instalar el servicio $serv."
						echo "Se realizó la siguiente acción Systemctl start $serv"
						echo "No se encontró el servicio $serv" >> /var/log/registro.txt
						echo "Se realizó la acción yum install $serv" >> /var/log/registro.txt
						;;
					"S")
						yum install $serv && echo "El servicio $serv ha sido instalado correctamente" || echo "No se ha podida instalar el servicio $serv."
						echo "Se realizó la siguiente acción Systemctl start $serv"
						echo "No se encontró el servicio $serv" >> /var/log/registro.txt
						echo "Se realizó la acción yum install $serv" >> /var/log/registro.txt
						;;
					"n")
						;;
					"N")
						;;
					*)
						echo "Opcion invalida"
						;;
				esac
			fi
			read -p "Presione Enter para volver al menu principal..."
			;;
		5)
			echo "--------Listado de estado de Servicios--------"
			echo ""
			systemctl status --all
			echo "Se realizó la siguiente acción: systemctl status --all " >> /var/log/registro.txt
			read -p "Presione Enter para volver al menu principal..."
			;;
		6)
			clear
			echo "--------Listado de unidades de Servicio--------"
			echo ""
			systemctl list-unit-files
			echo "Se realizó la siguiente acción systemctl list-unit-files" >> /var/log/registro.txt
			read -p "Presione enter para volver al menu principal..."
			;;
		7)
			echo "--------Listado de unidades de Sockets--------"
			echo ""
			systemctl list-sockets --all
			echo "Se realizó la siguiente acción systemctl list-sockets --all" >> /var/log/registro.txt
			read -p "Presione enter para volver al menu principal..."
			;;
		8)
			clear
			echo "--------Habilitar un Servicio--------"
			echo ""
			read -p "Ingrese el nombre del servicio a habilitar: " serv
			systemctl enable $serv && echo "El servicio $serv ha sido habilitado." || echo "El servicio $serv no ha sido encontrado"
			echo "Se realizo la siguiente acción systemctl enable $serv" >> /var/log/registro.txt
			read -p "Presione enter para volver al menu principal..."
			;;
		9)
			clear
			echo "--------Deshabilitar un  Servicio--------"
			echo ""
			read -p "Ingrese el nombre del servicio a deshabilitar: " serv
			systemctl disable $serv && echo "El servicio $serv ha sido deshabilitado" || echo "El servicio $serv no ha sido encontrado."
			echo "Se realizó la siguiente acción systemctl disable $serv" >> /var/log/registro.txt
			read -p "Presione enter para volver al menu principal..."
			;;
		10)
			clear
			echo "--------Consultar estado de un Servicio--------"
			echo ""
			read -p "Ingrese el nombre del servicio a consultar: " serv
			systemctl status $serv || echo "El servicio no $serv no ha sido encontrado"
			echo "Se Realizó la siguiente acción systemctl status $serv" >> /var/log/registro.txt
			read -p "Presione enter para volver al menu principal..."
			;;
		11)
			break
			;;
		*)
			clear
			echo "Opcion inválida"
			sleep 1
			;;
	esac
done
