FROM alpine:3.5
MAINTAINER Faye Salwin <faye.salwin@futureadvisor.com>
RUN apk add --no-cache openssh
RUN adduser -D -u 1000 dockreml
RUN mkdir /root/.ssh && \
    chmod 700 /root/.ssh && \
    ssh-keygen -A
COPY ssh-find-agent.sh /root/ssh-find-agent.sh
EXPOSE 22
VOLUME ["/root/.ssh/authorized_keys"]
CMD ["/usr/sbin/sshd","-D"]
