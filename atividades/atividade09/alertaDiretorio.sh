#!/usr/bin/bash
# Correção: 3,0

INTERVAL=$1
DIRECTORY=$2

LAST=$(ls $DIRECTORY)
while true; do
    sleep $INTERVAL
    DATETIME=$(date +'%d-%m-%Y %H:%M:%S')
    CURRENT=$(ls $DIRECTORY)
    if [ "$CURRENT" != "$LAST" ]; then
        N_LAST=$(wc -l <(echo $LAST | tr ' ' "\n") | cut -d " " -f1)
        N_CURR=$(wc -l <(echo $CURRENT | tr ' ' "\n") | cut -d " " -f1)
        N_ADD=$(grep -xvFf <(echo $LAST | tr ' ' "\n") <(echo $CURRENT | tr ' ' "\n"))
        N_REM=$(grep -xvFf <(echo $CURRENT | tr ' ' "\n") <(echo $LAST | tr ' ' "\n"))
        if [ -n "$N_ADD" ]; then N_ADD="Adicionados: $(echo $N_ADD | tr "\n" " ") "; fi
        if [ -n "$N_REM" ]; then N_REM="Removidos: $(echo $N_REM | tr "\n" " ") "; fi
        echo "[$DATETIME] Alteração! $N_LAST->$N_CURR. $N_ADD$N_REM" | tee -a dirSensors.log
    fi
    LAST=$CURRENT
done
