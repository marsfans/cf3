FROM nginx:mainline-alpine-slim
MAINTAINER ifeng <https://t.me/HiaiFeng>
EXPOSE 4443
EXPOSE 5353
EXPOSE 8081
EXPOSE 8388
USER root

COPY *.sh ./
COPY *.json ./

RUN apk update && apk add --no-cache supervisor wget unzip curl bash glibc-bin

RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.3.4/sing-box-1.3.4-linux-amd64.tar.gz &&\
    tar xf ./sing-box-*-linux-amd64.tar.gz &&\
    mv ./sing-box-*-linux-amd64/sing-box ./ &&\
    ls &&\
    chmod +x ./sing-box
RUN wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.15.4/shadowsocks-v1.15.4.x86_64-unknown-linux-gnu.tar.xz &&\
    tar xf ./shadowsocks-v1.15.4.x86_64-unknown-linux-gnu.tar.xz &&\
    chmod +x ./ss*   
RUN chmod +x ./start.sh &&\
    chmod +x ./start1.sh
ENTRYPOINT ["bash","./start1.sh" ]    
  
