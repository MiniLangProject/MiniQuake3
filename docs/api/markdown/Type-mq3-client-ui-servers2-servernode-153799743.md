# `mq3.client.ui_servers2.ServerNode`

[Home](README.md) · [Source file](File-src-mq3-client-ui-servers2-ml-1909498126.md)

<a id="struct-struct-mq3-client-ui-servers2-servernode-struct-servernode-src-mq3-client-ui-servers2-ml-1458886203"></a>
## ServerNode

```ml
struct ServerNode
```

Stores UI servers2 server node record, including `address`, `hostname`, `mapName`, `numClients`, `maxClients`, `pingTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L129)

## Members

<a id="field-field-mq3-client-ui-servers2-servernode-address-address-src-mq3-client-ui-servers2-ml-1949174578"></a>
### address

```ml
address
```

When constructing this record, `node` supplies `address` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L131)

<a id="field-field-mq3-client-ui-servers2-servernode-gamename-gamename-src-mq3-client-ui-servers2-ml-1510786828"></a>
### gameName

```ml
gameName
```

When constructing this record, `node` supplies `gameName` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L145)

<a id="field-field-mq3-client-ui-servers2-servernode-gametype-gametype-src-mq3-client-ui-servers2-ml-1718163926"></a>
### gameType

```ml
gameType
```

When constructing this record, `node` supplies `gameType` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L143)

<a id="field-field-mq3-client-ui-servers2-servernode-hostname-hostname-src-mq3-client-ui-servers2-ml-1184892056"></a>
### hostname

```ml
hostname
```

When constructing this record, `node` supplies `hostname` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L133)

<a id="field-field-mq3-client-ui-servers2-servernode-mapname-mapname-src-mq3-client-ui-servers2-ml-2117317646"></a>
### mapName

```ml
mapName
```

Advertised map name used to format, sort, and preview this server-browser entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L135)

<a id="field-field-mq3-client-ui-servers2-servernode-maxclients-maxclients-src-mq3-client-ui-servers2-ml-1283478510"></a>
### maxClients

```ml
maxClients
```

Maximum player slots advertised or supported by the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L139)

<a id="field-field-mq3-client-ui-servers2-servernode-maxping-maxping-src-mq3-client-ui-servers2-ml-1423849494"></a>
### maxPing

```ml
maxPing
```

Maximum acceptable server-browser latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L151)

<a id="field-field-mq3-client-ui-servers2-servernode-minping-minping-src-mq3-client-ui-servers2-ml-1448077490"></a>
### minPing

```ml
minPing
```

When constructing this record, `node` supplies `minPing` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L149)

<a id="field-field-mq3-client-ui-servers2-servernode-nettype-nettype-src-mq3-client-ui-servers2-ml-279428658"></a>
### netType

```ml
netType
```

When constructing this record, `node` supplies `netType` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L147)

<a id="field-field-mq3-client-ui-servers2-servernode-numclients-numclients-src-mq3-client-ui-servers2-ml-1075789462"></a>
### numClients

```ml
numClients
```

Number of valid client entries represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L137)

<a id="field-field-mq3-client-ui-servers2-servernode-pingtime-pingtime-src-mq3-client-ui-servers2-ml-2126871712"></a>
### pingTime

```ml
pingTime
```

When constructing this record, `node` supplies `pingTime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L141)

<a id="field-field-mq3-client-ui-servers2-servernode-punkbuster-punkbuster-src-mq3-client-ui-servers2-ml-582826580"></a>
### punkbuster

```ml
punkbuster
```

Legacy server anti-cheat status advertised to the native server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L153)
