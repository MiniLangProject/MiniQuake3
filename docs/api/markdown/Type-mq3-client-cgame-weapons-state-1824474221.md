# `mq3.client.cgame_weapons.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-weapons-ml-1641558282.md)

<a id="struct-struct-mq3-client-cgame-weapons-state-struct-state-src-mq3-client-cgame-weapons-ml-391289883"></a>
## State

```ml
struct State
```

Stores client game weapons state, including `time`, `weaponSelect`, `weaponSelectTime`, `owned`, `ammo`, `health` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L240)

## Members

<a id="field-field-mq3-client-cgame-weapons-state-actions-actions-src-mq3-client-cgame-weapons-ml-177077164"></a>
### actions

```ml
actions
```

Host requests queued while registering and presenting weapon models, firing sounds, and impact effects, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L326)

<a id="field-field-mq3-client-cgame-weapons-state-ammo-ammo-src-mq3-client-cgame-weapons-ml-1122490840"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L252)

<a id="field-field-mq3-client-cgame-weapons-state-brasstime-brasstime-src-mq3-client-cgame-weapons-ml-1276850632"></a>
### brassTime

```ml
brassTime
```

When constructing this record, `create` supplies `2500` for this member. Used by `machineGunEjectBrass` and `shotgunEjectBrass` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L274)

<a id="field-field-mq3-client-cgame-weapons-state-drawgun-drawgun-src-mq3-client-cgame-weapons-ml-2008718640"></a>
### drawGun

```ml
drawGun
```

When constructing this record, `create` supplies `true` for this member. Used by `addViewWeapon` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L292)

<a id="field-field-mq3-client-cgame-weapons-state-emitted-emitted-src-mq3-client-cgame-weapons-ml-1159411528"></a>
### emitted

```ml
emitted
```

When constructing this record, `create` supplies `0` for this member. Used by `action` and `clearActions` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L329)

<a id="field-field-mq3-client-cgame-weapons-state-errors-errors-src-mq3-client-cgame-weapons-ml-183780830"></a>
### errors

```ml
errors
```

Diagnostic messages collected while parsing or processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L334)

<a id="field-field-mq3-client-cgame-weapons-state-follow-follow-src-mq3-client-cgame-weapons-ml-354328038"></a>
### follow

```ml
follow
```

When constructing this record, `create` supplies `false` for this member. Used by `nextWeapon` and `prevWeapon` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L257)

<a id="field-field-mq3-client-cgame-weapons-state-fov-fov-src-mq3-client-cgame-weapons-ml-1849143856"></a>
### fov

```ml
fov
```

When constructing this record, `create` supplies `90` for this member. Used by `addViewWeapon` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L295)

<a id="field-field-mq3-client-cgame-weapons-state-gunx-gunx-src-mq3-client-cgame-weapons-ml-320390796"></a>
### gunX

```ml
gunX
```

When constructing this record, `create` supplies `0.0` for this member. Used by `addViewWeapon` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L298)

<a id="field-field-mq3-client-cgame-weapons-state-guny-guny-src-mq3-client-cgame-weapons-ml-738449030"></a>
### gunY

```ml
gunY
```

When constructing this record, `create` supplies `0.0` for this member. Used by `addViewWeapon` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L301)

<a id="field-field-mq3-client-cgame-weapons-state-gunz-gunz-src-mq3-client-cgame-weapons-ml-793424344"></a>
### gunZ

```ml
gunZ
```

When constructing this record, `create` supplies `0.0` for this member. Used by `addViewWeapon` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L304)

<a id="field-field-mq3-client-cgame-weapons-state-health-health-src-mq3-client-cgame-weapons-ml-1154944468"></a>
### health

```ml
health
```

Local-player health used to suppress the weapon-selection display after death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L254)

<a id="field-field-mq3-client-cgame-weapons-state-itempickuptime-itempickuptime-src-mq3-client-cgame-weapons-ml-1650814276"></a>
### itemPickupTime

```ml
itemPickupTime
```

Timestamp at which the most recent item-pickup notification began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L259)

<a id="field-field-mq3-client-cgame-weapons-state-items-items-src-mq3-client-cgame-weapons-ml-289565300"></a>
### items

```ml
items
```

When constructing this record, `create` supplies an empty list for this member. Used by `registerItemVisuals` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L323)

<a id="field-field-mq3-client-cgame-weapons-state-noprojectiletrail-noprojectiletrail-src-mq3-client-cgame-weapons-ml-1784585492"></a>
### noProjectileTrail

```ml
noProjectileTrail
```

When constructing this record, `create` supplies `false` for this member. Used by `smokeTrail` and `plasmaTrail` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L262)

<a id="field-field-mq3-client-cgame-weapons-state-oldplasma-oldplasma-src-mq3-client-cgame-weapons-ml-1895442516"></a>
### oldPlasma

```ml
oldPlasma
```

When constructing this record, `create` supplies `false` for this member. Used by `plasmaTrail` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L268)

<a id="field-field-mq3-client-cgame-weapons-state-oldrail-oldrail-src-mq3-client-cgame-weapons-ml-2069937724"></a>
### oldRail

