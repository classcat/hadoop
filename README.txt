
### JDK

java -version


### hadoop

# su - hduser

$ hadoop version

$ ssh (IP)

$ pwd
/opt/hadoop/etc/hadoop

hadoop-env.sh
yarn-env.sh を確認

// core-site.xml

IP address に変更する

    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:8020</value>
    </property>

// yarn-site.xml
  <property>
    <name>yarn.resourcemanager.hostname</name>
    <value>localhost</value>
  </property>


// slaves


### HDFS

$ hdfs namenode -format

$ ./sbin/start-dfs.sh

$ hdfs dfs -ls /


### SPARK


### HBASE

hbase-site.xml
