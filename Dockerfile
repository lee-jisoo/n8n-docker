FROM alpine:3.19 AS font-builder

RUN apk add --no-cache fontconfig ttf-dejavu
RUN fc-cache -fv

# ---

FROM n8nio/n8n:latest

USER root

# 폰트 및 fontconfig 복사
COPY --from=font-builder /usr/share/fonts/ /usr/share/fonts/
COPY --from=font-builder /usr/share/fontconfig/ /usr/share/fontconfig/
COPY --from=font-builder /var/cache/fontconfig/ /var/cache/fontconfig/
COPY --from=font-builder /etc/fonts/ /etc/fonts/

# 사용자 폰트 복사
COPY ./font/* /usr/share/fonts/

USER node