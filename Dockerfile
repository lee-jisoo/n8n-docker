FROM n8nio/n8n:latest

USER root

RUN apt-get update && apt-get install -y fontconfig

# 2. 폰트 파일 복사 (font 폴더)
COPY ./font/* /usr/share/fonts/

# 3. 폰트 캐시 갱신
RUN fc-cache -fv

USER node