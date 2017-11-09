#!/usr/bin/env bash
set -e

test_string="Hello_world!"
$(/usr/bin/kafka-topics --zookeeper 127.0.0.1:2181/kafka --delete --topic test &> /dev/null) || true
$(/usr/bin/kafka-topics --create --zookeeper ip6-localhost:2181/kafka --replication-factor 1  --partitions 1 --topic test &> /dev/null) 
echo $test_string | /usr/bin/kafka-console-producer --broker-list localhost:9092 --topic test
result=$(/usr/bin/kafka-console-consumer --new-consumer --bootstrap-server localhost:9092 --topic test --from-beginning --max-messages 1)

if [ $test_string == $result ];then
   echo 'SUCCESS'
fi

