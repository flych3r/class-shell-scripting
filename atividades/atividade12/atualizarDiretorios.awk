#!/bin/awk -f

{ gsub("/home/alunos/", "/srv/students/"); print }
