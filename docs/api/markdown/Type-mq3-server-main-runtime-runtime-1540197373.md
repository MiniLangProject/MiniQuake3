# `mq3.server.main_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-main-runtime-ml-68872411.md)

<a id="struct-struct-mq3-server-main-runtime-runtime-struct-runtime-src-mq3-server-main-runtime-ml-4280893"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for server.main_runtime, containing `time`, `nextHeartbeatTime`, `dedicated`, `masters`, `clients`, `maxClients`, and 16 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L85)

## Members

<a id="field-field-mq3-server-main-runtime-runtime-clients-clients-src-mq3-server-main-runtime-ml-737408177"></a>
### clients

```ml
clients
```

Client records shared by server status, connection, and console services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L95)

<a id="field-field-mq3-server-main-runtime-runtime-dedicated-dedicated-src-mq3-server-main-runtime-ml-162267969"></a>
### dedicated

```ml
dedicated
```

True when the server runs without a local graphical client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L91)

<a id="field-field-mq3-server-main-runtime-runtime-game-game-src-mq3-server-main-runtime-ml-1232193765"></a>
### game

```ml
game
```

Game name advertised in master-server heartbeats.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L123)

<a id="field-field-mq3-server-main-runtime-runtime-gametype-gametype-src-mq3-server-main-runtime-ml-206119381"></a>
### gametype

```ml
gametype
```

Game-mode identifier used when applying mode-specific rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L101)

<a id="field-field-mq3-server-main-runtime-runtime-gametypevalue-gametypevalue-src-mq3-server-main-runtime-ml-1335301729"></a>
### gametypeValue

```ml
gametypeValue
```

Game-mode value advertised in server information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L115)

<a id="field-field-mq3-server-main-runtime-runtime-hostname-hostname-src-mq3-server-main-runtime-ml-672864967"></a>
### hostname

```ml
hostname
```

Server display name advertised to clients and directory services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L109)

<a id="field-field-mq3-server-main-runtime-runtime-lastrcontime-lastrcontime-src-mq3-server-main-runtime-ml-993546799"></a>
### lastRconTime

```ml
lastRconTime
```

Timestamp of the most recently accepted remote-console request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L125)

<a id="field-field-mq3-server-main-runtime-runtime-mapname-mapname-src-mq3-server-main-runtime-ml-1884887245"></a>
### mapname

```ml
mapname
```

Name of the current game map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L111)

<a id="field-field-mq3-server-main-runtime-runtime-masters-masters-src-mq3-server-main-runtime-ml-838461485"></a>
### masters

```ml
masters
```

Master-server endpoints receiving heartbeat and shutdown notifications.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L93)

<a id="field-field-mq3-server-main-runtime-runtime-maxclients-maxclients-src-mq3-server-main-runtime-ml-68596477"></a>
### maxClients

```ml
maxClients
```

Configured connection capacity used by server status and admission services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L97)

<a id="field-field-mq3-server-main-runtime-runtime-maxping-maxping-src-mq3-server-main-runtime-ml-622368901"></a>
### maxPing

```ml
maxPing
```

Maximum client latency accepted by the connection policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L121)

<a id="field-field-mq3-server-main-runtime-runtime-minping-minping-src-mq3-server-main-runtime-ml-1709645385"></a>
### minPing

```ml
minPing
```

Minimum client latency accepted by the connection policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L119)

<a id="field-field-mq3-server-main-runtime-runtime-nextheartbeattime-nextheartbeattime-src-mq3-server-main-runtime-ml-928003917"></a>
### nextHeartbeatTime

```ml
nextHeartbeatTime
```

Server time at which the next master heartbeat should be sent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L89)

<a id="field-field-mq3-server-main-runtime-runtime-privateclients-privateclients-src-mq3-server-main-runtime-ml-1685526951"></a>
### privateClients

```ml
privateClients
```

Number of client slots reserved for clients with the private password.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L99)

<a id="field-field-mq3-server-main-runtime-runtime-protocol-protocol-src-mq3-server-main-runtime-ml-410613837"></a>
### protocol

```ml
protocol
```

Network protocol version advertised in discovery responses.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L113)

<a id="field-field-mq3-server-main-runtime-runtime-pure-pure-src-mq3-server-main-runtime-ml-337229349"></a>
### pure

```ml
pure
```

True when clients must use the server-approved package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L117)

<a id="field-field-mq3-server-main-runtime-runtime-rconpassword-rconpassword-src-mq3-server-main-runtime-ml-436337463"></a>
### rconPassword

```ml
rconPassword
```

Password required to accept a remote-console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L127)

<a id="field-field-mq3-server-main-runtime-runtime-redirectaddress-redirectaddress-src-mq3-server-main-runtime-ml-2108663285"></a>
### redirectAddress

```ml
redirectAddress
```

For rcon return messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L129)

<a id="field-field-mq3-server-main-runtime-runtime-restricted-restricted-src-mq3-server-main-runtime-ml-255860611"></a>
### restricted

```ml
restricted
```

True when discovery or client access is restricted by server policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L105)

<a id="field-field-mq3-server-main-runtime-runtime-serverinfo-serverinfo-src-mq3-server-main-runtime-ml-996461647"></a>
### serverInfo

```ml
serverInfo
```

Backslash-delimited information string advertised by the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L107)

<a id="field-field-mq3-server-main-runtime-runtime-time-time-src-mq3-server-main-runtime-ml-723133451"></a>
### time

```ml
time
```

Server clock shared by connectionless requests and connection runtime services, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L87)

<a id="field-field-mq3-server-main-runtime-runtime-uisingleplayeractive-uisingleplayeractive-src-mq3-server-main-runtime-ml-17851191"></a>
### uiSinglePlayerActive

```ml
uiSinglePlayerActive
```

True when the local UI is running a single-player session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L103)
