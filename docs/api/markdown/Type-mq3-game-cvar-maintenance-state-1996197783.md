# `mq3.game.cvar_maintenance.State`

[Home](README.md) · [Source file](File-src-mq3-game-cvar-maintenance-ml-54356974.md)

<a id="struct-struct-mq3-game-cvar-maintenance-state-struct-state-src-mq3-game-cvar-maintenance-ml-2055958593"></a>
## State

```ml
struct State
```

`State` record for cvar maintenance, containing `password`, `passwordModificationCount` and `lastPasswordModificationCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvar_maintenance.ml#L8)

## Members

<a id="field-field-mq3-game-cvar-maintenance-state-lastpasswordmodificationcount-lastpasswordmodificationcount-src-mq3-game-cvar-maintenance-ml-2141618506"></a>
### lastPasswordModificationCount

```ml
lastPasswordModificationCount
```

Password revision already propagated to the dependent setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvar_maintenance.ml#L14)

<a id="field-field-mq3-game-cvar-maintenance-state-password-password-src-mq3-game-cvar-maintenance-ml-692577884"></a>
### password

```ml
password
```

Current server password used by connection checks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvar_maintenance.ml#L10)

<a id="field-field-mq3-game-cvar-maintenance-state-passwordmodificationcount-passwordmodificationcount-src-mq3-game-cvar-maintenance-ml-135527614"></a>
### passwordModificationCount

```ml
passwordModificationCount
```

Revision counter of the password console variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvar_maintenance.ml#L12)
