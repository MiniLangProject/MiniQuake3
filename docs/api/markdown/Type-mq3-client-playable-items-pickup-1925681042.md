# `mq3.client.playable_items.Pickup`

[Home](README.md) · [Source file](File-src-mq3-client-playable-items-ml-142579930.md)

<a id="struct-struct-mq3-client-playable-items-pickup-struct-pickup-src-mq3-client-playable-items-ml-1246777053"></a>
## Pickup

```ml
struct Pickup
```

Stores playable items pickup record, including `itemIndex`, `classname`, `kind`, `amount`, `before`, `after` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L73)

## Members

<a id="field-field-mq3-client-playable-items-pickup-after-after-src-mq3-client-playable-items-ml-698601641"></a>
### after

```ml
after
```

When constructing this record, `take` supplies `after` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L86)

<a id="field-field-mq3-client-playable-items-pickup-amount-amount-src-mq3-client-playable-items-ml-664178181"></a>
### amount

```ml
amount
```

When constructing this record, `take` supplies `after-before` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L82)

<a id="field-field-mq3-client-playable-items-pickup-before-before-src-mq3-client-playable-items-ml-1652305519"></a>
### before

```ml
before
```

When constructing this record, `take` supplies `before` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L84)

<a id="field-field-mq3-client-playable-items-pickup-classname-classname-src-mq3-client-playable-items-ml-237139869"></a>
### classname

```ml
classname
```

Native item classname copied into the pickup result so HUD and audio feedback can identify the collected item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L78)

<a id="field-field-mq3-client-playable-items-pickup-itemindex-itemindex-src-mq3-client-playable-items-ml-989526593"></a>
### itemIndex

```ml
itemIndex
```

When constructing this record, `take` supplies `index` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L75)

<a id="field-field-mq3-client-playable-items-pickup-kind-kind-src-mq3-client-playable-items-ml-208121065"></a>
### kind

```ml
kind
```

Item category selecting pickup behavior or the type-specific UI control implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L80)

<a id="field-field-mq3-client-playable-items-pickup-weapon-weapon-src-mq3-client-playable-items-ml-978603513"></a>
### weapon

```ml
weapon
```

Selected weapon classname after applying this pickup, including pickups that keep the existing weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L89)
