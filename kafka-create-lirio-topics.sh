
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-client
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-seed
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-eligibility
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-feedback
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-contact
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-objectives
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-behaviors
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-srs
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-pcms
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-exposures
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-adoptions
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-achievements
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-nudges
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-behaviors
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-images
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-subject-lines
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-ctas
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic lirio-ci-benefits

kafka-topics --list --zookeeper localhost:2181
 