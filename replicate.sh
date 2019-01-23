pkg_add go git

# Create the certificates for the TLS server
openssl genrsa -out server.key 2048


# Key considerations for algorithm "ECDSA" ≥ secp384r1
# List ECDSA the supported curves (openssl ecparam -list_curves)
openssl ecparam -genkey -name secp384r1 -out server.key


# Generate X509 keys
openssl req -nodes -new -x509 -sha256 -key server.key -out server.crt -days 3650


# Move certificates to ssl folder and rename to domain
CERT_PATH=/etc/ssl/relayd
mkdir -p $CERT_PATH

cp server.crt $CERT_PATH/127.0.0.1.crt
cp server.key $CERT_PATH/127.0.0.1.key



















