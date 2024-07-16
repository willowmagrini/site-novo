#!/bin/bash

# Verifica se o número correto de parâmetros foi passado
if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <novo-nome>"
  exit 1
fi

# Atribui os parâmetros às variáveis
string_nova=$1
mv themes/hacklab-theme $string_nova

# Diretório atual
diretorio=$(pwd)

# Substitui as ocorrências da string antiga pela nova em todos os arquivos do diretório atual e subdiretórios
find "$diretorio" -type f -exec sed -i "s/hacklab-theme/$string_nova/g" {} +

echo "Substituição concluída com sucesso."
