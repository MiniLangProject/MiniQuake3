# `mq3.client.playable_combat_view.CombatView`

[Home](README.md) · [Source file](File-src-mq3-client-playable-combat-view-ml-1357380718.md)

<a id="struct-struct-mq3-client-playable-combat-view-combatview-struct-combatview-src-mq3-client-playable-combat-view-ml-1428171877"></a>
## CombatView

```ml
struct CombatView
```

Stores playable combat view combat view record, including `weaponName`, `score`, `kills`, `deaths`, `shots`, `hits` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L21)

## Members

<a id="field-field-mq3-client-playable-combat-view-combatview-damageamount-damageamount-src-mq3-client-playable-combat-view-ml-1948447000"></a>
### damageAmount

```ml
damageAmount
```

Nonnegative damage from the latest damage event, shown by the temporary damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L43)

<a id="field-field-mq3-client-playable-combat-view-combatview-damageside-damageside-src-mq3-client-playable-combat-view-ml-2056208622"></a>
### damageSide

```ml
damageSide
```

Signed side of the latest incoming damage: negative for left, positive for right, and zero for an unspecified side.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L46)

<a id="field-field-mq3-client-playable-combat-view-combatview-deaths-deaths-src-mq3-client-playable-combat-view-ml-622927632"></a>
### deaths

```ml
deaths
```

Recorded player deaths displayed beside the kill count in the combat overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L29)

<a id="field-field-mq3-client-playable-combat-view-combatview-hits-hits-src-mq3-client-playable-combat-view-ml-962879002"></a>
### hits

```ml
hits
```

Number of successful hit notifications recorded by the combat-feedback tracker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L33)

<a id="field-field-mq3-client-playable-combat-view-combatview-kills-kills-src-mq3-client-playable-combat-view-ml-1152830114"></a>
### kills

```ml
kills
```

Recorded kills displayed beside the death count in the combat overlay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L27)

<a id="field-field-mq3-client-playable-combat-view-combatview-lastdamage-lastdamage-src-mq3-client-playable-combat-view-ml-374632840"></a>
### lastDamage

```ml
lastDamage
```

When constructing this record, `state` supplies `-1000000` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L39)

<a id="field-field-mq3-client-playable-combat-view-combatview-lastfire-lastfire-src-mq3-client-playable-combat-view-ml-45000034"></a>
### lastFire

```ml
lastFire
```

When constructing this record, `state` supplies `-1000000` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L35)

<a id="field-field-mq3-client-playable-combat-view-combatview-lasthit-lasthit-src-mq3-client-playable-combat-view-ml-174614158"></a>
### lastHit

```ml
lastHit
```

When constructing this record, `state` supplies `-1000000` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L37)

<a id="field-field-mq3-client-playable-combat-view-combatview-lastkill-lastkill-src-mq3-client-playable-combat-view-ml-274569842"></a>
### lastKill

```ml
lastKill
```

When constructing this record, `state` supplies `-1000000` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L41)

<a id="field-field-mq3-client-playable-combat-view-combatview-score-score-src-mq3-client-playable-combat-view-ml-1994629602"></a>
### score

```ml
score
```

Current combat score exposed to the playable presentation layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L25)

<a id="field-field-mq3-client-playable-combat-view-combatview-shots-shots-src-mq3-client-playable-combat-view-ml-1737106430"></a>
### shots

```ml
shots
```

Number of firing events recorded by the combat-feedback tracker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L31)

<a id="field-field-mq3-client-playable-combat-view-combatview-weaponname-weaponname-src-mq3-client-playable-combat-view-ml-475462788"></a>
### weaponName

```ml
weaponName
```

When constructing this record, `state` supplies `weaponName` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_combat_view.ml#L23)
