# kafka-manager Docker image

[![Docker Layers](https://images.microbadger.com/badges/image/deric/kafka-manager.svg)](https://microbadger.com/images/deric/kafka-manager)

A Docker container based on Debian 9 containing just OpenJDK Java 8 and [Yahoo's kafka-manager](https://github.com/yahoo/kafka-manager).

## Running

Use `ZK_HOSTS` to specify connection to your ZooKeeper cluster, e.g. `zk-1.zk:2181,zk-2.zk:2181,zk-3.zk:2181/kafka-manager`.
```
docker run -it --rm  -p 9000:9000 -e ZK_HOSTS="localhost:2181" deric/kafka-manager
```

## Building

Simply specify version of a release available at [kafka-manager github](https://github.com/yahoo/kafka-manager/releases), e.g.:
```
make build v=1.3.3.15
```
