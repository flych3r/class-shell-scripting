#!/bin/awk -f
# Era para guardar no arquivo passwd.new
{ gsub("/home/alunos/", "/srv/students/"); print }
