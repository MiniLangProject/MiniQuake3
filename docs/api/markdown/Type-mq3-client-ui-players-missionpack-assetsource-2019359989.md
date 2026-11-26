# `mq3.client.ui_players_missionpack.AssetSource`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-missionpack-ml-1990652480.md)

<a id="struct-struct-mq3-client-ui-players-missionpack-assetsource-struct-assetsource-src-mq3-client-ui-players-missionpack-ml-1736616557"></a>
## AssetSource

```ml
struct AssetSource
```

Stores UI players missionpack asset source record, including `files`, `animationFiles`, `actions`, `retailActive`, `diagnostics`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L154)

## Members

<a id="field-field-mq3-client-ui-players-missionpack-assetsource-actions-actions-src-mq3-client-ui-players-missionpack-ml-997774054"></a>
### actions

```ml
actions
```

Host requests queued while loading team-aware model parts and drawing the Missionpack player preview, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L161)

<a id="field-field-mq3-client-ui-players-missionpack-assetsource-animationfiles-animationfiles-src-mq3-client-ui-players-missionpack-ml-1647631520"></a>
### animationFiles

```ml
animationFiles
```

When constructing this record, `assetSource` supplies `animationFiles` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L158)

<a id="field-field-mq3-client-ui-players-missionpack-assetsource-diagnostics-diagnostics-src-mq3-client-ui-players-missionpack-ml-1628006290"></a>
### diagnostics

```ml
diagnostics
```

When constructing this record, `assetSource` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L166)

<a id="field-field-mq3-client-ui-players-missionpack-assetsource-files-files-src-mq3-client-ui-players-missionpack-ml-2044773974"></a>
### files

```ml
files
```

When constructing this record, `assetSource` supplies `files` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L156)

<a id="field-field-mq3-client-ui-players-missionpack-assetsource-retailactive-retailactive-src-mq3-client-ui-players-missionpack-ml-688320260"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the Missionpack menu player preview, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players_missionpack.ml#L164)
