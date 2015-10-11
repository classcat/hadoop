#!/bin/bash

###############################################################
# Copyright (C) 2015 ClassCat(R) Co.,Ltd. All rights reserved.
###############################################################

. ../conf/hadoop.conf

export LC_ALL=C

CWD=`pwd`

mkdir -p /opt/packages

cd /opt/packages


wget http://ftp.riken.jp/net/apache/hbase/1.1.2/hbase-1.1.2-bin.tar.gz

tar xfz hbase-1.1.2-bin.tar.gz

chown -R hduser.hadoop hbase-1.1.2

ln -s /opt/packages/hbase-1.1.2 /opt/hbase

echo 'export PATH=$PATH:/opt/hbase/bin' >> /home/hduser/.bash_profile
chown hduser.hadoop /home/hduser/.bash_profile

cd $CWD

install -o hduser -g hadoop ../assets/hbase-env.v112.sh /opt/hbase/conf/hbase-env.sh
install -o hduser -g hadoop ../assets/hbase-site.v112.xml /opt/hbase/conf/hbase-site.xml

sed -i.bak -e "s/localhost/${MASTER_NODE_IP}/" /opt/hbase/conf/hbase-site.xml

exit 0
