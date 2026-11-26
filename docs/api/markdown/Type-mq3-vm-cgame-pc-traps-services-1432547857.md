# `mq3.vm.cgame_pc_traps.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-cgame-pc-traps-ml-1555701781.md)

<a id="struct-struct-mq3-vm-cgame-pc-traps-services-struct-services-src-mq3-vm-cgame-pc-traps-ml-912816479"></a>
## Services

```ml
struct Services
```

Services record for vm.cgame_pc_traps, containing `context`, `addDefineFn`, `loadSourceFn`, `freeSourceFn`, `readTokenFn`, `sourceLineFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L27)

## Members

<a id="field-field-mq3-vm-cgame-pc-traps-services-adddefinefn-adddefinefn-src-mq3-vm-cgame-pc-traps-ml-1902338531"></a>
### addDefineFn

```ml
addDefineFn
```

Injected callback for add define; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L31)

<a id="field-field-mq3-vm-cgame-pc-traps-services-context-context-src-mq3-vm-cgame-pc-traps-ml-1531287787"></a>
### context

```ml
context
```

Opaque caller-supplied context available to client-game precompiler source and token callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L29)

<a id="field-field-mq3-vm-cgame-pc-traps-services-freesourcefn-freesourcefn-src-mq3-vm-cgame-pc-traps-ml-447970081"></a>
### freeSourceFn

```ml
freeSourceFn
```

Injected callback for free source; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L35)

<a id="field-field-mq3-vm-cgame-pc-traps-services-loadsourcefn-loadsourcefn-src-mq3-vm-cgame-pc-traps-ml-1792977241"></a>
### loadSourceFn

```ml
loadSourceFn
```

Injected callback for load source; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L33)

<a id="field-field-mq3-vm-cgame-pc-traps-services-readtokenfn-readtokenfn-src-mq3-vm-cgame-pc-traps-ml-1512216747"></a>
### readTokenFn

```ml
readTokenFn
```

Injected callback for read token; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L37)

<a id="field-field-mq3-vm-cgame-pc-traps-services-sourcelinefn-sourcelinefn-src-mq3-vm-cgame-pc-traps-ml-159700953"></a>
### sourceLineFn

```ml
sourceLineFn
```

Injected callback for source line; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L39)
