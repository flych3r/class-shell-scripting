#!/usr/bin/bash

echo Relatório de Latência.
for ip in $(cat $1)
do
    ping -c 5 $ip | awk -v addr="$ip" 'END{ split($4, a, "/");  print addr " " a[2] $5 }'
done
