FROM nginx:mainline-alpine-slim
MAINTAINER ifeng <https://t.me/HiaiFeng>
EXPOSE 443
USER root

COPY start.sh ./
COPY config.json ./

RUN apk update && apk add --no-cache supervisor wget unzip curl bash

RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.3.4/sing-box-1.3.4-linux-amd64.tar.gz &&\
    tar xf ./sing-box-*-linux-amd64.tar.gz &&\
    mv ./sing-box-*-linux-amd64/sing-box ./ &&\
    ls &&\
    chmod +x ./sing-box &&\
    chmod +x ./start.sh
ENTRYPOINT ["bash","./start.sh" ]    
  
