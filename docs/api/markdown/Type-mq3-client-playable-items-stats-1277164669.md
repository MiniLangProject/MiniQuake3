# `mq3.client.playable_items.Stats`

[Home](README.md) · [Source file](File-src-mq3-client-playable-items-ml-142579930.md)

<a id="struct-struct-mq3-client-playable-items-stats-struct-stats-src-mq3-client-playable-items-ml-2115849797"></a>
## Stats

```ml
struct Stats
```

Stores playable items stats record, including `health`, `armor`, `ammo`, `weapon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L47)

## Members

<a id="field-field-mq3-client-playable-items-stats-ammo-ammo-src-mq3-client-playable-items-ml-511388212"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L53)

<a id="field-field-mq3-client-playable-items-stats-armor-armor-src-mq3-client-playable-items-ml-1405279240"></a>
### armor

```ml
armor
```

Mutable armor total checked and increased by preview armor pickups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L51)

<a id="field-field-mq3-client-playable-items-stats-health-health-src-mq3-client-playable-items-ml-1684454784"></a>
### health

```ml
health
```

Mutable health total checked and increased by preview item pickups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L49)

<a id="field-field-mq3-client-playable-items-stats-weapon-weapon-src-mq3-client-playable-items-ml-601176508"></a>
### weapon

```ml
weapon
```

Classname of the currently selected preview weapon in the mutable pickup statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L55)
