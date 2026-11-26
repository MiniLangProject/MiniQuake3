# `src/mq3/renderer/image_registry.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.image_registry`](Package-mq3-renderer-image-registry-800987808.md)

Reachable from entry: **yes**

## Imports

- `mq3/renderer/image_processing.ml` as `processing` → [src/mq3/renderer/image_processing.ml](File-src-mq3-renderer-image-processing-ml-681348538.md)
- `mq3/renderer/tga.ml` as `tga` → [src/mq3/renderer/tga.ml](File-src-mq3-renderer-tga-ml-193567265.md)

## Declarations

<a id="function-function-mq3-renderer-image-registry-cached-function-cached-registry-name-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-image-registry-ml-265921005"></a>
### cached

```ml
function cached(registry, name, mipmap, allowPicmip, wrapClampMode)
```

Finds an image by exact name in its hash bucket and warns when cached mipmap/picmip/wrap settings differ.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record providing `registry.buckets`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.image_registry.hashValue`. |
| `mipmap` | `dynamic` | — | Input tested by `image.mipmap!=mipmap`. |
| `allowPicmip` | `dynamic` | — | Input tested by `image.allowPicmip!=allowPicmip`. |
| `wrapClampMode` | `dynamic` | — | Input tested by `image.wrapClampMode!=wrapClampMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L332)

<a id="function-function-mq3-renderer-image-registry-copypixels-function-copypixels-pixels-count-src-mq3-renderer-image-registry-ml-1020229160"></a>
### copyPixels

```ml
function copyPixels(pixels, count)
```

Builds `output[i]` in `mq3.renderer.image_registry.copyPixels`; returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Indexed input read at `i`. |
| `count` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L208)

<a id="function-function-mq3-renderer-image-registry-create-function-create-config-host-activetexture-src-mq3-renderer-image-registry-ml-898577301"></a>
### create

```ml
function create(config, host, activeTexture)
```

Builds `mq3.renderer.image_registry.Registry` for `mq3.renderer.image_registry.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Initial value for `mq3.renderer.image_registry.Registry.config`. |
| `host` | `dynamic` | — | Initial value for `mq3.renderer.image_registry.Registry.services`. |
| `activeTexture` | `dynamic` | — | Initial value for `mq3.renderer.image_registry.Registry.activeTexture`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L163)

<a id="function-function-mq3-renderer-image-registry-createimage-function-createimage-registry-name-pixels-width-height-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-image-registry-ml-2022738023"></a>
### createImage

```ml
function createImage(registry, name, pixels, width, height, mipmap, allowPicmip, wrapClampMode)
```

Updates `registry.images`, `registry.buckets[hash]` in `mq3.renderer.image_registry.createImage`; returns `image`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Mutable record or buffer; this call updates `registry.images`, `registry.buckets[hash]`. |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `pixels` | `dynamic` | — | Value forwarded as `pixels` to `mq3.renderer.image_registry.prepareUpload`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.image_registry.prepareUpload`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.image_registry.prepareUpload`. |
| `mipmap` | `dynamic` | — | Value forwarded as `mipmap` to `mq3.renderer.image_registry.prepareUpload`. |
| `allowPicmip` | `dynamic` | — | Value forwarded as `allowPicmip` to `mq3.renderer.image_registry.prepareUpload`. |
| `wrapClampMode` | `dynamic` | — | Value used for `mq3.renderer.image_registry.Image.wrapClampMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L304)

<a id="function-function-mq3-renderer-image-registry-downsample-function-downsample-pixels-width-height-simple-src-mq3-renderer-image-registry-ml-1666238682"></a>
### downsample

```ml
function downsample(pixels, width, height, simple)
```

Returns `processing.mipMapFiltered(pixels,width,height)` from `mq3.renderer.image_registry.downsample`; earlier branches return `processing.mipMapSimple(pixels,width,height)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.image_processing.mipMapSimple`. |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.image_processing.mipMapSimple`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.image_processing.mipMapSimple`. |
| `simple` | `dynamic` | — | Input tested by `simple or width<2 or height<2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L241)

<a id="function-function-mq3-renderer-image-registry-fail-function-fail-message-src-mq3-renderer-image-registry-ml-21445415"></a>
### fail

```ml
function fail(message)
```

Creates error `7170` with message `"image registry: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7170,"image registry: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L143)

<a id="constant-constant-mq3-renderer-image-registry-file-hash-size-const-file-hash-size-1024-src-mq3-renderer-image-registry-ml-1582681164"></a>
### FILE_HASH_SIZE

```ml
const FILE_HASH_SIZE = 1024
```

Number of buckets in the image-name hash table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L9)

<a id="function-function-mq3-renderer-image-registry-findimagefile-function-findimagefile-registry-name-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-image-registry-ml-565322573"></a>
### findImageFile

