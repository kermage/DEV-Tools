# Check if the agent is running
SSH_AGENT_PID=$( ps -f | grep ssh-agent | awk '{print $2}' )

# Connect up the current ssh-agent
if [ -z "$SSH_AGENT_PID" ] ; then
	echo Removing old ssh-agent sockets
	rm -r /tmp/ssh-* 2>/dev/null
else
	echo Found ssh-agent at $SSH_AGENT_PID
	SSH_AUTH_SOCK=$( ls /tmp/ssh-*/agent.* | sed 's/=//' )
	if [ ! -z "$SSH_AUTH_SOCK" ] ; then
		echo Found ssh-agent socket at $SSH_AUTH_SOCK
		export SSH_AGENT_PID
		export SSH_AUTH_SOCK
	else
		echo Failed to find ssh-agent socket
		SSH_AGENT_PID=
	fi
fi

# See if we have the key
ssh-add -l > /dev/null 2>&1
E=$?
if [ $E -ne 0 ]; then
	if [ $E -eq 2 ]; then
		echo -n "Starting ssh-agent: "
		eval $( ssh-agent ) > /dev/null
		echo "done"
	fi
	ssh-add
	echo
fi
