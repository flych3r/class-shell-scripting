#!/bin/awk -f

/^Dec  4 18:[0-5][0-9]/ && $5 ~ "sshd" && $6 == "Accepted" {
    print
}
