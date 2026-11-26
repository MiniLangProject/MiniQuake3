# `mq3.client.cgame_main.Item`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-main-ml-1652783738.md)

<a id="struct-struct-mq3-client-cgame-main-item-struct-item-src-mq3-client-cgame-main-ml-915315469"></a>
## Item

```ml
struct Item
```

Stores client game main menu item, including `classname`, `pickupSound`, `sounds`, `icon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L129)

## Members

<a id="field-field-mq3-client-cgame-main-item-classname-classname-src-mq3-client-cgame-main-ml-911629816"></a>
### classname

```ml
classname
```

Native item classname used when registering and resolving CGame item media.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L131)

<a id="field-field-mq3-client-cgame-main-item-icon-icon-src-mq3-client-cgame-main-ml-817750682"></a>
### icon

```ml
icon
```

Virtual shader or image name requested when registering the item's HUD icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L137)

<a id="field-field-mq3-client-cgame-main-item-pickupsound-pickupsound-src-mq3-client-cgame-main-ml-1211434932"></a>
### pickupSound

```ml
pickupSound
```

Sound resource selected for the pickup event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L133)

<a id="field-field-mq3-client-cgame-main-item-sounds-sounds-src-mq3-client-cgame-main-ml-453799084"></a>
### sounds

```ml
sounds
```

Registered sound resources associated with the player model or media group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L135)
