# `mq3.server.abi.ServerStatic`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-serverstatic-struct-serverstatic-src-mq3-server-abi-ml-412354711"></a>
## ServerStatic

```ml
struct ServerStatic
```

ServerStatic record for server.abi, containing `initialized`, `time`, `snapFlagServerBit`, `clients`, `numSnapshotEntities`, `nextSnapshotEntities`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L364)

## Members

<a id="field-field-mq3-server-abi-serverstatic-authorizeaddress-authorizeaddress-src-mq3-server-abi-ml-1840477918"></a>
### authorizeAddress

```ml
authorizeAddress
```

Network address of the external client-authorization server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L386)

<a id="field-field-mq3-server-abi-serverstatic-challenges-challenges-src-mq3-server-abi-ml-1336334108"></a>
### challenges

```ml
challenges
```

Pending connection challenges used to validate connecting client addresses.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L382)

<a id="field-field-mq3-server-abi-serverstatic-clients-clients-src-mq3-server-abi-ml-1980828032"></a>
### clients

```ml
clients
```

Native-compatible client array referenced by the persistent server-static state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L372)

<a id="field-field-mq3-server-abi-serverstatic-initialized-initialized-src-mq3-server-abi-ml-1090370396"></a>
### initialized

```ml
initialized
```

Native server-static flag indicating that persistent server storage is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L366)

<a id="field-field-mq3-server-abi-serverstatic-nextheartbeattime-nextheartbeattime-src-mq3-server-abi-ml-489064588"></a>
### nextHeartbeatTime

```ml
nextHeartbeatTime
```

Server time at which the next master heartbeat should be sent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L380)

<a id="field-field-mq3-server-abi-serverstatic-nextsnapshotentities-nextsnapshotentities-src-mq3-server-abi-ml-1385942228"></a>
### nextSnapshotEntities

```ml
nextSnapshotEntities
```

Next absolute insertion position in the circular snapshot-entity buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L376)

<a id="field-field-mq3-server-abi-serverstatic-numsnapshotentities-numsnapshotentities-src-mq3-server-abi-ml-1739660260"></a>
### numSnapshotEntities

```ml
numSnapshotEntities
```

Number of entity-state slots reserved in the snapshot ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L374)

<a id="field-field-mq3-server-abi-serverstatic-redirectaddress-redirectaddress-src-mq3-server-abi-ml-387419812"></a>
### redirectAddress

```ml
redirectAddress
```

For rcon return messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L384)

<a id="field-field-mq3-server-abi-serverstatic-snapflagserverbit-snapflagserverbit-src-mq3-server-abi-ml-891027832"></a>
### snapFlagServerBit

```ml
snapFlagServerBit
```

Snapshot server-count bit toggled when a new server level is spawned.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L370)

<a id="field-field-mq3-server-abi-serverstatic-snapshotentities-snapshotentities-src-mq3-server-abi-ml-252774942"></a>
### snapshotEntities

```ml
snapshotEntities
```

Entity states retained in the server snapshot ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L378)

<a id="field-field-mq3-server-abi-serverstatic-time-time-src-mq3-server-abi-ml-590351986"></a>
### time

```ml
time
```

Persistent server clock represented in the native server-static ABI, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L368)
