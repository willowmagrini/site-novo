#!/bin/bash

# Verifica se o número correto de parâmetros foi passado
if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <novo-nome>"
  exit 1
fi

# Atribui o parâmetro à variável
string_nova=$1

# Renomeia o diretório do tema
mv themes/hacklab-theme themes/$string_nova

# Diretório atual
diretorio=$(pwd)

# Substitui as ocorrências da string antiga pela nova em todos os arquivos do diretório atual e subdiretórios, excluindo .git e cria-tema.sh
find "$diretorio" -type d -name ".git" -prune -o -type f ! -name "cria-tema.sh" -exec sed -i "s/hacklab-theme/$string_nova/g" {} +

# Remove o arquivo style.css e cria um link simbólico para o novo style.css
rm style.css
ln -s themes/$string_nova/style.css style.css
