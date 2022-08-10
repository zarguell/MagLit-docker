# Dockerfile
ARG NODE_VERSION=17.9.1

# The base image with updates applied
FROM node:$NODE_VERSION-alpine
RUN apk -U upgrade

# set workdir and user
RUN mkdir -p /opt/app

# copy app source to image and chown to app
COPY . /opt/app
RUN chown -R node:node /opt/app

# Install dependencies
RUN npm install

USER node
EXPOSE 3000

CMD [ "npm", "run", "production" ]