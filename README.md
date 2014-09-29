vagrant-zk-exhbitor
===================

A cluster of 3 nodes with static ips that sets up a zookeeper cluster with Exhibitor to manage / monitor them.

The exhibitor UI is [available at(http://localhost:9960/exhibitor/v1/ui/index.html)].

To use, please ensure that:

* submodules are initialised.
* jdk-8u20-linux-x64.gz (oracle JDK 8) is placed inside ./modules/jdk/files/oracle/jdk8/
* exhibitor-1.0-jar-with-dependencies.jar (the exhibitor jar) is placed in ./modules/exhbitor/files

The exhibitor jar can be built by following [this guide(https://github.com/Netflix/exhibitor/wiki/Building-Exhibitor)].


