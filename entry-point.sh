#!/bin/bash

## init contianer
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
mkdir -p ~/.ssh
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
service ssh start

echo "HADOOP init"
## starting hadoop
$HADOOP_HOME/bin/hdfs namenode -format
cd $HADOOP_HOME/sbin
./start-all.sh

sleep 10

echo "HBASE init"
## init hbase
$HADOOP_HOME/bin/hadoop fs -mkdir /hbase
$HBASE_HOME/bin/start-hbase.sh

echo "HIVE init"
## init hive
cd $HIVE_HOME/lib
rm guava-19.0.jar
mv $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib
mkdir -p /hive/data
cd /hive/data
$HIVE_HOME/bin/schematool -initSchema -dbType postgres

echo "Start sequence completed"
cd /
tail -f /dev/null
