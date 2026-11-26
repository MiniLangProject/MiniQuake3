# `mq3.client.cgame_weapons.Entity`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-weapons-ml-1641558282.md)

<a id="struct-struct-mq3-client-cgame-weapons-entity-struct-entity-src-mq3-client-cgame-weapons-ml-1489454951"></a>
## Entity

```ml
struct Entity
```

Stores client game weapons entity record, including `number`, `clientNum`, `weapon`, `eFlags`, `powerups`, `origin` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L207)

## Members

<a id="field-field-mq3-client-cgame-weapons-entity-angles-angles-src-mq3-client-cgame-weapons-ml-240112874"></a>
### angles

```ml
angles
```

Euler orientation used to place or animate the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L221)

<a id="field-field-mq3-client-cgame-weapons-entity-barrel-barrel-src-mq3-client-cgame-weapons-ml-828085210"></a>
### barrel

```ml
barrel
```

When constructing this record, `entity` supplies `barrel()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L233)

<a id="field-field-mq3-client-cgame-weapons-entity-clientnum-clientnum-src-mq3-client-cgame-weapons-ml-135282710"></a>
### clientNum

```ml
clientNum
```

Client slot identifying the player represented by this weapon-rendering entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L211)

<a id="field-field-mq3-client-cgame-weapons-entity-currentvalid-currentvalid-src-mq3-client-cgame-weapons-ml-2116755292"></a>
### currentValid

```ml
currentValid
```

True when the current snapshot contains a valid state for this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L235)

<a id="field-field-mq3-client-cgame-weapons-entity-eflags-eflags-src-mq3-client-cgame-weapons-ml-893495042"></a>
### eFlags

```ml
eFlags
```

When constructing this record, `entity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L215)

<a id="field-field-mq3-client-cgame-weapons-entity-legsanim-legsanim-src-mq3-client-cgame-weapons-ml-784370354"></a>
### legsAnim

```ml
legsAnim
```

When constructing this record, `entity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L237)

<a id="field-field-mq3-client-cgame-weapons-entity-lightningfiring-lightningfiring-src-mq3-client-cgame-weapons-ml-255287846"></a>
### lightningFiring

```ml
lightningFiring
```

True while the player is continuously firing the lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L227)

<a id="field-field-mq3-client-cgame-weapons-entity-muzzleflashtime-muzzleflashtime-src-mq3-client-cgame-weapons-ml-573068450"></a>
### muzzleFlashTime

```ml
muzzleFlashTime
```

Client timestamp at which the entity's muzzle-flash effect began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L225)

<a id="field-field-mq3-client-cgame-weapons-entity-number-number-src-mq3-client-cgame-weapons-ml-532124288"></a>
### number

```ml
number
```

When constructing this record, `entity` supplies `number` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L209)

<a id="field-field-mq3-client-cgame-weapons-entity-origin-origin-src-mq3-client-cgame-weapons-ml-794015542"></a>
### origin

```ml
origin
```

World-space weapon-owner position used to derive muzzle and attached-weapon placement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L219)

<a id="field-field-mq3-client-cgame-weapons-entity-powerups-powerups-src-mq3-client-cgame-weapons-ml-447938520"></a>
### powerups

```ml
powerups
```

Active PW_* bitmask used when selecting weapon-related powerup effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L217)

<a id="field-field-mq3-client-cgame-weapons-entity-railgunflash-railgunflash-src-mq3-client-cgame-weapons-ml-1398584842"></a>
### railgunFlash

```ml
railgunFlash
```

True while the railgun's muzzle-flash effect should be emitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L229)

<a id="field-field-mq3-client-cgame-weapons-entity-railgunimpact-railgunimpact-src-mq3-client-cgame-weapons-ml-1341125106"></a>
### railgunImpact

```ml
railgunImpact
```

World-space endpoint of the last railgun impact used by the weapon effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L231)

<a id="field-field-mq3-client-cgame-weapons-entity-trailtime-trailtime-src-mq3-client-cgame-weapons-ml-1128907354"></a>
### trailTime

```ml
trailTime
```

Last trail-emission time, allowing missile trails to catch up across dropped packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L223)

<a id="field-field-mq3-client-cgame-weapons-entity-weapon-weapon-src-mq3-client-cgame-weapons-ml-814311274"></a>
### weapon

```ml
weapon
```

Native weapon identifier carried by the player or projectile entity being rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_weapons.ml#L213)
