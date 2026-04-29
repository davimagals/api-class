FROM node:20-alpine

WORKDIR /app

# Copia apenas dependências primeiro (melhor cache)
COPY package*.json ./

# Instala só produção
RUN npm install --omit=dev

# Copia o restante do código
COPY . .

# Usa usuário não-root
USER node

EXPOSE 3000

CMD ["node", "src/server.js"]