# `mq3.client.playable_items.Item`

[Home](README.md) · [Source file](File-src-mq3-client-playable-items-ml-142579930.md)

<a id="struct-struct-mq3-client-playable-items-item-struct-item-src-mq3-client-playable-items-ml-1513323785"></a>
## Item

```ml
struct Item
```

Stores playable items menu item, including `classname`, `kind`, `origin`, `amount`, `cap`, `respawnMs` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L23)

## Members

<a id="field-field-mq3-client-playable-items-item-active-active-src-mq3-client-playable-items-ml-1764461172"></a>
### active

```ml
active
```

When constructing this record, `fromEntities` supplies `true` for this member. Used by `take` and `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L40)

<a id="field-field-mq3-client-playable-items-item-amount-amount-src-mq3-client-playable-items-ml-1186958288"></a>
### amount

```ml
amount
```

When constructing this record, `fromEntities` supplies `def[1]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L31)

<a id="field-field-mq3-client-playable-items-item-cap-cap-src-mq3-client-playable-items-ml-1311084364"></a>
### cap

```ml
cap
```

When constructing this record, `fromEntities` supplies `def[2]` for this member. Used by `canTake` and `take` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L34)

<a id="field-field-mq3-client-playable-items-item-classname-classname-src-mq3-client-playable-items-ml-1394792860"></a>
### classname

```ml
classname
```

Native item classname used to select this world's pickup behavior and presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L25)

<a id="field-field-mq3-client-playable-items-item-kind-kind-src-mq3-client-playable-items-ml-1290073356"></a>
### kind

```ml
kind
```

Item category selecting pickup behavior or the type-specific UI control implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L27)

<a id="field-field-mq3-client-playable-items-item-origin-origin-src-mq3-client-playable-items-ml-668584452"></a>
### origin

```ml
origin
```

World-space pickup position used for the player's item-collection distance test.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L29)

<a id="field-field-mq3-client-playable-items-item-respawnat-respawnat-src-mq3-client-playable-items-ml-342920220"></a>
### respawnAt

```ml
respawnAt
```

Client simulation timestamp at which the entity becomes eligible to respawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L42)

<a id="field-field-mq3-client-playable-items-item-respawnms-respawnms-src-mq3-client-playable-items-ml-636244516"></a>
### respawnMs

```ml
respawnMs
```

When constructing this record, `fromEntities` supplies `def[3]` for this member. Used by `take` and `takeInventory` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L37)

<a id="field-field-mq3-client-playable-items-item-weapon-weapon-src-mq3-client-playable-items-ml-560706216"></a>
### weapon

```ml
weapon
```

Weapon classname selected when this weapon pickup is collected; empty for other pickup kinds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L44)
