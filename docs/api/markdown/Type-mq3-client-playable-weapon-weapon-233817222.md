# `mq3.client.playable_weapon.Weapon`

[Home](README.md) · [Source file](File-src-mq3-client-playable-weapon-ml-1762261884.md)

<a id="struct-struct-mq3-client-playable-weapon-weapon-struct-weapon-src-mq3-client-playable-weapon-ml-777595771"></a>
## Weapon

```ml
struct Weapon
```

Stores playable weapon weapon record, including `traceFn`, `context`, `ammo`, `capacity`, `cooldownMilliseconds`, `cooldownRemaining` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L20)

## Members

<a id="field-field-mq3-client-playable-weapon-weapon-ammo-ammo-src-mq3-client-playable-weapon-ml-2106277265"></a>
### ammo

```ml
ammo
```

Ammunition quantity or ammunition state associated with the selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L26)

<a id="field-field-mq3-client-playable-weapon-weapon-automatic-automatic-src-mq3-client-playable-weapon-ml-1145019009"></a>
### automatic

```ml
automatic
```

When constructing this record, `createWithTrace` supplies `automatic` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L36)

<a id="field-field-mq3-client-playable-weapon-weapon-capacity-capacity-src-mq3-client-playable-weapon-ml-899875701"></a>
### capacity

```ml
capacity
```

Maximum number of entries or allocation units supported by the bounded storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L28)

<a id="field-field-mq3-client-playable-weapon-weapon-classname-classname-src-mq3-client-playable-weapon-ml-550978277"></a>
### classname

```ml
classname
```

Weapon item classname used to select firing behavior and corresponding weapon resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L42)

<a id="field-field-mq3-client-playable-weapon-weapon-context-context-src-mq3-client-playable-weapon-ml-933020817"></a>
### context

```ml
context
```

When constructing this record, `createWithTrace` supplies `context` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L24)

<a id="field-field-mq3-client-playable-weapon-weapon-cooldownmilliseconds-cooldownmilliseconds-src-mq3-client-playable-weapon-ml-90340691"></a>
### cooldownMilliseconds

```ml
cooldownMilliseconds
```

When constructing this record, `createWithTrace` supplies `cooldownMilliseconds` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L30)

<a id="field-field-mq3-client-playable-weapon-weapon-cooldownremaining-cooldownremaining-src-mq3-client-playable-weapon-ml-132503849"></a>
### cooldownRemaining

```ml
cooldownRemaining
```

When constructing this record, `createWithTrace` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L32)

<a id="field-field-mq3-client-playable-weapon-weapon-damage-damage-src-mq3-client-playable-weapon-ml-1536383635"></a>
### damage

```ml
damage
```

Damage amount applied or reported by the weapon, projectile, or hit result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L44)

<a id="field-field-mq3-client-playable-weapon-weapon-noammoevent-noammoevent-src-mq3-client-playable-weapon-ml-926415461"></a>
### noAmmoEvent

```ml
noAmmoEvent
```

When constructing this record, `createWithTrace` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L46)

<a id="field-field-mq3-client-playable-weapon-weapon-range-range-src-mq3-client-playable-weapon-ml-1136009609"></a>
### range

```ml
range
```

When constructing this record, `createWithTrace` supplies `numeric.f32(range)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L34)

<a id="field-field-mq3-client-playable-weapon-weapon-shotsfired-shotsfired-src-mq3-client-playable-weapon-ml-62046575"></a>
### shotsFired

```ml
shotsFired
```

When constructing this record, `createWithTrace` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L40)

<a id="field-field-mq3-client-playable-weapon-weapon-tracefn-tracefn-src-mq3-client-playable-weapon-ml-2084130781"></a>
### traceFn

```ml
traceFn
```

Host callback for the trace operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L22)

<a id="field-field-mq3-client-playable-weapon-weapon-triggerheld-triggerheld-src-mq3-client-playable-weapon-ml-547520605"></a>
### triggerHeld

```ml
triggerHeld
```

When constructing this record, `createWithTrace` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon.ml#L38)
