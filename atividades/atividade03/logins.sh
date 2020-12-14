#!/bin/bash

scp -i $PEM $USERNAME@programacaoscripts.joao.marcelo.nom.br:/home/compartilhado/auth.log.1 .

# echo 'Um comando grep que encontre todas as linhas com mensagens que não são do sshd.'
grep -v 'sshd' auth.log.1

# echo 'Um comando grep que encontre todas as linhas com mensagens que indicam um login de sucesso via sshd.'
grep 'sshd\[.*\]: Accepted publickey for' auth.log.1

# echo 'Um comando grep que encontre todas as vezes que alguém tentou fazer login via root através do sshd.'
grep 'sshd\[.*\]: .*authenticating user root' auth.log.1

# echo 'Um comando grep que encontre todas as vezes que alguém conseguiu fazer login com sucesso no dia 04 de dezembro, entre as 18:00 e 19:00.'
grep '^Dec  4 18:[0-5][0-9].*sshd\[.*\]: Accepted publickey for' auth.log.1
