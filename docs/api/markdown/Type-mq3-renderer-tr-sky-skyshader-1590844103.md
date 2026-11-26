# `mq3.renderer.tr_sky.SkyShader`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-sky-ml-1241105341.md)

<a id="struct-struct-mq3-renderer-tr-sky-skyshader-struct-skyshader-src-mq3-renderer-tr-sky-ml-1730952865"></a>
## SkyShader

```ml
struct SkyShader
```

Data record for `mq3.renderer.tr_sky.SkyShader`; groups `outerbox`, `cloudHeight`, `stages`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L73)

## Members

<a id="field-field-mq3-renderer-tr-sky-skyshader-cloudheight-cloudheight-src-mq3-renderer-tr-sky-ml-1646501929"></a>
### cloudHeight

```ml
cloudHeight
```

Height used to project moving cloud texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L77)

<a id="field-field-mq3-renderer-tr-sky-skyshader-outerbox-outerbox-src-mq3-renderer-tr-sky-ml-1440508937"></a>
### outerbox

```ml
outerbox
```

Six images forming the outer skybox.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L75)

<a id="field-field-mq3-renderer-tr-sky-skyshader-stages-stages-src-mq3-renderer-tr-sky-ml-384800459"></a>
### stages

```ml
stages
```

Ordered material stages evaluated when the shader is drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L79)
