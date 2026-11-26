# `mq3.client.ui_start_server.StartState`

[Home](README.md) · [Source file](File-src-mq3-client-ui-start-server-ml-1691378486.md)

<a id="struct-struct-mq3-client-ui-start-server-startstate-struct-startstate-src-mq3-client-ui-start-server-ml-191455191"></a>
## StartState

```ml
struct StartState
```

Stores UI start server start state record, including `multiplayer`, `gametype`, `maps`, `mapBits`, `currentMap`, `page` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L65)

## Members

<a id="field-field-mq3-client-ui-start-server-startstate-actions-actions-src-mq3-client-ui-start-server-ml-400030468"></a>
### actions

```ml
actions
```

Host requests queued while choosing a map and game rules, configuring bot slots, and launching a server, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L85)

<a id="field-field-mq3-client-ui-start-server-startstate-currentmap-currentmap-src-mq3-client-ui-start-server-ml-1154746434"></a>
### currentMap

```ml
currentMap
```

When constructing this record, `startState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L76)

<a id="field-field-mq3-client-ui-start-server-startstate-displayname-displayname-src-mq3-client-ui-start-server-ml-1703150516"></a>
### displayName

```ml
displayName
```

When constructing this record, `startState` supplies `"NO MAPS FOUND"` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L82)

<a id="field-field-mq3-client-ui-start-server-startstate-gametype-gametype-src-mq3-client-ui-start-server-ml-1224049656"></a>
### gametype

```ml
gametype
```

Selected game-type menu index, translated through remapGametype before filtering maps or setting g_gameType.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L70)

<a id="field-field-mq3-client-ui-start-server-startstate-mapbits-mapbits-src-mq3-client-ui-start-server-ml-754842432"></a>
### mapBits

```ml
mapBits
```

When constructing this record, `startState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L74)

<a id="field-field-mq3-client-ui-start-server-startstate-maps-maps-src-mq3-client-ui-start-server-ml-821709114"></a>
### maps

```ml
maps
```

When constructing this record, `startState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L72)

<a id="field-field-mq3-client-ui-start-server-startstate-maxpages-maxpages-src-mq3-client-ui-start-server-ml-441880332"></a>
### maxPages

```ml
maxPages
```

When constructing this record, `startState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L80)

<a id="field-field-mq3-client-ui-start-server-startstate-multiplayer-multiplayer-src-mq3-client-ui-start-server-ml-1648623500"></a>
### multiplayer

```ml
multiplayer
```

When constructing this record, `startState` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L67)

<a id="field-field-mq3-client-ui-start-server-startstate-page-page-src-mq3-client-ui-start-server-ml-1830146718"></a>
### page

```ml
page
```

When constructing this record, `startState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_start_server.ml#L78)
