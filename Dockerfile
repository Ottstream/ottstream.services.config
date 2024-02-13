# Use an official Node runtime as a parent image
FROM node:20

# Installing Google Chrome
RUN apt update \
    && apt install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y build-essential libvips-dev google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
RUN mkdir -p /usr/src/node-app && chown -R node:node /usr/src/node-app

# Set the working directory
WORKDIR /usr/src/node-app

# Copy package.json and package-lock.json
COPY package.json ./

# Copy package.json and package-lock.json
COPY .npmrc ./

RUN npm config set registry https://npm.ottstream.net/

# Install app dependencies
RUN npm i
# Install PM2 globally
RUN npm publish