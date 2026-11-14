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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `mipmap` | `dynamic` | — |  |
| `allowPicmip` | `dynamic` | — |  |
| `wrapClampMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L163)

<a id="function-function-mq3-renderer-image-registry-copypixels-function-copypixels-pixels-count-src-mq3-renderer-image-registry-ml-1020229160"></a>
### copyPixels

```ml
function copyPixels(pixels, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L76)

<a id="function-function-mq3-renderer-image-registry-create-function-create-config-host-activetexture-src-mq3-renderer-image-registry-ml-898577301"></a>
### create

```ml
function create(config, host, activeTexture)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `activeTexture` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L41)

<a id="function-function-mq3-renderer-image-registry-createimage-function-createimage-registry-name-pixels-width-height-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-image-registry-ml-2022738023"></a>
### createImage

```ml
function createImage(registry, name, pixels, width, height, mipmap, allowPicmip, wrapClampMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `pixels` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `mipmap` | `dynamic` | — |  |
| `allowPicmip` | `dynamic` | — |  |
| `wrapClampMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L144)

<a id="function-function-mq3-renderer-image-registry-downsample-function-downsample-pixels-width-height-simple-src-mq3-renderer-image-registry-ml-1666238682"></a>
### downsample

```ml
function downsample(pixels, width, height, simple)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `simple` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L97)

<a id="function-function-mq3-renderer-image-registry-fail-function-fail-message-src-mq3-renderer-image-registry-ml-21445415"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L28)

<a id="constant-constant-mq3-renderer-image-registry-file-hash-size-const-file-hash-size-1024-src-mq3-renderer-image-registry-ml-1582681164"></a>
### FILE_HASH_SIZE

```ml
const FILE_HASH_SIZE = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L8)

<a id="function-function-mq3-renderer-image-registry-findimagefile-function-findimagefile-registry-name-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-image-registry-ml-565322573"></a>
### findImageFile

```ml
function findImageFile(registry, name, mipmap, allowPicmip, wrapClampMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `mipmap` | `dynamic` | — |  |
| `allowPicmip` | `dynamic` | — |  |
| `wrapClampMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L185)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgb4-s3tc-const-gl-rgb4-s3tc-33697-src-mq3-renderer-image-registry-ml-1392716421"></a>
### GL_RGB4_S3TC

```ml
const GL_RGB4_S3TC = 33697
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L18)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgb5-const-gl-rgb5-32848-src-mq3-renderer-image-registry-ml-924601464"></a>
### GL_RGB5

```ml
const GL_RGB5 = 32848
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L14)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgb8-const-gl-rgb8-32849-src-mq3-renderer-image-registry-ml-29617149"></a>
### GL_RGB8

```ml
const GL_RGB8 = 32849
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L15)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgba4-const-gl-rgba4-32854-src-mq3-renderer-image-registry-ml-511016605"></a>
### GL_RGBA4

```ml
const GL_RGBA4 = 32854
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L16)

<a id="constant-constant-mq3-renderer-image-registry-gl-rgba8-const-gl-rgba8-32856-src-mq3-renderer-image-registry-ml-311155595"></a>
### GL_RGBA8

```ml
const GL_RGBA8 = 32856
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L17)

<a id="function-function-mq3-renderer-image-registry-hashvalue-function-hashvalue-name-src-mq3-renderer-image-registry-ml-1194706673"></a>
### hashValue

```ml
function hashValue(name)
```

Exact generateHashValue spelling rules: ASCII case fold, slash fold, extension omitted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L49)

<a id="function-function-mq3-renderer-image-registry-identitytable-function-identitytable-src-mq3-renderer-image-registry-ml-227752340"></a>
### identityTable

```ml
function identityTable()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L30)

- [mq3.renderer.image_registry.Image](Type-mq3-renderer-image-registry-image-1377316799.md) — struct
<a id="function-function-mq3-renderer-image-registry-internalformat-function-internalformat-pixels-width-height-lightmap-texturebits-texturecompression-src-mq3-renderer-image-registry-ml-1586012538"></a>
### internalFormat

```ml
function internalFormat(pixels, width, height, lightMap, textureBits, textureCompression)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `lightMap` | `dynamic` | — |  |
| `textureBits` | `dynamic` | — |  |
| `textureCompression` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L80)

