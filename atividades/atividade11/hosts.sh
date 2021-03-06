#!/bin/bash
# OK

adicionar () {
    echo $1,$2 >> hosts.db
}

remover () {
    if [ -f hosts.db ]
    then
        sed -i "/$1/d" hosts.db
    fi
}

procurar () {
    if [ -f hosts.db ]
    then
        if [ -z "$2" ]
        then
            grep $1 hosts.db | cut -d ',' -f2
        else
            grep $1 hosts.db | cut -d ',' -f1
        fi
    fi
}

listar () {
    if [ -f hosts.db ]
    then
        column -t -s ',' hosts.db
    fi
}

ARG=true
while getopts "a:i:d:r:l" OPTVAR
do
    case $OPTVAR in
        a)
            H=$OPTARG
            ARG=false
            ;;
        i)
            adicionar $H $OPTARG
            ARG=false
            ;;
        l)
            listar
            ARG=false
            ;;
        d)
            remover $OPTARG
            ARG=false
            ;;
        r)
            procurar $OPTARG true
            ARG=false
            ;;
    esac
done

if $ARG
then
    procurar $1
fi
