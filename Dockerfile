FROM n8nio/n8n:latest

USER root

# 쉘 명시적 지정
SHELL ["/bin/ash", "-c"]
RUN apk add --no-cache fontconfig ttf-dejavu

COPY ./font/* /usr/share/fonts/

RUN fc-cache -fv

USER node