<a id="constant-constant-mq3-renderer-image-registry-max-drawimages-const-max-drawimages-2048-src-mq3-renderer-image-registry-ml-496522855"></a>
### MAX_DRAWIMAGES

```ml
const MAX_DRAWIMAGES = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L9)

<a id="constant-constant-mq3-renderer-image-registry-max-qpath-const-max-qpath-64-src-mq3-renderer-image-registry-ml-1888476515"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L10)

<a id="function-function-mq3-renderer-image-registry-nextpower-function-nextpower-value-src-mq3-renderer-image-registry-ml-1154342581"></a>
### nextPower

```ml
function nextPower(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L72)

<a id="function-function-mq3-renderer-image-registry-prepareupload-function-prepareupload-pixels-width-height-mipmap-allowpicmip-lightmap-config-src-mq3-renderer-image-registry-ml-20124507"></a>
### prepareUpload

```ml
function prepareUpload(pixels, width, height, mipmap, allowPicmip, lightMap, config)
```

Produces every byte payload which Upload32 would hand to qglTexImage2D.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `mipmap` | `dynamic` | — |  |
| `allowPicmip` | `dynamic` | — |  |
| `lightMap` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L103)

- [mq3.renderer.image_registry.Registry](Type-mq3-renderer-image-registry-registry-1291358881.md) — struct
<a id="function-function-mq3-renderer-image-registry-services-function-services-src-mq3-renderer-image-registry-ml-78575804"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L39)

- [mq3.renderer.image_registry.Services](Type-mq3-renderer-image-registry-services-1332376806.md) — struct
- [mq3.renderer.image_registry.Source](Type-mq3-renderer-image-registry-source-488858519.md) — struct
<a id="function-function-mq3-renderer-image-registry-sourcefromtga-function-sourcefromtga-data-src-mq3-renderer-image-registry-ml-1941782418"></a>
### sourceFromTga

```ml
function sourceFromTga(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L67)

<a id="function-function-mq3-renderer-image-registry-startslightmap-function-startslightmap-name-src-mq3-renderer-image-registry-ml-193035375"></a>
### startsLightmap

```ml
function startsLightmap(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L62)

<a id="constant-constant-mq3-renderer-image-registry-tc-none-const-tc-none-0-src-mq3-renderer-image-registry-ml-2075562713"></a>
### TC_NONE

```ml
const TC_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L12)

<a id="constant-constant-mq3-renderer-image-registry-tc-s3tc-const-tc-s3tc-1-src-mq3-renderer-image-registry-ml-1558749592"></a>
### TC_S3TC

```ml
const TC_S3TC = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L13)

<a id="constant-constant-mq3-renderer-image-registry-texnum-base-const-texnum-base-1024-src-mq3-renderer-image-registry-ml-1171370244"></a>
### TEXNUM_BASE

```ml
const TEXNUM_BASE = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L11)

<a id="function-function-mq3-renderer-image-registry-uploadconfig-function-uploadconfig-src-mq3-renderer-image-registry-ml-1969623064"></a>
### uploadConfig

```ml
function uploadConfig()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L34)

- [mq3.renderer.image_registry.UploadConfig](Type-mq3-renderer-image-registry-uploadconfig-2058784205.md) — struct
- [mq3.renderer.image_registry.UploadLevel](Type-mq3-renderer-image-registry-uploadlevel-239060255.md) — struct
- [mq3.renderer.image_registry.UploadPlan](Type-mq3-renderer-image-registry-uploadplan-2077590968.md) — struct
<a id="function-function-mq3-renderer-image-registry-upperextension-function-upperextension-name-src-mq3-renderer-image-registry-ml-1643047039"></a>
### upperExtension

```ml
function upperExtension(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L179)

<a id="function-function-mq3-renderer-image-registry-warn-function-warn-registry-text-src-mq3-renderer-image-registry-ml-1064293824"></a>
### warn

```ml
function warn(registry, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_registry.ml#L159)
