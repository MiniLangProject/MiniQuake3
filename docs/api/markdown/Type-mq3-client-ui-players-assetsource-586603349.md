# `mq3.client.ui_players.AssetSource`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-ml-675454436.md)

<a id="struct-struct-mq3-client-ui-players-assetsource-struct-assetsource-src-mq3-client-ui-players-ml-1369259637"></a>
## AssetSource

```ml
struct AssetSource
```

Stores UI players asset source record, including `files`, `animationFiles`, `actions`, `retailActive`, `diagnostics`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L153)

## Members

<a id="field-field-mq3-client-ui-players-assetsource-actions-actions-src-mq3-client-ui-players-ml-300651754"></a>
### actions

```ml
actions
```

Host requests queued while loading model parts and drawing the animated base-game player preview, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L160)

<a id="field-field-mq3-client-ui-players-assetsource-animationfiles-animationfiles-src-mq3-client-ui-players-ml-1798873456"></a>
### animationFiles

```ml
animationFiles
```

When constructing this record, `assetSource` supplies `animationFiles` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L157)

<a id="field-field-mq3-client-ui-players-assetsource-diagnostics-diagnostics-src-mq3-client-ui-players-ml-1805498710"></a>
### diagnostics

```ml
diagnostics
```

When constructing this record, `assetSource` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L165)

<a id="field-field-mq3-client-ui-players-assetsource-files-files-src-mq3-client-ui-players-ml-86811450"></a>
### files

```ml
files
```

When constructing this record, `assetSource` supplies `files` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L155)

<a id="field-field-mq3-client-ui-players-assetsource-retailactive-retailactive-src-mq3-client-ui-players-ml-1838489668"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the base-game menu player preview, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L163)
