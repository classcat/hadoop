#!/bin/bash

groupadd -g hadoop

useradd -g hadoop -s /bin/bash -m hduser

mkdir -p /opt/packages

cd /opt/packages

wget http://ftp.riken.jp/net/apache/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz

tar xfz hadoop-2.7.1.tar.gz

chown -R hduser.hadoop hadoop-2.7.1

ln -s /opt/packages/hadoop-2.7.1 /opt/hadoop

echo "export PATH=$PATH:/opt/hadoop/bin" > /home/hduser/.bash_profile
chown hduser.hadoop /home/hduser/.bash_profile


# CONFIG

install -o hduser -g hadoop ../assets/hadoop-env.sh /opt/hadoop/etc/hadoop
install -o hduser -g hadoop ../assets/core-site.xml /opt/hadoop/etc/hadoop
install -o hduser -g hadoop ../assets/hdfs-site.xml /opt/hadoop/etc/hadoop


# HDFS

mkdir /var/lib/hadoop
chown hduser.hadoop /var/lib/hadoop


# SSH KEY
sudo -u hduser ssh-keygen -t rsa -P '' -f /home/hduser/.ssh/id_rsa

cat << _EOB_ > /home/hduser/.ssh/config
Host *
        StrictHostKeyChecking=no
_EOB_

chown hduser.hadoop /home/hduser/.ssh/config


exit 0
