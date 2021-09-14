FROM node:14.15.4-alpine3.12

RUN apk add --no-cache bash

# instala dockerize
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# a versao do nestjs deve ser maior ou igual a dos pacotes @nestjs/common": "^8.0.0" e "@nestjs/core": "^8.0.0" que estao no package.json
RUN npm install -g @nestjs/cli@8.0.0

# roda com o usario node para nao rodar com o root
USER node

# workdir dentro do container
WORKDIR /home/node/app
