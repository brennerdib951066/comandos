#!/bin/env bash

echo "Olá tudo? Você está no script Viver Bem"

echo -e "Você deseja que eu trabalhe né! \n"

echo -e "Então vamos começar\n?"

echo -e "Estamos renomeando seus arquivos para minusculas! \n"

rename 'y/A-Z/a-z/' *
echo "Pronto!"
sleep 5s

read -p "Você deseja Modificar Todos Seus os arquivos [S/N]?" remover
remover="S"
echo -e "Primaramente Estamos convertendo\nElas se tornarão .CSV"
sleep 5s

soffice --headless --convert-to csv *.xlsx
echo "Conversão realizada com sucesso!"
sleep 5s
if [[ $remover="S" ]];then
echo -e "Você escolheu SIM, estamos processando sua afirmação! \n"
rename "s/[-_() ]//g" *
sleep 5s
echo -e "Removendo caracteres que poderá atrapalhar você\nPor favor aguarde!"

#Elemina espaços caracetres especiais
echo -e "Movendo Arquivos XLSX para a pasta ArquivosXLSX!"
mv *.xlsx ~/Documentos/cesar
mv *.csv ~/Documentos/cesar
sleep 5s
pwd
sleep 10s
#echo -e "Agora vamos converter seus arquivos para txt\nPara que possamos filtrar"
#soffice --headless --convert-to txt *.csv

#echo -e "Outra conversão realizada com sucesso!"

cd ~/Documentos/cesar
pwd
sleep 10s
#mv m*csv ./leadsmg
#mv b*csv ./leadsmg
#mv *31*csv ./leadsmg
ls m* || ls bh*
sleep 10s
read  colunas
head -n 1 $colunas | awk -F, '{for (i=1; i<=NF; i++) {if ($i ~ /^[N|Tel]/) print i,$i}}'
cut -d"," -f1,3 *mg.csv > mg2tabelas.csv
cut -d"," -f1,3 bh*.csv > mg2tabelas.csv
cut -d"," -f1,3 *31.csv > mg2tabelas.csv
cut -d"," -f1,3 df*.csv > df2tabelas.csv
cut -d"," -f1,3 *61.csv > df2tabelas.csv
cut -d"," -f1,3 go*.csv > go2tabelas.csv
cut -d"," -f1,3 *62.csv > go2tabelas.csv

sort mg2tabelas.csv | uniq -i > semrepeticoesmg.csv
sort mg2tabelas.csv | uniq -d -c > qtdsRepetidosmg.csv

sort df2tabelas.csv | uniq -i > semrepeticoesdf.csv
sort df2tabelas.csv | uniq -d -c > qtdsRepetidosdf.csv

sort go2tabelas.csv | uniq -i > semrepeticoesgo
sort go2tabelas.csv | uniq -d -c > qtdsRepetidosgo.csv
mv qtdsRepetidosmg.csv ./dadosrepetidos
mv qtdsRepetidosdf.csv ./dadosrepetidos
mv qtdsRepetidosgo.csv ./dadosrepetidos
mv s*mg ./leadsmg
mv s*go ./leadsgo
mv s*df ./leadsdf

rm *tabelas.csv
pwd
sleep 10s


#sleep 20s
#echo -e "Listarei para você os arquivos que deseja retirar dados repetido
#$(ls d*txt)"

#mv d*txt ./leadsdf
#mv *61*.txt ./leadsdf
#cd ./leadsdf
#$(pwd)

#echo "Aqui estão os dados repetidos$(sort *txt | uniq -d -i  -c > QtdsRepetidasDF.txt)"
#mv QtdsRepetidasDF.txt ../dadosrepetidos/QtdsRepetidasDF.txt

#cut -s -d"," -f1,2,4 *.txt | sort *txt | uniq -i > sem_repeticoes
#echo "$(ls)"

#cd ..
#echo "$(pwd)"

#echo -e "Lista para mim os arquivos que deseja retirar dados repetido\n
#$(ls m*txt)"
#mv m*txt ./leadsmg
#mv B*txt ./leadsmg
#mv *31*.txt ./leadsmg
#cd ./leadsmg
#$(pwd)
#echo "Aqui estão os dados repetidos$(sort *txt | uniq -d -i  -c > QtdsRepetidasMG.txt)"
#mv QtdsRepetidasMG.txt ../dadosrepetidos/QtdsRepetidasMG.txt
#cut -s -d"," -f1,2,4 *.txt | sort *txt | uniq -i > sem_repeticoesMG
#echo "$(ls)"
#$(pwd)
#cd ..
#echo -e "Listarei para você os arquivos que deseja retirar dados repetido\n
#$(ls g*txt)"
#mv g*txt ./leadsgo
#mv *62*.txt ./leadsgo
#cd ./leadsgo
#$(pwd)
#sleep 10s
#echo "Aqui estão os dados repetidos$(sort *txt | uniq -d -i  -c > QtdsRepetidasGO.txt)"
#mv QtdsRepetidasGO.txt ../dadosrepetidos/QtdsRepetidasGO.txt
#cut -s -d"," -f1,2,4 *.txt | sort *.txt | uniq -i > sem_repeticoesGO
#echo "$(ls)"


#echo "$(pwd)"
#cd ..
#cd ./dadosrepetidos
#cat -s *txt > dadosRepetidos
#for f in dadosRepetidos; do ssconvert "$f" "${f%.csv}.csv"; done
#cd ../leadsgo
#for f in *; do ssconvert "$f" "${f%.csv}.csv"; done
#cd ../leadsdf
#for f in *; do ssconvert "$f" "${f%.csv}.csv"; done
#cd ../leadsmg
#for f in *; do ssconvert "$f" "${f%.csv}.csv"; done
#$(pwd)
#cd ..
#cd ./dadosrepetidos
#mv dadosRepetidos.csv ../enviarprocesar/dadosRepetidos.csv

#mv QtdsRepetidasDF.txt ../enviarprocesar/QtdsRepetidasDF.txt

#mv QtdsRepetidasMG.txt ../enviarprocesar/QtdsRepetidasMG.txt

#mv QtdsRepetidasGO.txt ../enviarprocesar/QtdsRepetidasGO.txt
#sleep 10s

#else
#echo -e "infezlimente você escolheu outra coisa! \n"
#fi

#read "Deseja Acessar seu Mysql [S/N]?" nome

#if [[ $nome="S" ]];then
#echo "Muito Bem Vou abrir seu Myql!"

#mysql-workbench %f
#else
#echo -e "Ok, Obrigado por me usar \n até a proxima!"
fi
