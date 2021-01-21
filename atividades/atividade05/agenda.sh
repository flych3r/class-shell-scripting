#!/usr/bin/bash
# Correção: 1,0

COMMAND=$1

if [ $COMMAND == 'adicionar' ]; then
    echo $2:$3 >> usuarios.db
fi
if [ $COMMAND == 'listar' ]; then
    cat usuarios.db
fi
if [ $COMMAND == 'remover' ]; then
    sed -i "/$2/d" usuarios.db
fi
