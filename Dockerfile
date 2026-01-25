FROM n8nio/n8n:2.0.2
USER root
RUN apk add --no-cache fontconfig ttf-dejavu && echo "cache-bust-20250122-v3"
RUN apk add --no-cache ffmpeg
RUN mkdir -p /usr/share/fonts/truetype/custom
COPY ./font/ /usr/share/fonts/truetype/custom/
RUN chmod -R 644 /usr/share/fonts/truetype/custom/*
RUN fc-cache -fv
RUN echo "=== Font files ===" && ls -la /usr/share/fonts/truetype/custom/
RUN echo "=== Korean fonts ===" && fc-list :lang=ko
RUN echo "=== FFmpeg version ===" && ffmpeg -version
# 커뮤니티 노드 설치
RUN mkdir -p /home/node/.n8n/nodes && echo "cache-bust-20250125-v6"
WORKDIR /home/node/.n8n/nodes
RUN npm init -y
RUN npm cache clean --force && npm install @lee-jisoo/n8n-nodes-mediafx
RUN chown -R node:node /home/node/.n8n
USER node
