# `mq3.client.demo_playback.Playback`

[Home](README.md) · [Source file](File-src-mq3-client-demo-playback-ml-1167034666.md)

<a id="struct-struct-mq3-client-demo-playback-playback-struct-playback-src-mq3-client-demo-playback-ml-1838726167"></a>
## Playback

```ml
struct Playback
```

Stores demo playback playback record, including `protocol`, `mapName`, `completed`, `handle`, `archiveData`, `offset` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L25)

## Members

<a id="field-field-mq3-client-demo-playback-playback-archivedata-archivedata-src-mq3-client-demo-playback-ml-895861800"></a>
### archiveData

```ml
archiveData
```

When constructing this record, `open` supplies `archiveData` for this member. Used by `close` and `read` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L38)

<a id="field-field-mq3-client-demo-playback-playback-completed-completed-src-mq3-client-demo-playback-ml-1571141068"></a>
### completed

```ml
completed
```

When constructing this record, `open` supplies `false` for this member. Used by `close` and `advance` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L32)

<a id="field-field-mq3-client-demo-playback-playback-handle-handle-src-mq3-client-demo-playback-ml-1703652360"></a>
### handle

```ml
handle
```

When constructing this record, `open` supplies `handle` for this member. Used by `close` and `read` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L35)

<a id="field-field-mq3-client-demo-playback-playback-header-header-src-mq3-client-demo-playback-ml-1658043290"></a>
### header

```ml
header
```

When constructing this record, `open` supplies `bytes(8,0)` for this member. Used by `readPacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L44)

<a id="field-field-mq3-client-demo-playback-playback-mapname-mapname-src-mq3-client-demo-playback-ml-948360880"></a>
### mapName

```ml
mapName
```

Map name extracted from the demo's initial game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L29)

<a id="field-field-mq3-client-demo-playback-playback-msg-msg-src-mq3-client-demo-playback-ml-1564802788"></a>
### msg

```ml
msg
```

When constructing this record, `open` supplies `message.initStorage(payload,demo.MAX_MSGLEN,false)` for this member. Used by `readPacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L54)

<a id="field-field-mq3-client-demo-playback-playback-offset-offset-src-mq3-client-demo-playback-ml-1549301614"></a>
### offset

```ml
offset
```

When constructing this record, `open` supplies `0` for this member. Used by `read` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L41)

<a id="field-field-mq3-client-demo-playback-playback-payload-payload-src-mq3-client-demo-playback-ml-1440531064"></a>
### payload

```ml
payload
```

When constructing this record, `open` supplies `payload` for this member. Used by `readPacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L47)

<a id="field-field-mq3-client-demo-playback-playback-protocol-protocol-src-mq3-client-demo-playback-ml-1391258096"></a>
### protocol

```ml
protocol
```

Client protocol parser runtime that decodes recorded server messages and retains their gamestate and snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L27)

<a id="field-field-mq3-client-demo-playback-playback-transferred-transferred-src-mq3-client-demo-playback-ml-834988112"></a>
### transferred

```ml
transferred
```

When constructing this record, `open` supplies `bytes(4,0)` for this member. Used by `read` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/demo_playback.ml#L50)
