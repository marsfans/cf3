FROM nginx:mainline-alpine-slim
MAINTAINER ifeng <https://t.me/HiaiFeng>
EXPOSE 4443
EXPOSE 5353
EXPOSE 8081
EXPOSE 8388
USER root

COPY *.sh ./
COPY *.json ./

RUN apk update && apk add --no-cache supervisor wget unzip curl bash

RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.3.4/sing-box-1.3.4-linux-amd64.tar.gz &&\
    tar xf ./sing-box-*-linux-amd64.tar.gz &&\
    mv ./sing-box-*-linux-amd64/sing-box ./ &&\
    ls &&\
    chmod +x ./sing-box &&\
    chmod +x ./start.sh &&\
    chmod +x ./start1.sh
ENTRYPOINT ["bash","./start1.sh" ]    
  
