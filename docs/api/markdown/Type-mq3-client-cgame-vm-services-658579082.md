# `mq3.client.cgame_vm.Services`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-vm-ml-1871886258.md)

<a id="struct-struct-mq3-client-cgame-vm-services-struct-services-src-mq3-client-cgame-vm-ml-1744012145"></a>
## Services

```ml
struct Services
```

Stores client game vm host-service callbacks, including `machineRuntime`, `syscall`, `loadFn`, `callFn`, `freeFn`, `context` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L36)

## Members

<a id="field-field-mq3-client-cgame-vm-services-callfn-callfn-src-mq3-client-cgame-vm-ml-403095309"></a>
### callFn

```ml
callFn
```

Host callback for the call operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L44)

<a id="field-field-mq3-client-cgame-vm-services-clearnotifyfn-clearnotifyfn-src-mq3-client-cgame-vm-ml-1018486321"></a>
### clearNotifyFn

```ml
clearNotifyFn
```

Host callback for the clear notify operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L70)

<a id="field-field-mq3-client-cgame-vm-services-closeconsolefn-closeconsolefn-src-mq3-client-cgame-vm-ml-1199431063"></a>
### closeConsoleFn

```ml
closeConsoleFn
```

Host callback for the close console operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L55)

<a id="field-field-mq3-client-cgame-vm-services-context-context-src-mq3-client-cgame-vm-ml-2056725061"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for CGame virtual-machine execution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L49)

<a id="field-field-mq3-client-cgame-vm-services-endregistrationfn-endregistrationfn-src-mq3-client-cgame-vm-ml-404314689"></a>
### endRegistrationFn

```ml
endRegistrationFn
```

Host callback for the end registration operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L61)

<a id="field-field-mq3-client-cgame-vm-services-freefn-freefn-src-mq3-client-cgame-vm-ml-358699461"></a>
### freeFn

```ml
freeFn
```

Host callback for the free operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L46)

<a id="field-field-mq3-client-cgame-vm-services-loadfn-loadfn-src-mq3-client-cgame-vm-ml-2122464413"></a>
### loadFn

```ml
loadFn
```

Host callback for the load operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L42)

<a id="field-field-mq3-client-cgame-vm-services-lowmemoryfn-lowmemoryfn-src-mq3-client-cgame-vm-ml-720053001"></a>
### lowMemoryFn

```ml
lowMemoryFn
```

Host callback for the low memory operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L64)

<a id="field-field-mq3-client-cgame-vm-services-machineruntime-machineruntime-src-mq3-client-cgame-vm-ml-158483335"></a>
### machineRuntime

```ml
machineRuntime
```

When constructing this record, `services` supplies `machineRuntime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L38)

<a id="field-field-mq3-client-cgame-vm-services-millisecondsfn-millisecondsfn-src-mq3-client-cgame-vm-ml-738501261"></a>
### millisecondsFn

```ml
millisecondsFn
```

Host callback for the milliseconds operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L52)

<a id="field-field-mq3-client-cgame-vm-services-serverinfofn-serverinfofn-src-mq3-client-cgame-vm-ml-1528602247"></a>
### serverInfoFn

```ml
serverInfoFn
```

Host callback for the server info operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L58)

<a id="field-field-mq3-client-cgame-vm-services-syscall-syscall-src-mq3-client-cgame-vm-ml-1977079805"></a>
### syscall

```ml
syscall
```

When constructing this record, `services` supplies `syscall` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L40)

<a id="field-field-mq3-client-cgame-vm-services-touchmemoryfn-touchmemoryfn-src-mq3-client-cgame-vm-ml-1114631109"></a>
### touchMemoryFn

```ml
touchMemoryFn
```

Host callback for the touch memory operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L67)
