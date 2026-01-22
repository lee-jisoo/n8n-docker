FROM n8nio/n8n:latest

USER root

# 1. 'apk' 대신 '/sbin/apk'라고 주소를 정확히 찍어서 실행합니다.
# (경로 문제로 명령어를 못 찾는 오류를 방지합니다)
RUN /sbin/apk add --no-cache fontconfig ttf-dejavu

# 2. 폰트 파일 복사
# 주의: 사용자님의 폴더명이 'font'인지 'fonts'인지 꼭 확인하세요.
# (현재 사용자님의 폴더명은 'font'로 보입니다)
COPY ./font/* /usr/share/fonts/

# 3. 폰트 캐시 갱신
RUN fc-cache -fv

USER node