#!/bin/bash

echo "Script to collect Linux forensic info by Ch3nsta"

verbose_mode=false
output_file="./forensic.txt"

# Output Signs
ERR="(x)"
LOG="(+)"
INF="(-)"

# Colors
RED="\e[31m"
GREEN="\e[32m"
ENDC="\e[0m"

# Display Script Usage
usage() {
	echo "Usage: $0 [OPTIONS]"
	echo "Options:"
	echo "-h,	--help		Help Message"
	echo "-v,	--verbose	Verbose Mode"
	echo "-o,	--output-file	Specify output file. If no give file uses ./forensic.txt"
}

has_argument() {
	[[ ("$1" == *=* && -n ${1#*=}) || ( ! -z "$2" && "$2" != -*)  ]];
}

extract_argument() {
  echo "${2:-${1#*=}}"
}

# Function to handle options
handle_options() {
	while [ $# -gt 0 ]; do
		case $1 in
			-h | --help)
				usage
				exit 0
				;;
			-v | --verbose)
				verbose_mode=true
				;;
			-o | --output-file*)
				if ! has_argument $@; then
					echo -e "${RED}${ERR} File not specified.${ENDC}" >&2
					usage
					exit 1
				fi

				output_file=$(extract_argument $@)

				shift
				;;
			*)
				echo "Invalid option: $1" >&2
				usage
				exit 1
				;;
		esac
		shift
	done
}

# Main Script
handle_options "$@"

# Perform actions based on flags
if [ "$verbose_mode" = true ]; then
	echo "Verbose mode enabled."
fi

if [ -n "$output_file" ]; then
	echo "Output file specified: $output_file"
fi

echo "----------Forensic Info----------" > $output_file
echo "# Users" >> $output_file

declare -a users

users=($(cut -d ':' -f 1 /etc/passwd))

for username in "${users[@]}"; do
	echo "${username}" >> $output_file
done

