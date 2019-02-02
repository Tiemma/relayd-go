 # Move certificates to ssl folder and rename to domain
 CERT_PATH=/etc/ssl

echo "Enter the address of the machine:"

 while read ADDRESS; 
	do echo -e "\nAddress: $ADDRESS "; 
		break; 
	done

echo "Enter the tls port of the server running:"

 while read TLS_PORT; 
	do 
		echo -e "\nTLS PORT: $TLS_PORT "; 
		break; 
	done
exit;

echo -e "\n\n=================\n"
echo -e "Configuration\n"
echo -e "ADDRESS: $ADDRESS\n"
echo -e "TLS PORT: $TLS_PORT\n"
echo -e "\n=================\n\n"
 
mkdir -p $CERT_PATH
mkdir -p $CERT_PATH/private

 cat server.crt server.key > server.includesprivatekey.pem
 cp server.crt $CERT_PATH/$ADDRESS:$TLS_PORT.crt
 cp server.key $CERT_PATH/private/$ADDRESS:$TLS_PORT.key
# cp server.includesprivatekey.pem $CERT_PATH/cert.pem


