FROM alpine:3.19 AS font-builder

RUN apk add --no-cache fontconfig ttf-dejavu

# ---

FROM n8nio/n8n:latest

USER root

# fontconfig 관련 파일 복사
COPY --from=font-builder /usr/share/fonts/ /usr/share/fonts/
COPY --from=font-builder /usr/share/fontconfig/ /usr/share/fontconfig/
COPY --from=font-builder /etc/fonts/ /etc/fonts/
COPY --from=font-builder /usr/bin/fc-cache /usr/bin/fc-cache
COPY --from=font-builder /usr/lib/libfontconfig* /usr/lib/
COPY --from=font-builder /usr/lib/libfreetype* /usr/lib/
COPY --from=font-builder /usr/lib/libpng* /usr/lib/
COPY --from=font-builder /usr/lib/libbz2* /usr/lib/
COPY --from=font-builder /usr/lib/libz* /usr/lib/
COPY --from=font-builder /usr/lib/libexpat* /usr/lib/
COPY --from=font-builder /usr/lib/libbrotli* /usr/lib/

# 사용자 폰트 복사
COPY ./font/* /usr/share/fonts/

# 폰트 캐시 갱신 (사용자 폰트 포함)
RUN fc-cache -fv || true

USER node