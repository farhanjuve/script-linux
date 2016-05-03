PS3='PILIH SALAH SATU SAJA : '
echo "============ UBUNTU 14.04 LTS ==========="
echo "NOTE : CASE SENSITIVE, WATCH YOUR UPPER AND LOWERCASE"
echo
menu=("Ganti Wallpaper" "Ganti Icon" "Ganti Tema" "Menambah User" "Keluar")
select opt in "${menu[@]}"

do
	case $opt in
		"${menu[0]}")
		echo "Masukkan file(ex :/home/yourname/xxx.png) : "
		read wp
		while [ ! -f $wp ]
			do
			 echo "Cannot find path to file"
			 read wp
			done
		gsettings set org.gnome.desktop.background picture-uri "file://$wp"
		;;
		
		"${menu[1]}")
		echo "Masukkan file/folder yang ingin diganti(ex :/root/test) : "
		read wp
		echo "Masukkan file icon(ex :/home/yourname/xxx.png) : "
		read icon
		gvfs-set-attribute $wp metadata::custom-icon "file://$icon"
		echo "if nothing happened, the directory you wrote is wrong"
		;;

		"${menu[2]}")
		echo "Masukkan nama tema dari direktori /usr/share/themes (ex:Radiance) : "
		read theme
		gsettings set org.gnome.desktop.interface gtk-theme "$theme"
		;;

		"${menu[3]}")
		echo "Masukkan nama user baru (ex:farhan) : "
		read user
		adduser $user
		;;

		"Keluar")
		break
		;;
		*) echo invalid menu;;
	esac
done
