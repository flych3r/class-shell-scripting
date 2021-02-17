#!/bin/awk -f

$5 !~ "sshd" { print }
