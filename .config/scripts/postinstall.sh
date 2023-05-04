#!/bin/bash
#Post-install Script for my void distribution

#printf "\n\nUpdating packages to latest version\n\n"
#sudo xbps-install -Suvy

#Variables go here:

#Check if tput exists:
if ! command -v tput &> /dev/null; then
	#tput could not be found
	BOLD=""
	RESET=""
	FG_SKYBLUE=""
	FG_ORANGE=""
	BG_AQUA=""
	FG_BLACK=""
	FG_ORANGE=""
	UL=""
	RUL=""
else
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
	FG_SKYBLUE=$(tput setaf 122)
	FG_ORANGE=$(tput setaf 208)
	BG_AQUA=$(tput setab 45)
	FG_BLACK=$(tput setaf 16)
	FG_ORANGE=$(tput setaf 214)
	UL=$(tput smul)
	RUL=$(tput rmul)
fi


getEssentials()
{
	printf "\nDownloading some required packages\n\n"
	printf "\n\nInstalling the $FG_ORANGEHTTP based Download tool$RESET\n"
	sudo xbps-install -Sy wget
	printf "\n\nInstalling $FG_ORANGEVim Text Editor$RESET\n"
	sudo xbps-install -Sy neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

packageInstall()
{
        input="$HOME/.config/INSTALLED_PKGS"
        while read -r line
        do
		if ! [[ $line =~ "socklog"  || $line =~ "socklog-void" || $line =~ "cronie" || $line =~ "wget" || $line =~ "git" || $line =~ "neovim" || $line =~ ^xfce4 ]]; then
			sudo xbps-install -Sy $line
			printf "\ninstalling $line"
           	fi
        done < "$input"
}
xfce4Install()
{
        input="$HOME/.config/INSTALLED_PKGS"
        while read -r line
        do
		if [[ $line =~ ^xfce4 ]]; then
			sudo xbps-install -Sy $line
			printf "\ninstalling $line"
           	fi
        done < "$input"

	sudo cp -rv $HOME/.config/xdg /etc/
#	rm -rf $HOME/.config.xfce4
}

createDirectories()
{
	if [[ -d $HOME/tmp ]] ; then
        	printf "The directory $FG_ORANGE$HOME/tmp$RESET already exists. Skipping..."
    	else
		mkdir $HOME/tmp
    	fi

    	if [[ -d $HOME/mYsTuFf ]] ; then
		printf "The directory $FG_ORANGE$HOME/mYsTuFf$RESET already exists. Skipping..."
    	else
		mkdir $HOME/mYsTuFf
    	fi

    	if [[ -d $HOME/void-packages ]] ; then
		printf "The directory $FG_ORANGE$HOME/void-packages$RESET already exists. Skipping..."
    	else
		printf "Setting up the source packages Tree...."
		cd $HOME 
		git clone http://github.com/eamoc/void-packages.git
		cd void-packages
		./xbps-src binary-bootstrap
    	fi
}

sourceBashrc()
{
	printf "Reloading .bashrc\n\n"
	source $HOME/.bashrc
}

gitGlobalIDSetup()
{
    	#Adding global username and email to git
    	printf "Adding global username and email to git\n\n"
    	git config --global user.name "eamonn costello"
    	git config --global user.email "eamonncostello@gmail.com"
}

firewallConfig()
{
    	#If the service already exists, disable it
    	if [ -L /var/service/iptables ] ; then
		sudo rm /var/service/iptables
		printf "Deleted existing symlink for iptables\n\n"
	fi

    	if [ -L /var/service/ip6tables ] ; then
       		sudo rm /var/service/ip6tables
       		printf "Deleted existing symlink for ipt6ables\n\n"
    	fi

    	#Apply rulesets to iptables and ip6tables
    	if [ -f $HOME/.config/scripts/iptables_ruleset.sh ] ; then
       		sudo sh $HOME/.config/scripts/iptables_ruleset.sh
       		sudo iptables-save | sudo tee /etc/iptables/iptables.rules
       		printf "Finished applying ruleset to iptables\n\n"
    	else 
       		printf "Ruleset file does not exist\n\n"    
    	fi

    	if [ -f $HOME/.config/scripts/ip6tables_ruleset.sh ] ; then
       		sudo sh $HOME/.config/scripts/ip6tables_ruleset.sh
       		sudo ip6tables-save | sudo tee /etc/iptables/ip6tables.rules
       		printf "Finished applying ruleset to ip6tables\n\n"
    	else 
       		printf "Ruleset file does not exist\n\n"
    	fi

    	# Add symbolic links for iptables and ip6tables I.e enable the services
    	sudo ln -s /etc/sv/iptables /var/service 
    	printf "Enabled the iptables service\n\n"
    	sudo ln -s /etc/sv/ip6tables /var/service 
    	printf "Enabled the ip6tables service\n\n"
}

socklogConfig()
{
	printf "\n\nInstalling the$FG_ORANGE Socklog logger$RESET\n"
    	sudo xbps-install -Sy socklog
   	printf "\n\nInstalling $FG_ORANGE Void Linux config for Socklog$RESET\n"
    	sudo xbps-install -Sy socklog-void

    	#Add a log user for logging
	#useradd -M -N -g 99 -u 98 -c 'Unprivileged User' -d /dev/null -s /bin/false log
    
    	#Give the logged in user access to the socklog group (dont know why I need this)
    	sudo usermod -aG socklog $USER
   
    	# Symbolic links for socklog

    	if [[ -h /var/service/socklog-unix ]] ; then
		sudo rm /var/service/socklog-unix
		printf "Disabled the $BG_ORANGE$FG_BLACK socklog-unix service$RESET$RESET\n\n"
		sudo ln -s /etc/sv/socklog-unix /var/service 
		printf "Ensabled the $BG_ORANGE$FG_BLACK socklog-unix service$RESET$RESET\n\n"
   	else
        	sudo ln -s /etc/sv/socklog-unix /var/service
        	printf "Enabled the $BG_ORANGE$FG_BLACK socklog-unix service$RESET$RESET\n\n"
    	fi

    	if [[ -h /var/service/nanoklogd ]] ; then
        	sudo rm /var/service/nanoklogd
        	printf "Disabled the $BG_ORANGE$FG_BLACK nanoklogd service$RESET$RESET\n\n"
        	sudo ln -s /etc/sv/nanoklogd /var/service 
        	printf "Enabled the $BG_ORANGE$FG_BLACK nanoklogd service$RESET$RESET\n\n"
    	else
        	sudo ln -s /etc/sv/nanoklogd /var/service
        	printf "Enabled the $BG_ORANGE$FG_BLACK nanoklogd service$RESET$RESET\n\n"
    	fi
}

cronie_SvConfig()
{
	printf "\n\nInstalling  the $FG_ORANGEcronie daemon to run specified commands$RESET\n"
	sudo xbps-install -Sy cronie

   
	if [[ -h /var/service/cronie ]] ; then
		sudo rm /var/service/cronie
		printf "Disabled the $BG_ORANGE$FG_BLACK cronie service$RESET$RESET\n\n"
		sudo ln -s /etc/sv/cronie /var/service 
		printf "Enabled the $BG_ORANGE$FG_BLACK cronie service$RESET$RESET\n\n"

	        #Set up the crontab
        	printf "importing crontab from file"
	        crontab $HOME/.config/CRONTAB
    	else
		sudo ln -s /etc/sv/cronie /var/service
		printf "Enabled the $BG_ORANGE$FG_BLACK cronie service$RESET$RESET\n\n"
		   
	        #Set up the crontab
        	printf "importing crontab from file\n"
	        crontab $HOME/.config/CRONTAB
    	fi
}

golangInstall()
{
	printf "\n\nDownloading and extracting $FG_ORANGEGoLang$RESET\n"
	# -4 means connect to ipv4 adresses only.
	# -O - Means print to standard output
    	wget -c https://golang.org/dl/go1.16.linux-amd64.tar.gz -4 -O - | sudo tar -xz -C /usr/local/
}

configureIrishLocale()
{

	if [[ -f /usr/share/X11/xorg.conf.d/20-keyboard.conf ]] ; then
		printf "\n"
		sudo rm -fv /usr/share/X11/xorg.conf.d/20-keyboard.conf
		printf "Deleted existing keyboard settings\n\n"
		sudo cp -v $HOME/.config/IRISH_XORG_LOCALE /usr/share/X11/xorg.conf.d/20-keyboard.conf  
 	       	printf "Configured keyboard for Irish locale \n"

	else
		sudo cp -v $HOME/.config/IRISH_XORG_LOCALE /usr/share/X11/xorg.conf.d/20-keyboard.conf  
 	       	printf "Configured keyboard for Irish locale \n"
	fi
}

dbus_SvConfig()
{
	if [[ -h /var/service/dbus ]] ; then
		sudo rm /var/service/dbus
		printf "Disabled the $BG_ORANGE$FG_BLACK d-bus service$RESET$RESET\n\n"
		sudo ln -s /etc/sv/dbus /var/service
		printf "Enabled the $BG_ORANGE$FG_BLACK d-bus service$RESET$RESET\n\n"
	else
		sudo ln -s /etc/sv/dbus /var/service
		printf "Enabled the $BG_ORANGE$FG_BLACK d-bus service$RESET$RESET\n\n"
    	fi

}

lightdm_SvConfig()
{
	if [[ -d /etc/sv/agetty-tty1 ]] ; then
		sudo rm -rfv /etc/sv/agetty-tty1 
#		sudo cp -v $HOME/.config/AGETTY_AUTOLOGIN_CONF /etc/sv/agetty-autologin-tty1/conf 
#		printf "Created the autologin terminal on tty1 \n\n"
	fi

	if [[ -h /var/service/lightdm ]] ; then
		sudo rm /var/service/lightdm
		printf "Disabled the $BG_ORANGE$FG_BLACK lightdm service$RESET$RESET\n\n"
		sudo cp -v $HOME/.config/LIGHTDM_CONF /etc/lightdm/lightdm.conf
		sudo cp -v $HOME/.config/LIGHTDM_GTK_GREETER_CONF /etc/lightdm/lightdm_gtk_greeter.conf

		sudo ln -s /etc/sv/lightdm /var/service
		printf "Enabled the $BG_ORANGE$FG_BLACK lightdm service$RESET$RESET\n\n"
	else
		sudo ln -s /etc/sv/lightdm /var/service
		sudo cp -v $HOME/.config/LIGHTDM_CONF /etc/lightdm/lightdm.conf
		sudo cp -v $HOME/.config/LIGHTDM_GTK_GREETER_CONF /etc/lightdm/lightdm_gtk_greeter.conf
		printf "Enabled the $BG_ORANGE$FG_BLACK d-bus service$RESET$RESET\n\n"
    	fi

}

dconfConfig()
{
	cp -v $HOME/.conf/DCONF_USER $HOME/dconf/user
}

#getEssentials
#packageInstall
#createDirectories
#firewallConfig
#cronie_SvConfig
#socklogConfig
#gitGlobalIDSetup
#golangInstall
#installOpenFrameworks
#configureIrishLocale
#xfce4Install
#dconfConfig
#lightdm_SvConfig
#sourceBashrc
dbus_SvConfig
