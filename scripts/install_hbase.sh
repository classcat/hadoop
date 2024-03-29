#!/bin/bash

###############################################################
# Copyright (C) 2015 ClassCat(R) Co.,Ltd. All rights reserved.
###############################################################

. ../conf/hadoop.conf

export LC_ALL=C

CWD=`pwd`

mkdir -p /opt/packages

cd /opt/packages


wget http://ftp.riken.jp/net/apache/hbase/0.98.15/hbase-0.98.15-hadoop2-bin.tar.gz
#wget http://ftp.riken.jp/net/apache/hbase/0.98.14/hbase-0.98.14-hadoop2-bin.tar.gz

tar xfz hbase-0.98.15-hadoop2-bin.tar.gz

chown -R hduser.hadoop hbase-0.98.15-hadoop2

ln -s /opt/packages/hbase-0.98.15-hadoop2 /opt/hbase

echo 'export PATH=$PATH:/opt/hbase/bin' >> /home/hduser/.bash_profile
chown hduser.hadoop /home/hduser/.bash_profile

cd $CWD

install -o hduser -g hadoop ../assets/hbase-env.sh /opt/hbase/conf
install -o hduser -g hadoop ../assets/hbase-site.xml /opt/hbase/conf

sed -i.bak -e "s/localhost/${MASTER_NODE_IP}/" /opt/hbase/conf/hbase-site.xml

exit 0
