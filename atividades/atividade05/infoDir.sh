#!/usr/bin/bash
# Correção: 1,0

if [ -d $1 ]; then
    SIZE=$(du -s $1 | cut -f1)
    N=$(ls -a $1 | wc -l)
    echo O diretório $1 ocupa $SIZE kilobytes e tem $N itens.
else
    echo $1 não é um diretório!!!
fi
