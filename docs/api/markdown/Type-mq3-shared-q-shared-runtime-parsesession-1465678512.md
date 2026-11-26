# `mq3.shared.q_shared_runtime.ParseSession`

[Home](README.md) · [Source file](File-src-mq3-shared-q-shared-runtime-ml-1830953505.md)

<a id="struct-struct-mq3-shared-q-shared-runtime-parsesession-struct-parsesession-src-mq3-shared-q-shared-runtime-ml-1161430403"></a>
## ParseSession

```ml
struct ParseSession
```

ParseSession record for shared.q_shared_runtime, containing `name`, `state`, `diagnostics`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L19)

## Members

<a id="field-field-mq3-shared-q-shared-runtime-parsesession-diagnostics-diagnostics-src-mq3-shared-q-shared-runtime-ml-952103952"></a>
### diagnostics

```ml
diagnostics
```

Collected parser or operation diagnostics retained for the caller.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L25)

<a id="field-field-mq3-shared-q-shared-runtime-parsesession-name-name-src-mq3-shared-q-shared-runtime-ml-818380830"></a>
### name

```ml
name
```

Diagnostic name of the active parse session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L21)

<a id="field-field-mq3-shared-q-shared-runtime-parsesession-state-state-src-mq3-shared-q-shared-runtime-ml-348928436"></a>
### state

```ml
state
```

Shared token-parser state retained across parse calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_runtime.ml#L23)
