# `mq3.game.ip_filters.State`

[Home](README.md) · [Source file](File-src-mq3-game-ip-filters-ml-868936231.md)

<a id="struct-struct-mq3-game-ip-filters-state-struct-state-src-mq3-game-ip-filters-ml-773664343"></a>
## State

```ml
struct State
```

`State` record for ip filters, containing `filters`, `count`, `banBuffer`, `banVm` and `filterBanVm` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L18)

## Members

<a id="field-field-mq3-game-ip-filters-state-banbuffer-banbuffer-src-mq3-game-ip-filters-ml-1939689178"></a>
### banBuffer

```ml
banBuffer
```

Text buffer containing the serialized IP filter list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L24)

<a id="field-field-mq3-game-ip-filters-state-banvm-banvm-src-mq3-game-ip-filters-ml-789458706"></a>
### banVm

```ml
banVm
```

VM cvar record containing the serialized IP filter list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L26)

<a id="field-field-mq3-game-ip-filters-state-buffercopygeneration-buffercopygeneration-src-mq3-game-ip-filters-ml-693221388"></a>
### bufferCopyGeneration

```ml
bufferCopyGeneration
```

Copy-generation value last observed in the bound VM console variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L36)

<a id="field-field-mq3-game-ip-filters-state-bufferversion-bufferversion-src-mq3-game-ip-filters-ml-232205862"></a>
### bufferVersion

```ml
bufferVersion
```

Revision of the serialized IP filter buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L32)

<a id="field-field-mq3-game-ip-filters-state-buffervisible-buffervisible-src-mq3-game-ip-filters-ml-1153109746"></a>
### bufferVisible

```ml
bufferVisible
```

Serialized filter-list string last observed in the bound VM console variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L34)

<a id="field-field-mq3-game-ip-filters-state-buffervm-buffervm-src-mq3-game-ip-filters-ml-1495363600"></a>
### bufferVm

```ml
bufferVm
```

VM cvar record associated with the exposed filter-list buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L30)

<a id="field-field-mq3-game-ip-filters-state-count-count-src-mq3-game-ip-filters-ml-1694357722"></a>
### count

```ml
count
```

Number of active IP address filter entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L22)

<a id="field-field-mq3-game-ip-filters-state-filterbanvm-filterbanvm-src-mq3-game-ip-filters-ml-471220046"></a>
### filterBanVm

```ml
filterBanVm
```

VM cvar record selecting blacklist or whitelist interpretation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L28)

<a id="field-field-mq3-game-ip-filters-state-filters-filters-src-mq3-game-ip-filters-ml-1105689798"></a>
### filters

```ml
filters
```

Configured IP address filter records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L20)
