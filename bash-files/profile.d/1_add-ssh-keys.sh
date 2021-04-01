# List keys
ssh_keys=$( ls ${HOME}/.ssh/*_rsa 2>/dev/null )

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
	while IFS= read -r file ; do
		CHECK_KEY $file
	done <<< "$ssh_keys"
fi
