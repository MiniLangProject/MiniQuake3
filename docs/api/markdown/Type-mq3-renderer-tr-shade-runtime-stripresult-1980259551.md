# `mq3.renderer.tr_shade_runtime.StripResult`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-stripresult-struct-stripresult-src-mq3-renderer-tr-shade-runtime-ml-306480221"></a>
## StripResult

```ml
struct StripResult
```

Data record for `mq3.renderer.tr_shade_runtime.StripResult`; groups `strips`, `begins`, `vertexes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L31)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-stripresult-begins-begins-src-mq3-renderer-tr-shade-runtime-ml-2057222248"></a>
### begins

```ml
begins
```

Number of graphics primitive-begin operations required by the strip plan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L35)

<a id="field-field-mq3-renderer-tr-shade-runtime-stripresult-strips-strips-src-mq3-renderer-tr-shade-runtime-ml-754899082"></a>
### strips

```ml
strips
```

Triangle strips produced by index-stream conversion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L33)

<a id="field-field-mq3-renderer-tr-shade-runtime-stripresult-vertexes-vertexes-src-mq3-renderer-tr-shade-runtime-ml-1670833356"></a>
### vertexes

```ml
vertexes
```

Number of vertex emissions needed by the generated triangle strips.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L37)
