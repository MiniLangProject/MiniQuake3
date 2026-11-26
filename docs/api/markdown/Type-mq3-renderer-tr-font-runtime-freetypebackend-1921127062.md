# `mq3.renderer.tr_font_runtime.FreeTypeBackend`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-font-runtime-ml-1181758530.md)

<a id="struct-struct-mq3-renderer-tr-font-runtime-freetypebackend-struct-freetypebackend-src-mq3-renderer-tr-font-runtime-ml-2054090481"></a>
## FreeTypeBackend

```ml
struct FreeTypeBackend
```

Callback table for `mq3.renderer.tr_font_runtime.FreeTypeBackend`; exposes `context`, `rasterizeFn`, `createImageFn`, `saveFontData`, `outputRoot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L132)

## Members

<a id="field-field-mq3-renderer-tr-font-runtime-freetypebackend-context-context-src-mq3-renderer-tr-font-runtime-ml-85657367"></a>
### context

```ml
context
```

Font-backend state passed to glyph rasterization and atlas-image creation callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L134)

<a id="field-field-mq3-renderer-tr-font-runtime-freetypebackend-createimagefn-createimagefn-src-mq3-renderer-tr-font-runtime-ml-1202590647"></a>
### createImageFn

```ml
createImageFn
```

Host callback used to perform create image operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L138)

<a id="field-field-mq3-renderer-tr-font-runtime-freetypebackend-outputroot-outputroot-src-mq3-renderer-tr-font-runtime-ml-19894301"></a>
### outputRoot

```ml
outputRoot
```

Directory under which generated font assets are written.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L142)

<a id="field-field-mq3-renderer-tr-font-runtime-freetypebackend-rasterizefn-rasterizefn-src-mq3-renderer-tr-font-runtime-ml-1609210395"></a>
### rasterizeFn

```ml
rasterizeFn
```

Host callback used to perform rasterize operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L136)

<a id="field-field-mq3-renderer-tr-font-runtime-freetypebackend-savefontdata-savefontdata-src-mq3-renderer-tr-font-runtime-ml-2091417567"></a>
### saveFontData

```ml
saveFontData
```

Whether generated font metadata is saved by the backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_font_runtime.ml#L140)
