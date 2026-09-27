#!/bin/sh

echo "$domains" > /tmp/whitelist

cat /tmp/whitelist

exec tinyproxy -d -c /tinyproxy.conf
