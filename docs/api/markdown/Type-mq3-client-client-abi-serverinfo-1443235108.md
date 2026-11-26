# `mq3.client.client_abi.ServerInfo`

[Home](README.md) · [Source file](File-src-mq3-client-client-abi-ml-362324391.md)

<a id="struct-struct-mq3-client-client-abi-serverinfo-struct-serverinfo-src-mq3-client-client-abi-ml-470925263"></a>
## ServerInfo

```ml
struct ServerInfo
```

Stores client ABI server info record, including `adr`, `hostName`, `mapName`, `game`, `netType`, `gameType` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L200)

## Members

<a id="field-field-mq3-client-client-abi-serverinfo-adr-adr-src-mq3-client-client-abi-ml-535135598"></a>
### adr

```ml
adr
```

Compatibility member corresponding to native `serverInfo_t.adr`; the original declaration is `netadr_t adr`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L203)

<a id="field-field-mq3-client-client-abi-serverinfo-clients-clients-src-mq3-client-client-abi-ml-951767814"></a>
### clients

```ml
clients
```

Reported connected-client count stored in the server-browser ABI record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L219)

<a id="field-field-mq3-client-client-abi-serverinfo-game-game-src-mq3-client-client-abi-ml-524670330"></a>
### game

```ml
game
```

Compatibility member corresponding to native `serverInfo_t.game`; the original declaration is `char game[MAX_NAME_LENGTH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L211)

<a id="field-field-mq3-client-client-abi-serverinfo-gametype-gametype-src-mq3-client-client-abi-ml-2064314698"></a>
### gameType

```ml
gameType
```

Compatibility member corresponding to native `serverInfo_t.gameType`; the original declaration is `int gameType`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L217)

<a id="field-field-mq3-client-client-abi-serverinfo-hostname-hostname-src-mq3-client-client-abi-ml-120280560"></a>
### hostName

```ml
hostName
```

Compatibility member corresponding to native `serverInfo_t.hostName`; the original declaration is `char hostName[MAX_NAME_LENGTH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L206)

<a id="field-field-mq3-client-client-abi-serverinfo-mapname-mapname-src-mq3-client-client-abi-ml-1373573986"></a>
### mapName

```ml
mapName
```

Advertised map name stored in the native server-browser compatibility entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L208)

<a id="field-field-mq3-client-client-abi-serverinfo-maxclients-maxclients-src-mq3-client-client-abi-ml-2113803546"></a>
### maxClients

```ml
maxClients
```

Maximum player slots advertised or supported by the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L221)

<a id="field-field-mq3-client-client-abi-serverinfo-maxping-maxping-src-mq3-client-client-abi-ml-1646632794"></a>
### maxPing

```ml
maxPing
```

Maximum acceptable server-browser latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L226)

<a id="field-field-mq3-client-client-abi-serverinfo-minping-minping-src-mq3-client-client-abi-ml-1845522270"></a>
### minPing

```ml
minPing
```

Compatibility member corresponding to native `serverInfo_t.minPing`; the original declaration is `int minPing`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L224)

<a id="field-field-mq3-client-client-abi-serverinfo-nettype-nettype-src-mq3-client-client-abi-ml-785179478"></a>
### netType

```ml
netType
```

Compatibility member corresponding to native `serverInfo_t.netType`; the original declaration is `int netType`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L214)

<a id="field-field-mq3-client-client-abi-serverinfo-ping-ping-src-mq3-client-client-abi-ml-964132054"></a>
### ping

```ml
ping
```

Server-query latency in milliseconds retained in the server-browser ABI record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L228)

<a id="field-field-mq3-client-client-abi-serverinfo-punkbuster-punkbuster-src-mq3-client-client-abi-ml-851026724"></a>
### punkbuster

```ml
punkbuster
```

Legacy server anti-cheat status advertised to the native server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L232)

<a id="field-field-mq3-client-client-abi-serverinfo-visible-visible-src-mq3-client-client-abi-ml-988959450"></a>
### visible

```ml
visible
```

True when the record is eligible for the current drawing or browser-display pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L230)
