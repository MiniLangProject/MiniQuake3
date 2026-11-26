# `mq3.renderer.tr_backend_runtime.RawUpload`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-rawupload-struct-rawupload-src-mq3-renderer-tr-backend-runtime-ml-1271709631"></a>
## RawUpload

```ml
struct RawUpload
```

Data record for `mq3.renderer.tr_backend_runtime.RawUpload`; groups `client`, `width`, `height`, `pixels`, `fullUpload`, `dirty`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L166)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-rawupload-client-client-src-mq3-renderer-tr-backend-runtime-ml-885820314"></a>
### client

```ml
client
```

Cinematic client or scratch-image slot associated with the raw image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L168)

<a id="field-field-mq3-renderer-tr-backend-runtime-rawupload-dirty-dirty-src-mq3-renderer-tr-backend-runtime-ml-620130148"></a>
### dirty

```ml
dirty
```

Whether the stored image differs from the graphics-driver copy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L178)

<a id="field-field-mq3-renderer-tr-backend-runtime-rawupload-fullupload-fullupload-src-mq3-renderer-tr-backend-runtime-ml-1811545276"></a>
### fullUpload

```ml
fullUpload
```

Whether all image pixels must be uploaded to the graphics backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L176)

<a id="field-field-mq3-renderer-tr-backend-runtime-rawupload-height-height-src-mq3-renderer-tr-backend-runtime-ml-829392678"></a>
### height

```ml
height
```

Height in pixels of the raw or cinematic image being uploaded to its scratch texture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L172)

<a id="field-field-mq3-renderer-tr-backend-runtime-rawupload-pixels-pixels-src-mq3-renderer-tr-backend-runtime-ml-996328658"></a>
### pixels

```ml
pixels
```

Decoded pixel data for the image or upload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L174)

<a id="field-field-mq3-renderer-tr-backend-runtime-rawupload-width-width-src-mq3-renderer-tr-backend-runtime-ml-1431088092"></a>
### width

```ml
width
```

Width in pixels of the raw or cinematic image being uploaded to its scratch texture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L170)
