 # Move certificates to ssl folder and rename to domain
 CERT_PATH=/etc/ssl
 ADDRESS=$1
 TLS_PORT=$2
 
mkdir -p $CERT_PATH
mkdir -p $CERT_PATH/private

 cat server.crt server.key > server.includesprivatekey.pem
 cp server.crt $CERT_PATH/$1:$2.crt
 cp server.key $CERT_PATH/private/$1:$2.key 
 cp server.includesprivatekey.pem $CERT_PATH/cert.pem


