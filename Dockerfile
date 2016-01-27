FROM armbuild/ubuntu:trusty

RUN apt-get update && apt-get install -y software-properties-common locales curl \
 && update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales

# Tune sysctl
RUN echo "kernel.shmall = 262144" >> /etc/sysctl.conf && \
    echo "kernel.shmmax = 1073741824" >> /etc/sysctl.conf
