# `mq3.renderer.tr_font_runtime.Lifecycle`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-font-runtime-ml-1181758530.md)

<a id="struct-struct-mq3-renderer-tr-font-runtime-lifecycle-struct-lifecycle-src-mq3-renderer-tr-font-runtime-ml-1224353737"></a>
## Lifecycle

```ml
struct Lifecycle
```

Data record for `mq3.renderer.tr_font_runtime.Lifecycle`; groups `registry`, `registeredFontCount`, `freeTypeInitialized`, `backend`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L145)

## Members

<a id="field-field-mq3-renderer-tr-font-runtime-lifecycle-backend-backend-src-mq3-renderer-tr-font-runtime-ml-1991888761"></a>
### backend

```ml
backend
```

Backend implementation used to execute platform or drawing operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L153)

<a id="field-field-mq3-renderer-tr-font-runtime-lifecycle-freetypeinitialized-freetypeinitialized-src-mq3-renderer-tr-font-runtime-ml-368157113"></a>
### freeTypeInitialized

```ml
freeTypeInitialized
```

Whether the font rasterizer has completed initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L151)

<a id="field-field-mq3-renderer-tr-font-runtime-lifecycle-registeredfontcount-registeredfontcount-src-mq3-renderer-tr-font-runtime-ml-104058633"></a>
### registeredFontCount

```ml
registeredFontCount
```

Number of fonts registered by the font lifecycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L149)

<a id="field-field-mq3-renderer-tr-font-runtime-lifecycle-registry-registry-src-mq3-renderer-tr-font-runtime-ml-2049423443"></a>
### registry

```ml
registry
```

Resource registry used to resolve names or handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L147)
