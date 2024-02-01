FROM node:7.7-alpine

# install deps
ADD package.json /tmp/package.json
RUN cd /tmp && npm install

# Copy deps
RUN mkdir -p /opt/kkh-app && cp -a /tmp/node_modules /opt/kkh

# Setup workdir
WORKDIR /kkh-app
COPY . /opt/kkh-app

# run
EXPOSE 3000
CMD ["npm", "start"]