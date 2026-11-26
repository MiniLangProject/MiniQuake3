# `mq3.botlib.ai_weapon_weights.Weapon`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-weapon-weights-ml-776993711.md)

<a id="struct-struct-mq3-botlib-ai-weapon-weights-weapon-struct-weapon-src-mq3-botlib-ai-weapon-weights-ml-1430578451"></a>
## Weapon

```ml
struct Weapon
```

`Weapon` record for ai weapon weights, containing `valid`, `number`, `name`, `model` and `level` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L55)

## Members

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-acceleration-acceleration-src-mq3-botlib-ai-weapon-weights-ml-1844532989"></a>
### acceleration

```ml
acceleration
```

Acceleration applied to the fired projectile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L81)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-activate-activate-src-mq3-botlib-ai-weapon-weights-ml-1938826207"></a>
### activate

```ml
activate
```

Delay before the selected weapon becomes ready to fire.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L95)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-ammoamount-ammoamount-src-mq3-botlib-ai-weapon-weights-ml-1859626141"></a>
### ammoAmount

```ml
ammoAmount
```

Amount of ammunition consumed by a weapon shot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L91)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-ammoindex-ammoindex-src-mq3-botlib-ai-weapon-weights-ml-1133182725"></a>
### ammoIndex

```ml
ammoIndex
```

Inventory index of the ammunition consumed by the weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L93)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-angleoffset-angleoffset-src-mq3-botlib-ai-weapon-weights-ml-1721588741"></a>
### angleOffset

```ml
angleOffset
```

Angular offset between the weapon aim and projectile launch direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L87)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-extrazvelocity-extrazvelocity-src-mq3-botlib-ai-weapon-weights-ml-923438011"></a>
### extraZVelocity

```ml
extraZVelocity
```

Additional vertical velocity imparted to the projectile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L89)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-flags-flags-src-mq3-botlib-ai-weapon-weights-ml-1914737861"></a>
### flags

```ml
flags
```

Weapon behavior properties combined from WFL flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L69)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-horizontalspread-horizontalspread-src-mq3-botlib-ai-weapon-weights-ml-665025815"></a>
### horizontalSpread

```ml
horizontalSpread
```

Horizontal angular spread of the weapon's projectiles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L75)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-level-level-src-mq3-botlib-ai-weapon-weights-ml-1139222941"></a>
### level

```ml
level
```

Configured weapon-selection level or priority classification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L65)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-model-model-src-mq3-botlib-ai-weapon-weights-ml-1723219757"></a>
### model

```ml
model
```

Asset model configured for the weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L63)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-name-name-src-mq3-botlib-ai-weapon-weights-ml-907940807"></a>
### name

```ml
name
```

Weapon-definition name used by fuzzy weight lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L61)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-number-number-src-mq3-botlib-ai-weapon-weights-ml-1509631387"></a>
### number

```ml
number
```

Game weapon identifier used to index this weapon definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L59)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-numprojectiles-numprojectiles-src-mq3-botlib-ai-weapon-weights-ml-2045101357"></a>
### numProjectiles

```ml
numProjectiles
```

Number of projectiles represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L73)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-offset-offset-src-mq3-botlib-ai-weapon-weights-ml-389324267"></a>
### offset

```ml
offset
```

Position offset from the weapon origin at which projectiles are spawned.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L85)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-projectile-projectile-src-mq3-botlib-ai-weapon-weights-ml-671405951"></a>
### projectile

```ml
projectile
```

Resolved projectile definition referenced by the weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L103)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-projectilename-projectilename-src-mq3-botlib-ai-weapon-weights-ml-1778732365"></a>
### projectileName

```ml
projectileName
```

Name of the projectile definition fired by this weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L71)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-recoil-recoil-src-mq3-botlib-ai-weapon-weights-ml-1471827053"></a>
### recoil

```ml
recoil
```

Recoil vector applied when the weapon fires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L83)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-reload-reload-src-mq3-botlib-ai-weapon-weights-ml-538114087"></a>
### reload

```ml
reload
```

Time required to reload or become ready for the next shot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L97)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-speed-speed-src-mq3-botlib-ai-weapon-weights-ml-1218540057"></a>
### speed

```ml
speed
```

Initial projectile speed configured for this weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L79)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-spindown-spindown-src-mq3-botlib-ai-weapon-weights-ml-972961821"></a>
### spindown

```ml
spindown
```

Delay while the weapon spins down after firing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L101)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-spinup-spinup-src-mq3-botlib-ai-weapon-weights-ml-228752183"></a>
### spinup

```ml
spinup
```

Delay while the weapon spins up before firing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L99)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-valid-valid-src-mq3-botlib-ai-weapon-weights-ml-2058604637"></a>
### valid

```ml
valid
```

True when the represented entry contains usable data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L57)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-verticalspread-verticalspread-src-mq3-botlib-ai-weapon-weights-ml-521437423"></a>
### verticalSpread

```ml
verticalSpread
```

Vertical angular spread of the weapon's projectiles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L77)

<a id="field-field-mq3-botlib-ai-weapon-weights-weapon-weaponindex-weaponindex-src-mq3-botlib-ai-weapon-weights-ml-2141267453"></a>
### weaponIndex

```ml
weaponIndex
```

Inventory or weapon-table index associated with the weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L67)
