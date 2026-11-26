# `mq3.client.cgame_weapons.Item`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-weapons-ml-1641558282.md)

<a id="struct-struct-mq3-client-cgame-weapons-item-struct-item-src-mq3-client-cgame-weapons-ml-275360867"></a>
## Item

```ml
struct Item
```

Stores client game weapons menu item, including `number`, `type`, `tag`, `worldModel`, `worldModel2`, `icon` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L175)

## Members

<a id="field-field-mq3-client-cgame-weapons-item-icon-icon-src-mq3-client-cgame-weapons-ml-1040785208"></a>
### icon

```ml
icon
```

Virtual shader or image name used to register the item's HUD icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L188)

<a id="field-field-mq3-client-cgame-weapons-item-number-number-src-mq3-client-cgame-weapons-ml-940139320"></a>
### number

```ml
number
```

Index of the item in the game's item-definition table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L177)

<a id="field-field-mq3-client-cgame-weapons-item-pickupname-pickupname-src-mq3-client-cgame-weapons-ml-365433800"></a>
### pickupName

```ml
pickupName
```

Human-readable item name shown by pickup notifications and item-selection UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L190)

<a id="field-field-mq3-client-cgame-weapons-item-registered-registered-src-mq3-client-cgame-weapons-ml-126275906"></a>
### registered

```ml
registered
```

True once the referenced media resources have been registered with the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L192)

<a id="field-field-mq3-client-cgame-weapons-item-tag-tag-src-mq3-client-cgame-weapons-ml-2016067286"></a>
### tag

```ml
tag
```

Type-specific item tag selecting the associated weapon, ammunition, powerup, or holdable identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L182)

<a id="field-field-mq3-client-cgame-weapons-item-type-type-src-mq3-client-cgame-weapons-ml-523502466"></a>
### type

```ml
type
```

UI item kind selecting its type-specific behavior and payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L179)

<a id="field-field-mq3-client-cgame-weapons-item-worldmodel-worldmodel-src-mq3-client-cgame-weapons-ml-507210884"></a>
### worldModel

```ml
worldModel
```

Model resource selected for the world presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L184)

<a id="field-field-mq3-client-cgame-weapons-item-worldmodel2-worldmodel2-src-mq3-client-cgame-weapons-ml-101903810"></a>
### worldModel2

```ml
worldModel2
```

Secondary world-model asset associated with the item, such as an additional model component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L186)
