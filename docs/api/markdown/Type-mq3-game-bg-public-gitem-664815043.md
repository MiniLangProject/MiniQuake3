# `mq3.game.bg_public.Gitem`

[Home](README.md) · [Source file](File-src-mq3-game-bg-public-ml-2091356861.md)

<a id="struct-struct-mq3-game-bg-public-gitem-struct-gitem-src-mq3-game-bg-public-ml-289618917"></a>
## Gitem

```ml
struct Gitem
```

`Gitem` record for bg public, containing `classname`, `pickupSound`, `worldModel`, `icon` and `pickupName` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L223)

## Members

<a id="field-field-mq3-game-bg-public-gitem-classname-classname-src-mq3-game-bg-public-ml-113496929"></a>
### classname

```ml
classname
```

Map entity class name used to select a spawn function.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L225)

<a id="field-field-mq3-game-bg-public-gitem-gitag-gitag-src-mq3-game-bg-public-ml-1361605341"></a>
### giTag

```ml
giTag
```

Category-specific item identifier, such as a weapon, powerup, or holdable ID.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L239)

<a id="field-field-mq3-game-bg-public-gitem-gitype-gitype-src-mq3-game-bg-public-ml-1240877669"></a>
### giType

```ml
giType
```

Item category selected from the IT_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L237)

<a id="field-field-mq3-game-bg-public-gitem-icon-icon-src-mq3-game-bg-public-ml-791101607"></a>
### icon

```ml
icon
```

Icon resource used to display the item in the interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L231)

<a id="field-field-mq3-game-bg-public-gitem-pickupname-pickupname-src-mq3-game-bg-public-ml-589406135"></a>
### pickupName

```ml
pickupName
```

Human-readable name shown when the item is picked up.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L233)

<a id="field-field-mq3-game-bg-public-gitem-pickupsound-pickupsound-src-mq3-game-bg-public-ml-1045766981"></a>
### pickupSound

```ml
pickupSound
```

Sound resource played when the item is picked up.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L227)

<a id="field-field-mq3-game-bg-public-gitem-precaches-precaches-src-mq3-game-bg-public-ml-827772133"></a>
### precaches

```ml
precaches
```

Additional asset names to preload for the item definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L241)

<a id="field-field-mq3-game-bg-public-gitem-quantity-quantity-src-mq3-game-bg-public-ml-2052504091"></a>
### quantity

```ml
quantity
```

Base amount granted by an item pickup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L235)

<a id="field-field-mq3-game-bg-public-gitem-sounds-sounds-src-mq3-game-bg-public-ml-202259429"></a>
### sounds

```ml
sounds
```

Additional sound resources associated with the item or level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L243)

<a id="field-field-mq3-game-bg-public-gitem-worldmodel-worldmodel-src-mq3-game-bg-public-ml-1050733931"></a>
### worldModel

```ml
worldModel
```

World/model resources used to represent an item pickup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_public.ml#L229)
