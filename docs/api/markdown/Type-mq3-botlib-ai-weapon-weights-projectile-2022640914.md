# `mq3.botlib.ai_weapon_weights.Projectile`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-weapon-weights-ml-776993711.md)

<a id="struct-struct-mq3-botlib-ai-weapon-weights-projectile-struct-projectile-src-mq3-botlib-ai-weapon-weights-ml-696145395"></a>
## Projectile

```ml
struct Projectile
```

`Projectile` record for ai weapon weights, containing `name`, `model`, `flags`, `gravity` and `damage` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L24)

## Members

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-bounce-bounce-src-mq3-botlib-ai-weapon-weights-ml-1693220090"></a>
### bounce

```ml
bounce
```

Bounce coefficient used by the projectile simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L48)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-bouncefriction-bouncefriction-src-mq3-botlib-ai-weapon-weights-ml-619671478"></a>
### bounceFriction

```ml
bounceFriction
```

Velocity reduction applied when the projectile bounces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L50)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-bouncestop-bouncestop-src-mq3-botlib-ai-weapon-weights-ml-711295338"></a>
### bounceStop

```ml
bounceStop
```

Speed threshold below which projectile bouncing stops.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L52)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-damage-damage-src-mq3-botlib-ai-weapon-weights-ml-1236238672"></a>
### damage

```ml
damage
```

Base damage caused by the projectile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L34)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-damagetype-damagetype-src-mq3-botlib-ai-weapon-weights-ml-2085783368"></a>
### damageType

```ml
damageType
```

Bit mask describing impact, radial, or visibility-dependent damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L40)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-detonation-detonation-src-mq3-botlib-ai-weapon-weights-ml-51807948"></a>
### detonation

```ml
detonation
```

Delay or condition value controlling projectile detonation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L46)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-flags-flags-src-mq3-botlib-ai-weapon-weights-ml-48304838"></a>
### flags

```ml
flags
```

Projectile behavior properties combined from PFL flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L30)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-gravity-gravity-src-mq3-botlib-ai-weapon-weights-ml-1394438214"></a>
### gravity

```ml
gravity
```

Gravity magnitude used when predicting movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L32)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-healthincrease-healthincrease-src-mq3-botlib-ai-weapon-weights-ml-1747553862"></a>
### healthIncrease

```ml
healthIncrease
```

Health adjustment associated with the projectile's effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L42)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-model-model-src-mq3-botlib-ai-weapon-weights-ml-1756544822"></a>
### model

```ml
model
```

Asset model configured for the projectile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L28)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-name-name-src-mq3-botlib-ai-weapon-weights-ml-1845901732"></a>
### name

```ml
name
```

Projectile-definition name referenced by weapon configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L26)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-push-push-src-mq3-botlib-ai-weapon-weights-ml-778646134"></a>
### push

```ml
push
```

Push force associated with the projectile's impact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L44)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-radius-radius-src-mq3-botlib-ai-weapon-weights-ml-1565767782"></a>
### radius

```ml
radius
```

Radius of the represented sphere or capsule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L36)

<a id="field-field-mq3-botlib-ai-weapon-weights-projectile-visibledamage-visibledamage-src-mq3-botlib-ai-weapon-weights-ml-2112903374"></a>
### visibleDamage

```ml
visibleDamage
```

Damage considered when the target has line of sight to the projectile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L38)
