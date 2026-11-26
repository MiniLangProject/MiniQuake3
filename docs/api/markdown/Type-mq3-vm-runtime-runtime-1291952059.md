# `mq3.vm.runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-vm-runtime-ml-288435087.md)

<a id="struct-struct-mq3-vm-runtime-runtime-struct-runtime-src-mq3-vm-runtime-ml-145959749"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for vm.runtime, containing `slots`, `services`, `current`, `last`, `debugLevel`, `syscallCount`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L81)

## Members

<a id="field-field-mq3-vm-runtime-runtime-current-current-src-mq3-vm-runtime-ml-76218799"></a>
### current

```ml
current
```

VM currently executing a call, or void outside VM execution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L87)

<a id="field-field-mq3-vm-runtime-runtime-debuglevel-debuglevel-src-mq3-vm-runtime-ml-1576840157"></a>
### debugLevel

```ml
debugLevel
```

Diagnostic verbosity level used by the module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L91)

<a id="field-field-mq3-vm-runtime-runtime-last-last-src-mq3-vm-runtime-ml-806810087"></a>
### last

```ml
last
```

VM that most recently executed a call.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L89)

<a id="field-field-mq3-vm-runtime-runtime-services-services-src-mq3-vm-runtime-ml-1881776935"></a>
### services

```ml
services
```

Injected service callbacks and state used to communicate with the surrounding engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L85)

<a id="field-field-mq3-vm-runtime-runtime-slots-slots-src-mq3-vm-runtime-ml-956168987"></a>
### slots

```ml
slots
```

Named VM slots managed by this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L83)

<a id="field-field-mq3-vm-runtime-runtime-syscallcount-syscallcount-src-mq3-vm-runtime-ml-904393607"></a>
### syscallCount

```ml
syscallCount
```

Number of system calls observed by the VM runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L93)

<a id="field-field-mq3-vm-runtime-runtime-syscalllog-syscalllog-src-mq3-vm-runtime-ml-1320457133"></a>
### syscallLog

```ml
syscallLog
```

Recorded VM system-call entries retained for diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/runtime.ml#L95)
