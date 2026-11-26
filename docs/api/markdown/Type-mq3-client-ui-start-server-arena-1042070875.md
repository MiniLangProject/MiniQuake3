# `mq3.client.ui_start_server.Arena`

[Home](README.md) · [Source file](File-src-mq3-client-ui-start-server-ml-1691378486.md)

<a id="struct-struct-mq3-client-ui-start-server-arena-struct-arena-src-mq3-client-ui-start-server-ml-893329671"></a>
## Arena

```ml
struct Arena
```

Stores UI start server arena record, including `map`, `type`, `bots`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L49)

## Members

<a id="field-field-mq3-client-ui-start-server-arena-bots-bots-src-mq3-client-ui-start-server-ml-1043853466"></a>
### bots

```ml
bots
```

Bot names or bot-selection declaration supplied by the arena definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L55)

<a id="field-field-mq3-client-ui-start-server-arena-map-map-src-mq3-client-ui-start-server-ml-903212250"></a>
### map

```ml
map
```

Virtual map name loaded when this arena is selected for a local server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L51)

<a id="field-field-mq3-client-ui-start-server-arena-type-type-src-mq3-client-ui-start-server-ml-1972046922"></a>
### type

```ml
type
```

Arena game-type declaration used to filter maps for the selected server rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L53)
