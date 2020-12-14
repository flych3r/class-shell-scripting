#!/bin/bash

sed 's/\/home\/alunos\//\/srv\/students\//' /etc/passwd > passwd.new
