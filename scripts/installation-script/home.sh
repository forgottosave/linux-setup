#!/bin/bash

#
# This script sets up my Ubuntu 20.04, installing programms, extensions, etc.
#

######### SETUP
sudo echo "check root..."
APP_FILE="applications.list"
REP_FILE="repositories.list"

######### APT REPOSITORIES
echo "adding required apt repositories..."
while IFS= read line
do
    [[ $line =~ ^#.* ]] && continue
    sudo add-apt-repository $line
done < "$REP_FILE"

########## APPLICATIONS
echo "installing applications..."
#sudo apt update
while IFS= read line
do
	[[ $line =~ ^#.* ]] && continue
	sudo apt install $line
done < "$APP_FILE"

########## EXTENSIONS
echo "installing extensions..."
# floating dock, may be buggy
sudo gnome-extensions install gnome_extensions/floating-docknandoferreira_profhotmail.com.v4.shell-extension.zip
# windows-like panel look
sudo gnome-extensions install gnome_extensions/dash-to-paneljderose9.github.com.v50.shell-extension.zip
# funny window-closing animations
sudo gnome-extensions install gnome_extensions/burn-my-windowsschneegans.github.com.v15.shell-extension.zip
# window tiling manager
sudo git clone 'https://github.com/paperwm/PaperWM.git' "${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions/paperwm@hedning:matrix.org"
sudo ~/.local/share/gnome-shell/extensions/paperwm@hedning\:matrix.org/install.sh
