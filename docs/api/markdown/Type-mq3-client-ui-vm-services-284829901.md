# `mq3.client.ui_vm.Services`

[Home](README.md) · [Source file](File-src-mq3-client-ui-vm-ml-1076773103.md)

<a id="struct-struct-mq3-client-ui-vm-services-struct-services-src-mq3-client-ui-vm-ml-1091803463"></a>
## Services

```ml
struct Services
```

Stores UI vm host-service callbacks, including `machineRuntime`, `syscall`, `loadFn`, `callFn`, `freeFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L45)

## Members

<a id="field-field-mq3-client-ui-vm-services-callfn-callfn-src-mq3-client-ui-vm-ml-135069945"></a>
### callFn

```ml
callFn
```

Host callback for the call operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L53)

<a id="field-field-mq3-client-ui-vm-services-freefn-freefn-src-mq3-client-ui-vm-ml-291569453"></a>
### freeFn

```ml
freeFn
```

Host callback for the free operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L55)

<a id="field-field-mq3-client-ui-vm-services-loadfn-loadfn-src-mq3-client-ui-vm-ml-1457731289"></a>
### loadFn

```ml
loadFn
```

Host callback for the load operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L51)

<a id="field-field-mq3-client-ui-vm-services-machineruntime-machineruntime-src-mq3-client-ui-vm-ml-215031255"></a>
### machineRuntime

```ml
machineRuntime
```

When constructing this record, `services` supplies `machineRuntime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L47)

<a id="field-field-mq3-client-ui-vm-services-syscall-syscall-src-mq3-client-ui-vm-ml-1106386001"></a>
### syscall

```ml
syscall
```

When constructing this record, `services` supplies `syscall` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L49)
