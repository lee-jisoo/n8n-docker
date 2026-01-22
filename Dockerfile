FROM n8nio/n8n:latest

USER root

# 1. GitHub에 올린 fonts 폴더의 모든 파일을 시스템 폰트 폴더로 복사합니다.
COPY ./fonts/* /usr/share/fonts/

# 2. 복사한 폰트를 시스템에 등록합니다.
RUN fc-cache -fv

USER node