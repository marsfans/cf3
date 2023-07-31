FROM nginx:mainline-alpine-slim
MAINTAINER ifeng <https://t.me/HiaiFeng>
EXPOSE 80
USER root

RUN apk update && apk add --no-cache supervisor wget unzip curl bash

RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.3.4/sing-box-1.3.4-linux-amd64.tar.gz &&\
    tar xf ./sing-box*.tar.gz &&\
    mv ./sing-box*/sing-box ./ &&\
    chromd +x ./sing-box &&\
    chmod -v 755 v ./start.sh
ENTRYPOINT [ "./start.sh" ]    
  
