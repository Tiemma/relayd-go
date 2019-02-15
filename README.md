
### IGNORE THIS SECTION
```
To run the test configuration [NOT NEEDED]: 

> go run main.go &

This would show the following prompts aferwards

Server started on localhost:8443 - HTTP
Server started on localhost:9443 - TLS

```


## Things to consider before deploying 


### Certificates 
Relayd loads its certificates for tls relay forwarding from the /etc/ssl path described 
above.

Currently the crt and key need to be named as server.crt and server.key for the script 
#[certs.sh](certs.sh) to work.

Once this is done, you should see the certs listed in the final prompts

```bash
ksh certs.sh
```

### Testing

You should open up the relayd.conf file and update the IP address and domain of the site you want to proxy for.

You can then proceed and start the relayd server using:

```bash
relayd -d -vv -f relayd.conf
```
Do this before deploying to be sure that the configuration is good and that you can access the server on https.

Debug logs as such should be seen 
```
vultr# relayd -d -vv -f relayd.conf  
startup
pfe: filter init done
socket_rlimit: max open files 1024
socket_rlimit: max open files 1024
socket_rlimit: max open files 1024
socket_rlimit: max open files 1024
relay_load_certfiles: using certificate /etc/ssl/80.240.27.13.crt
relay_load_certfiles: using private key /etc/ssl/private/80.240.27.13.key
warning: macro 'localServicesTLSPort' not used
parent_tls_ticket_rekey: rekeying tickets
relay_privinit: adding relay tcp_forwarder
protocol 2: name tcp_service
        flags: used, relay flags: 
        tcp flags: nodelay, socket buffer size
        tls session tickets: disabled
        type: http
relay_privinit: adding relay tcp_forwarder_tls
protocol 1: name tcp_service_tls
        flags: used, relay flags: tls
        tcp flags: nodelay, socket buffer size
        tls flags: tlsv1.0, tlsv1.1, tlsv1.2, cipher-server-preference
        tls session tickets: disabled
        type: http
                pass request quick header "Host" value "bakare.raedahgroup.com" forward to <localServices> 
                match request header append "X-Forwarded-For" value "$REMOTE_ADDR" 
                match request header append "X-Forwarded-By" value "$SERVER_ADDR:$SERVER_PORT" 
                match response header append "X-XSS-Protection" value "1; mode=block" 
                match response header append "X-Permitted-Cross-Domain-Policies" value "none" 
                match response header append "X-Frame-Options" value "DENY" 
                match response header append "X-Content-Type-Options" value "nosniff" 
                match response header append "Referrer-Policy" value "same-origin" 
ca_engine_init: using RSA privsep engine
ca_engine_init: using RSA privsep engine
ca_engine_init: using RSA privsep engine
ca_engine_init: using RSA privsep engine
adding 1 hosts from table localServices:80 (no check)
adding 1 hosts from table localServices:80 (no check)
relay_launch: running relay tcp_forwarder
adding 1 hosts from table localServices:80 (no check)
relay_launch: running relay tcp_forwarder
relay_tls_ctx_create: loading certificate
relay_launch: running relay tcp_forwarder
relay_tls_ctx_create: loading certificate
adding 1 hosts from table localServices:80 (no check)
relay_launch: running relay tcp_forwarder_tls
adding 1 hosts from table localServices:80 (no check)
relay_launch: running relay tcp_forwarder_tls

```


Certificate imports should likewise follow this format

```

/etc/ssl/address.crt
     
/etc/ssl/address:port.crt
     
/etc/ssl/private/address.key
     
/etc/ssl/private/address:port.key
    Location of the relay TLS server certificates, where address is the configured IP 
address and port is the configured port number of the relay.

/etc/ssl/cert.pem
    Default location of the CA bundle that can be used with relayd(8).
    
Examples from the logs are:

relay_load_certfiles: using certificate /etc/ssl/80.240.27.13.crt
relay_load_certfiles: using private key /etc/ssl/private/80.240.27.13.key

```

## Deploying

Just run

```bash
ksh deploy.sh
```

That would copy the script the etc folder, enable the relayd service and start the relayd server.

That's all





