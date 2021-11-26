apt-get update
apt-get install build-essential libssl-dev -y
wget https://nchc.dl.sourceforge.net/project/pcre/pcre/8.42/pcre-8.42.tar.gz
tar -zxf pcre-8.42.tar.gz
cd pcre-8.42
./configure
make
make install

cd
wget http://zlib.net/zlib-1.2.11.tar.gz
tar -zxf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure
make
make install

cd
wget https://nginx.org/download/nginx-1.21.4.tar.gz
tar zxf nginx-1.21.4.tar.gz
cd nginx-1.21.4
./configure --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid --with-pcre=../pcre-8.42 --with-zlib=../zlib-1.2.11 --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module

make
make install
cp /usr/local/nginx/nginx /usr/bin

openssl ecparam -out /etc/ssl/private/ssl-nginx.key -name prime256v1 -genkey
openssl req -new -days 3650 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -key /etc/ssl/private/ssl-nginx.key -out /etc/ssl/certs/ssl-nginx.cert
#nginx
