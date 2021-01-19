#!/usr/bin/bash

echo Relatório de Latência.
for ip in $(cat $1)
do
    stats=$(ping -c 5 $ip | tail -n 1 | cut -d "=" -f2)
    avg=$(echo $stats | cut -d "/" -f2)
    unit=$(echo $stats | cut -d " " -f2)
    echo $ip $avg$unit
done
