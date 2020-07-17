FROM node:6.17.0-alpine
RUN apk upgrade && apk add --no-cache procps