```ml
function findImageFile(registry, name, mipmap, allowPicmip, wrapClampMode)
```

Computes `findImageFile` from `cached(registry,name,mipmap,allowPicmip,wrapClampMode)` using `mq3.renderer.image_registry.cached`, `registry.services.loadFn`, `mq3.renderer.image_registry.upperExtension`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record providing `registry.services`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.image_registry.cached`. |
| `mipmap` | `dynamic` | — | Value forwarded as `mipmap` to `mq3.renderer.image_registry.cached`. |
| `allowPicmip` | `dynamic` | — | Value forwarded as `allowPicmip` to `mq3.renderer.image_registry.cached`. |
| `wrapClampMode` | `dynamic` | — | Value forwarded as `wrapClampMode` to `mq3.renderer.image_registry.cached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L362)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgb4-s3tc-const-gl-rgb4-s3tc-33697-src-mq3-renderer-image-registry-ml-1392716421"></a>
### GL_RGB4_S3TC

```ml
const GL_RGB4_S3TC = 33697
```

OpenGL legacy RGB4_S3TC compressed RGB texture-format selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L29)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgb5-const-gl-rgb5-32848-src-mq3-renderer-image-registry-ml-924601464"></a>
### GL_RGB5

```ml
const GL_RGB5 = 32848
```

OpenGL internal texture format with five bits per red, green, and blue component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L21)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgb8-const-gl-rgb8-32849-src-mq3-renderer-image-registry-ml-29617149"></a>
### GL_RGB8

```ml
const GL_RGB8 = 32849
```

OpenGL internal texture format with eight bits per red, green, and blue component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L23)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgba4-const-gl-rgba4-32854-src-mq3-renderer-image-registry-ml-511016605"></a>
### GL_RGBA4

```ml
const GL_RGBA4 = 32854
```

OpenGL internal texture format with four bits per red, green, blue, and alpha component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L25)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgba8-const-gl-rgba8-32856-src-mq3-renderer-image-registry-ml-311155595"></a>
### GL_RGBA8

```ml
const GL_RGBA8 = 32856
```

OpenGL internal texture format with eight bits per red, green, blue, and alpha component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L27)

<a id="function-function-mq3-renderer-image-registry-hashvalue-function-hashvalue-name-src-mq3-renderer-image-registry-ml-1194706673"></a>
### hashValue

```ml
function hashValue(name)
```

Exact generateHashValue spelling rules: ASCII case fold, slash fold, extension omitted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L172)

<a id="function-function-mq3-renderer-image-registry-identitytable-function-identitytable-src-mq3-renderer-image-registry-ml-227752340"></a>
### identityTable

```ml
function identityTable()
```

Builds `table[i]` in `mq3.renderer.image_registry.identityTable`; returns `table`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L146)

- [mq3.renderer.image_registry.Image](Type-mq3-renderer-image-registry-image-1377316799.md) — struct
<a id="function-function-mq3-renderer-image-registry-internalformat-function-internalformat-pixels-width-height-lightmap-texturebits-texturecompression-src-mq3-renderer-image-registry-ml-1586012538"></a>
### internalFormat

```ml
function internalFormat(pixels, width, height, lightMap, textureBits, textureCompression)
```

Computes `internalFormat` from `[4,4]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Indexed input read at `i*4+3`. |
| `width` | `dynamic` | — | Input used by `for i=0 to width*height-1`. |
| `height` | `dynamic` | — | Input used by `for i=0 to width*height-1`. |
| `lightMap` | `dynamic` | — | Input tested by `lightMap`. |
| `textureBits` | `dynamic` | — | Input tested by `textureBits==16`. |
| `textureCompression` | `dynamic` | — | Input tested by `textureCompression==TC_S3TC`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L219)

<a id="constant-constant-mq3-renderer-image-registry-max-drawimages-const-max-drawimages-2048-src-mq3-renderer-image-registry-ml-496522855"></a>
### MAX_DRAWIMAGES

```ml
const MAX_DRAWIMAGES = 2048
```

Maximum number of images retained by the renderer's image registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L11)

<a id="constant-constant-mq3-renderer-image-registry-max-qpath-const-max-qpath-64-src-mq3-renderer-image-registry-ml-1888476515"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```

Capacity of a Quake virtual-path buffer, including the terminating byte in the native ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L13)

<a id="function-function-mq3-renderer-image-registry-nextpower-function-nextpower-value-src-mq3-renderer-image-registry-ml-1154342581"></a>
### nextPower

```ml
function nextPower(value)
```

