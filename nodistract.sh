#!/bin/bash

# Blocks & unblocks distracting domains using hosts file.
# Written by Fred Kelly <me@fredkelly.net> 5/4/2012.

HOSTS="/etc/hosts"
CURRENT=$(cat $HOSTS)
EMPTIED=$(sed "/## BEGIN BLOCKING DISTRACTIONS ##/,/## END BLOCKING DISTRACTIONS ##/d" $HOSTS)

if [ "$CURRENT" == "$EMPTIED" ]; then
	echo "Blocking those pesky distractions..."
	# add lines to hosts
	(
		echo -e "\n## BEGIN BLOCKING DISTRACTIONS ##"
		echo -e "127.0.0.1\tfacebook.com"
		echo -e "127.0.0.1\ttwitter.com"
		# add more here...
		echo -e "## BEGIN BLOCKING DISTRACTIONS ##\n"
	) >> /etc/hosts
else
	echo "Unblocking those beautiful distractions..."
	# remove lines from hosts
	echo "$EMPTIED" > $HOSTS
fi


