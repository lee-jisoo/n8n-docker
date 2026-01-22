FROM n8nio/n8n:2.0.2

USER root

# 폰트 관련 패키지 설치
RUN apk add --no-cache fontconfig ttf-dejavu

# 폰트 디렉토리 생성 및 복사
RUN mkdir -p /usr/share/fonts/truetype/custom
COPY ./font/ /usr/share/fonts/truetype/custom/

# 권한 설정 및 캐시 갱신
RUN chmod -R 644 /usr/share/fonts/truetype/custom/* && \
    fc-cache -fv

# 설치된 한글 폰트 확인 (빌드 로그에 출력)
RUN echo "=== Installed Korean Fonts ===" && fc-list :lang=ko

USER node