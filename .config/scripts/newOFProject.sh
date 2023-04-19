#!/bin/bash

echo "Enter a name for the OpenFrameworks Project: "
read ofProjName

while [[ "$ofProjName" =~ ( |\') ]]; do
	echo -e "Project name cannot contain spaces\nTry again..."
	read ofProjName
done

projectGenerator -o"$HOME/openFrameworks/" $HOME/sCrAtCh/OFProjects/$ofProjName
