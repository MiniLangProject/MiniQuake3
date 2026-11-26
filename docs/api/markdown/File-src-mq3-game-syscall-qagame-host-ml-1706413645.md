# `src/mq3/game/syscall_qagame_host.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.syscall_qagame_host`](Package-mq3-game-syscall-qagame-host-1644492259.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/syscalls.ml` as `traps` → [src/mq3/game/syscalls.ml](File-src-mq3-game-syscalls-ml-1705577754.md)
- `mq3/vm/syscall_qagame.ml` as `qagame` → [src/mq3/vm/syscall_qagame.ml](File-src-mq3-vm-syscall-qagame-ml-1544842921.md)

## Declarations

<a id="function-function-mq3-game-syscall-qagame-host-bind-function-bind-services-vm-base-src-mq3-game-syscall-qagame-host-ml-1080799174"></a>
### bind

```ml
function bind(services, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/syscall_qagame_host.ml#L29)

<a id="function-function-mq3-game-syscall-qagame-host-context-function-context-services-vm-base-src-mq3-game-syscall-qagame-host-ml-480638576"></a>
### context

```ml
function context(services, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/syscall_qagame_host.ml#L12)

- [mq3.game.syscall_qagame_host.Context](Type-mq3-game-syscall-qagame-host-context-942569630.md) — struct
<a id="function-function-mq3-game-syscall-qagame-host-invoke-function-invoke-value-opcode-arguments-src-mq3-game-syscall-qagame-host-ml-2096303493"></a>
### invoke

```ml
function invoke(value, opcode, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `opcode` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/syscall_qagame_host.ml#L18)
