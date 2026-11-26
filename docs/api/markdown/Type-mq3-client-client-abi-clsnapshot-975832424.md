# `mq3.client.client_abi.ClSnapshot`

[Home](README.md) · [Source file](File-src-mq3-client-client-abi-ml-362324391.md)

<a id="struct-struct-mq3-client-client-abi-clsnapshot-struct-clsnapshot-src-mq3-client-client-abi-ml-1800981751"></a>
## ClSnapshot

```ml
struct ClSnapshot
```

Stores client ABI cl snapshot record, including `valid`, `snapFlags`, `serverTime`, `messageNum`, `deltaNum`, `ping` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L10)

## Members

<a id="field-field-mq3-client-client-abi-clsnapshot-areamask-areamask-src-mq3-client-client-abi-ml-1097886904"></a>
### areamask

```ml
areamask
```

Portal-area visibility bitset associated with the current snapshot or rendered view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L24)

<a id="field-field-mq3-client-client-abi-clsnapshot-cmdnum-cmdnum-src-mq3-client-client-abi-ml-156768354"></a>
### cmdNum

```ml
cmdNum
```

Next user-command sequence number expected by the server for this snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L26)

<a id="field-field-mq3-client-client-abi-clsnapshot-deltanum-deltanum-src-mq3-client-client-abi-ml-729683278"></a>
### deltaNum

```ml
deltaNum
```

Sequence number of the earlier message used as this snapshot's delta base.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L20)

<a id="field-field-mq3-client-client-abi-clsnapshot-messagenum-messagenum-src-mq3-client-client-abi-ml-91716024"></a>
### messageNum

```ml
messageNum
```

Incoming network-message sequence number associated with the snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L18)

<a id="field-field-mq3-client-client-abi-clsnapshot-numentities-numentities-src-mq3-client-client-abi-ml-824054386"></a>
### numEntities

```ml
numEntities
```

Number of entity-state entries represented by the snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L30)

<a id="field-field-mq3-client-client-abi-clsnapshot-parseentitiesnum-parseentitiesnum-src-mq3-client-client-abi-ml-1161047662"></a>
### parseEntitiesNum

```ml
parseEntitiesNum
```

Absolute position in the parsed-entity ring at which this snapshot's entities begin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L32)

<a id="field-field-mq3-client-client-abi-clsnapshot-ping-ping-src-mq3-client-client-abi-ml-1108960482"></a>
### ping

```ml
ping
```

Packet-derived latency in milliseconds stored with the client connection snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L22)

<a id="field-field-mq3-client-client-abi-clsnapshot-ps-ps-src-mq3-client-client-abi-ml-1568408956"></a>
### ps

```ml
ps
```

Complete player-state record carried by the snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L28)

<a id="field-field-mq3-client-client-abi-clsnapshot-servercommandnum-servercommandnum-src-mq3-client-client-abi-ml-6248154"></a>
### serverCommandNum

```ml
serverCommandNum
```

Server-command sequence that must be executed before presenting this snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L34)

<a id="field-field-mq3-client-client-abi-clsnapshot-servertime-servertime-src-mq3-client-client-abi-ml-2074535878"></a>
### serverTime

```ml
serverTime
```

Server simulation timestamp in milliseconds retained with the client connection snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L16)

<a id="field-field-mq3-client-client-abi-clsnapshot-snapflags-snapflags-src-mq3-client-client-abi-ml-161226282"></a>
### snapFlags

```ml
snapFlags
```

Snapshot flags describing rate delay and dropped-command conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L14)

<a id="field-field-mq3-client-client-abi-clsnapshot-valid-valid-src-mq3-client-client-abi-ml-1365466294"></a>
### valid

```ml
valid
```

True when the stored data passed the validation required by its consumer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L12)
