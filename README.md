#SSHD/CentOS Dockerfile



##SSH Connect to docker container Using RSA key.




#Installation

- Setup authorized_keys

~~~
Copy your id_rsa.pub keys to authorized_keys
~~~

- Disabling SELinux　（host:CentOS）

~~~
vi /etc/selinux/config

#SELINUX=disabled
~~~


- Build Container
	
~~~
Docker build .
~~~

- Commit 

~~~
docker commit [ContainerID] sshd/centos
~~~ 


- Docker run as a daemon

~~~
docker run -d -p 22 sshd/centos /usr/sbin/sshd -D
~~~


- check running port 

~~~
docker ps 
~~~



- Connect to docker


~~~
ssh docker@[ip.add.re.ss] -p [port] 
~~~


enjoy!



##LISENSE

MIT



