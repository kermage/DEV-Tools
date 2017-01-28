# List keys
ssh_keys=$( ls $( echo /$USERPROFILE | sed -e 's/\\/\//g' -e 's/://')/.ssh/*_rsa 2>/dev/null )

CHECK_KEY() {
	# Add to list if ssh key is unidentified
	is_identified=
	is_identified=$( ssh-add -l | grep $1 | awk '{print $3}' )
	if [ -z $is_identified ]; then
		ssh-add $1
	fi
}

# If keys found
if [ ! -z "$ssh_keys" ] ; then
	# Check if ssh keys are known
	for x in $ssh_keys ; do
		CHECK_KEY $x
	done
fi