```ml
oldRail
```

When constructing this record, `create` supplies `false` for this member. Used by `railTrail` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L265)

<a id="field-field-mq3-client-cgame-weapons-state-oldrocket-oldrocket-src-mq3-client-cgame-weapons-ml-1882282812"></a>
### oldRocket

```ml
oldRocket
```

When constructing this record, `create` supplies `false` for this member. Used by `missileHitWall` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L271)

<a id="field-field-mq3-client-cgame-weapons-state-owned-owned-src-mq3-client-cgame-weapons-ml-2069872912"></a>
### owned

```ml
owned
```

When constructing this record, `create` supplies `0` for this member. Used by `drawWeaponSelect` and `weaponSelectable` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L250)

<a id="field-field-mq3-client-cgame-weapons-state-railtrailtime-railtrailtime-src-mq3-client-cgame-weapons-ml-1349215892"></a>
### railTrailTime

```ml
railTrailTime
```

When constructing this record, `create` supplies `400.0` for this member. Used by `railTrail` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L286)

<a id="field-field-mq3-client-cgame-weapons-state-random-random-src-mq3-client-cgame-weapons-ml-483553570"></a>
### random

```ml
random
```

When constructing this record, `create` supplies `q.RandomState(1)` for this member. Used by `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L311)

<a id="field-field-mq3-client-cgame-weapons-state-randomat-randomat-src-mq3-client-cgame-weapons-ml-1687197952"></a>
### randomAt

```ml
randomAt
```

When constructing this record, `create` supplies `0` for this member. Used by `setRandomInts` and `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L317)

<a id="field-field-mq3-client-cgame-weapons-state-randomints-randomints-src-mq3-client-cgame-weapons-ml-2121657174"></a>
### randomInts

```ml
randomInts
```

When constructing this record, `create` supplies an empty list for this member. Used by `setRandomInts` and `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L314)

<a id="field-field-mq3-client-cgame-weapons-state-renderingthirdperson-renderingthirdperson-src-mq3-client-cgame-weapons-ml-2136276664"></a>
### renderingThirdPerson

```ml
renderingThirdPerson
```

True while the camera uses a third-person, chase, or death view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L306)

<a id="field-field-mq3-client-cgame-weapons-state-suppressed-suppressed-src-mq3-client-cgame-weapons-ml-2017801060"></a>
### suppressed

```ml
suppressed
```

Number of requests withheld from native dispatch while registering and presenting weapon models, firing sounds, and impact effects because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L332)

<a id="field-field-mq3-client-cgame-weapons-state-testgun-testgun-src-mq3-client-cgame-weapons-ml-1020734800"></a>
### testGun

```ml
testGun
```

True when the developer test model is positioned as a first-person weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L308)

<a id="field-field-mq3-client-cgame-weapons-state-time-time-src-mq3-client-cgame-weapons-ml-913094286"></a>
### time

```ml
time
```

Current client-game time in milliseconds used for weapon animation, muzzle flashes, and barrel effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L243)

<a id="field-field-mq3-client-cgame-weapons-state-tracerchance-tracerchance-src-mq3-client-cgame-weapons-ml-643863190"></a>
### tracerChance

```ml
tracerChance
```

When constructing this record, `create` supplies `0.4` for this member. Used by `bullet` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L277)

<a id="field-field-mq3-client-cgame-weapons-state-tracerlength-tracerlength-src-mq3-client-cgame-weapons-ml-1884795582"></a>
### tracerLength

```ml
tracerLength
```

When constructing this record, `create` supplies `160.0` for this member. Used by `tracer` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L280)

<a id="field-field-mq3-client-cgame-weapons-state-tracerwidth-tracerwidth-src-mq3-client-cgame-weapons-ml-1679549328"></a>
### tracerWidth

```ml
tracerWidth
```

When constructing this record, `create` supplies `1.0` for this member. Used by `tracer` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L283)

<a id="field-field-mq3-client-cgame-weapons-state-truelightning-truelightning-src-mq3-client-cgame-weapons-ml-1829311232"></a>
### trueLightning

```ml
trueLightning
```

When constructing this record, `create` supplies `0.0` for this member. Used by `lightningBolt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L289)

<a id="field-field-mq3-client-cgame-weapons-state-weapons-weapons-src-mq3-client-cgame-weapons-ml-1760583796"></a>
### weapons

```ml
weapons
```

When constructing this record, `create` supplies `ws` for this member. Used by `registerWeapon` and `addPlayerWeapon` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L320)

<a id="field-field-mq3-client-cgame-weapons-state-weaponselect-weaponselect-src-mq3-client-cgame-weapons-ml-1802715744"></a>
### weaponSelect

```ml
weaponSelect
```

Weapon identifier currently selected by the local player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L245)

<a id="field-field-mq3-client-cgame-weapons-state-weaponselecttime-weaponselecttime-src-mq3-client-cgame-weapons-ml-1242831562"></a>
### weaponSelectTime

```ml
weaponSelectTime
```

Timestamp at which the weapon-selection display was last refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L247)
