#!/bin/bash

echo "🚀 Iniciando Heavenly Fall..."

# Iniciar o banco de dados (caso o PC tenha sido reiniciado)
echo "🗄️ Ligando o Banco de Dados (MongoDB)..."
docker start mongo-db > /dev/null 2>&1 || echo "⚠️ Aviso: não foi possível iniciar o mongo-db automaticamente"

# Iniciar o backend
cd HeavenlyFall_BackEnd
echo "📦 Instalando dependências do backend..."
bun install > /dev/null
echo "⚙️ Iniciando servidor principal na porta 3000..."
bun start &
BACKEND_PID=$!
cd ..

echo ""
echo "🌐 Seu jogo e backend agora estão unidos e rodando!"
echo "👉 Para jogar localmente, acesse: http://localhost:3000"
echo ""
echo "🔗 Gerando link público (Localtunnel)..."
echo "Envie o link abaixo para seus amigos jogarem:"
npx -y localtunnel --port 3000 &
LT_PID=$!

# Aguardar interrupção (Ctrl+C)
trap "echo 'Encerrando servidores...'; kill $BACKEND_PID $LT_PID; exit" INT
wait
