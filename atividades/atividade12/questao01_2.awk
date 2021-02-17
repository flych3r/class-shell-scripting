#!/bin/awk -f

$5 ~ "sshd" && $6 == "Accepted" {print}
