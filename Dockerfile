FROM node:14-alpine

LABEL maintainer="mart256@gmail.com"

COPY . /src

WORKDIR /src

RUN npm install

EXPOSE 3000

ENTRYPOINT ["node", "./app.js"]
