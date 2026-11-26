# `mq3.client.system_info.Binding`

[Home](README.md) · [Source file](File-src-mq3-client-system-info-ml-628530239.md)

<a id="struct-struct-mq3-client-system-info-binding-struct-binding-src-mq3-client-system-info-ml-2006491243"></a>
## Binding

```ml
struct Binding
```

Stores system info binding record, including `state`, `services`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L42)

## Members

<a id="field-field-mq3-client-system-info-binding-services-services-src-mq3-client-system-info-ml-1991278498"></a>
### services

```ml
services
```

Service callbacks and context used to access the host engine from this client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L47)

<a id="field-field-mq3-client-system-info-binding-state-state-src-mq3-client-system-info-ml-2010678854"></a>
### state

```ml
state
```

When constructing this record, `install` supplies `state` for this member. Used by `gamestateChanged` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/system_info.ml#L45)
