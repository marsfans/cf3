#USER root

#COPY start.sh ./

RUN apt-get update && apt-get install -y wget unzip iproute2 systemctl &&\
    wget $(wget -qO- "https://api.github.com/repos/SagerNet/sing-box/releases/latest" | grep -m1 -o "https.*linux-amd64.*gz")\
    tar xf sing-box*.tar.gz\
    chromd +x sing-box\
    chmod -v 755 v start.sh\
ENTRYPOINT [ "./start.sh" ]    
  
