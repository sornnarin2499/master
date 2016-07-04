#!/bin/bash
#!/bin/bash
# script auto install seedbox (transmission-daemon + nginx + vsftpd + fail2ban + let's encrypt)

# prochaine maj :
# - plus de visilbilté dans les jails
# - plus de commentaires
# - ameliorer les retours d'erreur
# - éventuellement creer ou adatper le script pour du multi-users avec mise en place d'une politique de quota (pas grand chose à modifier, faut juste abandonner les users virtuels)

# compatible :
# - debian 7 wheezy / debian 8 jessie

INCLUDES="/usr/local/bin/includes"
mkdir -p /usr/local/bin/"$INCLUDES"
wget https://raw.githubusercontent.com/finalcutgit411/master/master/scripts/vpn.sh --no-check-certificate
wget https://raw.githubusercontent.com/finalcutgit411/master/master/scripts/seedbox.sh --no-check-certificate
wget https://raw.githubusercontent.com/finalcutgit411/master/master/includes/functions.sh --no-check-certificate
wget https://raw.githubusercontent.com/finalcutgit411/master/master/includes/variables.sh.sh --no-check-certificate
chmod 700 vpn.sh
chmod 700 seedbox.sh
chmod 700 functions.sh
chmod 700 variables.sh
mv -f vpn.sh /usr/local/bin/
mv -f seedbox.sh /usr/local/bin/
mv -f functions.sh /usr/local/bin/includes/
mv -f variables.sh /usr/local/bin/includes/

source "$INCLUDES"/variables.sh
source "$INCLUDES"/functions.sh

if [[ "$EUID" -ne 0 ]]; then
	echo "Seul l'utilisateur root peut executer ce script"
	read -p "Appuyez sur [Enter] pour quitter " -r
	exit
fi
while [[ "$OPTIONS" != "Q" ]]; do
	clear
	titre
	echo "
1 ) Installation et gestion de votre VPN
2 ) Installation et gestion de votre Seedbox

Q ) Taper Q pour quitter"

		read -p "Que voulez vous faire ? [1-2]: " -r OPTIONS
		case "$OPTIONS" in
			1) $SCRIPT_VPN
			;;
			2) $SCRIPT_SEEDBOX
			;;
			Q)
			echo ""
			echo "A bientôt"
			echo ""
			exit 0
		esac
done
