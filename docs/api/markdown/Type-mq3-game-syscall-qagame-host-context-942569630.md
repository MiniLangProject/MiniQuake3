# `mq3.game.syscall_qagame_host.Context`

[Home](README.md) · [Source file](File-src-mq3-game-syscall-qagame-host-ml-1706413645.md)

<a id="struct-struct-mq3-game-syscall-qagame-host-context-struct-context-src-mq3-game-syscall-qagame-host-ml-1198464427"></a>
## Context

```ml
struct Context
```

`Context` record for syscall qagame host, containing `services`, `vm` and `base`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/syscall_qagame_host.ml#L11)

## Members

<a id="field-field-mq3-game-syscall-qagame-host-context-base-base-src-mq3-game-syscall-qagame-host-ml-1270751606"></a>
### base

```ml
base
```

Byte offset in QVM data memory where the syscall argument vector is written.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/syscall_qagame_host.ml#L17)

<a id="field-field-mq3-game-syscall-qagame-host-context-services-services-src-mq3-game-syscall-qagame-host-ml-180759352"></a>
### services

```ml
services
```

Injected service callbacks and state used to communicate with the surrounding engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/syscall_qagame_host.ml#L13)

<a id="field-field-mq3-game-syscall-qagame-host-context-vm-vm-src-mq3-game-syscall-qagame-host-ml-1858051738"></a>
### vm

```ml
vm
```

VM instance or VM-facing console-variable record associated with this adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/syscall_qagame_host.ml#L15)
