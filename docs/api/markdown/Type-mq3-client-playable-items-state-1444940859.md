# `mq3.client.playable_items.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-items-ml-142579930.md)

<a id="struct-struct-mq3-client-playable-items-state-struct-state-src-mq3-client-playable-items-ml-1153774017"></a>
## State

```ml
struct State
```

Stores playable items state, including `items`, `stats`, `pickupRadius`, `lastTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L58)

## Members

<a id="field-field-mq3-client-playable-items-state-items-items-src-mq3-client-playable-items-ml-1780658518"></a>
### items

```ml
items
```

When constructing this record, `fromEntities` supplies `items` for this member. Used by `take` and `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L61)

<a id="field-field-mq3-client-playable-items-state-lasttime-lasttime-src-mq3-client-playable-items-ml-1054606772"></a>
### lastTime

```ml
lastTime
```

When constructing this record, `fromEntities` supplies `0` for this member. Used by `update` and `updateInventory` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L70)

<a id="field-field-mq3-client-playable-items-state-pickupradius-pickupradius-src-mq3-client-playable-items-ml-1522238518"></a>
### pickupRadius

```ml
pickupRadius
```

When constructing this record, `fromEntities` supplies `pickupRadius` for this member. Used by `update` and `updateInventory` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L67)

<a id="field-field-mq3-client-playable-items-state-stats-stats-src-mq3-client-playable-items-ml-233022662"></a>
### stats

```ml
stats
```

When constructing this record, `fromEntities` supplies `Stats(100,0,50,"weapon_machinegun")` for this member. Used by `setStats` and `take` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L64)
