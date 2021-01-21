#!/usr/bin/bash
# Correção: 0,5

DIR1=$1
DIR2=$2
LAST=$3

FILES=$(echo $(diff $DIR1 $DIR2 | grep $DIR1 | sed -r 's/.*://') | tr " " "\n")

for file in $FILES
do
    file=$DIR1/$file
    modified=$(stat -c %y $file | cut -d "." -f1)
    [[ "$modified" > "$LAST" ]] && cp $file $DIR2
done
