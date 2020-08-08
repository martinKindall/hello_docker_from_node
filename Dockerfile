FROM ubuntu

LABEL maintainer="mart256@gmail.com"

RUN apt update
RUN apt install nodejs npm

COPY . /src

WORKDIR /src

RUN npm install

EXPOSE 3000

ENTRYPOINT ["node", "./app.js"]
