# `mq3.client.ui_gameinfo_missionpack.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-gameinfo-missionpack-ml-695041638.md)

<a id="struct-struct-mq3-client-ui-gameinfo-missionpack-state-struct-state-src-mq3-client-ui-gameinfo-missionpack-ml-1951235607"></a>
## State

```ml
struct State
```

Stores UI gameinfo missionpack state, including `data`, `arenaInfos`, `botInfos`, `maps`, `gameTypeCounts`, `diagnostics` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L76)

## Members

<a id="field-field-mq3-client-ui-gameinfo-missionpack-state-actions-actions-src-mq3-client-ui-gameinfo-missionpack-ml-1788585304"></a>
### actions

```ml
actions
```

Host requests queued while loading Missionpack arena and bot definitions, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L97)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-state-arenainfos-arenainfos-src-mq3-client-ui-gameinfo-missionpack-ml-1464759244"></a>
### arenaInfos

```ml
arenaInfos
```

When constructing this record, `create` supplies an empty list for this member. Used by `sync` and `UI_LoadArenas` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L82)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-state-botinfos-botinfos-src-mq3-client-ui-gameinfo-missionpack-ml-1597241920"></a>
### botInfos

```ml
botInfos
```

When constructing this record, `create` supplies an empty list for this member. Used by `sync` and `UI_LoadBots` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-state-data-data-src-mq3-client-ui-gameinfo-missionpack-ml-2062568428"></a>
### data

```ml
data
```

When constructing this record, `create` supplies `base.create()` for this member. Used by `sync` and `UI_ParseInfos` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L79)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-state-diagnostics-diagnostics-src-mq3-client-ui-gameinfo-missionpack-ml-248376860"></a>
### diagnostics

```ml
diagnostics
```

When constructing this record, `create` supplies an empty list for this member. Used by `sync` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L94)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-state-gametypecounts-gametypecounts-src-mq3-client-ui-gameinfo-missionpack-ml-541225676"></a>
### gameTypeCounts

```ml
gameTypeCounts
```

When constructing this record, `create` supplies `array(GT_MAX_GAME_TYPE,0)` for this member. Used by `UI_LoadArenas` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L91)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-state-maps-maps-src-mq3-client-ui-gameinfo-missionpack-ml-2058397606"></a>
### maps

```ml
maps
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_LoadArenas` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L88)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-state-retailactive-retailactive-src-mq3-client-ui-gameinfo-missionpack-ml-773972154"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns Missionpack arena and bot metadata, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L100)
