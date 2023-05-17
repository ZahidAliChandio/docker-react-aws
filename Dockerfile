# Multi step docker file

FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
#build folder will be created in the working directory /app (eg:/app/build)

#2nd phase
FROM nginx
# To intruct that this container needs port mapping to port 80.
# Elasticbeanstalk will look for this EXPOSE intrunction.
# EXPOSE 80 
COPY --from=0 /app/build/ /usr/share/nginx/html
