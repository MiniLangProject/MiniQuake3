# `mq3.server.client_lifecycle.Server`

[Home](README.md) · [Source file](File-src-mq3-server-client-lifecycle-ml-743240113.md)

<a id="struct-struct-mq3-server-client-lifecycle-server-struct-server-src-mq3-server-client-lifecycle-ml-780238503"></a>
## Server

```ml
struct Server
```

Server record for server.client_lifecycle, containing `time`, `checksumFeed`, `checksumFeedServerId`, `pure`, `configstrings`, `baselines`, and 8 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L94)

## Members

<a id="field-field-mq3-server-client-lifecycle-server-baselines-baselines-src-mq3-server-client-lifecycle-ml-952499558"></a>
### baselines

```ml
baselines
```

Baseline entity states used as initial references for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L106)

<a id="field-field-mq3-server-client-lifecycle-server-cgamechecksum-cgamechecksum-src-mq3-server-client-lifecycle-ml-1002006302"></a>
### cgameChecksum

```ml
cgameChecksum
```

Checksum expected for the client-game VM package.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L112)

<a id="field-field-mq3-server-client-lifecycle-server-cgamepakfound-cgamepakfound-src-mq3-server-client-lifecycle-ml-1082437994"></a>
### cgamePakFound

```ml
cgamePakFound
```

True when the required client-game package is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L116)

<a id="field-field-mq3-server-client-lifecycle-server-checksumfeed-checksumfeed-src-mq3-server-client-lifecycle-ml-128856252"></a>
### checksumFeed

```ml
checksumFeed
```

Server-supplied feed value used to calculate pure-package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L98)

<a id="field-field-mq3-server-client-lifecycle-server-checksumfeedserverid-checksumfeedserverid-src-mq3-server-client-lifecycle-ml-150100160"></a>
### checksumFeedServerId

```ml
checksumFeedServerId
```

Server identifier associated with the current checksum feed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L100)

<a id="field-field-mq3-server-client-lifecycle-server-clients-clients-src-mq3-server-client-lifecycle-ml-1273866850"></a>
### clients

```ml
clients
```

Client records whose entry, userinfo, and disconnection are managed by this lifecycle runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L108)

<a id="field-field-mq3-server-client-lifecycle-server-configstrings-configstrings-src-mq3-server-client-lifecycle-ml-1871965214"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by their protocol slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L104)

<a id="field-field-mq3-server-client-lifecycle-server-dedicated-dedicated-src-mq3-server-client-lifecycle-ml-446511138"></a>
### dedicated

```ml
dedicated
```

True when the server runs without a local graphical client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L120)

<a id="field-field-mq3-server-client-lifecycle-server-lanforcerate-lanforcerate-src-mq3-server-client-lifecycle-ml-1199527330"></a>
### lanForceRate

```ml
lanForceRate
```

True when LAN clients bypass the normal rate limit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L122)

<a id="field-field-mq3-server-client-lifecycle-server-loadedpurechecksums-loadedpurechecksums-src-mq3-server-client-lifecycle-ml-1658820214"></a>
### loadedPureChecksums

```ml
loadedPureChecksums
```

Package checksums accepted by the current pure server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L110)

<a id="field-field-mq3-server-client-lifecycle-server-pure-pure-src-mq3-server-client-lifecycle-ml-1766544198"></a>
### pure

```ml
pure
```

True when clients must use the server-approved package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L102)

<a id="field-field-mq3-server-client-lifecycle-server-time-time-src-mq3-server-client-lifecycle-ml-954059556"></a>
### time

```ml
time
```

Server time used when clients enter the world, update state, or disconnect, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L96)

<a id="field-field-mq3-server-client-lifecycle-server-uichecksum-uichecksum-src-mq3-server-client-lifecycle-ml-1337318052"></a>
### uiChecksum

```ml
uiChecksum
```

Checksum expected for the UI VM package.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L114)

<a id="field-field-mq3-server-client-lifecycle-server-uipakfound-uipakfound-src-mq3-server-client-lifecycle-ml-413842422"></a>
### uiPakFound

```ml
uiPakFound
```

True when the required UI package is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L118)
