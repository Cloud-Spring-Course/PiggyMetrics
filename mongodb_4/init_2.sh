#!/bin/bash

    echo "_______START init_2.sh___________STARTED"
	echo "$MONGODB_PASSWORD"
exit 0
	
if [ -z "$MONGODB_PASSWORD" ]
then
    echo "MONGODB_PASSWORD not defined"
    exit 1
else	
	echo "MONGODB_PASSWORD defined"
fi

auth="-u user -p $MONGODB_PASSWORD"
exit 
# MONGODB USER CREATION
if false
then 
(
echo "_____1______________________________WORKED"
echo "setup mongodb auth"
#create_user="if (!db.getUser('user')) { db.createUser({ user: 'user', pwd: '$MONGODB_PASSWORD', roles: [ {role:'readWrite', db:'piggymetrics'} ]}) }"
create_user="if ( db.getUser('user')){'exist'} else { db.createUser({ user: 'user', pwd: 'passwd', roles: [ {role:'readWrite', db:'piggymetrics'} ]}) }"
until mongo piggymetrics --eval "$create_user" || mongo piggymetrics $auth --eval "$create_user"; do sleep 5; done
#killall mongod
#sleep 1
#killall -9 mongod
) #&
fi 

echo "_____2______________________________WORKED"

exit 0
#INIT DUMP EXECUTION
(
if test -n "$INIT_DUMP"; then
    echo "execute dump file"
	#sleep 20
	#until mongo piggymetrics $auth $INIT_DUMP; do sleep 5; done
	#mongo piggymetrics account-service-dump.js	
    #until mongo piggymetrics  $INIT_DUMP; do sleep 5; done 
else
    echo "INIT_DUMP is not presented" 
fi
) #&

echo "_____3______________________________WORKED"
#echo "start mongodb without auth"
#chown -R mongodb /data/db
#gosu mongodb mongod "$@"

#echo "restarting with auth on"
#sleep 5
#exec gosu mongodb /usr/local/bin/docker-entrypoint.sh --auth "$@"
#