#!/bin/bash

mkdir -p /etc/ssl/certs
mkdir -p /etc/ssl/private

if [ ! -f /etc/ssl/certs/inception.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/inception.key \
        -out /etc/ssl/certs/inception.crt \
        -subj "/C=FR/ST=Paris/L=Paris/O=42School/CN=mgarsaul.42.fr"
fi

rm -f /etc/nginx/sites-enabled/default

exec "$@"