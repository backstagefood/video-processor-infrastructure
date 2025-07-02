#!/bin/bash

# Configurações padrão
URL="http://localhost:3000/api/upload"
FILE_PATH="/home/hamilton/Videos/sample_2.mp4"
CREDENTIALS="chaves@gmail.com:123456"
COUNT=1
VERBOSE=false

# Processa os parâmetros
while getopts ":q:f:u:c:vh" opt; do
  case $opt in
    q) COUNT="$OPTARG" ;;
    f) FILE_PATH="$OPTARG" ;;
    u) URL="$OPTARG" ;;
    c) CREDENTIALS="$OPTARG" ;;
    v) VERBOSE=true ;;
    h)
      echo "Uso: $0 [-q quantidade] [-f arquivo] [-u url] [-c credenciais] [-v] [-h]"
      echo "  -q: Quantidade de execuções (padrão: 1)"
      echo "  -f: Caminho do arquivo para upload (padrão: ./arquivo.mp4)"
      echo "  -u: URL do endpoint (padrão: http://localhost:3000/api/upload)"
      echo "  -c: Credenciais no formato usuario:senha (padrão: usuario@exemplo.com:senha123)"
      echo "  -v: Modo verboso"
      echo "  -h: Mostra esta ajuda"
      exit 0
      ;;
    \?)
      echo "Opção inválida: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Opção -$OPTARG requer um argumento." >&2
      exit 1
      ;;
  esac
done

# Verifica se o arquivo existe
if [ ! -f "$FILE_PATH" ]; then
  echo "Erro: Arquivo $FILE_PATH não encontrado!" >&2
  exit 1
fi

# Codifica as credenciais em Base64
AUTH_HEADER="Authorization: Basic $(echo -n "$CREDENTIALS" | base64)"

echo "Iniciando $COUNT requisições para $URL"
echo "Arquivo: $FILE_PATH"
echo ""

for ((i=1; i<=$COUNT; i++)); do
  echo -n "Executando requisição $i/$COUNT..."

  # Executa o curl e captura o output
  RESPONSE=$(curl -s -X POST \
    -H "$AUTH_HEADER" \
    -F "video=@$FILE_PATH" \
    "$URL" 2>&1)

  # Verifica o status da requisição
  if [ $? -eq 0 ]; then
    echo " OK"
    if [ "$VERBOSE" = true ]; then
      echo "Resposta: $RESPONSE"
    fi
  else
    echo " FALHOU"
    echo "Erro: $RESPONSE" >&2
  fi

  # Pequena pausa entre requisições para evitar sobrecarga
  sleep 0.1
done

echo ""
echo "Concluído! Total de requisições: $COUNT"