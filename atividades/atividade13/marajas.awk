# !/bin/awk -f

(NR>1) {
    if ($3 > salario[$2]) {
        salario[$2] = $3
        professor[$2] = $1
    }
}
END {
    for (curso in salario)
        print curso ":\t" professor[curso] ",\t" salario[curso] | "sort | column -t"
}
