# `src/mq3/renderer/tr_image_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_image_runtime`](Package-mq3-renderer-tr-image-runtime-371465274.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_jpeg.ml` as `jpeg` → [src/mq3/platform/playable_jpeg.ml](File-src-mq3-platform-playable-jpeg-ml-1311517486.md)
- `mq3/renderer/image_processing.ml` as `processing` → [src/mq3/renderer/image_processing.ml](File-src-mq3-renderer-image-processing-ml-681348538.md)
- `mq3/renderer/image_registry.ml` as `registry` → [src/mq3/renderer/image_registry.ml](File-src-mq3-renderer-image-registry-ml-1972611638.md)
- `mq3/renderer/player_skins.ml` as `skinParser` → [src/mq3/renderer/player_skins.ml](File-src-mq3-renderer-player-skins-ml-163797353.md)
- `mq3/renderer/tga.ml` as `tga` → [src/mq3/renderer/tga.ml](File-src-mq3-renderer-tga-ml-193567265.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-tr-image-runtime-clonebytedata-function-clonebytedata-data-src-mq3-renderer-tr-image-runtime-ml-151692814"></a>
### cloneByteData

```ml
function cloneByteData(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L30)

<a id="function-function-mq3-renderer-tr-image-runtime-commaparse-function-commaparse-text-offset-src-mq3-renderer-tr-image-runtime-ml-700210584"></a>
### CommaParse

```ml
function CommaParse(text, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L98)

<a id="function-function-mq3-renderer-tr-image-runtime-create-function-create-imageregistry-host-src-mq3-renderer-tr-image-runtime-ml-1184426040"></a>
### create

```ml
function create(imageRegistry, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `imageRegistry` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L25)

- [mq3.renderer.tr_image_runtime.Destination](Type-mq3-renderer-tr-image-runtime-destination-1695831404.md) — struct
<a id="function-function-mq3-renderer-tr-image-runtime-empty-output-buffer-function-empty-output-buffer-destination-src-mq3-renderer-tr-image-runtime-ml-1679091156"></a>
### empty_output_buffer

```ml
function empty_output_buffer(destination)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L133)

<a id="constant-constant-mq3-renderer-tr-image-runtime-fog-table-size-const-fog-table-size-256-src-mq3-renderer-tr-image-runtime-ml-1269088726"></a>
### FOG_TABLE_SIZE

```ml
const FOG_TABLE_SIZE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L17)

<a id="function-function-mq3-renderer-tr-image-runtime-generatehashvalue-function-generatehashvalue-name-src-mq3-renderer-tr-image-runtime-ml-1231286039"></a>
### generateHashValue

```ml
function generateHashValue(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L61)

<a id="constant-constant-mq3-renderer-tr-image-runtime-gl-clamp-const-gl-clamp-10496-src-mq3-renderer-tr-image-runtime-ml-82632549"></a>
### GL_CLAMP

```ml
const GL_CLAMP = 10496
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L16)

<a id="constant-constant-mq3-renderer-tr-image-runtime-gl-repeat-const-gl-repeat-10497-src-mq3-renderer-tr-image-runtime-ml-1510563464"></a>
### GL_REPEAT

```ml
const GL_REPEAT = 10497
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L15)

<a id="function-function-mq3-renderer-tr-image-runtime-gl-texturemode-function-gl-texturemode-state-name-src-mq3-renderer-tr-image-runtime-ml-1521465782"></a>
### GL_TextureMode

```ml
function GL_TextureMode(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L75)

<a id="function-function-mq3-renderer-tr-image-runtime-init-destination-function-init-destination-destination-src-mq3-renderer-tr-image-runtime-ml-713381220"></a>
### init_destination

```ml
function init_destination(destination)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L132)

<a id="function-function-mq3-renderer-tr-image-runtime-jpegdest-function-jpegdest-capacity-src-mq3-renderer-tr-image-runtime-ml-1340045860"></a>
### jpegDest

