# `mq3.client.cl_cgame_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-client-cl-cgame-runtime-ml-51368453.md)

<a id="struct-struct-mq3-client-cl-cgame-runtime-services-struct-services-src-mq3-client-cl-cgame-runtime-ml-883075783"></a>
## Services

```ml
struct Services
```

Stores engine client client game runtime host-service callbacks, including `context`, `addCommandFn`, `errorFn`, `loadMapFn`, `systemInfoFn`, `debugFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L37)

## Members

<a id="field-field-mq3-client-cl-cgame-runtime-services-addcommandfn-addcommandfn-src-mq3-client-cl-cgame-runtime-ml-833428163"></a>
### addCommandFn

```ml
addCommandFn
```

Host callback for the add command operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L43)

<a id="field-field-mq3-client-cl-cgame-runtime-services-clearnotifyfn-clearnotifyfn-src-mq3-client-cl-cgame-runtime-ml-665268063"></a>
### clearNotifyFn

```ml
clearNotifyFn
```

Host callback for the clear notify operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L56)

<a id="field-field-mq3-client-cl-cgame-runtime-services-closeconsolefn-closeconsolefn-src-mq3-client-cl-cgame-runtime-ml-1793893769"></a>
### closeConsoleFn

```ml
closeConsoleFn
```

Host callback for the close console operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L59)

<a id="field-field-mq3-client-cl-cgame-runtime-services-context-context-src-mq3-client-cl-cgame-runtime-ml-1630134339"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for the engine-side CGame runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L40)

<a id="field-field-mq3-client-cl-cgame-runtime-services-debugfn-debugfn-src-mq3-client-cl-cgame-runtime-ml-1453437595"></a>
### debugFn

```ml
debugFn
```

Host callback for the debug operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L53)

<a id="field-field-mq3-client-cl-cgame-runtime-services-errorfn-errorfn-src-mq3-client-cl-cgame-runtime-ml-835197339"></a>
### errorFn

```ml
errorFn
```

Host callback for the error operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L45)

<a id="field-field-mq3-client-cl-cgame-runtime-services-loadmapfn-loadmapfn-src-mq3-client-cl-cgame-runtime-ml-1100771227"></a>
### loadMapFn

```ml
loadMapFn
```

Host callback for the load map operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L48)

<a id="field-field-mq3-client-cl-cgame-runtime-services-queueconsolefn-queueconsolefn-src-mq3-client-cl-cgame-runtime-ml-715638619"></a>
### queueConsoleFn

```ml
queueConsoleFn
```

Host callback for the queue console operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L62)

<a id="field-field-mq3-client-cl-cgame-runtime-services-serverrunning-serverrunning-src-mq3-client-cl-cgame-runtime-ml-1455909027"></a>
### serverRunning

```ml
serverRunning
```

True when a local game server is running in the same engine instance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L64)

<a id="field-field-mq3-client-cl-cgame-runtime-services-systeminfofn-systeminfofn-src-mq3-client-cl-cgame-runtime-ml-1323951041"></a>
### systemInfoFn

```ml
systemInfoFn
```

Host callback for the system info operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L51)
