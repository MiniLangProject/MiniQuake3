# `mq3.client.cgame_syscalls.Gateway`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-syscalls-ml-1820570659.md)

<a id="struct-struct-mq3-client-cgame-syscalls-gateway-struct-gateway-src-mq3-client-cgame-syscalls-ml-1587293505"></a>
## Gateway

```ml
struct Gateway
```

Stores client game syscalls gateway record, including `context`, `syscallFn`, `retailActive`, `calls`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L214)

## Members

<a id="field-field-mq3-client-cgame-syscalls-gateway-calls-calls-src-mq3-client-cgame-syscalls-ml-980303499"></a>
### calls

```ml
calls
```

When constructing this record, `dllEntry` supplies an empty list for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L224)

<a id="field-field-mq3-client-cgame-syscalls-gateway-context-context-src-mq3-client-cgame-syscalls-ml-594784651"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for the CGame syscall gateway.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L216)

<a id="field-field-mq3-client-cgame-syscalls-gateway-retailactive-retailactive-src-mq3-client-cgame-syscalls-ml-1545653481"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the CGame syscall gateway, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L221)

<a id="field-field-mq3-client-cgame-syscalls-gateway-syscallfn-syscallfn-src-mq3-client-cgame-syscalls-ml-638221791"></a>
### syscallFn

```ml
syscallFn
```

Host callback for the syscall operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_syscalls.ml#L218)
