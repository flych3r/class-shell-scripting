#!/bin/bash

[[ $1 != +([0-9]) ]] && echo Opa!!! $1 não é número. && exit
[[ $2 != +([0-9]) ]] && echo Opa!!! $2 não é número. && exit
[[ $3 != +([0-9]) ]] && echo Opa!!! $3 não é número. && exit

if [[ $1 -gt $2 && $1 -gt $3 ]]; then
    echo $1
elif [ $2 -gt $3 ]; then
    echo $2
else
    echo $3
fi
