all:
	docker build -t pinata-sshd pinata-sshd
	@echo Please run "make install"

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

install:
	@if [ ! -d "$(PREFIX)" ]; then echo Error: need a $(PREFIX) directory; exit 1; fi
	@mkdir -p $(BINDIR)
	cp pinata-ssh-forward.sh $(BINDIR)/pinata-ssh-forward
	cp pinata-ssh-mount.sh $(BINDIR)/pinata-ssh-mount
	cp ssh-agent-wrap.sh $(BINDIR)/ssh-agent-wrap
