#!/bin/bash

###############################################################
# Copyright (C) 2015 ClassCat(R) Co.,Ltd. All rights reserved.
###############################################################

. ../conf/hadoop.conf

export LC_ALL=C

CWD=`pwd`

groupadd -g 500 hadoop

useradd -u 500 -g hadoop -s /bin/bash -m hduser

mkdir -p /opt/packages

cd /opt/packages

wget http://ftp.riken.jp/net/apache/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz

tar xfz hadoop-2.7.1.tar.gz

chown -R hduser.hadoop hadoop-2.7.1

ln -s /opt/packages/hadoop-2.7.1 /opt/hadoop

echo 'export PATH=$PATH:/opt/hadoop/bin' > /home/hduser/.bash_profile
chown hduser.hadoop /home/hduser/.bash_profile

ln -s /opt/hadoop /home/hduser/hadoop


# CONFIG

cd $CWD

install -o hduser -g hadoop ../assets/hadoop-env.sh /opt/hadoop/etc/hadoop
install -o hduser -g hadoop ../assets/core-site.xml /opt/hadoop/etc/hadoop

install -o hduser -g hadoop ../assets/hdfs-site.xml /opt/hadoop/etc/hadoop

install -o hduser -g hadoop ../assets/yarn-env.sh /opt/hadoop/etc/hadoop
install -o hduser -g hadoop ../assets/yarn-site.xml /opt/hadoop/etc/hadoop

sed -i.bak -e "s/localhost/${MASTER_NODE_IP}/" /opt/hadoop/etc/hadoop/core-site.xml
sed -i.bak -e "s/localhost/${MASTER_NODE_IP}/" /opt/hadoop/etc/hadoop/yarn-site.xml


# HDFS

mkdir /var/lib/hadoop
chown hduser.hadoop /var/lib/hadoop


# SSH KEY directory
mkdir /home/hduser/.ssh
chown hduser.hadoop /home/hduser/.ssh
chmod 0700  /home/hduser/.ssh

touch /home/hduser/.ssh/authorized_keys
chown hduser.hadoop /home/hduser/.ssh/authorized_keys


exit 0
