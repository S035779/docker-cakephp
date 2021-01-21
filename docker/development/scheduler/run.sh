#!/bin/sh

set -e

host=$(echo "${1}" | cut -d ':' -f 1)
port=$(echo "${1}" | cut -d ':' -f 2)
shift
cmd="${@}"

until mysql \
    --user="${MYSQL_USER}" \
    --password="${MYSQL_PASSWORD}" \
    --host="${host}" \
    --port="${port}" \
    --database="${MYSQL_DATABASE}" \
    --execute="show tables;"; do
    >&2 echo "MySQL is unavailable - sleeping"
    sleep 5
done

>&2 echo "MySQL is up - executing command"

/usr/bin/env > /tmp/.env
exec $cmd

