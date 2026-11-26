# `mq3.renderer.image_registry.UploadPlan`

[Home](README.md) · [Source file](File-src-mq3-renderer-image-registry-ml-1972611638.md)

<a id="struct-struct-mq3-renderer-image-registry-uploadplan-struct-uploadplan-src-mq3-renderer-image-registry-ml-585989009"></a>
## UploadPlan

```ml
struct UploadPlan
```

Data record for `mq3.renderer.image_registry.UploadPlan`; groups `uploadWidth`, `uploadHeight`, `internalFormat`, `samples`, `lightMap`, `levels`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L71)

## Members

<a id="field-field-mq3-renderer-image-registry-uploadplan-internalformat-internalformat-src-mq3-renderer-image-registry-ml-459989267"></a>
### internalFormat

```ml
internalFormat
```

Graphics-driver format selected for the uploaded texture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L77)

<a id="field-field-mq3-renderer-image-registry-uploadplan-levels-levels-src-mq3-renderer-image-registry-ml-2118588157"></a>
### levels

```ml
levels
```

Image levels generated for the texture's mipmap chain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L83)

<a id="field-field-mq3-renderer-image-registry-uploadplan-lightmap-lightmap-src-mq3-renderer-image-registry-ml-2122690187"></a>
### lightMap

```ml
lightMap
```

Baked-lighting texture coordinates or resource associated with this vertex or patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L81)

<a id="field-field-mq3-renderer-image-registry-uploadplan-samples-samples-src-mq3-renderer-image-registry-ml-1098423143"></a>
### samples

```ml
samples
```

Number of color components retained in the uploaded image format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L79)

<a id="field-field-mq3-renderer-image-registry-uploadplan-uploadheight-uploadheight-src-mq3-renderer-image-registry-ml-506237379"></a>
### uploadHeight

```ml
uploadHeight
```

Height in pixels of the image submitted to the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L75)

<a id="field-field-mq3-renderer-image-registry-uploadplan-uploadwidth-uploadwidth-src-mq3-renderer-image-registry-ml-1941700179"></a>
### uploadWidth

```ml
uploadWidth
```

Width in pixels of the image submitted to the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_registry.ml#L73)
