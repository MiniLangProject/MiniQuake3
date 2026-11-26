# `mq3.client.protocol_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-protocol-runtime-ml-1085434472.md)

<a id="struct-struct-mq3-client-protocol-runtime-runtime-struct-runtime-src-mq3-client-protocol-runtime-ml-342802783"></a>
## Runtime

```ml
struct Runtime
```

Stores protocol runtime runtime wiring and state, including `dispatcher`, `gamestateState`, `downloadState`, `downloadServices`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/protocol_runtime.ml#L12)

## Members

<a id="field-field-mq3-client-protocol-runtime-runtime-dispatcher-dispatcher-src-mq3-client-protocol-runtime-ml-57401807"></a>
### dispatcher

```ml
dispatcher
```

When constructing this record, `create` supplies `dispatcher` for this member. Used by `parse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/protocol_runtime.ml#L15)

<a id="field-field-mq3-client-protocol-runtime-runtime-downloadservices-downloadservices-src-mq3-client-protocol-runtime-ml-654948017"></a>
### downloadServices

```ml
downloadServices
```

When constructing this record, `create` supplies `downloadServices` for this member. Used by `downloadCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/protocol_runtime.ml#L24)

<a id="field-field-mq3-client-protocol-runtime-runtime-downloadstate-downloadstate-src-mq3-client-protocol-runtime-ml-2102335977"></a>
### downloadState

```ml
downloadState
```

When constructing this record, `create` supplies `download.create()` for this member. Used by `downloadCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/protocol_runtime.ml#L21)

<a id="field-field-mq3-client-protocol-runtime-runtime-gamestatestate-gamestatestate-src-mq3-client-protocol-runtime-ml-588600489"></a>
### gamestateState

```ml
gamestateState
```

When constructing this record, `create` supplies `gamestate.create()` for this member. Used by `gamestateCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/protocol_runtime.ml#L18)
