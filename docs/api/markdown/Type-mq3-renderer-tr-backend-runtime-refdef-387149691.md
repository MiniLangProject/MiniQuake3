# `mq3.renderer.tr_backend_runtime.Refdef`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-refdef-struct-refdef-src-mq3-renderer-tr-backend-runtime-ml-1745510679"></a>
## Refdef

```ml
struct Refdef
```

Data record for `mq3.renderer.tr_backend_runtime.Refdef`; groups `time`, `floatTime`, `rdflags`, `entities`, `dlights`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L126)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-refdef-dlights-dlights-src-mq3-renderer-tr-backend-runtime-ml-2048811739"></a>
### dlights

```ml
dlights
```

Dynamic lights submitted to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L136)

<a id="field-field-mq3-renderer-tr-backend-runtime-refdef-entities-entities-src-mq3-renderer-tr-backend-runtime-ml-921967761"></a>
### entities

```ml
entities
```

Entity records associated with the current world, scene, or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L134)

<a id="field-field-mq3-renderer-tr-backend-runtime-refdef-floattime-floattime-src-mq3-renderer-tr-backend-runtime-ml-106959795"></a>
### floatTime

```ml
floatTime
```

View time expressed in seconds for shader calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L130)

<a id="field-field-mq3-renderer-tr-backend-runtime-refdef-rdflags-rdflags-src-mq3-renderer-tr-backend-runtime-ml-597359715"></a>
### rdflags

```ml
rdflags
```

Bit mask of view-level rendering options such as no-world or hyperspace rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L132)

<a id="field-field-mq3-renderer-tr-backend-runtime-refdef-time-time-src-mq3-renderer-tr-backend-runtime-ml-19336081"></a>
### time

```ml
time
```

Backend view time in milliseconds, also converted to floating-point seconds for shader evaluation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L128)
