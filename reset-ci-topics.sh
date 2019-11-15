#!/bin/bash
#
# Delete and add back the content item topics
# 
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-nudges
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-behaviors
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-images
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-subject-lines
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-ctas
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-benefits
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-organization-data

kafka-topics --list --zookeeper localhost:2181 | grep lirio

kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-nudges
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-behaviors
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-images
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-subject-lines
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-ctas
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-benefits
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-organization-data

kafka-topics --list --zookeeper localhost:2181 | grep lirio
