# `mq3.server.abi.ClientSnapshot`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-clientsnapshot-struct-clientsnapshot-src-mq3-server-abi-ml-635566643"></a>
## ClientSnapshot

```ml
struct ClientSnapshot
```

ClientSnapshot record for server.abi, containing `areabytes`, `areabits`, `ps`, `numEntities`, `firstEntity`, `messageSent`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L216)

## Members

<a id="field-field-mq3-server-abi-clientsnapshot-areabits-areabits-src-mq3-server-abi-ml-1392951064"></a>
### areabits

```ml
areabits
```

Bitset of map areas visible in this snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L220)

<a id="field-field-mq3-server-abi-clientsnapshot-areabytes-areabytes-src-mq3-server-abi-ml-295996554"></a>
### areabytes

```ml
areabytes
```

Number of valid bytes in the snapshot's area-visibility mask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L218)

<a id="field-field-mq3-server-abi-clientsnapshot-firstentity-firstentity-src-mq3-server-abi-ml-988783402"></a>
### firstEntity

```ml
firstEntity
```

First entity-state position for this snapshot in the shared circular snapshot buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L226)

<a id="field-field-mq3-server-abi-clientsnapshot-messageacked-messageacked-src-mq3-server-abi-ml-1950732820"></a>
### messageAcked

```ml
messageAcked
```

Server timestamp when this snapshot message was acknowledged, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L230)

<a id="field-field-mq3-server-abi-clientsnapshot-messagesent-messagesent-src-mq3-server-abi-ml-58917354"></a>
### messageSent

```ml
messageSent
```

Server timestamp when this snapshot message was transmitted, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L228)

<a id="field-field-mq3-server-abi-clientsnapshot-messagesize-messagesize-src-mq3-server-abi-ml-1100189294"></a>
### messageSize

```ml
messageSize
```

Transmitted snapshot-message size in bytes, used for rate limiting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L232)

<a id="field-field-mq3-server-abi-clientsnapshot-numentities-numentities-src-mq3-server-abi-ml-692896738"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L224)

<a id="field-field-mq3-server-abi-clientsnapshot-ps-ps-src-mq3-server-abi-ml-2014150012"></a>
### ps

```ml
ps
```

Player-state payload stored in a client snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L222)
