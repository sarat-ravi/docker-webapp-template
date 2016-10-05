FROM node:4.6.0

# Add our user and group first to make sure their IDs get assigned consistently
RUN groupadd -r app && useradd -r -g app app

# Create app directory
RUN mkdir -p /usr/src/app
RUN mkdir -p /var/eb_log
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
# RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080

# TODO: Use index.js instead.
CMD [ "npm", "start" ]

