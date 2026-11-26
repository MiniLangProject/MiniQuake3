# `mq3.server.download.Server`

[Home](README.md) · [Source file](File-src-mq3-server-download-ml-1708412053.md)

<a id="struct-struct-mq3-server-download-server-struct-server-src-mq3-server-download-ml-966343647"></a>
## Server

```ml
struct Server
```

Server record for server.download, containing `time`, `allowDownload`, `pure`, `maxRate`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L56)

## Members

<a id="field-field-mq3-server-download-server-allowdownload-allowdownload-src-mq3-server-download-ml-633463182"></a>
### allowDownload

```ml
allowDownload
```

True when clients may request files from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L60)

<a id="field-field-mq3-server-download-server-maxrate-maxrate-src-mq3-server-download-ml-1834890418"></a>
### maxRate

```ml
maxRate
```

Upper bound on the client transmission rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L64)

<a id="field-field-mq3-server-download-server-pure-pure-src-mq3-server-download-ml-1168133726"></a>
### pure

```ml
pure
```

True when clients must use the server-approved package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L62)

<a id="field-field-mq3-server-download-server-time-time-src-mq3-server-download-ml-1880479420"></a>
### time

```ml
time
```

Server clock used for download acknowledgment and retransmission scheduling, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/download.ml#L58)