```ml
function jpegDest(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L131)

<a id="function-function-mq3-renderer-tr-image-runtime-loadbmp-function-loadbmp-data-src-mq3-renderer-tr-image-runtime-ml-1704073002"></a>
### LoadBMP

```ml
function LoadBMP(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L34)

<a id="function-function-mq3-renderer-tr-image-runtime-loadjpg-function-loadjpg-data-src-mq3-renderer-tr-image-runtime-ml-1156702430"></a>
### LoadJPG

```ml
function LoadJPG(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L33)

<a id="function-function-mq3-renderer-tr-image-runtime-loadpcx-function-loadpcx-data-src-mq3-renderer-tr-image-runtime-ml-1317154614"></a>
### LoadPCX

```ml
function LoadPCX(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L44)

<a id="function-function-mq3-renderer-tr-image-runtime-loadpcx32-function-loadpcx32-data-src-mq3-renderer-tr-image-runtime-ml-1681529000"></a>
### LoadPCX32

```ml
function LoadPCX32(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L58)

<a id="function-function-mq3-renderer-tr-image-runtime-loadtga-function-loadtga-data-src-mq3-renderer-tr-image-runtime-ml-36450400"></a>
### LoadTGA

```ml
function LoadTGA(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L32)

<a id="function-function-mq3-renderer-tr-image-runtime-lower-function-lower-value-src-mq3-renderer-tr-image-runtime-ml-349835263"></a>
### lower

```ml
function lower(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L27)

<a id="constant-constant-mq3-renderer-tr-image-runtime-max-skins-const-max-skins-1024-src-mq3-renderer-tr-image-runtime-ml-1570003540"></a>
### MAX_SKINS

```ml
const MAX_SKINS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L18)

<a id="function-function-mq3-renderer-tr-image-runtime-r-blendovertexture-function-r-blendovertexture-data-pixelcount-blend-src-mq3-renderer-tr-image-runtime-ml-935153154"></a>
### R_BlendOverTexture

```ml
function R_BlendOverTexture(data, pixelCount, blend)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `pixelCount` | `dynamic` | — |  |
| `blend` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L66)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createbuiltinimages-function-r-createbuiltinimages-state-src-mq3-renderer-tr-image-runtime-ml-118926349"></a>
### R_CreateBuiltinImages

```ml
function R_CreateBuiltinImages(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L87)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createdefaultimage-function-r-createdefaultimage-state-src-mq3-renderer-tr-image-runtime-ml-280633889"></a>
### R_CreateDefaultImage

```ml
function R_CreateDefaultImage(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L84)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createdlightimage-function-r-createdlightimage-state-src-mq3-renderer-tr-image-runtime-ml-1234660053"></a>
### R_CreateDlightImage

```ml
function R_CreateDlightImage(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L85)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createfogimage-function-r-createfogimage-state-src-mq3-renderer-tr-image-runtime-ml-1861691221"></a>
### R_CreateFogImage

```ml
function R_CreateFogImage(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L86)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createimage-function-r-createimage-state-name-data-width-height-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-tr-image-runtime-ml-1400085392"></a>
### R_CreateImage

```ml
function R_CreateImage(state, name, data, width, height, mipmap, allowPicmip, wrapClampMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `mipmap` | `dynamic` | — |  |
| `allowPicmip` | `dynamic` | — |  |
| `wrapClampMode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L71)

<a id="function-function-mq3-renderer-tr-image-runtime-r-deletetextures-function-r-deletetextures-state-src-mq3-renderer-tr-image-runtime-ml-594158905"></a>
### R_DeleteTextures

```ml
function R_DeleteTextures(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L96)

<a id="function-function-mq3-renderer-tr-image-runtime-r-findimagefile-function-r-findimagefile-state-name-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-tr-image-runtime-ml-377599237"></a>
### R_FindImageFile

```ml
function R_FindImageFile(state, name, mipmap, allowPicmip, wrapClampMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `mipmap` | `dynamic` | — |  |
| `allowPicmip` | `dynamic` | — |  |
| `wrapClampMode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L72)

