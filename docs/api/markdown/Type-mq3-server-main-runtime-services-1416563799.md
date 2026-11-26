# `mq3.server.main_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-server-main-runtime-ml-68872411.md)

<a id="struct-struct-mq3-server-main-runtime-services-struct-services-src-mq3-server-main-runtime-ml-637370107"></a>
## Services

```ml
struct Services
```

Services record for server.main_runtime, containing `sendFn`, `resolveFn`, `printFn`, `dropFn`, `executeFn`, `millisecondsFn`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L137)

## Members

<a id="field-field-mq3-server-main-runtime-services-authorizefn-authorizefn-src-mq3-server-main-runtime-ml-1234748239"></a>
### authorizeFn

```ml
authorizeFn
```

Host callback that performs the host-side client authorization exchange.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L151)

<a id="field-field-mq3-server-main-runtime-services-context-context-src-mq3-server-main-runtime-ml-762227175"></a>
### context

```ml
context
```

Caller-supplied data associated with server address resolution, outgoing messages, console commands, and diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L158)

<a id="field-field-mq3-server-main-runtime-services-decompressfn-decompressfn-src-mq3-server-main-runtime-ml-64902453"></a>
### decompressFn

```ml
decompressFn
```

Host callback that decompresses a received packet payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L153)

<a id="field-field-mq3-server-main-runtime-services-diagnosticfn-diagnosticfn-src-mq3-server-main-runtime-ml-1748609433"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback that reports subsystem diagnostics to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L155)

<a id="field-field-mq3-server-main-runtime-services-dropfn-dropfn-src-mq3-server-main-runtime-ml-1256870637"></a>
### dropFn

```ml
dropFn
```

Host callback that disconnects a client and reports the supplied reason.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L145)

<a id="field-field-mq3-server-main-runtime-services-executefn-executefn-src-mq3-server-main-runtime-ml-740677683"></a>
### executeFn

```ml
executeFn
```

Host callback that executes a routed command or operation on the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L147)

<a id="field-field-mq3-server-main-runtime-services-millisecondsfn-millisecondsfn-src-mq3-server-main-runtime-ml-775513319"></a>
### millisecondsFn

```ml
millisecondsFn
```

Host callback that supplies the current host clock in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L149)

<a id="field-field-mq3-server-main-runtime-services-printfn-printfn-src-mq3-server-main-runtime-ml-1590705391"></a>
### printFn

```ml
printFn
```

Host callback that prints server runtime status, command output, and connection diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L143)

<a id="field-field-mq3-server-main-runtime-services-resolvefn-resolvefn-src-mq3-server-main-runtime-ml-1965820223"></a>
### resolveFn

```ml
resolveFn
```

Host callback that resolves a textual network address or host name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L141)

<a id="field-field-mq3-server-main-runtime-services-sendfn-sendfn-src-mq3-server-main-runtime-ml-1833195995"></a>
### sendFn

```ml
sendFn
```

Host callback that transmits the supplied message through the host network interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L139)
