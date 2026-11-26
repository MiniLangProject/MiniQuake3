# `mq3.renderer.image_registry.Image`

[Home](README.md) · [Source file](File-src-mq3-renderer-image-registry-ml-1972611638.md)

<a id="struct-struct-mq3-renderer-image-registry-image-struct-image-src-mq3-renderer-image-registry-ml-1513480313"></a>
## Image

```ml
struct Image
```

Data record for `mq3.renderer.image_registry.Image`; groups `texnum`, `imgName`, `width`, `height`, `uploadWidth`, `uploadHeight`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L86)

## Members

<a id="field-field-mq3-renderer-image-registry-image-allowpicmip-allowpicmip-src-mq3-renderer-image-registry-ml-398913058"></a>
### allowPicmip

```ml
allowPicmip
```

Whether the global picmip reduction may downscale this image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L102)

<a id="field-field-mq3-renderer-image-registry-image-frameused-frameused-src-mq3-renderer-image-registry-ml-1707211538"></a>
### frameUsed

```ml
frameUsed
```

Most recent renderer frame in which this image was used.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L112)

<a id="field-field-mq3-renderer-image-registry-image-height-height-src-mq3-renderer-image-registry-ml-1154000996"></a>
### height

```ml
height
```

Height in pixels of the registered image before upload-specific resizing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L94)

<a id="field-field-mq3-renderer-image-registry-image-imgname-imgname-src-mq3-renderer-image-registry-ml-2078885582"></a>
### imgName

```ml
imgName
```

Virtual asset name used to register and cache the image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L90)

<a id="field-field-mq3-renderer-image-registry-image-internalformat-internalformat-src-mq3-renderer-image-registry-ml-1222937994"></a>
### internalFormat

```ml
internalFormat
```

Graphics-driver format selected for the uploaded texture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L108)

<a id="field-field-mq3-renderer-image-registry-image-mipmap-mipmap-src-mq3-renderer-image-registry-ml-2018137214"></a>
### mipmap

```ml
mipmap
```

Whether mip levels are generated or used for this image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L100)

<a id="field-field-mq3-renderer-image-registry-image-texnum-texnum-src-mq3-renderer-image-registry-ml-512751092"></a>
### texnum

```ml
texnum
```

Graphics-driver texture object identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L88)

<a id="field-field-mq3-renderer-image-registry-image-tmu-tmu-src-mq3-renderer-image-registry-ml-1745406206"></a>
### TMU

```ml
TMU
```

Texture unit on which the image is bound or managed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L106)

<a id="field-field-mq3-renderer-image-registry-image-upload-upload-src-mq3-renderer-image-registry-ml-274931832"></a>
### upload

```ml
upload
```

Prepared pixel levels and format used to upload the image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L110)

<a id="field-field-mq3-renderer-image-registry-image-uploadheight-uploadheight-src-mq3-renderer-image-registry-ml-1576706594"></a>
### uploadHeight

```ml
uploadHeight
```

Height in pixels of the image submitted to the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L98)

<a id="field-field-mq3-renderer-image-registry-image-uploadwidth-uploadwidth-src-mq3-renderer-image-registry-ml-1914147790"></a>
### uploadWidth

```ml
uploadWidth
```

Width in pixels of the image submitted to the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L96)

<a id="field-field-mq3-renderer-image-registry-image-width-width-src-mq3-renderer-image-registry-ml-927051714"></a>
### width

```ml
width
```

Width in pixels of the registered image before upload-specific resizing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L92)

<a id="field-field-mq3-renderer-image-registry-image-wrapclampmode-wrapclampmode-src-mq3-renderer-image-registry-ml-658067478"></a>
### wrapClampMode

```ml
wrapClampMode
```

Texture address mode selected at the image edges.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L104)
