# !/bin/awk -f

BEGIN {
    total = 0
    success = 0
    fail = 0
    avg_dutation = 0
}
{
    if ($0 ~ "Duration:") {
        total += 1
        success += 1
        avg_dutation += $7

    }
    if ($0 ~ "Task timed out") {
        total += 1
        fail += 1
    }
}
END {
    avg_dutation = avg_dutation / success
    print "Total de Invocações: " total
    print "Invocações com sucesso: " success
    print "Invocações com falha: " fail
    print "Tempo médio das invocações com sucesso (em milisegundos): " avg_dutation
}
