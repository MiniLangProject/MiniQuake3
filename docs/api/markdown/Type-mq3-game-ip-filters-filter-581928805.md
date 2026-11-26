# `mq3.game.ip_filters.Filter`

[Home](README.md) · [Source file](File-src-mq3-game-ip-filters-ml-868936231.md)

<a id="struct-struct-mq3-game-ip-filters-filter-struct-filter-src-mq3-game-ip-filters-ml-773181879"></a>
## Filter

```ml
struct Filter
```

`Filter` record for ip filters, containing `mask` and `compare`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L11)

## Members

<a id="field-field-mq3-game-ip-filters-filter-compare-compare-src-mq3-game-ip-filters-ml-688846129"></a>
### compare

```ml
compare
```

IP address bits compared after applying the filter mask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L15)

<a id="field-field-mq3-game-ip-filters-filter-mask-mask-src-mq3-game-ip-filters-ml-636042749"></a>
### mask

```ml
mask
```

Mask selecting the collision or filter categories used by the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ip_filters.ml#L13)
