# `mq3.game.syscalls.Binding`

[Home](README.md) · [Source file](File-src-mq3-game-syscalls-ml-1705577754.md)

<a id="struct-struct-mq3-game-syscalls-binding-struct-binding-src-mq3-game-syscalls-ml-1954734581"></a>
## Binding

```ml
struct Binding
```

`Binding` record for syscalls, containing `context`, `invokeFn` and `calls`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/syscalls.ml#L18)

## Members

<a id="field-field-mq3-game-syscalls-binding-calls-calls-src-mq3-game-syscalls-ml-1320811118"></a>
### calls

```ml
calls
```

Recorded syscall/host-call requests retained for inspection or replay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/syscalls.ml#L24)

<a id="field-field-mq3-game-syscalls-binding-context-context-src-mq3-game-syscalls-ml-554876750"></a>
### context

```ml
context
```

Opaque caller-supplied context available to the bound game-module syscall invocation callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/syscalls.ml#L20)

<a id="field-field-mq3-game-syscalls-binding-invokefn-invokefn-src-mq3-game-syscalls-ml-1290822094"></a>
### invokeFn

```ml
invokeFn
```

Injected callback for invoke; invoked through the Binding service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/syscalls.ml#L22)
