apt-get update
apt-get install build-essential libssl-dev -y
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz
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
wget http://www.openssl.org/source/openssl-1.1.1b.tar.gz
tar -zxf openssl-1.1.1b.tar.gz
cd openssl-1.1.1b
./Configure darwin64-x86_64-cc --prefix=/usr
make
make install

cd
wget https://nginx.org/download/nginx-1.14.2.tar.gz 
tar zxf nginx-1.14.2.tar.gz
cd nginx-1.14.2
./configure --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid --with-pcre=../pcre-8.42 --with-zlib=../zlib-1.2.11  --with-stream  

make
make install
cp /usr/local/nginx/nginx /usr/bin

echo "stream {server {listen 9999;proxy_pass ae-pool.beepool.org:9505;}}" >> /usr/local/nginx/nginx.conf

nginx
