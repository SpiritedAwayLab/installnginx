yum update -y
yum install build-essential libssl-dev -y
yum install gcc gcc-c++ make -y
curl ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz -o pcre-8.42.tar.gz
tar -zxf pcre-8.42.tar.gz
cd pcre-8.42
./configure
make
make install

cd
curl https://datapacket.dl.sourceforge.net/project/libpng/zlib/1.2.11/zlib-1.2.11.tar.gz -o zlib-1.2.11.tar.gz
tar -zxf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure
make
make install

cd
curl http://www.openssl.org/source/openssl-1.1.1b.tar.gz -o openssl-1.1.1b.tar.gz
tar -zxf openssl-1.1.1b.tar.gz
cd openssl-1.1.1b
./Configure darwin64-x86_64-cc --prefix=/usr
make
make install

cd
curl https://nginx.org/download/nginx-1.14.2.tar.gz -o nginx-1.14.2.tar.gz
tar zxf nginx-1.14.2.tar.gz
cd nginx-1.14.2
./configure --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid --with-pcre=../pcre-8.42 --with-zlib=../zlib-1.2.11  --with-stream  

make
make install
cp /usr/local/nginx/nginx /usr/bin


nginx
