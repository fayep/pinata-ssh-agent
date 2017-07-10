#!/bin/bash
# SSH Agent functions because of a shared environment between all shells.
# WSL shells are not connected
# Instead, we'll drop the agent code into the user's home, and test if
# the agent is running each time.  Put this into your startup scripts.

. ~/.ssh-agent >& /dev/null
ps -p $SSH_AGENT_PID | grep -q ssh-agent; running=$?
if [ "$running" -eq 1 -o ! -S "$SSH_AUTH_SOCK" ]; then
  ssh-agent > ~/.ssh-agent
fi
. ~/.ssh-agent
