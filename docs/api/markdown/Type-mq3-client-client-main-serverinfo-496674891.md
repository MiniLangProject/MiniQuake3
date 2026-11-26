# `mq3.client.client_main.ServerInfo`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-serverinfo-struct-serverinfo-src-mq3-client-client-main-ml-282818419"></a>
## ServerInfo

```ml
struct ServerInfo
```

Stores client main server info record, including `address`, `clients`, `hostName`, `mapName`, `maxClients`, `maxPing` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L90)

## Members

<a id="field-field-mq3-client-client-main-serverinfo-address-address-src-mq3-client-client-main-ml-1821754786"></a>
### address

```ml
address
```

When constructing this record, `CL_InitServerInfo` supplies `address` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L92)

<a id="field-field-mq3-client-client-main-serverinfo-clients-clients-src-mq3-client-client-main-ml-978891482"></a>
### clients

```ml
clients
```

Connected-client count parsed from the server information response.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L94)

<a id="field-field-mq3-client-client-main-serverinfo-game-game-src-mq3-client-client-main-ml-829707414"></a>
### game

```ml
game
```

When constructing this record, `CL_InitServerInfo` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L108)

<a id="field-field-mq3-client-client-main-serverinfo-gametype-gametype-src-mq3-client-client-main-ml-583814086"></a>
### gameType

```ml
gameType
```

When constructing this record, `CL_InitServerInfo` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L110)

<a id="field-field-mq3-client-client-main-serverinfo-hostname-hostname-src-mq3-client-client-main-ml-1406242300"></a>
### hostName

```ml
hostName
```

When constructing this record, `CL_InitServerInfo` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L96)

<a id="field-field-mq3-client-client-main-serverinfo-mapname-mapname-src-mq3-client-client-main-ml-1979728222"></a>
### mapName

```ml
mapName
```

Map name parsed from the server's information response for browser display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L98)

<a id="field-field-mq3-client-client-main-serverinfo-maxclients-maxclients-src-mq3-client-client-main-ml-327706174"></a>
### maxClients

```ml
maxClients
```

Maximum player slots advertised or supported by the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L100)

<a id="field-field-mq3-client-client-main-serverinfo-maxping-maxping-src-mq3-client-client-main-ml-1570612070"></a>
### maxPing

```ml
maxPing
```

Maximum acceptable server-browser latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L102)

<a id="field-field-mq3-client-client-main-serverinfo-minping-minping-src-mq3-client-client-main-ml-2102334914"></a>
### minPing

```ml
minPing
```

When constructing this record, `CL_InitServerInfo` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L104)

<a id="field-field-mq3-client-client-main-serverinfo-nettype-nettype-src-mq3-client-client-main-ml-1277326594"></a>
### netType

```ml
netType
```

When constructing this record, `CL_InitServerInfo` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L112)

<a id="field-field-mq3-client-client-main-serverinfo-ping-ping-src-mq3-client-client-main-ml-1052570502"></a>
### ping

```ml
ping
```

Server latency in milliseconds recorded by the client server-list machinery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L106)

<a id="field-field-mq3-client-client-main-serverinfo-visible-visible-src-mq3-client-client-main-ml-2048890294"></a>
### visible

```ml
visible
```

True when the record is eligible for the current drawing or browser-display pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L114)
