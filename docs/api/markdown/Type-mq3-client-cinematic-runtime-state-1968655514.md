# `mq3.client.cinematic_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)

<a id="struct-struct-mq3-client-cinematic-runtime-state-struct-state-src-mq3-client-cinematic-runtime-ml-1641369523"></a>
## State

```ml
struct State
```

Stores cinematic runtime state, including `archive`, `handles`, `drawQueue`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L137)

## Members

<a id="field-field-mq3-client-cinematic-runtime-state-archive-archive-src-mq3-client-cinematic-runtime-ml-734391698"></a>
### archive

```ml
archive
```

When constructing this record, `create` supplies `archive` for this member. Used by `play` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L140)

<a id="field-field-mq3-client-cinematic-runtime-state-drawqueue-drawqueue-src-mq3-client-cinematic-runtime-ml-1853461602"></a>
### drawQueue

```ml
drawQueue
```

When constructing this record, `create` supplies `lists.List.withCapacity(16)` for this member. Used by `draw` and `takeDraws` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L146)

<a id="field-field-mq3-client-cinematic-runtime-state-handles-handles-src-mq3-client-cinematic-runtime-ml-1882888438"></a>
### handles

```ml
handles
```

When constructing this record, `create` supplies `array(MAX_HANDLES,void)` for this member. Used by `validHandle` and `freeHandle` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L143)
