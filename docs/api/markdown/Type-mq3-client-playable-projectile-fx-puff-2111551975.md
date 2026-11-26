# `mq3.client.playable_projectile_fx.Puff`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-fx-ml-1498990564.md)

<a id="struct-struct-mq3-client-playable-projectile-fx-puff-struct-puff-src-mq3-client-playable-projectile-fx-ml-1668891189"></a>
## Puff

```ml
struct Puff
```

Stores playable projectile fx puff record, including `entityId`, `style`, `origin`, `bornAt`, `expiresAt`, `radius`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L59)

## Members

<a id="field-field-mq3-client-playable-projectile-fx-puff-bornat-bornat-src-mq3-client-playable-projectile-fx-ml-1300779664"></a>
### bornAt

```ml
bornAt
```

When constructing this record, `addPuff` supplies `bornAt` for this member. Used by `update` and `puffFraction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L68)

<a id="field-field-mq3-client-playable-projectile-fx-puff-entityid-entityid-src-mq3-client-playable-projectile-fx-ml-2063723156"></a>
### entityId

```ml
entityId
```

When constructing this record, `addPuff` supplies `entityId` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L61)

<a id="field-field-mq3-client-playable-projectile-fx-puff-expiresat-expiresat-src-mq3-client-playable-projectile-fx-ml-1646572444"></a>
### expiresAt

```ml
expiresAt
```

When constructing this record, `addPuff` supplies `bornAt+p.lifetime` for this member. Used by `update` and `puffFraction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L71)

<a id="field-field-mq3-client-playable-projectile-fx-puff-origin-origin-src-mq3-client-playable-projectile-fx-ml-1609634976"></a>
### origin

```ml
origin
```

World-space center projected to place a projectile smoke puff on screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L65)

<a id="field-field-mq3-client-playable-projectile-fx-puff-radius-radius-src-mq3-client-playable-projectile-fx-ml-350718152"></a>
### radius

```ml
radius
```

Initial world-space size of this trail puff before age and perspective scaling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L73)

<a id="field-field-mq3-client-playable-projectile-fx-puff-style-style-src-mq3-client-playable-projectile-fx-ml-829511208"></a>
### style

```ml
style
```

Projectile style retained by a smoke puff to select its trail appearance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_fx.ml#L63)
