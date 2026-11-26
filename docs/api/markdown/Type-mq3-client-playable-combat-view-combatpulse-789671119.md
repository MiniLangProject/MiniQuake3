# `mq3.client.playable_combat_view.CombatPulse`

[Home](README.md) · [Source file](File-src-mq3-client-playable-combat-view-ml-1357380718.md)

<a id="struct-struct-mq3-client-playable-combat-view-combatpulse-struct-combatpulse-src-mq3-client-playable-combat-view-ml-957544413"></a>
## CombatPulse

```ml
struct CombatPulse
```

Stores playable combat view combat pulse record, including `recoil`, `muzzle`, `hit`, `damage`, `kill`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L49)

## Members

<a id="field-field-mq3-client-playable-combat-view-combatpulse-damage-damage-src-mq3-client-playable-combat-view-ml-1624100512"></a>
### damage

```ml
damage
```

Damage amount applied or reported by the weapon, projectile, or hit result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L60)

<a id="field-field-mq3-client-playable-combat-view-combatpulse-hit-hit-src-mq3-client-playable-combat-view-ml-500564018"></a>
### hit

```ml
hit
```

When constructing this record, `pulse` supplies `remaining(now,view.lastHit,HIT_MARK_MS)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L58)

<a id="field-field-mq3-client-playable-combat-view-combatpulse-kill-kill-src-mq3-client-playable-combat-view-ml-1655862218"></a>
### kill

```ml
kill
```

When constructing this record, `pulse` supplies `remaining(now,view.lastKill,KILL_MARK_MS)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L63)

<a id="field-field-mq3-client-playable-combat-view-combatpulse-muzzle-muzzle-src-mq3-client-playable-combat-view-ml-1526994340"></a>
### muzzle

```ml
muzzle
```

When constructing this record, `pulse` supplies `remaining(now,view.lastFire,FIRE_FLASH_MS)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L55)

<a id="field-field-mq3-client-playable-combat-view-combatpulse-recoil-recoil-src-mq3-client-playable-combat-view-ml-1003455402"></a>
### recoil

```ml
recoil
```

When constructing this record, `pulse` supplies `remaining(now,view.lastFire,RECOIL_MS)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L52)
