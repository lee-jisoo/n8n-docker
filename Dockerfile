FROM n8nio/n8n:latest-alpine

USER root

RUN apk add --no-cache fontconfig ttf-dejavu

COPY ./font/* /usr/share/fonts/

RUN fc-cache -fv

USER node