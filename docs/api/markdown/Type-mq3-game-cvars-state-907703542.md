# `mq3.game.cvars.State`

[Home](README.md) · [Source file](File-src-mq3-game-cvars-ml-718537019.md)

<a id="struct-struct-mq3-game-cvars-state-struct-state-src-mq3-game-cvars-ml-2087748515"></a>
## State

```ml
struct State
```

`State` record for cvars, containing `level`, `registry`, `rows`, `effectFn` and `registered` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L28)

## Members

<a id="field-field-mq3-game-cvars-state-effectfn-effectfn-src-mq3-game-cvars-ml-295977424"></a>
### effectFn

```ml
effectFn
```

Injected callback for effect; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L36)

<a id="field-field-mq3-game-cvars-state-level-level-src-mq3-game-cvars-ml-732929950"></a>
### level

```ml
level
```

Game-level state shared with the operation or runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L30)

<a id="field-field-mq3-game-cvars-state-passwordstate-passwordstate-src-mq3-game-cvars-ml-1714841142"></a>
### passwordState

```ml
passwordState
```

State tracking password changes and dependent connection settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L40)

<a id="field-field-mq3-game-cvars-state-registered-registered-src-mq3-game-cvars-ml-1692712042"></a>
### registered

```ml
registered
```

Nonzero after the relevant cvars or resources are registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L38)

<a id="field-field-mq3-game-cvars-state-registry-registry-src-mq3-game-cvars-ml-1957753108"></a>
### registry

```ml
registry
```

Registry of currently loaded preprocessor/token sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L32)

<a id="field-field-mq3-game-cvars-state-rows-rows-src-mq3-game-cvars-ml-765726796"></a>
### rows

```ml
rows
```

Console-variable table rows managed by the cvar subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L34)
