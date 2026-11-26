# `mq3.client.cgame_syscalls.DispatcherContext`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-syscalls-ml-1820570659.md)

<a id="struct-struct-mq3-client-cgame-syscalls-dispatchercontext-struct-dispatchercontext-src-mq3-client-cgame-syscalls-ml-1012333933"></a>
## DispatcherContext

```ml
struct DispatcherContext
```

Stores client game syscalls dispatcher context record, including `host`, `vm`, `base`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L227)

## Members

<a id="field-field-mq3-client-cgame-syscalls-dispatchercontext-base-base-src-mq3-client-cgame-syscalls-ml-876119259"></a>
### base

```ml
base
```

When constructing this record, `qvmGateway` supplies `base` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L233)

<a id="field-field-mq3-client-cgame-syscalls-dispatchercontext-host-host-src-mq3-client-cgame-syscalls-ml-1797759077"></a>
### host

```ml
host
```

Host-adapter callbacks and context used to execute the module's engine operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L229)

<a id="field-field-mq3-client-cgame-syscalls-dispatchercontext-vm-vm-src-mq3-client-cgame-syscalls-ml-1436984035"></a>
### vm

```ml
vm
```

When constructing this record, `qvmGateway` supplies `vm` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L231)
