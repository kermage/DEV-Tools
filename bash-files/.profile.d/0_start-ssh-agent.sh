#!/usr/bin/env bash

PS_WITH_OPTIONS="ps -f"

if [ $( uname -s ) == "Darwin" ]; then
	PS_WITH_OPTIONS="${PS_WITH_OPTIONS}lx"
fi

# Check if the agent is running
SSH_AGENT_PID=$( $PS_WITH_OPTIONS | grep -v grep | grep ssh-agent | awk '{print $2}' )
SSH_AUTH_SOCK=$( ls ${TMPDIR}/ssh-*/agent.* 2>/dev/null | sed 's/=//' )

if [ -z "$SSH_AGENT_PID" ] ; then
	if [ ! -z "$SSH_AUTH_SOCK" ] ; then
		echo Removing old ssh-agent sockets
		rm -r ${TMPDIR}/ssh-* 2>/dev/null
	fi
else
	if [ -z "$SSH_AUTH_SOCK" ] ; then
		echo Killing old unusable ssh-agents
		kill $SSH_AGENT_PID
	else
		export SSH_AGENT_PID
		export SSH_AUTH_SOCK
	fi
fi

# See if we have keys
ssh-add -l &>/dev/null
if [ $? -eq 2 ]; then
	# Start a new agent
	eval $( ssh-agent -s ) > /dev/null
	echo -n "Agent started with "
else
	# Reuse started agent
	echo -n "Connected to Agent "
fi
echo PID: $SSH_AGENT_PID Socket: $SSH_AUTH_SOCK
