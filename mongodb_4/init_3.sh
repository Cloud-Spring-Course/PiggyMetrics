#!/bin/bash

echo "_______START init_2.sh___________STARTED"
echo "$MONGODB_PASSWORD"
	
#exec gosu mongodb /usr/local/bin/docker-entrypoint.sh 	
#mongo

#echo "_____________start_______mongo piggymetrics account-service-dump.js	"
#mongo piggymetrics account-service-dump.js	

auth="-u user -p $MONGODB_PASSWORD"

echo "start mongodb without auth"
#chown -R mongodb /data/db
#--port 27017 
#gosu mongodb mongod --bind_ip_all  "$@"  


echo "_____2______________________________WORKED"

echo "_____________start_______mongo piggymetrics account-service-dump.js	1"
#mongo piggymetrics account-service-dump.js	
#echo "_____2"
# INIT DUMP EXECUTION
(
if test -n "$INIT_DUMP"; then
    echo "execute dump file"
	#until mongo piggymetrics $auth account-service-dump.js; do sleep 5; done
	until mongo piggymetrics  account-service-dump.js; do sleep 5; done
fi
) &


echo "_____3______________________________WORKED"

gosu mongodb mongod --bind_ip_all  "$@"  

#echo "restarting with auth on"
#sleep 5
#exec gosu mongodb  /usr/local/bin/docker-entrypoint.sh --auth "$@"

