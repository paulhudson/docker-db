# # MySQL Galera Cluster 5.5.34-25.9/Galera 2.8/Ubuntu 12.04 64bit
FROM ubuntu:12.04
MAINTAINER Paul Hudson <paul@hudhosting.com>
 
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
RUN sed -i '/repo.percona.com/d'  /etc/apt/sources.list
RUN sh -c 'echo "deb http://repo.percona.com/apt precise main" >> /etc/apt/sources.list'
RUN sh -c 'echo "deb-src http://repo.percona.com/apt precise main" >> /etc/apt/sources.list'
RUN apt-get -q -y update
RUN LC_ALL=en_US.utf8 DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confnew' -qqy install nano wget psmisc libdbi-perl libdbd-mysql-perl libwrap0 perl libaio1 mysql-client percona-xtrabackup libssl0.9.8 libssl1.0.0 rsync netcat
RUN wget --no-check-certificate https://launchpad.net/codership-mysql/5.5/5.5.34-25.9/+download/mysql-server-wsrep-5.5.34-25.9-amd64.deb
RUN wget --no-check-certificate https://launchpad.net/galera/2.x/25.2.8/+download/galera-25.2.8-amd64.deb
RUN dpkg -i galera-25.2.8-amd64.deb
RUN dpkg -i mysql-server-wsrep-5.5.34-25.9-amd64.deb
ADD ./my.cnf /etc/mysql/my.cnf
EXPOSE 3306 4444 4567 4568
