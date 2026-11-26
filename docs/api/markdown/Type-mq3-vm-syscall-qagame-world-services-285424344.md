# `mq3.vm.syscall_qagame_world.Services`

[Home](README.md) · [Source file](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)

<a id="struct-struct-mq3-vm-syscall-qagame-world-services-struct-services-src-mq3-vm-syscall-qagame-world-ml-1906141109"></a>
## Services

```ml
struct Services
```

Services record for vm.syscall_qagame_world, containing `context`, `traceFn`, `pointContentsFn`, `entitiesInBoxFn`, `entityContactFn`, `getUsercmdFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L62)

## Members

<a id="field-field-mq3-vm-syscall-qagame-world-services-context-context-src-mq3-vm-syscall-qagame-world-ml-648644221"></a>
### context

```ml
context
```

Opaque caller-supplied context available to game-VM world tracing, contact tests, and user-command retrieval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L65)

<a id="field-field-mq3-vm-syscall-qagame-world-services-entitiesinboxfn-entitiesinboxfn-src-mq3-vm-syscall-qagame-world-ml-372378253"></a>
### entitiesInBoxFn

```ml
entitiesInBoxFn
```

Injected callback for entities in box; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L71)

<a id="field-field-mq3-vm-syscall-qagame-world-services-entitycontactfn-entitycontactfn-src-mq3-vm-syscall-qagame-world-ml-1228834425"></a>
### entityContactFn

```ml
entityContactFn
```

Injected callback for entity contact; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L73)

<a id="field-field-mq3-vm-syscall-qagame-world-services-getusercmdfn-getusercmdfn-src-mq3-vm-syscall-qagame-world-ml-55524859"></a>
### getUsercmdFn

```ml
getUsercmdFn
```

Injected callback for get user command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L75)

<a id="field-field-mq3-vm-syscall-qagame-world-services-pointcontentsfn-pointcontentsfn-src-mq3-vm-syscall-qagame-world-ml-1555090777"></a>
### pointContentsFn

```ml
pointContentsFn
```

Injected callback for point contents; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L69)

<a id="field-field-mq3-vm-syscall-qagame-world-services-tracefn-tracefn-src-mq3-vm-syscall-qagame-world-ml-1116410145"></a>
### traceFn

```ml
traceFn
```

Injected callback for trace; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L67)
