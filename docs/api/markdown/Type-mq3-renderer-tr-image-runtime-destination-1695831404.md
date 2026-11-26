# `mq3.renderer.tr_image_runtime.Destination`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-image-runtime-ml-1468528624.md)

<a id="struct-struct-mq3-renderer-tr-image-runtime-destination-struct-destination-src-mq3-renderer-tr-image-runtime-ml-1061596931"></a>
## Destination

```ml
struct Destination
```

Data record for `mq3.renderer.tr_image_runtime.Destination`; groups `bytes`, `capacity`, `used`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L48)

## Members

<a id="field-field-mq3-renderer-tr-image-runtime-destination-bytes-bytes-src-mq3-renderer-tr-image-runtime-ml-1400208817"></a>
### bytes

```ml
bytes
```

Backing byte buffer receiving the encoded image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L50)

<a id="field-field-mq3-renderer-tr-image-runtime-destination-capacity-capacity-src-mq3-renderer-tr-image-runtime-ml-1109166481"></a>
### capacity

```ml
capacity
```

Allocated byte capacity of the encoded-image output buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L52)

<a id="field-field-mq3-renderer-tr-image-runtime-destination-used-used-src-mq3-renderer-tr-image-runtime-ml-72570427"></a>
### used

```ml
used
```

Number of encoded output bytes currently written to the destination buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L54)
