pkg_add go git

# Create the certificates for the TLS server
openssl genrsa -out server.key 2048


# Key considerations for algorithm "ECDSA" ≥ secp384r1
# List ECDSA the supported curves (openssl ecparam -list_curves)
openssl ecparam -genkey -name secp384r1 -out server.key


# Generate X509 keys
openssl req -nodes -new -x509 -sha256 -key server.key -out server.crt -days 3650


# Move certificates to ssl folder and rename to domain
CERT_PATH=/etc/ssl/private
ADDRESS=$1
TLS_PORT=$2
mkdir -p $CERT_PATH

cat server.crt server.key > server.includesprivatekey.pem
cp server.crt $CERT_PATH/$1:$2.crt
cp server.key $CERT_PATH/$1:$2.key
cp server.includesprivatekey.pem $CERT_PATH/$1:$2.pem


















