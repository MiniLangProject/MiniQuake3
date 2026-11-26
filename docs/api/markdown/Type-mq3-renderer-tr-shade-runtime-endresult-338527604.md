# `mq3.renderer.tr_shade_runtime.EndResult`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-endresult-struct-endresult-src-mq3-renderer-tr-shade-runtime-ml-288401603"></a>
## EndResult

```ml
struct EndResult
```

Data record for `mq3.renderer.tr_shade_runtime.EndResult`; groups `skipped`, `shadow`, `counters`, `iteratorResult`, `debugTris`, `debugNormals`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L152)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-endresult-counters-counters-src-mq3-renderer-tr-shade-runtime-ml-561059947"></a>
### counters

```ml
counters
```

Drawing statistics accumulated while finishing the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L158)

<a id="field-field-mq3-renderer-tr-shade-runtime-endresult-debugnormals-debugnormals-src-mq3-renderer-tr-shade-runtime-ml-2030114295"></a>
### debugNormals

```ml
debugNormals
```

Debug geometry used to show the submitted vertex normals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L164)

<a id="field-field-mq3-renderer-tr-shade-runtime-endresult-debugtris-debugtris-src-mq3-renderer-tr-shade-runtime-ml-1392679669"></a>
### debugTris

```ml
debugTris
```

Debug geometry used to show the submitted triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L162)

<a id="field-field-mq3-renderer-tr-shade-runtime-endresult-iteratorresult-iteratorresult-src-mq3-renderer-tr-shade-runtime-ml-272527955"></a>
### iteratorResult

```ml
iteratorResult
```

Result returned by the shader's selected drawing iterator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L160)

<a id="field-field-mq3-renderer-tr-shade-runtime-endresult-shadow-shadow-src-mq3-renderer-tr-shade-runtime-ml-1194876885"></a>
### shadow

```ml
shadow
```

Whether this result belongs to the shadow drawing path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L156)

<a id="field-field-mq3-renderer-tr-shade-runtime-endresult-skipped-skipped-src-mq3-renderer-tr-shade-runtime-ml-695407165"></a>
### skipped

```ml
skipped
```

Whether the requested surface drawing operation was omitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L154)
