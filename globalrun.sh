#!/bin/bash

### Run / Install your complete environment and automatically install the project

#load
source .dot/.config
source .dot/.docker
source .dot/.functions

#show menu
if docker-cexists ; then
	echo "Do you want to install or (re)start the containers?"
	select ts_option in "Startup" "Stop" "Reinstall" "Quit Menu" ; do
		case $ts_option in
			Startup )
				source .dot/startup.sh
				break;;
			Stop )
				source .dot/stop.sh
				return;;
			Reinstall )
				source .dot/install.sh
				break;;
			"Quit Menu" )
				return;;
		esac
	done
else
	source .dotfiles/install.sh
fi

openInBrowser
