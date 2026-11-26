# `mq3.game.weapon_state.State`

[Home](README.md) · [Source file](File-src-mq3-game-weapon-state-ml-1905655678.md)

<a id="struct-struct-mq3-game-weapon-state-state-struct-state-src-mq3-game-weapon-state-ml-237072049"></a>
## State

```ml
struct State
```

`State` record for weapon state, containing `quadFactor`, `forward`, `right`, `up` and `muzzle` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L7)

## Members

<a id="field-field-mq3-game-weapon-state-state-forward-forward-src-mq3-game-weapon-state-ml-375478918"></a>
### forward

```ml
forward
```

Forward direction vector derived from the current view orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L11)

<a id="field-field-mq3-game-weapon-state-state-kamikazegeneration-kamikazegeneration-src-mq3-game-weapon-state-ml-1778353136"></a>
### kamikazeGeneration

```ml
kamikazeGeneration
```

Generation marker preventing repeated damage within one kamikaze phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L23)

<a id="field-field-mq3-game-weapon-state-state-kamikazeshockgeneration-kamikazeshockgeneration-src-mq3-game-weapon-state-ml-1046961434"></a>
### kamikazeShockGeneration

```ml
kamikazeShockGeneration
```

Generation marker preventing repeated shock application within one phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L25)

<a id="field-field-mq3-game-weapon-state-state-kamikazeshocktime-kamikazeshocktime-src-mq3-game-weapon-state-ml-361440470"></a>
### kamikazeShockTime

```ml
kamikazeShockTime
```

Time controlling the next kamikaze shock-wave phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L21)

<a id="field-field-mq3-game-weapon-state-state-kamikazetime-kamikazetime-src-mq3-game-weapon-state-ml-1613489006"></a>
### kamikazeTime

```ml
kamikazeTime
```

Time controlling the next kamikaze damage phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L19)

<a id="field-field-mq3-game-weapon-state-state-muzzle-muzzle-src-mq3-game-weapon-state-ml-1638967496"></a>
### muzzle

```ml
muzzle
```

World-space muzzle position from which weapon traces or projectiles begin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L17)

<a id="field-field-mq3-game-weapon-state-state-quadfactor-quadfactor-src-mq3-game-weapon-state-ml-1785986094"></a>
### quadFactor

```ml
quadFactor
```

Damage multiplier applied by the active quad-damage effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L9)

<a id="field-field-mq3-game-weapon-state-state-right-right-src-mq3-game-weapon-state-ml-1378488790"></a>
### right

```ml
right
```

Right direction vector derived from the current view orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L13)

<a id="field-field-mq3-game-weapon-state-state-up-up-src-mq3-game-weapon-state-ml-1411306332"></a>
### up

```ml
up
```

Up direction vector derived from the current view orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/weapon_state.ml#L15)
