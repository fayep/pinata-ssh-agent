Forward SSH agent socket into a container

Still experimental -- contact faye@futureadvisor.com if you want help.

## Installation

Assuming you have a `/usr/local`
Note the reversal of make install and make

```
$ git clone git://github.com/FutureAdvisor/pinata-ssh-agent
$ make install
$ make
```

On every boot, do:

```
$ pinata-ssh-forward
```

and the you can run `pinata-ssh-mount` to get a Docker CLI fragment
that adds the SSH agent socket and set `SSH_AUTH_SOCK` within the container.

```
$ pinata-ssh-mount 
-v /Users/avsm/.pinata-sshd/ssh-1azk9Mmd27/agent.16:/tmp/ssh-agent.sock --env SSH_AUTH_SOCK=/tmp/ssh-agent.sock

$ docker run -it $(pinata-ssh-mount) ocaml/opam ssh git@github.com
The authenticity of host 'github.com (192.30.252.128)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,192.30.252.128' (RSA) to the list of known hosts.
PTY allocation request failed on channel 0
Hi avsm! You've successfully authenticated, but GitHub does not provide shell access.
Connection to github.com closed.
```

## Additional Programs

Included in this bundle is an ssh-agent wrapper which works even if your shells aren't children of the ssh-agent environment.  This is particularly useful in Windows.  To make ssh-agent available in your shell, just

```
source /usr/local/bin/ssh-agent-wrap
```

Also included is a wrapper to fix up WSL paths when running docker from bash on Windows.  This should go away when https://github.com/docker/for-win/issues/860 is implemented.

To use it, put it in your path earlier than the real docker binary as `docker`.  Don't forget to rehash your path (`hash -r`) to use it immediately.

## Contributors

* Faye Salwin
* Justin Cormack

[License](LICENSE.md) is ISC.
