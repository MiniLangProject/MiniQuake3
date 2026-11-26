# `mq3.server.init_runtime.SharedEntity`

[Home](README.md) · [Source file](File-src-mq3-server-init-runtime-ml-863108862.md)

<a id="struct-struct-mq3-server-init-runtime-sharedentity-struct-sharedentity-src-mq3-server-init-runtime-ml-239678285"></a>
## SharedEntity

```ml
struct SharedEntity
```

SharedEntity record for server.init_runtime, containing `linked`, `state`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L83)

## Members

<a id="field-field-mq3-server-init-runtime-sharedentity-linked-linked-src-mq3-server-init-runtime-ml-1428188929"></a>
### linked

```ml
linked
```

True when this entity or resource is linked into the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L85)

<a id="field-field-mq3-server-init-runtime-sharedentity-state-state-src-mq3-server-init-runtime-ml-2066645947"></a>
### state

```ml
state
```

Network-visible entity state shared with the game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L87)
