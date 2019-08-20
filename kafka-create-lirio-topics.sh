
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-nudges
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-behaviors
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-images
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-subject-lines
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-ctas
kafka-topics --delete --zookeeper localhost:2181 --topic lirio-ci-benefits

kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-client
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-seed
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-eligibility
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-feedback
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-contact
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-objectives
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-behaviors
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-srs
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-master-objectives
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-master-behaviors
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-master-srs
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-pcms
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-exposures
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-adoptions
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-achievements

kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-selection-requests-objectives
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-selection-requests-behaviors
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-selection-requests-behaviors-ci
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-selection-requests-nudges
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-selection-requests-benefits
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-selection-requests-ctas
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-selection-requests-subjects
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-selection-requests-images

kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-nudges
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-behaviors
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-images
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-subject-lines
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-ctas
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-benefits
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-organization-data

kafka-topics --list --zookeeper localhost:2181
 