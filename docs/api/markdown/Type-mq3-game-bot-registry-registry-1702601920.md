# `mq3.game.bot_registry.Registry`

[Home](README.md) · [Source file](File-src-mq3-game-bot-registry-ml-1422489899.md)

<a id="struct-struct-mq3-game-bot-registry-registry-struct-registry-src-mq3-game-bot-registry-ml-827188311"></a>
## Registry

```ml
struct Registry
```

`Registry` record for bot registry, containing `botInfos`, `arenaInfos`, `readFileFn`, `listFilesFn` and `printFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L15)

## Members

<a id="field-field-mq3-game-bot-registry-registry-arenainfos-arenainfos-src-mq3-game-bot-registry-ml-881331598"></a>
### arenaInfos

```ml
arenaInfos
```

Parsed arena/map definitions used by game selection and bot setup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L19)

<a id="field-field-mq3-game-bot-registry-registry-botinfos-botinfos-src-mq3-game-bot-registry-ml-1383096930"></a>
### botInfos

```ml
botInfos
```

Parsed bot definitions available for bot creation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L17)

<a id="field-field-mq3-game-bot-registry-registry-context-context-src-mq3-game-bot-registry-ml-760912442"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot and arena definition file-loading, file-listing, and print callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L28)

<a id="field-field-mq3-game-bot-registry-registry-listfilesfn-listfilesfn-src-mq3-game-bot-registry-ml-941874178"></a>
### listFilesFn

```ml
listFilesFn
```

Injected callback for list files; invoked through the Registry service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L23)

<a id="field-field-mq3-game-bot-registry-registry-printfn-printfn-src-mq3-game-bot-registry-ml-1433271162"></a>
### printFn

```ml
printFn
```

Injected callback for print; invoked through the Registry service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L25)

<a id="field-field-mq3-game-bot-registry-registry-readfilefn-readfilefn-src-mq3-game-bot-registry-ml-1358023242"></a>
### readFileFn

```ml
readFileFn
```

Injected callback for read file; invoked through the Registry service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L21)
