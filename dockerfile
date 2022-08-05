FROM ubuntu

RUN apt-get update && apt-get install -y iputils-ping openssh-client net-tools telnet openssh-server rsync
RUN update-rc.d ssh defaults && systemctl enable ssh.socket
RUN ssh-keygen -b 4096 -q -t rsa -N '' -f /root/.ssh/id_rsa