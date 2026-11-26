# `mq3.botlib.ai_weight_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-weight-runtime-ml-1778350864.md)

<a id="struct-struct-mq3-botlib-ai-weight-runtime-state-struct-state-src-mq3-botlib-ai-weight-runtime-ml-1560471563"></a>
## State

```ml
struct State
```

`State` record for ai weight runtime, containing `weights`, `context`, `writeFn`, `randomFn` and `diagnostics`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L12)

## Members

<a id="field-field-mq3-botlib-ai-weight-runtime-state-context-context-src-mq3-botlib-ai-weight-runtime-ml-1945207712"></a>
### context

```ml
context
```

Caller-supplied data associated with saving fuzzy-weight files and choosing genetic mutations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L16)

<a id="field-field-mq3-botlib-ai-weight-runtime-state-diagnostics-diagnostics-src-mq3-botlib-ai-weight-runtime-ml-482218528"></a>
### diagnostics

```ml
diagnostics
```

Diagnostics collected while processing the subsystem's requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L22)

<a id="field-field-mq3-botlib-ai-weight-runtime-state-randomfn-randomfn-src-mq3-botlib-ai-weight-runtime-ml-2133383310"></a>
### randomFn

```ml
randomFn
```

Host callback that supplies the random values used by bot selection and fuzzy logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L20)

<a id="field-field-mq3-botlib-ai-weight-runtime-state-weights-weights-src-mq3-botlib-ai-weight-runtime-ml-744203456"></a>
### weights

```ml
weights
```

Fuzzy-weight configurations registered with the combined weight runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L14)

<a id="field-field-mq3-botlib-ai-weight-runtime-state-writefn-writefn-src-mq3-botlib-ai-weight-runtime-ml-1235478644"></a>
### writeFn

```ml
writeFn
```

Host callback that writes data through the host output interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weight_runtime.ml#L18)
