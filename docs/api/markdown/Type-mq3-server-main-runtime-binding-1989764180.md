# `mq3.server.main_runtime.Binding`

[Home](README.md) · [Source file](File-src-mq3-server-main-runtime-ml-68872411.md)

<a id="struct-struct-mq3-server-main-runtime-binding-struct-binding-src-mq3-server-main-runtime-ml-320980223"></a>
## Binding

```ml
struct Binding
```

Binding record for server.main_runtime, containing `state`, `services`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L384)

## Members

<a id="field-field-mq3-server-main-runtime-binding-services-services-src-mq3-server-main-runtime-ml-234476514"></a>
### services

```ml
services
```

Server host services retained by the bound connectionless and runtime adapters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L388)

<a id="field-field-mq3-server-main-runtime-binding-state-state-src-mq3-server-main-runtime-ml-1042274902"></a>
### state

```ml
state
```

Managed server runtime passed to the bound host callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L386)
