# docker_container_IPs_to_etchosts
Grabs current IPs used by docker containers and adds them to /etc/hosts
Useful for local hostname resolution, or for things like pi-hole that will attribute events to a container

Use:
~~~
$ ./add_names.sh /etc/hosts
~~~
Might need to run as root, depending on your docker setup...
~~~
# ./add_names.sh /etc/hosts
~~~
