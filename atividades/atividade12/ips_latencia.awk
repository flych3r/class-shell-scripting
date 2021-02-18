#!/bin/awk -f

BEGIN {
        print "Relatório de Latência."
}
{
        ping = "ping -c 5 " $0

        while(ping | getline linha) {
        }

        split(linha, stats, " ")
        split(stats[4], values, "/")
        print $0 " " values[2] " " stats[5]
}
