#!/bin/sh -e
# Log the location of the SSH agent to a file

finish() {
 rm -f /share/agent_socket_path
}
trap finish EXIT
echo $SSH_AUTH_SOCK > /share/agent_socket_path
tail -f /dev/null
