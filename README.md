# Installing Docker on TurnkeyLinux Core
Installing Docker on TurnkeyLinux Core and enabling access by various Docker GUI tools

```bash
#Install docker
echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list.d/sources.list
apt-get update
apt-get install docker.io

#Allow Remote API Access for GUI tools
echo "DOCKER_OPTS='-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock'" >> /etc/default/docker
service docker restart

#(Optional)Bring in Required images
docker pull turnkeylinux/lapp-14.1
docker pull turnkeylinux/lamp-14.1
```
Note, if you are behind a firewall run this command to get through it...check with your network administrator to find out what this is

```bash
echo "export http_proxy=http://username:password@10.1.1.1:8080/" >> /etc/apt/apt.conf.d/01turnkey 
```

#Things to do
Create a docker file from this
