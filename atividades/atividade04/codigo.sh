#!/bin/bash

#  scp -i $PEM $USERNAME@programacaoscripts.joao.marcelo.nom.br:/home/compartilhado/auth.log.1 .

sed -i 's/#!\/bin\/python/#!\/bin\/python3/g' atividade04.py

sed -i 's/nota1/\U&/g; s/nota2/\U&/g; s/notaFinal/\U&/g' atividade04.py

sed -i '/^import  os/a import  time' atividade04.py

sed -i '$a print(time.ctime())' atividade04.py
