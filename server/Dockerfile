FROM debian:bullseye-slim

LABEL maintainer="Farid <info@yaba-consulting.com>"

RUN apt update && \
    apt remove -y nano || true && \
    apt install -y openssh-server && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
