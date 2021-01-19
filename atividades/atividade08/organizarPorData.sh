#!/usr/bin/bash

DIR1=$1
DIR2=$2

FILES=$(ls $DIR1 | tr ' ' "\n")

for file in $FILES
do
    file=$DIR1/$file
    modified=$(echo $(stat -c %y $file | cut -d " " -f1) | tr "-" "/")
    dest=$DIR2/$modified
    mkdir -p $dest
    cp $file $dest
done
