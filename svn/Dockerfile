FROM index.alauda.cn/tutum/ubuntu
MAINTAINER shibin@alauda.io

RUN apt-get update && \
    apt-get install -y subversion  apache2  libapache2-svn  curl  && \
    mkdir /svn  

COPY state  /svn
COPY svn.sh  /svn

EXPOSE 80
EXPOSE 8080

CMD  /svn/svn.sh  && tailf /svn/state
