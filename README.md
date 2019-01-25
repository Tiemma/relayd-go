To run the test configuration: 

> go run main.go &

This would show the following prompts aferwards

```
Server started on localhost:8443 - HTTP
Server started on localhost:9443 - TLS

```

You can proceed and start the relayd server using:
 
> relayd -d --vv -f relayd.conf

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

Currently debugging TLS issues on port 9443

