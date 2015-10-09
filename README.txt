
### JDK

java -version


### hadoop

# su - hduser

$ hadoop version

$ ssh (IP)

$ pwd
/opt/hadoop/etc/hadoop

// core-site.xml

IP address に変更する

    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:8020</value>
    </property>



slaves

hdfs namenode -format


// hdfs

format


### HBASE

hbase-site.xml