<a id="function-function-mq3-renderer-tr-image-runtime-r-fogfactor-function-r-fogfactor-state-s-t-src-mq3-renderer-tr-image-runtime-ml-2093600562"></a>
### R_FogFactor

```ml
function R_FogFactor(state, s, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L83)

<a id="function-function-mq3-renderer-tr-image-runtime-r-gammacorrect-function-r-gammacorrect-state-data-src-mq3-renderer-tr-image-runtime-ml-516366985"></a>
### R_GammaCorrect

```ml
function R_GammaCorrect(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L73)

<a id="function-function-mq3-renderer-tr-image-runtime-r-getskinbyhandle-function-r-getskinbyhandle-state-handle-src-mq3-renderer-tr-image-runtime-ml-1872996497"></a>
### R_GetSkinByHandle

```ml
function R_GetSkinByHandle(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L128)

<a id="function-function-mq3-renderer-tr-image-runtime-r-imagelist-f-function-r-imagelist-f-state-src-mq3-renderer-tr-image-runtime-ml-1044195847"></a>
### R_ImageList_f

```ml
function R_ImageList_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L80)

<a id="function-function-mq3-renderer-tr-image-runtime-r-initfogtable-function-r-initfogtable-state-src-mq3-renderer-tr-image-runtime-ml-1641980761"></a>
### R_InitFogTable

```ml
function R_InitFogTable(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L82)

<a id="function-function-mq3-renderer-tr-image-runtime-r-initimages-function-r-initimages-state-overbright-gamma-intensity-fullscreen-colorbits-src-mq3-renderer-tr-image-runtime-ml-1707832679"></a>
### R_InitImages

```ml
function R_InitImages(state, overbright, gamma, intensity, fullscreen, colorBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `overbright` | `dynamic` | — |  |
| `gamma` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |
| `colorBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L95)

<a id="function-function-mq3-renderer-tr-image-runtime-r-initskins-function-r-initskins-state-src-mq3-renderer-tr-image-runtime-ml-1821072015"></a>
### R_InitSkins

```ml
function R_InitSkins(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L118)

<a id="function-function-mq3-renderer-tr-image-runtime-r-lightscaletexture-function-r-lightscaletexture-state-data-width-height-onlygamma-src-mq3-renderer-tr-image-runtime-ml-1989800379"></a>
### R_LightScaleTexture

```ml
function R_LightScaleTexture(state, data, width, height, onlyGamma)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `onlyGamma` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L63)

<a id="function-function-mq3-renderer-tr-image-runtime-r-loadimage-function-r-loadimage-data-name-src-mq3-renderer-tr-image-runtime-ml-1720158919"></a>
### R_LoadImage

```ml
function R_LoadImage(data, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L59)

<a id="function-function-mq3-renderer-tr-image-runtime-r-mipmap-function-r-mipmap-data-width-height-src-mq3-renderer-tr-image-runtime-ml-1557542575"></a>
### R_MipMap

```ml
function R_MipMap(data, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L64)

<a id="function-function-mq3-renderer-tr-image-runtime-r-mipmap2-function-r-mipmap2-data-width-height-src-mq3-renderer-tr-image-runtime-ml-148339529"></a>
### R_MipMap2

```ml
function R_MipMap2(data, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L65)

<a id="function-function-mq3-renderer-tr-image-runtime-r-setcolormappings-function-r-setcolormappings-state-overbright-gamma-intensity-fullscreen-colorbits-src-mq3-renderer-tr-image-runtime-ml-1613485495"></a>
### R_SetColorMappings

```ml
function R_SetColorMappings(state, overbright, gamma, intensity, fullscreen, colorBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `overbright` | `dynamic` | — |  |
| `gamma` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |
| `colorBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L88)

