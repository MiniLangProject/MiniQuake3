# `mq3.client.cg_local.WeaponInfo`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-weaponinfo-struct-weaponinfo-src-mq3-client-cg-local-ml-1686512787"></a>
## WeaponInfo

```ml
struct WeaponInfo
```

Stores client game local weapon info record, including `registered`, `item`, `handsModel`, `weaponModel`, `barrelModel`, `flashModel` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L475)

## Members

<a id="field-field-mq3-client-cg-local-weaponinfo-ammoicon-ammoicon-src-mq3-client-cg-local-ml-1718992377"></a>
### ammoIcon

```ml
ammoIcon
```

Shader or image resource used to display this weapon's ammunition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L500)

<a id="field-field-mq3-client-cg-local-weaponinfo-ammomodel-ammomodel-src-mq3-client-cg-local-ml-755774767"></a>
### ammoModel

```ml
ammoModel
```

Model resource selected for the ammo presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L502)

<a id="field-field-mq3-client-cg-local-weaponinfo-barrelmodel-barrelmodel-src-mq3-client-cg-local-ml-276348299"></a>
### barrelModel

```ml
barrelModel
```

Model resource selected for the barrel presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L486)

<a id="field-field-mq3-client-cg-local-weaponinfo-ejectbrassfunc-ejectbrassfunc-src-mq3-client-cg-local-ml-780670963"></a>
### ejectBrassFunc

```ml
ejectBrassFunc
```

Callback used to emit an ejected shell casing when the weapon fires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L516)

<a id="field-field-mq3-client-cg-local-weaponinfo-firingsound-firingsound-src-mq3-client-cg-local-ml-357580467"></a>
### firingSound

```ml
firingSound
```

Sound resource selected for the firing event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L524)

<a id="field-field-mq3-client-cg-local-weaponinfo-flashdlight-flashdlight-src-mq3-client-cg-local-ml-815438459"></a>
### flashDlight

```ml
flashDlight
```

Intensity of the weapon's muzzle-flash dynamic light.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L492)

<a id="field-field-mq3-client-cg-local-weaponinfo-flashdlightcolor-flashdlightcolor-src-mq3-client-cg-local-ml-30636481"></a>
### flashDlightColor

```ml
flashDlightColor
```

RGB components of the weapon's muzzle-flash dynamic light.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L494)

<a id="field-field-mq3-client-cg-local-weaponinfo-flashmodel-flashmodel-src-mq3-client-cg-local-ml-28200525"></a>
### flashModel

```ml
flashModel
```

Model resource selected for the flash presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L488)

<a id="field-field-mq3-client-cg-local-weaponinfo-flashsound-flashsound-src-mq3-client-cg-local-ml-256882981"></a>
### flashSound

```ml
flashSound
```

Alternative firing sounds selected when the weapon produces a muzzle flash.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L496)

<a id="field-field-mq3-client-cg-local-weaponinfo-handsmodel-handsmodel-src-mq3-client-cg-local-ml-1131932289"></a>
### handsModel

```ml
handsModel
```

Weapon-hand model used to position the first-person weapon, even when the hands are not drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L482)

<a id="field-field-mq3-client-cg-local-weaponinfo-item-item-src-mq3-client-cg-local-ml-1384976477"></a>
### item

```ml
item
```

Compatibility member corresponding to native `weaponInfo_t.item`; the original declaration is `gitem_t *item`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L480)

<a id="field-field-mq3-client-cg-local-weaponinfo-loopfiresound-loopfiresound-src-mq3-client-cg-local-ml-2110356779"></a>
### loopFireSound

```ml
loopFireSound
```

True when the weapon's firing sound is sustained as a looping sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L526)

<a id="field-field-mq3-client-cg-local-weaponinfo-missiledlight-missiledlight-src-mq3-client-cg-local-ml-1744300647"></a>
### missileDlight

```ml
missileDlight
```

Intensity of the dynamic light attached to the projectile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L510)

<a id="field-field-mq3-client-cg-local-weaponinfo-missiledlightcolor-missiledlightcolor-src-mq3-client-cg-local-ml-1486098077"></a>
### missileDlightColor

```ml
missileDlightColor
```

RGB components of the dynamic light attached to the projectile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L512)

<a id="field-field-mq3-client-cg-local-weaponinfo-missilemodel-missilemodel-src-mq3-client-cg-local-ml-116582529"></a>
### missileModel

```ml
missileModel
```

Model resource selected for the missile presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L504)

<a id="field-field-mq3-client-cg-local-weaponinfo-missilerenderfx-missilerenderfx-src-mq3-client-cg-local-ml-791873979"></a>
### missileRenderfx

```ml
missileRenderfx
```

Renderer flags applied to the projectile model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L514)

<a id="field-field-mq3-client-cg-local-weaponinfo-missilesound-missilesound-src-mq3-client-cg-local-ml-1242592937"></a>
### missileSound

```ml
missileSound
```

Sound resource selected for the missile event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L506)

<a id="field-field-mq3-client-cg-local-weaponinfo-missiletrailfunc-missiletrailfunc-src-mq3-client-cg-local-ml-610086207"></a>
### missileTrailFunc

```ml
missileTrailFunc
```

Callback used to emit the projectile's continuous trail effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L508)

<a id="field-field-mq3-client-cg-local-weaponinfo-readysound-readysound-src-mq3-client-cg-local-ml-725181983"></a>
### readySound

```ml
readySound
```

Sound resource selected for the ready event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L522)

<a id="field-field-mq3-client-cg-local-weaponinfo-registered-registered-src-mq3-client-cg-local-ml-1757272211"></a>
### registered

```ml
registered
```

True once the referenced media resources have been registered with the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L477)

<a id="field-field-mq3-client-cg-local-weaponinfo-trailradius-trailradius-src-mq3-client-cg-local-ml-1333380331"></a>
### trailRadius

```ml
trailRadius
```

Radius used when emitting this weapon's projectile trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L518)

<a id="field-field-mq3-client-cg-local-weaponinfo-weaponicon-weaponicon-src-mq3-client-cg-local-ml-1032998073"></a>
### weaponIcon

```ml
weaponIcon
```

Shader or image resource used to display the weapon in the HUD.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L498)

<a id="field-field-mq3-client-cg-local-weaponinfo-weaponmidpoint-weaponmidpoint-src-mq3-client-cg-local-ml-451545683"></a>
### weaponMidpoint

```ml
weaponMidpoint
```

Model-space center used to rotate the weapon preview around its visual midpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L490)

<a id="field-field-mq3-client-cg-local-weaponinfo-weaponmodel-weaponmodel-src-mq3-client-cg-local-ml-1370705227"></a>
### weaponModel

```ml
weaponModel
```

Model resource selected for the weapon presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L484)

<a id="field-field-mq3-client-cg-local-weaponinfo-witrailtime-witrailtime-src-mq3-client-cg-local-ml-2114495927"></a>
### wiTrailTime

```ml
wiTrailTime
```

Lifetime or cadence parameter supplied to the weapon's projectile-trail implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L520)
