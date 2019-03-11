FROM node:10.15.2

# Run this from rainblock-storage dir
RUN mkdir -p /home/node/rainblock-storage && chown -R node:node /home/node/rainblock-storage

WORKDIR /home/node/rainblock-storage

COPY package*.json ./

USER node
COPY --chown=node:node . .

RUN npm install typescript@^3.2
RUN npm install
RUN npm install express
RUN npm run compile

EXPOSE 8080

CMD [ "node", "hello.js" ]