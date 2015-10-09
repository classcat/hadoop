#!/bin/bash

mkdir -p /opt/packages

cd /opt/packages

wget http://ftp.riken.jp/net/apache/spark/spark-1.5.1/spark-1.5.1-bin-hadoop2.4.tgz

tar xfz spark-1.5.1-bin-hadoop2.4.tgz

chown -R hduser.hadoop spark-1.5.0-bin-hadoop2.4

ln -s /opt/packages/spark-1.5.0-bin-hadoop2.4 /opt/spark


echo "export PATH=$PATH:/opt/spark/bin" >> /home/hduser/.bash_profile
chown hduser.hadoop /home/hduser/.bash_profile

exit 0
