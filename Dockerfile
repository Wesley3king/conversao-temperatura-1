FROM node:18.3.0
WORKDIR /app
COPY ./package*.json ./
RUN npm config set registry="http://registry.npmjs.org/"
RUN npm config rm proxy
RUN npm config rm https-proxy
RUN npm config set fetch-retry-mintimeout 20000
RUN npm config set fetch-retry-maxtimeout 120000
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node","server.js"]