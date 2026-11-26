# `mq3.client.cg_local.PlayerEntity`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-playerentity-struct-playerentity-src-mq3-client-cg-local-ml-1361467631"></a>
## PlayerEntity

```ml
struct PlayerEntity
```

Stores client game local player entity record, including `legs`, `torso`, `flag`, `painTime`, `painDirection`, `lightningFiring` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L213)

## Members

<a id="field-field-mq3-client-cg-local-playerentity-barrelangle-barrelangle-src-mq3-client-cg-local-ml-1877439149"></a>
### barrelAngle

```ml
barrelAngle
```

Current rotational angle of the spinning weapon barrel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L231)

<a id="field-field-mq3-client-cg-local-playerentity-barrelspinning-barrelspinning-src-mq3-client-cg-local-ml-1457482677"></a>
### barrelSpinning

```ml
barrelSpinning
```

True while the weapon barrel is in its spinning state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L235)

<a id="field-field-mq3-client-cg-local-playerentity-barreltime-barreltime-src-mq3-client-cg-local-ml-2009789079"></a>
### barrelTime

```ml
barrelTime
```

Client timestamp used to advance or stop weapon-barrel rotation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L233)

<a id="field-field-mq3-client-cg-local-playerentity-flag-flag-src-mq3-client-cg-local-ml-1800641261"></a>
### flag

```ml
flag
```

Animation and interpolation state for the flag carried by the player model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L219)

<a id="field-field-mq3-client-cg-local-playerentity-legs-legs-src-mq3-client-cg-local-ml-1763313247"></a>
### legs

```ml
legs
```

Animation and interpolation state for the player's legs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L215)

<a id="field-field-mq3-client-cg-local-playerentity-lightningfiring-lightningfiring-src-mq3-client-cg-local-ml-920822661"></a>
### lightningFiring

```ml
lightningFiring
```

True while the player is continuously firing the lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L225)

<a id="field-field-mq3-client-cg-local-playerentity-paindirection-paindirection-src-mq3-client-cg-local-ml-770066189"></a>
### painDirection

```ml
painDirection
```

Alternating direction selector used for the player's pain animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L223)

<a id="field-field-mq3-client-cg-local-playerentity-paintime-paintime-src-mq3-client-cg-local-ml-1427299247"></a>
### painTime

```ml
painTime
```

Client timestamp of the last pain reaction, used to animate the flinch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L221)

<a id="field-field-mq3-client-cg-local-playerentity-railgunflash-railgunflash-src-mq3-client-cg-local-ml-251240777"></a>
### railgunFlash

```ml
railgunFlash
```

True while the railgun's muzzle-flash effect should be emitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L229)

<a id="field-field-mq3-client-cg-local-playerentity-railgunimpact-railgunimpact-src-mq3-client-cg-local-ml-758427521"></a>
### railgunImpact

```ml
railgunImpact
```

World-space endpoint of the last railgun impact used by the weapon effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L227)

<a id="field-field-mq3-client-cg-local-playerentity-torso-torso-src-mq3-client-cg-local-ml-2069316717"></a>
### torso

```ml
torso
```

Animation and interpolation state for the player's torso.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L217)
