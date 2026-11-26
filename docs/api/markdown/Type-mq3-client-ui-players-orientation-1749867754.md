# `mq3.client.ui_players.Orientation`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-ml-675454436.md)

<a id="struct-struct-mq3-client-ui-players-orientation-struct-orientation-src-mq3-client-ui-players-ml-1194284147"></a>
## Orientation

```ml
struct Orientation
```

Stores UI players orientation record, including `origin`, `axis`, `found`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L168)

## Members

<a id="field-field-mq3-client-ui-players-orientation-axis-axis-src-mq3-client-ui-players-ml-1336691117"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L172)

<a id="field-field-mq3-client-ui-players-orientation-found-found-src-mq3-client-ui-players-ml-581848071"></a>
### found

```ml
found
```

True when the requested model attachment tag was found and the returned transform is valid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L174)

<a id="field-field-mq3-client-ui-players-orientation-origin-origin-src-mq3-client-ui-players-ml-65665219"></a>
### origin

```ml
origin
```

Model-local origin of an attachment tag used to place one preview model part relative to another.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players.ml#L170)
