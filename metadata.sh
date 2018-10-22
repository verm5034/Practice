#!/bin/bash
ACTION=${1}
VERSION=0.5.0

function show_version() {

	echo "$VERSION"
}

function create_file()  {

cd ~/assignment-4-vpc-verm5034
curl http://169.254.169.254/latest/dynamic/instance-identity/document/ > backend1-identity.json
curl -vs https://s3.amazonaws.com/seis665/message.json 2>&1 | tee backend1-message.txt
cp /var/log/nginx/access.log  access.log
}

function display_help() {

cat << EOF
________________________________________________________________
usage: ${0} {-c|--create|-v|--version|-h|--help} 
OPTIONS:
	-c | --create Create a new file
	-h | --help Display the command help
	-v | --version Display version
Examples:
	Create a new file:
		$ ${0} -c
	Display Version:
		$ ${0} -v
	Display help:
		$ ${0} -h
_______________________________________________________________
EOF
}

case "$ACTION" in
	-h|--help)
		display_help
		;;
	-c|--create)
		create_file 
		;;
	-v|--version)
		show_version
		;;
	*)

	echo  "******** Usage ${0} {-c|-v|-h} **********"
	exit 1
esac
