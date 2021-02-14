FROM node:14-alpine

LABEL maintainer="mart256@gmail.com"

COPY . /src

WORKDIR /src

RUN apk --no-cache add curl
RUN npm install

EXPOSE 3000

ENTRYPOINT ["node", "./app.js"]
