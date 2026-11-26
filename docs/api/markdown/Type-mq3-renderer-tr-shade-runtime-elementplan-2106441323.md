# `mq3.renderer.tr_shade_runtime.ElementPlan`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-elementplan-struct-elementplan-src-mq3-renderer-tr-shade-runtime-ml-201931741"></a>
## ElementPlan

```ml
struct ElementPlan
```

Data record for `mq3.renderer.tr_shade_runtime.ElementPlan`; groups `mode`, `strips`, `indexCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L40)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-elementplan-indexcount-indexcount-src-mq3-renderer-tr-shade-runtime-ml-1188115438"></a>
### indexCount

```ml
indexCount
```

Number of vertex indices submitted by the drawing plan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L46)

<a id="field-field-mq3-renderer-tr-shade-runtime-elementplan-mode-mode-src-mq3-renderer-tr-shade-runtime-ml-571332886"></a>
### mode

```ml
mode
```

Index-submission strategy: triangles, strip arrays, discrete strips, or none.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L42)

<a id="field-field-mq3-renderer-tr-shade-runtime-elementplan-strips-strips-src-mq3-renderer-tr-shade-runtime-ml-1270928390"></a>
### strips

```ml
strips
```

Triangle strips produced by index-stream conversion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L44)
