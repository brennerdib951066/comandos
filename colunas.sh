#!/bin/bash
# Verifica o número de colunas do arquivo CSV
num_cols=$(head -n 1 DF1.csv | tr ',' '\n' | wc -l)

# Itera sobre as colunas do arquivo CSV
for ((i=1;i<=num_cols;i++)); do
#Obtém o título da coluna atual
col_title=$(head -n 1 DF1.csv | cut -d',' -f$i)

  # Verifica se o título da coluna começa com a letra "n"
if [[ $col_title == N* || $col_title == Te* ]]; then
#Exporta a coluna para um novo arquivo
cut -d',' -f$i DF1.csv > DF_col$i.csv
fi
done


# Procura os arquivos mais recentes na pasta atual
files=$(find . -maxdepth 1 -type f -printf '%T@ %p\n' | sort -n | cut -d' ' -f2- | tail -3)

# Concatena os arquivos em colunas usando o separador ','
paste -d',' $files





#file="GO.csv"

#initial="n"

#temp_file=$(mktemp)

#awk -F, '{for (i=1;i<=NF;i++) if (substr($i,1,1) == initial) print $i}' $file > $temp_file

#cat $temp_file




