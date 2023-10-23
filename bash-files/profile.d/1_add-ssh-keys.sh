if [ -d "${HOME}/.ssh" ] ; then
	for key in ${HOME}/.ssh/*_rsa ; do
		if [ -z $( ssh-add -l | grep $key | awk '{print $3}' ) ]; then
			ssh-add $key
		fi
	done
fi
