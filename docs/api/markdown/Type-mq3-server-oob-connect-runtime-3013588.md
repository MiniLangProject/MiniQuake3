# `mq3.server.oob_connect.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-oob-connect-ml-829458266.md)

<a id="struct-struct-mq3-server-oob-connect-runtime-struct-runtime-src-mq3-server-oob-connect-ml-1047711033"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for server.oob_connect, containing `time`, `challenges`, `clients`, `config`, `randFn`, `lanFn`, and 9 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L110)

## Members

<a id="field-field-mq3-server-oob-connect-runtime-authorizeaddress-authorizeaddress-src-mq3-server-oob-connect-ml-2071702491"></a>
### authorizeAddress

```ml
authorizeAddress
```

Network address of the external client-authorization server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L140)

<a id="field-field-mq3-server-oob-connect-runtime-authorizefn-authorizefn-src-mq3-server-oob-connect-ml-1044147721"></a>
### authorizeFn

```ml
authorizeFn
```

Host callback that performs the host-side client authorization exchange.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L129)

<a id="field-field-mq3-server-oob-connect-runtime-challenges-challenges-src-mq3-server-oob-connect-ml-1066553665"></a>
### challenges

```ml
challenges
```

Pending connection challenges used to validate connecting client addresses.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L115)

<a id="field-field-mq3-server-oob-connect-runtime-clients-clients-src-mq3-server-oob-connect-ml-1920743669"></a>
### clients

```ml
clients
```

Connection slots searched for reconnecting clients and available admission capacity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L117)

<a id="field-field-mq3-server-oob-connect-runtime-config-config-src-mq3-server-oob-connect-ml-1901119345"></a>
### config

```ml
config
```

Configuration object supplying the settings used by this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L119)

<a id="field-field-mq3-server-oob-connect-runtime-context-context-src-mq3-server-oob-connect-ml-1055606681"></a>
### context

```ml
context
```

Caller-supplied data associated with connection challenges, authorization, and connection admission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L138)

<a id="field-field-mq3-server-oob-connect-runtime-diagnosticfn-diagnosticfn-src-mq3-server-oob-connect-ml-1137351319"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback that reports subsystem diagnostics to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L142)

<a id="field-field-mq3-server-oob-connect-runtime-dropfn-dropfn-src-mq3-server-oob-connect-ml-958210943"></a>
### dropFn

```ml
dropFn
```

Host callback that disconnects a client and reports the supplied reason.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L133)

<a id="field-field-mq3-server-oob-connect-runtime-gameconnectfn-gameconnectfn-src-mq3-server-oob-connect-ml-213152185"></a>
### gameConnectFn

```ml
gameConnectFn
```

Host callback that asks the game VM to accept or reject a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L131)

<a id="field-field-mq3-server-oob-connect-runtime-heartbeatfn-heartbeatfn-src-mq3-server-oob-connect-ml-1150304017"></a>
### heartbeatFn

```ml
heartbeatFn
```

Host callback that sends a server heartbeat to the configured master.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L135)

<a id="field-field-mq3-server-oob-connect-runtime-lanfn-lanfn-src-mq3-server-oob-connect-ml-1711252337"></a>
### lanFn

```ml
lanFn
```

Host callback that classifies a network address for LAN connection policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L123)

<a id="field-field-mq3-server-oob-connect-runtime-localfn-localfn-src-mq3-server-oob-connect-ml-807993005"></a>
### localFn

```ml
localFn
```

Host callback that classifies a connection address as local or remote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L125)

<a id="field-field-mq3-server-oob-connect-runtime-randfn-randfn-src-mq3-server-oob-connect-ml-2023716931"></a>
### randFn

```ml
randFn
```

Host callback that supplies random values used for connection challenges.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L121)

<a id="field-field-mq3-server-oob-connect-runtime-sendfn-sendfn-src-mq3-server-oob-connect-ml-1113560081"></a>
### sendFn

```ml
sendFn
```

Host callback that transmits the supplied message through the host network interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L127)

<a id="field-field-mq3-server-oob-connect-runtime-time-time-src-mq3-server-oob-connect-ml-1313918463"></a>
### time

```ml
time
```

Server clock used for challenge expiration, authorization waits, and connection admission, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L113)
