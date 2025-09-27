FROM alpine:3.18

RUN apk add --no-cache curl unzip

WORKDIR /xray

# Скачиваем Xray
RUN curl -Ls https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o /tmp/xray.zip \
 && unzip /tmp/xray.zip -d /xray/bin \
 && rm /tmp/xray.zip

# Копируем конфиг
COPY config.json /xray/config.json

EXPOSE 443

CMD ["/xray/bin/xray", "-config", "/xray/config.json"]
