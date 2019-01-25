To run the test configuration: 

> go run main.go &

This would show the following prompts aferwards

```
Server started on localhost:8443 - HTTP
Server started on localhost:9443 - TLS

```

You can proceed and start the relayd server using:
 relayd -d --vv -f relayd.conf

Debug logs as such shoulw be seen 
```
startup
pfe: filter init done
socket_rlimit: max open files 1024
socket_rlimit: max open files 1024
socket_rlimit: max open files 1024
socket_rlimit: max open files 1024
warning: macro 'exposedInstancePort' not used
unused protocol: tcp_service_tls
parent_tls_ticket_rekey: rekeying tickets
relay_privinit: adding relay tcp_forwarder
protocol 2: name tcp_service
        flags: used, relay flags: 
        tcp flags: nodelay, socket buffer size
        tls session tickets: disabled
        type: http
adding 1 hosts from table localServices:8443
adding 1 hosts from table localServices:8443
relay_launch: running relay tcp_forwarder
adding 1 hosts from table localServices:8443
relay_launch: running relay tcp_forwarder
relay_launch: running relay tcp_forwarder
hce_notify_done: 127.0.0.1 (http code ok)
host 127.0.0.1, check http code (5ms,http code ok), state unknown -> up, availability 
100.00%

```


Certificate imports should likewie follow this format

```

/etc/ssl/address.crt
     
/etc/ssl/address:port.crt
     
/etc/ssl/private/address.key
     
/etc/ssl/private/address:port.key
    Location of the relay TLS server certificates, where address is the configured IP 
address and port is the configured port number of the relay.

/etc/ssl/cert.pem
    Default location of the CA bundle that can be used with relayd(8).

```
