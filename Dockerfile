# Dockerfile
ARG         NODE_VERSION=17

# The base image with updates applied
FROM        node:$NODE_VERSION-alpine

# set workdir and user
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser --system --group app

# copy app source to image and chown to app
COPY . /opt/app
RUN chown -R app /opt/app

# Install dependencies
RUN npm install

USER app
EXPOSE 3000

CMD [ "npm", "run", "production" ]