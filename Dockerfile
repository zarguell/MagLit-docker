# Dockerfile

FROM node:18.7.0-slim

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