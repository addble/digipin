FROM node:lts 
USER root
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN npm install
CMD ["npm","start"]