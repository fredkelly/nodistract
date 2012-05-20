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

DISTRACTIONS=('facebook.com' 'twitter.com' 'rugbydump.com' 'ebay.co.uk' 'lshunter.tv' 'tumblr.com') # add more here...

HOSTS="/etc/hosts"
CURRENT=$(cat $HOSTS)
EMPTIED=$(sed "/## BEGIN BLOCKING DISTRACTIONS ##/,/## END BLOCKING DISTRACTIONS ##/d" $HOSTS)

if [ "$CURRENT" == "$EMPTIED" ]; then
	echo "Blocking those pesky distractions..."
	# add lines to hosts
	(
		echo -e "\n## BEGIN BLOCKING DISTRACTIONS ##"
		for distraction in ${DISTRACTIONS[*]}
		do
			echo -e "127.0.0.1\t${distraction}\twww.${distraction}"
		done
		echo -e "## END BLOCKING DISTRACTIONS ##\n"
	) >> /etc/hosts
else
	echo "Unblocking those beautiful distractions..."
	# remove lines from hosts
	echo "$EMPTIED" > $HOSTS
fi


