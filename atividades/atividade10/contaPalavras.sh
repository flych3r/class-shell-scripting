# Correção: 1,0
read -p 'Informe o arquivo: ' FILE

BOW=$(cat $FILE | tr [:punct:] ' ' | tr '[:space:]' '[\n*]' | grep -v "^\s*$" | sort | uniq -c | sort -r | sed 's/  //g' | sed 's/ /:/g')
for w in $BOW
do
    word=(${w//:/ })
    echo ${word[1]}:$'\t'${word[0]}
done
