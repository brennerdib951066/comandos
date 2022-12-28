#!/bin/bash
echo "Cole sua URL youtube aqui!"
read baixar
echo "Agora escolha seu diretorio onde deseja salvar o downloads"
read diretorio

yt-dlp -f mp4 -o "$diretorio/%(title)s.%(ext)s" $baixar

