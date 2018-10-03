#!/bin/bash



# unraid automated transcoder

# Using Don-Meltons Video Transcoding solution

#

# By : Chris Andersen

# Version

# 	1.0 - initial release 4/2/17

#

# Docker requires folders

# 	/media/transcoder

#	/config

#

# Script installs needed software and components on boot



# install required software

	apt-get install -y software-properties-common

	add-apt-repository -y ppa:stebbins/handbrake-releases

	add-apt-repository -y ppa:mc3man/trusty-media

	apt-get update

	apt-get install -y make git mkvtoolnix handbrake-cli

	apt-get install -y mplayer ffmpeg mp4v2-utils mpv

	apt-get install -y linux-headers-generic ruby-full

	apt-get install -y build-essential dkms supervisor
	
	apt-get install -y mediainfo

	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# install transcoding scripts using ruby-gem

	gem install video_transcoding



# setup the transcoder root

	if [ ! -d "/media/transcoder" ]; then

		mkdir -p /media/transcoder

	fi



# setup the config folder

	if [ ! -d "/config" ]; then

		mkdir -p /config

	fi



# Now we put the automation scripts where they belong, assuming they aren't already there

#	- Note the config transcoder.py is to allow us to modify it before booting the docker



	# install the transcoder config file if needed

	if [ ! -f "/config/transcoder.py" ]; then

		cp /transcoder-files/transcoder.py /config/transcoder.py

	fi



	# install the service if needed

	if [ ! -f "/etc/supervisor/conf.d/transcoder.conf" ]; then

		cp /transcoder-files/supervisor-config.conf /etc/supervisor/conf.d/transcoder.conf

	fi



	# remove the base files as they are no longer needed

	rm -rf /transcoder-files



# Now we copy over the changed transcoder.py to the /usr/local/bin

#	Doing this lets us change transcoder.py in the config directory

#	on unraid, restart the docker, and have any changes in place

#	rather than having to login to the unraid and use docker cli



	cp /config/transcoder.py /usr/local/bin

	chmod +x /usr/local/bin/transcoder.py

# setup the supevisor
	/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
	supervisorctl reload
