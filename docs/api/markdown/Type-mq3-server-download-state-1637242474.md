# `mq3.server.download.State`

[Home](README.md) · [Source file](File-src-mq3-server-download-ml-1708412053.md)

<a id="struct-struct-mq3-server-download-state-struct-state-src-mq3-server-download-ml-1987225731"></a>
## State

```ml
struct State
```

State record for server.download, containing `name`, `handle`, `size`, `count`, `clientBlock`, `currentBlock`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L20)

## Members

<a id="field-field-mq3-server-download-state-blocks-blocks-src-mq3-server-download-ml-1909757674"></a>
### blocks

```ml
blocks
```

Data blocks retained in the sliding download window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L36)

<a id="field-field-mq3-server-download-state-blocksizes-blocksizes-src-mq3-server-download-ml-1454362852"></a>
### blockSizes

```ml
blockSizes
```

Valid byte counts for the buffered download blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L38)

<a id="field-field-mq3-server-download-state-clientblock-clientblock-src-mq3-server-download-ml-1058864346"></a>
### clientBlock

```ml
clientBlock
```

Oldest download block not yet acknowledged by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L30)

<a id="field-field-mq3-server-download-state-count-count-src-mq3-server-download-ml-1667882494"></a>
### count

```ml
count
```

File bytes already read into the download window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L28)

<a id="field-field-mq3-server-download-state-currentblock-currentblock-src-mq3-server-download-ml-1466903194"></a>
### currentBlock

```ml
currentBlock
```

Next block number to fill with file data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L32)

<a id="field-field-mq3-server-download-state-eof-eof-src-mq3-server-download-ml-1742837690"></a>
### eof

```ml
eof
```

True after the end-of-file block has been queued.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L40)

<a id="field-field-mq3-server-download-state-handle-handle-src-mq3-server-download-ml-133389994"></a>
### handle

```ml
handle
```

Open host file handle for the current client download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L24)

<a id="field-field-mq3-server-download-state-name-name-src-mq3-server-download-ml-1775410712"></a>
### name

```ml
name
```

Asset path of the file currently being downloaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L22)

<a id="field-field-mq3-server-download-state-rate-rate-src-mq3-server-download-ml-1017886426"></a>
### rate

```ml
rate
```

Maximum client download and snapshot transfer rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L44)

<a id="field-field-mq3-server-download-state-sendtime-sendtime-src-mq3-server-download-ml-652500040"></a>
### sendTime

```ml
sendTime
```

Server timestamp of the last block transmission, used for retry timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L42)

<a id="field-field-mq3-server-download-state-size-size-src-mq3-server-download-ml-705824136"></a>
### size

```ml
size
```

Total byte length of the file being downloaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L26)

<a id="field-field-mq3-server-download-state-snapshotmsec-snapshotmsec-src-mq3-server-download-ml-2090879910"></a>
### snapshotMsec

```ml
snapshotMsec
```

Requested interval between snapshots, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L46)

<a id="field-field-mq3-server-download-state-xmitblock-xmitblock-src-mq3-server-download-ml-216723554"></a>
### xmitBlock

```ml
xmitBlock
```

Next buffered block number selected for transmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L34)
