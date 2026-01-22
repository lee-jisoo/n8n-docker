FROM n8nio/n8n:latest

USER root

# Alpine 기반 - apk 직접 호출
RUN apk add --no-cache fontconfig ttf-dejavu

# 폰트 파일 복사
COPY ./font/* /usr/share/fonts/

# 폰트 캐시 갱신
RUN fc-cache -fv

USER node