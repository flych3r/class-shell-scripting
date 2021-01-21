#!/usr/bin/bash
# Correção: 1,0

[ -d $1 ] && echo É um diretório. || echo É um arquivo.

[ -r $1 ] && echo Tem permissão de leitura. || echo Não tem permissão de leitura.

[ -w $1 ] && echo Tem permissão de escrita. || echo Não tem permissão de escrita.