Returns `result` from `mq3.renderer.image_registry.nextPower`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used by `while result<value result=result<<1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L201)

<a id="function-function-mq3-renderer-image-registry-prepareupload-function-prepareupload-pixels-width-height-mipmap-allowpicmip-lightmap-config-src-mq3-renderer-image-registry-ml-20124507"></a>
### prepareUpload

```ml
function prepareUpload(pixels, width, height, mipmap, allowPicmip, lightMap, config)
```

Produces every byte payload which Upload32 would hand to qglTexImage2D.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Value forwarded as `pixels` to `mq3.renderer.image_registry.internalFormat`. |
| `width` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.image_registry.nextPower`. |
| `height` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.image_registry.nextPower`. |
| `mipmap` | `dynamic` | — | Input tested by `scaledWidth==workWidth and scaledHeight==workHeight and not mipmap`. |
| `allowPicmip` | `dynamic` | — | Input tested by `allowPicmip`. |
| `lightMap` | `dynamic` | — | Initial value for `mq3.renderer.image_registry.UploadPlan.lightMap`. |
| `config` | `dynamic` | — | Record providing `config.maxTextureSize`, `config.picmip`, `config.roundImagesDown`, `config.textureBits`, `config.textureCompression`, `config.simpleMipMaps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L254)

- [mq3.renderer.image_registry.Registry](Type-mq3-renderer-image-registry-registry-1291358881.md) — struct
<a id="function-function-mq3-renderer-image-registry-services-function-services-src-mq3-renderer-image-registry-ml-78575804"></a>
### services

```ml
function services()
```

Constructs `mq3.renderer.image_registry.Services` with `loadFn` = `void`, `releaseFn` = `void`, `submitFn` = `void`, `diagnosticFn` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L157)

- [mq3.renderer.image_registry.Services](Type-mq3-renderer-image-registry-services-1332376806.md) — struct
- [mq3.renderer.image_registry.Source](Type-mq3-renderer-image-registry-source-488858519.md) — struct
<a id="function-function-mq3-renderer-image-registry-sourcefromtga-function-sourcefromtga-data-src-mq3-renderer-image-registry-ml-1941782418"></a>
### sourceFromTga

```ml
function sourceFromTga(data)
```

Builds `mq3.renderer.image_registry.Source` using `mq3.renderer.tga.decode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.tga.decode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L194)

<a id="function-function-mq3-renderer-image-registry-startslightmap-function-startslightmap-name-src-mq3-renderer-image-registry-ml-193035375"></a>
### startsLightmap

```ml
function startsLightmap(name)
```

Returns `decode(slice(bytes(name),0,9))=="*lightmap"` from `mq3.renderer.image_registry.startsLightmap`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L187)

<a id="constant-constant-mq3-renderer-image-registry-tc-none-const-tc-none-0-src-mq3-renderer-image-registry-ml-2075562713"></a>
### TC_NONE

```ml
const TC_NONE = 0
```

Texture-compression mode indicating that textures remain uncompressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L17)

<a id="constant-constant-mq3-renderer-image-registry-tc-s3tc-const-tc-s3tc-1-src-mq3-renderer-image-registry-ml-1558749592"></a>
### TC_S3TC

```ml
const TC_S3TC = 1
```

Texture-compression mode using the S3TC extension.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L19)

<a id="constant-constant-mq3-renderer-image-registry-texnum-base-const-texnum-base-1024-src-mq3-renderer-image-registry-ml-1171370244"></a>
### TEXNUM_BASE

```ml
const TEXNUM_BASE = 1024
```

First texture-object identifier reserved for registered renderer images.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L15)

<a id="function-function-mq3-renderer-image-registry-uploadconfig-function-uploadconfig-src-mq3-renderer-image-registry-ml-1969623064"></a>
### uploadConfig

```ml
function uploadConfig()
```

Builds `mq3.renderer.image_registry.UploadConfig` for `mq3.renderer.image_registry.uploadConfig`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L151)

- [mq3.renderer.image_registry.UploadConfig](Type-mq3-renderer-image-registry-uploadconfig-2058784205.md) — struct
- [mq3.renderer.image_registry.UploadLevel](Type-mq3-renderer-image-registry-uploadlevel-239060255.md) — struct
- [mq3.renderer.image_registry.UploadPlan](Type-mq3-renderer-image-registry-uploadplan-2077590968.md) — struct
<a id="function-function-mq3-renderer-image-registry-upperextension-function-upperextension-name-src-mq3-renderer-image-registry-ml-1643047039"></a>
### upperExtension

```ml
function upperExtension(name)
```

Builds `data[i]` in `mq3.renderer.image_registry.upperExtension`; returns `decode(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L350)

<a id="function-function-mq3-renderer-image-registry-warn-function-warn-registry-text-src-mq3-renderer-image-registry-ml-1064293824"></a>
### warn

```ml
function warn(registry, text)
```

Forwards an image-registry diagnostic to the optional host callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record providing `registry.services`. |
| `text` | `dynamic` | — | Argument 2 supplied to `registry.services.diagnosticFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L322)
