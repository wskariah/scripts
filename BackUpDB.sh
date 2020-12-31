#!/bin/sh


echo "Enter the port number for the host you want to backup the DB on: "
read FROM 
echo

echo "Enter the IP address of the environment that you are doing the DB backup on: "
read IP
echo

echo "Stopping $FROM hub"
echo

        ssh -i ~/.ssh/yocto.rsa -p $FROM root@$IP exec /etc/init.d/basecamp stop

echo

sleep 3

echo "Starting to backup the database and eprom files"

        ssh -i ~/.ssh/yocto.rsa -p $FROM root@$IP "mkdir /home/DB_Backup"
        ssh -i ~/.ssh/yocto.rsa -p $FROM root@$IP "cp /var/sqlite/ZWave.db /home/DB_Backup"
        ssh -i ~/.ssh/yocto.rsa -p $FROM root@$IP exec /sbin/eprog -d /home/DB_Backup/eeprom.hex


echo "Starting $FROM hub"
echo

        ssh -i ~/.ssh/yocto.rsa -p $FROM root@$IP exec /etc/init.d/basecamp start

sleep 3

echo "DB backup on $FROM is complete"
