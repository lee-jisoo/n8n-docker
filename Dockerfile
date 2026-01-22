FROM n8nio/n8n:latest

USER root

# Debian/Ubuntu 기반 이미지용 (apt 사용)
RUN apt-get update && apt-get install -y --no-install-recommends \
    fontconfig \
    fonts-dejavu \
    && rm -rf /var/lib/apt/lists/*

# 폰트 파일 복사
COPY ./font/* /usr/share/fonts/

# 폰트 캐시 갱신
RUN fc-cache -fv

USER node