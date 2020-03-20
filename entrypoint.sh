#!/bin/sh
trap 'exit' 2

if [ -z "$BACKUP_PREFIX" ];then
  echo "Variable BACKUP_PREFIX is mandatory"
  exit 255
fi

if [ -z "$DATABASE_FILE" ];then
  echo "Variable DATABASE_FILE is mandatory"
  exit 255
fi

echo "Starting eternal sleep..."

while :
do
   sleep 10 &
   wait $!   
done