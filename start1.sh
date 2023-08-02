wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.15.4/shadowsocks-v1.15.4.x86_64-unknown-linux-gnu.tar.xz
tar xf ./shadowsocks-v1.15.4.x86_64-unknown-linux-gnu.tar.xz
chmod +x ./ssserver 
chmod +x ./sslocal
chmod +x ./ssmanager
chmod +x ./ssserver
chmod +x ./ssurl

./ssserver -c ./config-sh.json