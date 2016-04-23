# Setting Up a Docker Host Server on TurnkeyLinux Core
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
Then you can use a tool like https://chrome.google.com/webstore/detail/simple-docker-ui/jfaelnolkgonnjdlkfokjadedkacbnib?hl=en to manage the docker host

Note, if you are behind a firewall run this command to get through it...check with your network administrator to find out what this is

```bash
echo "export http_proxy=http://username:password@10.1.1.1:8080/" >> /etc/apt/apt.conf.d/01turnkey 
```

#Usage
Here's an example of how you'd use it. Clone a repo off Github and then build and then run it in your docker host.
##Installing a Container from GitHub

```bash
# Clone Repo and build then build the container
git clone https://github.com/ano/TurnkeyLinux-LAPP-and-NodeJS.git
docker build -t "turnkeylinux/LAPP-and-NodeJS-14.1" .
```
