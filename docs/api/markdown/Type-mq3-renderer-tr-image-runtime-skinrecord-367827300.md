# `mq3.renderer.tr_image_runtime.SkinRecord`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-image-runtime-ml-1468528624.md)

<a id="struct-struct-mq3-renderer-tr-image-runtime-skinrecord-struct-skinrecord-src-mq3-renderer-tr-image-runtime-ml-165471877"></a>
## SkinRecord

```ml
struct SkinRecord
```

Data record for `mq3.renderer.tr_image_runtime.SkinRecord`; groups `name`, `skin`, `surfaces`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L39)

## Members

<a id="field-field-mq3-renderer-tr-image-runtime-skinrecord-name-name-src-mq3-renderer-tr-image-runtime-ml-1655862027"></a>
### name

```ml
name
```

Registered skin name or shader fallback name used by skin lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L41)

<a id="field-field-mq3-renderer-tr-image-runtime-skinrecord-skin-skin-src-mq3-renderer-tr-image-runtime-ml-448394927"></a>
### skin

```ml
skin
```

Parsed skin definition assigning shaders to model surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L43)

<a id="field-field-mq3-renderer-tr-image-runtime-skinrecord-surfaces-surfaces-src-mq3-renderer-tr-image-runtime-ml-804534741"></a>
### surfaces

```ml
surfaces
```

Pairs mapping lower-case model-surface names to shader names.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L45)
