# `mq3.client.cgame_predict.RunContext`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-predict-ml-1773632218.md)

<a id="struct-struct-mq3-client-cgame-predict-runcontext-struct-runcontext-src-mq3-client-cgame-predict-ml-51983131"></a>
## RunContext

```ml
struct RunContext
```

Stores client game predict run context record, including `observer`, `services`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L110)

## Members

<a id="field-field-mq3-client-cgame-predict-runcontext-observer-observer-src-mq3-client-cgame-predict-ml-444697"></a>
### observer

```ml
observer
```

When constructing this record, `predict` supplies `state` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L112)

<a id="field-field-mq3-client-cgame-predict-runcontext-services-services-src-mq3-client-cgame-predict-ml-1685843425"></a>
### services

```ml
services
```

Service callbacks and context used to access the host engine from this client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L114)
