# `mq3.client.ui_main_missionpack.ServerInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-missionpack-ml-2627719.md)

<a id="struct-struct-mq3-client-ui-main-missionpack-serverinfo-struct-serverinfo-src-mq3-client-ui-main-missionpack-ml-575205063"></a>
## ServerInfo

```ml
struct ServerInfo
```

Stores UI main missionpack server info record, including `address`, `hostname`, `mapname`, `clients`, `maxClients`, `gametype` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L206)

## Members

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-address-address-src-mq3-client-ui-main-missionpack-ml-1286628134"></a>
### address

```ml
address
```

When constructing this record, `serverInfo` supplies `address` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L208)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-clients-clients-src-mq3-client-ui-main-missionpack-ml-777454502"></a>
### clients

```ml
clients
```

Server player count used for empty/full filtering, sorting, and the browser player column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L214)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-favorite-favorite-src-mq3-client-ui-main-missionpack-ml-26417718"></a>
### favorite

```ml
favorite
```

When constructing this record, `serverInfo` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L229)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-gametype-gametype-src-mq3-client-ui-main-missionpack-ml-276514466"></a>
### gametype

```ml
gametype
```

Game type advertised by this browser server entry, used for filtering, sorting, and mode labels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L218)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-hostname-hostname-src-mq3-client-ui-main-missionpack-ml-2030069184"></a>
### hostname

```ml
hostname
```

When constructing this record, `serverInfo` supplies `hostname` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L210)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-mapname-mapname-src-mq3-client-ui-main-missionpack-ml-1677653986"></a>
### mapname

```ml
mapname
```

Map name parsed from server information or selected by the client UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L212)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-maxclients-maxclients-src-mq3-client-ui-main-missionpack-ml-443529938"></a>
### maxClients

```ml
maxClients
```

Maximum player slots advertised or supported by the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L216)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-nettype-nettype-src-mq3-client-ui-main-missionpack-ml-780447638"></a>
### nettype

```ml
nettype
```

When constructing this record, `serverInfo` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L223)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-ping-ping-src-mq3-client-ui-main-missionpack-ml-1918858510"></a>
### ping

```ml
ping
```

Server latency in milliseconds used for browser sorting and display; nonpositive values are excluded by the visibility filter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L221)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-punkbuster-punkbuster-src-mq3-client-ui-main-missionpack-ml-109091468"></a>
### punkbuster

```ml
punkbuster
```

Legacy server anti-cheat status advertised to the native server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L225)

<a id="field-field-mq3-client-ui-main-missionpack-serverinfo-visible-visible-src-mq3-client-ui-main-missionpack-ml-1816297050"></a>
### visible

```ml
visible
```

True when the record is eligible for the current drawing or browser-display pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L227)
