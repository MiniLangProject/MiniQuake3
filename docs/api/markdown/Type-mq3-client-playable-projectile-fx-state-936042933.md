# `mq3.client.playable_projectile_fx.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-fx-ml-1498990564.md)

<a id="struct-struct-mq3-client-playable-projectile-fx-state-struct-state-src-mq3-client-playable-projectile-fx-ml-1142738469"></a>
## State

```ml
struct State
```

Stores playable projectile fx state, including `puffs`, `trackers`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L92)

## Members

<a id="field-field-mq3-client-playable-projectile-fx-state-puffs-puffs-src-mq3-client-playable-projectile-fx-ml-1091501422"></a>
### puffs

```ml
puffs
```

When constructing this record, `create` supplies an empty list for this member. Used by `addPuff` and `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L95)

<a id="field-field-mq3-client-playable-projectile-fx-state-trackers-trackers-src-mq3-client-playable-projectile-fx-ml-1858769180"></a>
### trackers

```ml
trackers
```

When constructing this record, `create` supplies an empty list for this member. Used by `trackerIndex` and `sampleFlight` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L98)
