# `mq3.server.game_vm.Services`

[Home](README.md) · [Source file](File-src-mq3-server-game-vm-ml-2099996303.md)

<a id="struct-struct-mq3-server-game-vm-services-struct-services-src-mq3-server-game-vm-ml-939423531"></a>
## Services

```ml
struct Services
```

Services record for server.game_vm, containing `machineRuntime`, `syscall`, `loadFn`, `callFn`, `restartFn`, `freeFn`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L31)

## Members

<a id="field-field-mq3-server-game-vm-services-botenablefn-botenablefn-src-mq3-server-game-vm-ml-420762585"></a>
### botEnableFn

```ml
botEnableFn
```

Host callback that reports whether server bot processing is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L53)

<a id="field-field-mq3-server-game-vm-services-callfn-callfn-src-mq3-server-game-vm-ml-880801745"></a>
### callFn

```ml
callFn
```

Host callback that invokes a game-VM export with the supplied arguments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L39)

<a id="field-field-mq3-server-game-vm-services-clearcliententityfn-clearcliententityfn-src-mq3-server-game-vm-ml-44245945"></a>
### clearClientEntityFn

```ml
clearClientEntityFn
```

Host callback that clears the game-entity association for a client slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L51)

<a id="field-field-mq3-server-game-vm-services-context-context-src-mq3-server-game-vm-ml-1162939993"></a>
### context

```ml
context
```

Caller-supplied data associated with game VM loading, invocation, restart, and release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L45)

<a id="field-field-mq3-server-game-vm-services-entitystringfn-entitystringfn-src-mq3-server-game-vm-ml-1354145721"></a>
### entityStringFn

```ml
entityStringFn
```

Host callback that returns the textual BSP entity definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L49)

<a id="field-field-mq3-server-game-vm-services-freefn-freefn-src-mq3-server-game-vm-ml-904353613"></a>
### freeFn

```ml
freeFn
```

Host callback that releases host-managed memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L43)

<a id="field-field-mq3-server-game-vm-services-loadfn-loadfn-src-mq3-server-game-vm-ml-1032982097"></a>
### loadFn

```ml
loadFn
```

Host callback that loads the requested resource through the host interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L37)

<a id="field-field-mq3-server-game-vm-services-machineruntime-machineruntime-src-mq3-server-game-vm-ml-2060479187"></a>
### machineRuntime

```ml
machineRuntime
```

Runtime used to load and execute the game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L33)

<a id="field-field-mq3-server-game-vm-services-millisecondsfn-millisecondsfn-src-mq3-server-game-vm-ml-380404657"></a>
### millisecondsFn

```ml
millisecondsFn
```

Host callback that supplies the current host clock in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L47)

<a id="field-field-mq3-server-game-vm-services-restartfn-restartfn-src-mq3-server-game-vm-ml-1815502749"></a>
### restartFn

```ml
restartFn
```

Host callback that restarts the game VM for a map restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L41)

<a id="field-field-mq3-server-game-vm-services-syscall-syscall-src-mq3-server-game-vm-ml-511078761"></a>
### syscall

```ml
syscall
```

Dispatcher handling game-VM calls back into the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L35)
