#!/bin/sh
 
#
# Retrieve the argument and create a name for a tmp file
# USAGE:
# ./add_names.sh /etc/hosts
processfile=$1
tmpfile=${1}.tmp
  
#
# for all running docker containers
#
for service in `docker ps -q`; do
   #
   # Extract the servicename and ipaddress
   #
   servicename=`docker inspect --format '{{ .Name }}' $service `
   ipaddress=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' $service`
  
   #
   # if there is a service name and ipaddress
   #
   if [ ! -z $ipaddress ] &&  [ ! -z $servicename ] ;
   then
        # get rid of the first character - this is '/'
  
        #servicename="${servicename:1}"
        servicename=${servicename#"/"}
  
        # remove the service name from the process file, and add it again
        grep -v $servicename $processfile > $tmpfile
        echo $ipaddress '\t' $servicename  >> $tmpfile
        mv $tmpfile $processfile
   fi
done
