# `mq3.game.cvars.Row`

[Home](README.md) · [Source file](File-src-mq3-game-cvars-ml-718537019.md)

<a id="struct-struct-mq3-game-cvars-row-struct-row-src-mq3-game-cvars-ml-484342985"></a>
## Row

```ml
struct Row
```

`Row` record for cvars, containing `vmName`, `name`, `defaultString`, `flags` and `modificationCount` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L9)

## Members

<a id="field-field-mq3-game-cvars-row-defaultstring-defaultstring-src-mq3-game-cvars-ml-1618283195"></a>
### defaultString

```ml
defaultString
```

Default textual value registered for the console variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L15)

<a id="field-field-mq3-game-cvars-row-flags-flags-src-mq3-game-cvars-ml-231857583"></a>
### flags

```ml
flags
```

Console-variable registration flags supplied to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L17)

<a id="field-field-mq3-game-cvars-row-modificationcount-modificationcount-src-mq3-game-cvars-ml-1355774587"></a>
### modificationCount

```ml
modificationCount
```

Revision counter incremented when the console variable changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L19)

<a id="field-field-mq3-game-cvars-row-name-name-src-mq3-game-cvars-ml-1520065673"></a>
### name

```ml
name
```

Engine console-variable name registered by this row.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L13)

<a id="field-field-mq3-game-cvars-row-teamshader-teamshader-src-mq3-game-cvars-ml-1937704111"></a>
### teamShader

```ml
teamShader
```

Nonzero when changing this console variable requires refreshing team shaders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L23)

<a id="field-field-mq3-game-cvars-row-trackchange-trackchange-src-mq3-game-cvars-ml-795146891"></a>
### trackChange

```ml
trackChange
```

Nonzero when changes to this console variable need processing or announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L21)

<a id="field-field-mq3-game-cvars-row-vm-vm-src-mq3-game-cvars-ml-278243621"></a>
### vm

```ml
vm
```

VM instance or VM-facing console-variable record associated with this adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L25)

<a id="field-field-mq3-game-cvars-row-vmname-vmname-src-mq3-game-cvars-ml-2027417259"></a>
### vmName

```ml
vmName
```

Name used for the console variable in the VM-facing cvar table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L11)
