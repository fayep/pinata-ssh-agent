#!/bin/sh

LOCAL_STATE=~/.pinata-sshd
PINATA_SOCK=$(cat $LOCAL_STATE/agent_socket_path)
echo "-v ${PINATA_SOCK}:/tmp/ssh-agent.sock --env SSH_AUTH_SOCK=/tmp/ssh-agent.sock"
