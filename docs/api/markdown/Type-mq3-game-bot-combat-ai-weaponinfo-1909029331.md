# `mq3.game.bot_combat_ai.WeaponInfo`

[Home](README.md) · [Source file](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)

<a id="struct-struct-mq3-game-bot-combat-ai-weaponinfo-struct-weaponinfo-src-mq3-game-bot-combat-ai-ml-1811530527"></a>
## WeaponInfo

```ml
struct WeaponInfo
```

`WeaponInfo` record for bot combat ai, containing `number`, `speed`, `offset`, `vspread` and `hspread` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L155)

## Members

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-damage-damage-src-mq3-game-bot-combat-ai-ml-559946579"></a>
### damage

```ml
damage
```

Damage amount applied by this entity, attack, or operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L171)

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-damagetype-damagetype-src-mq3-game-bot-combat-ai-ml-19354563"></a>
### damageType

```ml
damageType
```

Weapon damage-category flags describing the attack effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L167)

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-flags-flags-src-mq3-game-bot-combat-ai-ml-43959305"></a>
### flags

```ml
flags
```

WFL_* flags controlling bot weapon firing behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L173)

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-hspread-hspread-src-mq3-game-bot-combat-ai-ml-1686403525"></a>
### hspread

```ml
hspread
```

Horizontal spread applied when generating a weapon shot direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L165)

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-number-number-src-mq3-game-bot-combat-ai-ml-768408947"></a>
### number

```ml
number
```

Weapon identifier associated with these combat characteristics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L157)

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-offset-offset-src-mq3-game-bot-combat-ai-ml-1738420379"></a>
### offset

```ml
offset
```

Vector offset of the projectile launch position relative to the weapon origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L161)

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-radius-radius-src-mq3-game-bot-combat-ai-ml-892472349"></a>
### radius

```ml
radius
```

World-space radius used by the weapon or spatial effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L169)

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-speed-speed-src-mq3-game-bot-combat-ai-ml-1580109653"></a>
### speed

```ml
speed
```

Movement or travel speed used by this game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L159)

<a id="field-field-mq3-game-bot-combat-ai-weaponinfo-vspread-vspread-src-mq3-game-bot-combat-ai-ml-1819039141"></a>
### vspread

```ml
vspread
```

Vertical spread applied when generating a weapon shot direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L163)
