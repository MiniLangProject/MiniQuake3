# `mq3.renderer.shader_runtime.CollapseResult`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-runtime-ml-1808980679.md)

<a id="struct-struct-mq3-renderer-shader-runtime-collapseresult-struct-collapseresult-src-mq3-renderer-shader-runtime-ml-522848283"></a>
## CollapseResult

```ml
struct CollapseResult
```

Data record for `mq3.renderer.shader_runtime.CollapseResult`; groups `collapsed`, `environment`, `blend`, `first`, `second`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L52)

## Members

<a id="field-field-mq3-renderer-shader-runtime-collapseresult-blend-blend-src-mq3-renderer-shader-runtime-ml-971669457"></a>
### blend

```ml
blend
```

Blend mode selected for the material or merged stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L58)

<a id="field-field-mq3-renderer-shader-runtime-collapseresult-collapsed-collapsed-src-mq3-renderer-shader-runtime-ml-751485593"></a>
### collapsed

```ml
collapsed
```

Whether two compatible material stages were merged into one pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L54)

<a id="field-field-mq3-renderer-shader-runtime-collapseresult-environment-environment-src-mq3-renderer-shader-runtime-ml-1022403093"></a>
### environment

```ml
environment
```

Texture-environment combine mode selected for the merged pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L56)

<a id="field-field-mq3-renderer-shader-runtime-collapseresult-first-first-src-mq3-renderer-shader-runtime-ml-1880622849"></a>
### first

```ml
first
```

First shader stage participating in the attempted multitexture collapse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L60)

<a id="field-field-mq3-renderer-shader-runtime-collapseresult-second-second-src-mq3-renderer-shader-runtime-ml-90858537"></a>
### second

```ml
second
```

Second shader stage participating in the attempted multitexture collapse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L62)
