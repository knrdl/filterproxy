#!/bin/sh

echo "$domains" > /tmp/whitelist

cat /tmp/whitelist

tinyproxy -d -c /tinyproxy.conf