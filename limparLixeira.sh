#!/bin/bash/env bash

rm -rf /home/*/.local/share/Trash/*
if [ $? -eq 0 ];then
touch statusLixeira.txt | echo "Apagado em $(date) mais arquivos" >> statusLixeira.txt
else
touch nao.txt
fi 
