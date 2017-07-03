#!/bin/sh -e
# Log the location of the SSH agent to a file

finish() {
 rm -f /share/agent_socket_path
}
trap finish EXIT
# Docker non-root users are mapped to user 1000 by default
# This will make non-root ssh work
chown dockreml $SSH_AUTH_SOCK
echo $SSH_AUTH_SOCK > /share/agent_socket_path
tail -f /dev/null
