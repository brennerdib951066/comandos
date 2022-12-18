#!/bin/bash

#Verifica se o arquivo especificado existe
if [ ! -f "$1" ]; then
echo "Arquivo não encontrado."
exit 1
fi

#Adiciona o arquivo ao stage do git
git add "$1"

#Faz o commit com a mensagem especificada
git commit -m "Enviando arquivo $1 para o GitHub"

#Envia o commit para o repositório remoto
git push origin master

Novo commit
Legalll demais
