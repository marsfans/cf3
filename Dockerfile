#USER root

#COPY start.sh ./

RUN apt-get update && apt-get install -y wget unzip iproute2 systemctl &&\
    wget -O https://github.com/SagerNet/sing-box/releases/download/v1.3.4/sing-box-1.3.4-linux-amd64.tar.gz &&\
    tar xf sing-box*.tar.gz &&\
    chromd +x sing-box &&\
    chmod -v 755 v start.sh
ENTRYPOINT [ "./start.sh" ]    
  
