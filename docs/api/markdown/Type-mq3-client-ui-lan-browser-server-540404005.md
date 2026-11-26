# `mq3.client.ui_lan_browser.Server`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)

<a id="struct-struct-mq3-client-ui-lan-browser-server-struct-server-src-mq3-client-ui-lan-browser-ml-821663501"></a>
## Server

```ml
struct Server
```

Stores UI LAN browser server record, including `address`, `hostName`, `mapName`, `clients`, `maxClients`, `ping` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L33)

## Members

<a id="field-field-mq3-client-ui-lan-browser-server-address-address-src-mq3-client-ui-lan-browser-ml-1818878548"></a>
### address

```ml
address
```

When constructing this record, `server` supplies `address` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L35)

<a id="field-field-mq3-client-ui-lan-browser-server-clients-clients-src-mq3-client-ui-lan-browser-ml-1087101172"></a>
### clients

```ml
clients
```

Number of connected clients reported by this LAN or master-list server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L41)

<a id="field-field-mq3-client-ui-lan-browser-server-game-game-src-mq3-client-ui-lan-browser-ml-205113488"></a>
### game

```ml
game
```

When constructing this record, `server` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L51)

<a id="field-field-mq3-client-ui-lan-browser-server-gametype-gametype-src-mq3-client-ui-lan-browser-ml-433372096"></a>
### gameType

```ml
gameType
```

When constructing this record, `server` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L53)

<a id="field-field-mq3-client-ui-lan-browser-server-hostname-hostname-src-mq3-client-ui-lan-browser-ml-105883094"></a>
### hostName

```ml
hostName
```

When constructing this record, `server` supplies `name` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L37)

<a id="field-field-mq3-client-ui-lan-browser-server-mapname-mapname-src-mq3-client-ui-lan-browser-ml-1986022456"></a>
### mapName

```ml
mapName
```

Advertised level name displayed in this LAN-browser server row.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L39)

<a id="field-field-mq3-client-ui-lan-browser-server-maxclients-maxclients-src-mq3-client-ui-lan-browser-ml-137740456"></a>
### maxClients

```ml
maxClients
```

Maximum player slots advertised or supported by the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L43)

<a id="field-field-mq3-client-ui-lan-browser-server-maxping-maxping-src-mq3-client-ui-lan-browser-ml-1441275504"></a>
### maxPing

```ml
maxPing
```

Maximum acceptable server-browser latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L49)

<a id="field-field-mq3-client-ui-lan-browser-server-minping-minping-src-mq3-client-ui-lan-browser-ml-711183724"></a>
### minPing

```ml
minPing
```

When constructing this record, `server` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L47)

<a id="field-field-mq3-client-ui-lan-browser-server-nettype-nettype-src-mq3-client-ui-lan-browser-ml-1450275020"></a>
### netType

```ml
netType
```

When constructing this record, `server` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L55)

<a id="field-field-mq3-client-ui-lan-browser-server-ping-ping-src-mq3-client-ui-lan-browser-ml-371094640"></a>
### ping

```ml
ping
```

Measured server-query latency in milliseconds; reset to -1 when a fresh ping is required.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L45)

<a id="field-field-mq3-client-ui-lan-browser-server-punkbuster-punkbuster-src-mq3-client-ui-lan-browser-ml-794480458"></a>
### punkbuster

```ml
punkbuster
```

Legacy server anti-cheat status advertised to the native server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L57)

<a id="field-field-mq3-client-ui-lan-browser-server-status-status-src-mq3-client-ui-lan-browser-ml-284647468"></a>
### status

```ml
status
```

When constructing this record, `server` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L61)

<a id="field-field-mq3-client-ui-lan-browser-server-visible-visible-src-mq3-client-ui-lan-browser-ml-652256832"></a>
### visible

```ml
visible
```

True when the record is eligible for the current drawing or browser-display pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L59)
