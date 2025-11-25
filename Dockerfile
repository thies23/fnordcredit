FROM node:20
WORKDIR /app
RUN apt-get update && apt-get install -y openssl ca-certificates bash
RUN rm -rf /var/lib/apt/lists/*
RUN corepack enable && corepack prepare yarn@stable --activate
COPY package.json yarn.lock ./
RUN yarn install
COPY prisma ./prisma
RUN npx prisma generate
COPY . .
EXPOSE 3000
CMD ["yarn", "dev"]
