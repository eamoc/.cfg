#!/bin/bash

PROJECT_GEN_PATH=$PG_OF_PATH/apps/projectGenerator/commandLine/bin

echo "Enter a name for the OpenFrameworks Project: "
read ofProjName
while [[ "$ofProjName" =~ ( |\') ]]; do
	echo -e "Project name cannot contain spaces\nTry again..."
	read ofProjName
done
$PROJECT_GEN_PATH/projectGenerator $DEV_PROJECT_DIR/$ofProjName
