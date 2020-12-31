#!/bin/sh


echo "Enter the port number for the host you want to backup the DB on: "
while read FROM
do
echo "$FROM" done >/tmp/test

echo "Enter the IP address of the environment that you are doing the DB backup on: "
while read IP
do
echo "$IP" done >

echo "Stopping $FROM server"
echo

        ssh -i ~/.ssh/mytest.rsa -p $FROM root@$IP exec /etc/init.d/mydb stop

echo

sleep 3

echo "Starting to backup the database"

        ssh -i ~/.ssh/mytest.rsa -p $FROM root@$IP "mkdir /home/DB_Backup"
        ssh -i ~/.ssh/mytest.rsa -p $FROM root@$IP "cp /var/sqlite/mydb.db /home/DB_Backup"


echo "Starting $FROM server"
echo

        ssh -i ~/.ssh/mytest.rsa -p $FROM root@$IP exec /etc/init.d/myservice start

sleep 3

echo "DB backup on $FROM is complete"

