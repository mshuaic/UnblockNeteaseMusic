FROM alpine
RUN apk add --update nodejs npm --repository=http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/

ENV NODE_ENV production

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --production
COPY . .

EXPOSE 8080 8081

ENTRYPOINT ["node", "app.js", "-p", "8080:8081", "-e","http://music.163.com", "-o", "netease", "qq", "kuwo", "migu", "kugou", "baidu", "xiami", "joox", "youtube"]