<a id="function-function-mq3-renderer-tr-image-runtime-r-skinlist-f-function-r-skinlist-f-state-src-mq3-renderer-tr-image-runtime-ml-1093164057"></a>
### R_SkinList_f

```ml
function R_SkinList_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L129)

<a id="function-function-mq3-renderer-tr-image-runtime-r-sumofusedimages-function-r-sumofusedimages-state-framecount-src-mq3-renderer-tr-image-runtime-ml-216058037"></a>
### R_SumOfUsedImages

```ml
function R_SumOfUsedImages(state, frameCount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `frameCount` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L79)

<a id="function-function-mq3-renderer-tr-image-runtime-re-registerskin-function-re-registerskin-state-name-src-mq3-renderer-tr-image-runtime-ml-1786403602"></a>
### RE_RegisterSkin

```ml
function RE_RegisterSkin(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L119)

<a id="function-function-mq3-renderer-tr-image-runtime-resampletexture-function-resampletexture-data-inwidth-inheight-outwidth-outheight-src-mq3-renderer-tr-image-runtime-ml-1350500368"></a>
### ResampleTexture

```ml
function ResampleTexture(data, inWidth, inHeight, outWidth, outHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `inWidth` | `dynamic` | — |  |
| `inHeight` | `dynamic` | — |  |
| `outWidth` | `dynamic` | — |  |
| `outHeight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L62)

<a id="function-function-mq3-renderer-tr-image-runtime-savejpg-function-savejpg-state-filename-quality-width-height-pixels-src-mq3-renderer-tr-image-runtime-ml-537509397"></a>
### SaveJPG

```ml
function SaveJPG(state, filename, quality, width, height, pixels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `quality` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `pixels` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L135)

<a id="function-function-mq3-renderer-tr-image-runtime-services-function-services-src-mq3-renderer-tr-image-runtime-ml-32781840"></a>
### services

```ml
function services()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L24)

- [mq3.renderer.tr_image_runtime.Services](Type-mq3-renderer-tr-image-runtime-services-1588385876.md) — struct
- [mq3.renderer.tr_image_runtime.SkinRecord](Type-mq3-renderer-tr-image-runtime-skinrecord-367827300.md) — struct
- [mq3.renderer.tr_image_runtime.State](Type-mq3-renderer-tr-image-runtime-state-1347280449.md) — struct
<a id="function-function-mq3-renderer-tr-image-runtime-term-destination-function-term-destination-destination-used-src-mq3-renderer-tr-image-runtime-ml-1688088133"></a>
### term_destination

```ml
function term_destination(destination, used)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `used` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L134)

<a id="function-function-mq3-renderer-tr-image-runtime-u16-function-u16-data-at-src-mq3-renderer-tr-image-runtime-ml-999798245"></a>
### u16

```ml
function u16(data, at)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `at` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L28)

<a id="function-function-mq3-renderer-tr-image-runtime-u32-function-u32-data-at-src-mq3-renderer-tr-image-runtime-ml-358064545"></a>
### u32

```ml
function u32(data, at)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `at` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L29)

<a id="function-function-mq3-renderer-tr-image-runtime-upload32-function-upload32-state-data-width-height-mipmap-allowpicmip-lightmap-src-mq3-renderer-tr-image-runtime-ml-1976337253"></a>
### Upload32

```ml
function Upload32(state, data, width, height, mipmap, allowPicmip, lightMap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `mipmap` | `dynamic` | — |  |
| `allowPicmip` | `dynamic` | — |  |
| `lightMap` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L70)

<a id="function-function-mq3-renderer-tr-image-runtime-warn-function-warn-state-text-src-mq3-renderer-tr-image-runtime-ml-1534089878"></a>
### warn

```ml
function warn(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_image_runtime.ml#L26)
