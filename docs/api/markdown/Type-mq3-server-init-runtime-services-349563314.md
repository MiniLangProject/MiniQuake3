# `mq3.server.init_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-server-init-runtime-ml-863108862.md)

<a id="struct-struct-mq3-server-init-runtime-services-struct-services-src-mq3-server-init-runtime-ml-1398491725"></a>
## Services

```ml
struct Services
```

Services record for server.init_runtime, containing `context`, `actionFn`, `randomFn`, `millisecondsFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L183)

## Members

<a id="field-field-mq3-server-init-runtime-services-actionfn-actionfn-src-mq3-server-init-runtime-ml-875465845"></a>
### actionFn

```ml
actionFn
```

Host callback that dispatches a recorded subsystem action to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L188)

<a id="field-field-mq3-server-init-runtime-services-context-context-src-mq3-server-init-runtime-ml-1427835429"></a>
### context

```ml
context
```

Caller-supplied data associated with server startup actions, random values, and initialization timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L186)

<a id="field-field-mq3-server-init-runtime-services-millisecondsfn-millisecondsfn-src-mq3-server-init-runtime-ml-1160726269"></a>
### millisecondsFn

```ml
millisecondsFn
```

Host callback that supplies the current host clock in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L192)

<a id="field-field-mq3-server-init-runtime-services-randomfn-randomfn-src-mq3-server-init-runtime-ml-970442727"></a>
### randomFn

```ml
randomFn
```

Host callback that supplies the random values used by bot selection and fuzzy logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L190)
