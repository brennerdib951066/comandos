!/usr/bin/env bash

#echo "Qual a linguagem do sistema?"
#echo "$LANG"

#echo "Qual diretorio o usuario esta?"
#echo "$HOME"

#echo "qual o nome do usuario?"
#echo "$USER"

#criar_pasta=$(mkdir -v rua)
#echo "$criar_pasta"

#listagem=$(ls /boot)
#echo "$listagem"
#listagem2=$(ls /home)
#echo "$listagem2"
#listagem2=$(ls /home/"Downloads")
#echo "$listagem3"

#criar=$(mkdir testes teste2 3)
#echo "$criar"
#echo $?
#mover=$(mv *.xlsx ./LeadsMG)
#cd ./LeadsMG
#soffice --headless --convert-to csv *.xlsx
#echo $?

#[[ -e "cursos.sh" ]] && echo "Sim existe!"
#[[ "cursos.sh" -ot "meu.txt" ]] && echo "Sim existe novo!" || echo "Não é velho"

#nome[0]="MG.csv"
#nome_arquivo="${nome[0]}"

#if [[ nome_arquivo = MG.csv ]];then
#mv MG.csv MinasGerais.csv
#else 
#echo "não valido!"
#fi


#LOG="teste.txt"
 
#for i in *.csv; 
#do
 
#echo "INSERT INTO upload (id_empresa,arquivo)VALUES('101','"$i"');" >> $LOG
 
#done

#grep "^D" arquivosjpg.json
#valor=""
#echo ""

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
mv *.xlsx ./arquivosxlsx
sleep 5s
echo -e "Agora vamos converter seus arquivos para txt\nPara que possamos filtrar"
soffice --headless --convert-to txt *.csv

echo -e "Outra conversão realizada com sucesso!"
sleep 20s
echo -e "Listarei para você os arquivos que deseja retirar dados repetido
$(ls d*txt)"

mv d*txt ./leadsdf
cd ./leadsdf
$(pwd)

echo "Aqui estão os dados repetidos$(sort *txt | uniq -d -i  -c > QtdsRepetidasDF.txt)"
mv QtdsRepetidasDF.txt ../dadosrepetidos/QtdsRepetidasDF.txt

cut -s -d"," -f1,2,4 *.txt | sort *txt | uniq -i > sem_repeticoes
echo "$(ls)"

cd ..
echo "$(pwd)"

echo -e "Lista para mim os arquivos que deseja retirar dados repetido\n
$(ls m*txt)"
mv m*txt ./leadsmg
cd ./leadsmg
$(pwd)
echo "Aqui estão os dados repetidos$(sort *txt | uniq -d -i  -c > QtdsRepetidasMG.txt)"
mv QtdsRepetidasMG.txt ../dadosrepetidos/QtdsRepetidasMG.txt
cut -s -d"," -f1,2,4 *.txt | sort *txt | uniq -i > sem_repeticoesMG
echo "$(ls)"
$(pwd)
cd ..
echo -e "Listarei para você os arquivos que deseja retirar dados repetido\n
$(ls g*txt)"
mv g*txt ./leadsgo
cd ./leadsgo
$(pwd)
sleep 10s
echo "Aqui estão os dados repetidos$(sort *txt | uniq -d -i  -c > QtdsRepetidasGO.txt)"
mv QtdsRepetidasGO.txt ../dadosrepetidos/QtdsRepetidasGO.txt
cut -s -d"," -f1,2,4 *.txt | sort *.txt | uniq -i > sem_repeticoesGO
echo "$(ls)"


echo "$(pwd)"
cd ..
cd ./dadosrepetidos
cat -s *txt > dadosRepetidos
for f in dadosRepetidos; do ssconvert "$f" "${f%.csv}.csv"; done
cd ../leadsgo
for f in *; do ssconvert "$f" "${f%.csv}.csv"; done
cd ../leadsdf
for f in *; do ssconvert "$f" "${f%.csv}.csv"; done
cd ../leadsmg
for f in *; do ssconvert "$f" "${f%.csv}.csv"; done
$(pwd)
cd ..
cd ./dadosrepetidos
mv dadosRepetidos.csv ../enviarprocesar/dadosRepetidos.csv

mv QtdsRepetidasDF.txt ../enviarprocesar/QtdsRepetidasDF.txt

mv QtdsRepetidasMG.txt ../enviarprocesar/QtdsRepetidasMG.txt

mv QtdsRepetidasGO.txt ../enviarprocesar/QtdsRepetidasGO.txt
sleep 10s

else
echo -e "infezlimente você escolheu outra coisa! \n"
fi

read "Deseja Acessar seu Mysql [S/N]?" nome

if [[ $nome="S" ]];then
echo "Muito Bem Vou abrir seu Myql!"

mysql-workbench %f
else
echo -e "Ok, Obrigado por me usar \n até a proxima!"
fi

