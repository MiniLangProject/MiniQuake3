# `mq3.client.cgame_weapons.WeaponInfo`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-weapons-ml-1641558282.md)

<a id="struct-struct-mq3-client-cgame-weapons-weaponinfo-struct-weaponinfo-src-mq3-client-cgame-weapons-ml-253734567"></a>
## WeaponInfo

```ml
struct WeaponInfo
```

Stores client game weapons weapon info record, including `number`, `registered`, `weaponModel`, `flashModel`, `barrelModel`, `handsModel` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L128)

## Members

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-ammoicon-ammoicon-src-mq3-client-cgame-weapons-ml-354133171"></a>
### ammoIcon

```ml
ammoIcon
```

Shader or image resource used to display this weapon's ammunition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L146)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-barrelmodel-barrelmodel-src-mq3-client-cgame-weapons-ml-2091897265"></a>
### barrelModel

```ml
barrelModel
```

Model resource selected for the barrel presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L138)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-ejectbrass-ejectbrass-src-mq3-client-cgame-weapons-ml-856358289"></a>
### ejectBrass

```ml
ejectBrass
```

When constructing this record, `emptyWeapon` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L168)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-firingsound-firingsound-src-mq3-client-cgame-weapons-ml-2096533145"></a>
### firingSound

```ml
firingSound
```

Sound resource selected for the firing event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L150)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-flashcolor-flashcolor-src-mq3-client-cgame-weapons-ml-1823509155"></a>
### flashColor

```ml
flashColor
```

When constructing this record, `emptyWeapon` supplies `zero3()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L156)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-flashmodel-flashmodel-src-mq3-client-cgame-weapons-ml-271143115"></a>
### flashModel

```ml
flashModel
```

Model resource selected for the flash presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L136)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-flashsounds-flashsounds-src-mq3-client-cgame-weapons-ml-814066769"></a>
### flashSounds

```ml
flashSounds
```

Sound resources selected for the flash event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L154)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-handsmodel-handsmodel-src-mq3-client-cgame-weapons-ml-2065694623"></a>
### handsModel

```ml
handsModel
```

Weapon-hand model used to position the first-person weapon, even when the hands are not drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L140)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-loopfire-loopfire-src-mq3-client-cgame-weapons-ml-1356375145"></a>
### loopFire

```ml
loopFire
```

When constructing this record, `emptyWeapon` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L170)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-missilecolor-missilecolor-src-mq3-client-cgame-weapons-ml-195422923"></a>
### missileColor

```ml
missileColor
```

When constructing this record, `emptyWeapon` supplies `zero3()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L158)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-missiledlight-missiledlight-src-mq3-client-cgame-weapons-ml-972659997"></a>
### missileDlight

```ml
missileDlight
```

Intensity of the dynamic light attached to the projectile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L160)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-missilemodel-missilemodel-src-mq3-client-cgame-weapons-ml-938000231"></a>
### missileModel

```ml
missileModel
```

Model resource selected for the missile presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L142)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-missilesound-missilesound-src-mq3-client-cgame-weapons-ml-744085711"></a>
### missileSound

```ml
missileSound
```

Sound resource selected for the missile event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L152)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-number-number-src-mq3-client-cgame-weapons-ml-1925818675"></a>
### number

```ml
number
```

When constructing this record, `emptyWeapon` supplies `number` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L130)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-pickupname-pickupname-src-mq3-client-cgame-weapons-ml-461460427"></a>
### pickupName

```ml
pickupName
```

Human-readable item name shown by pickup notifications and item-selection UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L172)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-readysound-readysound-src-mq3-client-cgame-weapons-ml-1127245369"></a>
### readySound

```ml
readySound
```

Sound resource selected for the ready event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L148)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-registered-registered-src-mq3-client-cgame-weapons-ml-1827983117"></a>
### registered

```ml
registered
```

True once the referenced media resources have been registered with the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L132)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-trail-trail-src-mq3-client-cgame-weapons-ml-1173968157"></a>
### trail

```ml
trail
```

When constructing this record, `emptyWeapon` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L166)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-trailradius-trailradius-src-mq3-client-cgame-weapons-ml-881122857"></a>
### trailRadius

```ml
trailRadius
```

Radius used when emitting this weapon's projectile trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L164)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-trailtime-trailtime-src-mq3-client-cgame-weapons-ml-1479657401"></a>
### trailTime

```ml
trailTime
```

Last trail-emission time, allowing missile trails to catch up across dropped packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L162)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-weaponicon-weaponicon-src-mq3-client-cgame-weapons-ml-462278123"></a>
### weaponIcon

```ml
weaponIcon
```

Shader or image resource used to display the weapon in the HUD.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L144)

<a id="field-field-mq3-client-cgame-weapons-weaponinfo-weaponmodel-weaponmodel-src-mq3-client-cgame-weapons-ml-118444673"></a>
### weaponModel

```ml
weaponModel
```

Model resource selected for the weapon presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L134)
