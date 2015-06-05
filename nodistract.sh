#!/bin/bash

# Blocks & unblocks distracting domains using hosts file.
# Written by Fred Kelly <me@fredkelly.net> 5/4/2012.

# for Mac OS add this to your /usr/bin using:
# sudo ln /path/to/nodistract.sh /usr/bin/nodistract
# (..make sure you have /usr/bin in your $PATH.)

# force to run as root
if [ $(id -u) != "0" ]
then
    sudo "$0" "$@"
    exit $?
fi

HOSTS="/etc/hosts"
CURRENT=$(cat $HOSTS)
EMPTIED=$(sed "/## BEGIN BLOCKING DISTRACTIONS ##/,/## END BLOCKING DISTRACTIONS ##/d" $HOSTS)

if [ "$CURRENT" == "$EMPTIED" ]; then
	echo "Blocking those pesky distractions..."
	# add lines to hosts
	(
		echo -e "\n## BEGIN BLOCKING DISTRACTIONS ##"
		while read distraction;
		do
			echo -e "127.0.0.1\t${distraction}\twww.${distraction}"
		done <distractions.file
		echo -e "## END BLOCKING DISTRACTIONS ##\n"
	) >> $HOSTS
else
	echo "Unblocking those beautiful distractions..."
	# remove lines from hosts
	echo "$EMPTIED" > $HOSTS
fi


