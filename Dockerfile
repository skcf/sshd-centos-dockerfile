FROM centos

MAINTAINER Souichi

#Install Packages

RUN yum update -y
RUN yum install -y passwd openssh openssh-server openssh-clients sudo

## Create user
RUN useradd docker
RUN passwd -f -u docker

## Set up SSH 
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
ADD  authorized_keys /home/docker/.ssh/authorized_keys
RUN chown docker /home/docker/.ssh/authorized_keys
RUN chmod 600 /home/docker/.ssh/authorized_keys

## setup sudoers
RUN echo "docker    ALL=(ALL)       ALL" >> /etc/sudoers.d/docker

## Set up SSHD config

RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

## Init SSHD

RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

