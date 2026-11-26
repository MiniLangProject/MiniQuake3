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
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-tr-image-runtime-clonebytedata-function-clonebytedata-data-src-mq3-renderer-tr-image-runtime-ml-151692814"></a>
### cloneByteData

```ml
function cloneByteData(data)
```

Builds `output[i]` in `mq3.renderer.tr_image_runtime.cloneByteData`; returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Indexed input read at `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L119)

<a id="function-function-mq3-renderer-tr-image-runtime-commaparse-function-commaparse-text-offset-src-mq3-renderer-tr-image-runtime-ml-700210584"></a>
### CommaParse

```ml
function CommaParse(text, offset)
```

Computes `CommaParse` from `[decode(slice(data,start,offset-start)),offset]` using `not`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `offset` | `dynamic` | — | Input tested by `text==void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L293)

<a id="function-function-mq3-renderer-tr-image-runtime-create-function-create-imageregistry-host-src-mq3-renderer-tr-image-runtime-ml-1184426040"></a>
### create

```ml
function create(imageRegistry, host)
```

Builds `mq3.renderer.tr_image_runtime.State` using `mq3.renderer.image_registry.create`, `mq3.renderer.image_registry.identityTable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `imageRegistry` | `dynamic` | — | Initial value for `mq3.renderer.tr_image_runtime.State.images`. |
| `host` | `dynamic` | — | Initial value for `mq3.renderer.tr_image_runtime.State.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L101)

- [mq3.renderer.tr_image_runtime.Destination](Type-mq3-renderer-tr-image-runtime-destination-1695831404.md) — struct
<a id="function-function-mq3-renderer-tr-image-runtime-empty-output-buffer-function-empty-output-buffer-destination-src-mq3-renderer-tr-image-runtime-ml-1679091156"></a>
### empty_output_buffer

```ml
function empty_output_buffer(destination)
```

Computes `destination!=void and destination.used<destination.capacity` for `mq3.renderer.tr_image_runtime.empty_output_buffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Record providing `destination.used`, `destination.capacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L344)

<a id="constant-constant-mq3-renderer-tr-image-runtime-fog-table-size-const-fog-table-size-256-src-mq3-renderer-tr-image-runtime-ml-1269088726"></a>
### FOG_TABLE_SIZE

```ml
const FOG_TABLE_SIZE = 256
```

Number of samples in the fog-density lookup table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L20)

<a id="function-function-mq3-renderer-tr-image-runtime-generatehashvalue-function-generatehashvalue-name-src-mq3-renderer-tr-image-runtime-ml-1231286039"></a>
### generateHashValue

```ml
function generateHashValue(name)
```

Calls `mq3.renderer.image_registry.hashValue` with `(name)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.image_registry.hashValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L165)

<a id="constant-constant-mq3-renderer-tr-image-runtime-gl-clamp-const-gl-clamp-10496-src-mq3-renderer-tr-image-runtime-ml-82632549"></a>
### GL_CLAMP

```ml
const GL_CLAMP = 10496
```

OpenGL legacy texture-wrap mode that clamps coordinates at the image border.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L18)

<a id="constant-constant-mq3-renderer-tr-image-runtime-gl-repeat-const-gl-repeat-10497-src-mq3-renderer-tr-image-runtime-ml-1510563464"></a>
### GL_REPEAT

```ml
const GL_REPEAT = 10497
```

OpenGL texture-wrap mode that periodically repeats the image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L16)

<a id="function-function-mq3-renderer-tr-image-runtime-gl-texturemode-function-gl-texturemode-state-name-src-mq3-renderer-tr-image-runtime-ml-1521465782"></a>
### GL_TextureMode

```ml
function GL_TextureMode(state, name)
```

Updates `state.filterName`, `state.filterMin`, `state.filterMax` in `mq3.renderer.tr_image_runtime.GL_TextureMode`; returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.filterName`, `state.filterMin`, `state.filterMax`. |
| `name` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_image_runtime.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L232)

<a id="function-function-mq3-renderer-tr-image-runtime-init-destination-function-init-destination-destination-src-mq3-renderer-tr-image-runtime-ml-713381220"></a>
### init_destination

```ml
function init_destination(destination)
```

Updates `destination.used` in `mq3.renderer.tr_image_runtime.init_destination`; returns `destination.capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Mutable record or buffer; this call updates `destination.used`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L341)

<a id="function-function-mq3-renderer-tr-image-runtime-jpegdest-function-jpegdest-capacity-src-mq3-renderer-tr-image-runtime-ml-1340045860"></a>
### jpegDest

```ml
function jpegDest(capacity)
```

Builds `mq3.renderer.tr_image_runtime.Destination` for `mq3.renderer.tr_image_runtime.jpegDest`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Initial value for `mq3.renderer.tr_image_runtime.Destination.capacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L338)

<a id="function-function-mq3-renderer-tr-image-runtime-loadbmp-function-loadbmp-data-src-mq3-renderer-tr-image-runtime-ml-1704073002"></a>
### LoadBMP

```ml
function LoadBMP(data)
```

Builds `output[target]`, `output[target+1]`, `output[target+2]`, `output[target+3]` in `mq3.renderer.tr_image_runtime.LoadBMP`; returns `registry.Source(width,height,output)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_image_runtime.u32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L129)

<a id="function-function-mq3-renderer-tr-image-runtime-loadjpg-function-loadjpg-data-src-mq3-renderer-tr-image-runtime-ml-1156702430"></a>
### LoadJPG

```ml
function LoadJPG(data)
```

Returns `registry.Source(decoded.width,decoded.height,decoded.pixels)` from `mq3.renderer.tr_image_runtime.LoadJPG`; earlier branches return `decoded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.platform.playable_jpeg.decode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L126)

<a id="function-function-mq3-renderer-tr-image-runtime-loadpcx-function-loadpcx-data-src-mq3-renderer-tr-image-runtime-ml-1317154614"></a>
### LoadPCX

```ml
function LoadPCX(data)
```

Builds `indexes[target]`, `output[dst]`, `output[dst+1]`, `output[dst+2]`, `output[dst+3]` in `mq3.renderer.tr_image_runtime.LoadPCX`; returns `registry.Source(width,height,output)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_image_runtime.u16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L141)

<a id="function-function-mq3-renderer-tr-image-runtime-loadpcx32-function-loadpcx32-data-src-mq3-renderer-tr-image-runtime-ml-1681529000"></a>
### LoadPCX32

```ml
function LoadPCX32(data)
```

Calls `mq3.renderer.tr_image_runtime.LoadPCX` with `(data)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_image_runtime.LoadPCX`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L157)

<a id="function-function-mq3-renderer-tr-image-runtime-loadtga-function-loadtga-data-src-mq3-renderer-tr-image-runtime-ml-36450400"></a>
### LoadTGA

```ml
function LoadTGA(data)
```

Returns `registry.Source(decoded.width,decoded.height,decoded.pixels)` from `mq3.renderer.tr_image_runtime.LoadTGA`; earlier branches return `decoded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.tga.decode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L123)

<a id="function-function-mq3-renderer-tr-image-runtime-lower-function-lower-value-src-mq3-renderer-tr-image-runtime-ml-349835263"></a>
### lower

```ml
function lower(value)
```

Calls `std.string.toLowerAscii` with `(value)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L108)

<a id="constant-constant-mq3-renderer-tr-image-runtime-max-skins-const-max-skins-1024-src-mq3-renderer-tr-image-runtime-ml-1570003540"></a>
### MAX_SKINS

```ml
const MAX_SKINS = 1024
```

Maximum number of registered skin definitions retained by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L22)

<a id="function-function-mq3-renderer-tr-image-runtime-r-blendovertexture-function-r-blendovertexture-data-pixelcount-blend-src-mq3-renderer-tr-image-runtime-ml-935153154"></a>
### R_BlendOverTexture

```ml
function R_BlendOverTexture(data, pixelCount, blend)
```

Updates `data[at]`, `data[at+1]`, `data[at+2]` in `mq3.renderer.tr_image_runtime.R_BlendOverTexture`; returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Mutable record or buffer; this call updates `data[at]`, `data[at+1]`, `data[at+2]`. |
| `pixelCount` | `dynamic` | — | Input tested by `data==void or blend==void or len(data)<pixelCount*4 or len(blend)<4`. |
| `blend` | `dynamic` | — | Indexed input read at `3`, `0`, `1`, `2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L194)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createbuiltinimages-function-r-createbuiltinimages-state-src-mq3-renderer-tr-image-runtime-ml-118926349"></a>
### R_CreateBuiltinImages

```ml
function R_CreateBuiltinImages(state)
```

Updates `state.whiteImage`, `state.identityLightImage`, `state.scratchImages` in `mq3.renderer.tr_image_runtime.R_CreateBuiltinImages`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.whiteImage`, `state.identityLightImage`, `state.scratchImages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L263)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createdefaultimage-function-r-createdefaultimage-state-src-mq3-renderer-tr-image-runtime-ml-280633889"></a>
### R_CreateDefaultImage

```ml
function R_CreateDefaultImage(state)
```

Updates `state.defaultImage` in `mq3.renderer.tr_image_runtime.R_CreateDefaultImage`; returns `state.defaultImage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.defaultImage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L254)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createdlightimage-function-r-createdlightimage-state-src-mq3-renderer-tr-image-runtime-ml-1234660053"></a>
### R_CreateDlightImage

```ml
function R_CreateDlightImage(state)
```

Updates `state.dlightImage` in `mq3.renderer.tr_image_runtime.R_CreateDlightImage`; returns `state.dlightImage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.dlightImage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L257)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createfogimage-function-r-createfogimage-state-src-mq3-renderer-tr-image-runtime-ml-1861691221"></a>
### R_CreateFogImage

```ml
function R_CreateFogImage(state)
```

Updates `state.fogImage` in `mq3.renderer.tr_image_runtime.R_CreateFogImage`; returns `state.fogImage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fogImage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L260)

<a id="function-function-mq3-renderer-tr-image-runtime-r-createimage-function-r-createimage-state-name-data-width-height-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-tr-image-runtime-ml-1400085392"></a>
### R_CreateImage

```ml
function R_CreateImage(state, name, data, width, height, mipmap, allowPicmip, wrapClampMode)
```

Calls `mq3.renderer.image_registry.createImage` with `(state.images,name,data,width,height,mipmap,allowPicmip,wrapClampMode)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.images`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.image_registry.createImage`. |
| `data` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.image_registry.createImage`. |
| `width` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.image_registry.createImage`. |
| `height` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.image_registry.createImage`. |
| `mipmap` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.image_registry.createImage`. |
| `allowPicmip` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.image_registry.createImage`. |
| `wrapClampMode` | `dynamic` | — | Argument 8 supplied to `mq3.renderer.image_registry.createImage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L216)

<a id="function-function-mq3-renderer-tr-image-runtime-r-deletetextures-function-r-deletetextures-state-src-mq3-renderer-tr-image-runtime-ml-594158905"></a>
### R_DeleteTextures

```ml
function R_DeleteTextures(state)
```

Updates `state.images.images`, `state.images.buckets` in `mq3.renderer.tr_image_runtime.R_DeleteTextures`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.images.images`, `state.images.buckets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L288)

<a id="function-function-mq3-renderer-tr-image-runtime-r-findimagefile-function-r-findimagefile-state-name-mipmap-allowpicmip-wrapclampmode-src-mq3-renderer-tr-image-runtime-ml-377599237"></a>
### R_FindImageFile

```ml
function R_FindImageFile(state, name, mipmap, allowPicmip, wrapClampMode)
```

Calls `mq3.renderer.image_registry.findImageFile` with `(state.images,name,mipmap,allowPicmip,wrapClampMode)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.images`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.image_registry.findImageFile`. |
| `mipmap` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.image_registry.findImageFile`. |
| `allowPicmip` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.image_registry.findImageFile`. |
| `wrapClampMode` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.image_registry.findImageFile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L223)

<a id="function-function-mq3-renderer-tr-image-runtime-r-fogfactor-function-r-fogfactor-state-s-t-src-mq3-renderer-tr-image-runtime-ml-2093600562"></a>
### R_FogFactor

```ml
function R_FogFactor(state, s, t)
```

Returns `state.fogTable[index]` from `mq3.renderer.tr_image_runtime.R_FogFactor`; earlier branches return `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.fogTable`. |
| `s` | `dynamic` | — | Input used by `s=s-1.0/512.0`. |
| `t` | `dynamic` | — | Input tested by `s<0.0 or t<1.0/32.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L251)

<a id="function-function-mq3-renderer-tr-image-runtime-r-gammacorrect-function-r-gammacorrect-state-data-src-mq3-renderer-tr-image-runtime-ml-516366985"></a>
### R_GammaCorrect

```ml
function R_GammaCorrect(state, data)
```

Builds `output[i]` in `mq3.renderer.tr_image_runtime.R_GammaCorrect`; returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.gammaTable`. |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_image_runtime.cloneByteData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L227)

<a id="function-function-mq3-renderer-tr-image-runtime-r-getskinbyhandle-function-r-getskinbyhandle-state-handle-src-mq3-renderer-tr-image-runtime-ml-1872996497"></a>
### R_GetSkinByHandle

```ml
function R_GetSkinByHandle(state, handle)
```

Returns `state.skins[handle]` from `mq3.renderer.tr_image_runtime.R_GetSkinByHandle`; earlier branches return `state.skins[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.skins`. |
| `handle` | `dynamic` | — | Input tested by `handle<1 or handle>=len(state.skins)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L331)

<a id="function-function-mq3-renderer-tr-image-runtime-r-imagelist-f-function-r-imagelist-f-state-src-mq3-renderer-tr-image-runtime-ml-1044195847"></a>
### R_ImageList_f

```ml
function R_ImageList_f(state)
```

Returns `result` from `mq3.renderer.tr_image_runtime.R_ImageList_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.images`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L242)

<a id="function-function-mq3-renderer-tr-image-runtime-r-initfogtable-function-r-initfogtable-state-src-mq3-renderer-tr-image-runtime-ml-1641980761"></a>
### R_InitFogTable

```ml
function R_InitFogTable(state)
```

Updates `state.fogTable` in `mq3.renderer.tr_image_runtime.R_InitFogTable`; returns `table`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fogTable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L246)

<a id="function-function-mq3-renderer-tr-image-runtime-r-initimages-function-r-initimages-state-overbright-gamma-intensity-fullscreen-colorbits-src-mq3-renderer-tr-image-runtime-ml-1707832679"></a>
### R_InitImages

```ml
function R_InitImages(state, overbright, gamma, intensity, fullscreen, colorBits)
```

Updates `state.images.images`, `state.images.buckets` in `mq3.renderer.tr_image_runtime.R_InitImages`; returns `R_CreateBuiltinImages(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.images.images`, `state.images.buckets`. |
| `overbright` | `dynamic` | — | Value forwarded as `overbright` to `mq3.renderer.tr_image_runtime.R_SetColorMappings`. |
| `gamma` | `dynamic` | — | Value forwarded as `gamma` to `mq3.renderer.tr_image_runtime.R_SetColorMappings`. |
| `intensity` | `dynamic` | — | Value forwarded as `intensity` to `mq3.renderer.tr_image_runtime.R_SetColorMappings`. |
| `fullscreen` | `dynamic` | — | Value forwarded as `fullscreen` to `mq3.renderer.tr_image_runtime.R_SetColorMappings`. |
| `colorBits` | `dynamic` | — | Value forwarded as `colorBits` to `mq3.renderer.tr_image_runtime.R_SetColorMappings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L285)

<a id="function-function-mq3-renderer-tr-image-runtime-r-initskins-function-r-initskins-state-src-mq3-renderer-tr-image-runtime-ml-1821072015"></a>
### R_InitSkins

```ml
function R_InitSkins(state)
```

Updates `state.skins` in `mq3.renderer.tr_image_runtime.R_InitSkins`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.skins`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L315)

<a id="function-function-mq3-renderer-tr-image-runtime-r-lightscaletexture-function-r-lightscaletexture-state-data-width-height-onlygamma-src-mq3-renderer-tr-image-runtime-ml-1989800379"></a>
### R_LightScaleTexture

```ml
function R_LightScaleTexture(state, data, width, height, onlyGamma)
```

Calls `mq3.renderer.image_processing.lightScale` with `(data,width,height,onlyGamma,state.images.config.deviceSupportsGamma,state.gammaTable,state.intensityTable)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.images`, `state.gammaTable`, `state.intensityTable`. |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.image_processing.lightScale`. |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.image_processing.lightScale`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.image_processing.lightScale`. |
| `onlyGamma` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.image_processing.lightScale`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L179)

<a id="function-function-mq3-renderer-tr-image-runtime-r-loadimage-function-r-loadimage-data-name-src-mq3-renderer-tr-image-runtime-ml-1720158919"></a>
### R_LoadImage

```ml
function R_LoadImage(data, name)
```

Selects the TGA, JPEG, PCX, or BMP decoder from the case-insensitive filename extension.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_image_runtime.LoadTGA`. |
| `name` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_image_runtime.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L161)

<a id="function-function-mq3-renderer-tr-image-runtime-r-mipmap-function-r-mipmap-data-width-height-src-mq3-renderer-tr-image-runtime-ml-1557542575"></a>
### R_MipMap

```ml
function R_MipMap(data, width, height)
```

Calls `mq3.renderer.image_processing.mipMapSimple` with `(data,width,height)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.image_processing.mipMapSimple`. |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.image_processing.mipMapSimple`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.image_processing.mipMapSimple`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L184)

<a id="function-function-mq3-renderer-tr-image-runtime-r-mipmap2-function-r-mipmap2-data-width-height-src-mq3-renderer-tr-image-runtime-ml-148339529"></a>
### R_MipMap2

```ml
function R_MipMap2(data, width, height)
```

Calls `mq3.renderer.image_processing.mipMapFiltered` with `(data,width,height)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.image_processing.mipMapFiltered`. |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.image_processing.mipMapFiltered`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.image_processing.mipMapFiltered`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L189)

<a id="function-function-mq3-renderer-tr-image-runtime-r-setcolormappings-function-r-setcolormappings-state-overbright-gamma-intensity-fullscreen-colorbits-src-mq3-renderer-tr-image-runtime-ml-1613485495"></a>
### R_SetColorMappings

```ml
function R_SetColorMappings(state, overbright, gamma, intensity, fullscreen, colorBits)
```

Updates `state.overbrightBits`, `state.identityLight`, `state.identityLightByte`, `state.gammaTable`, `state.intensityTable` in `mq3.renderer.tr_image_runtime.R_SetColorMappings`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.overbrightBits`, `state.identityLight`, `state.identityLightByte`, `state.gammaTable`, `state.intensityTable`. |
| `overbright` | `dynamic` | — | Value assigned to `state.overbrightBits`. |
| `gamma` | `dynamic` | — | Argument 3 supplied to `state.services.gammaFn`. |
| `intensity` | `dynamic` | — | Input tested by `intensity<1.0`. |
| `fullscreen` | `dynamic` | — | Input tested by `not state.images.config.deviceSupportsGamma or not fullscreen`. |
| `colorBits` | `dynamic` | — | Input tested by `colorBits>16 and overbright>2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L271)

<a id="function-function-mq3-renderer-tr-image-runtime-r-skinlist-f-function-r-skinlist-f-state-src-mq3-renderer-tr-image-runtime-ml-1093164057"></a>
### R_SkinList_f

```ml
function R_SkinList_f(state)
```

Returns `result` from `mq3.renderer.tr_image_runtime.R_SkinList_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.skins`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L334)

<a id="function-function-mq3-renderer-tr-image-runtime-r-sumofusedimages-function-r-sumofusedimages-state-framecount-src-mq3-renderer-tr-image-runtime-ml-216058037"></a>
### R_SumOfUsedImages

```ml
function R_SumOfUsedImages(state, frameCount)
```

Returns `total` from `mq3.renderer.tr_image_runtime.R_SumOfUsedImages`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.images`. |
| `frameCount` | `dynamic` | — | Input used by `for each image in state.images.images if image.frameUsed==frameCount then total=total+image.uploadWidth*image.uploadHeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L239)

<a id="function-function-mq3-renderer-tr-image-runtime-re-registerskin-function-re-registerskin-state-name-src-mq3-renderer-tr-image-runtime-ml-1786403602"></a>
### RE_RegisterSkin

```ml
function RE_RegisterSkin(state, name)
```

Updates `state.skins` in `mq3.renderer.tr_image_runtime.RE_RegisterSkin`; returns `len(state.skins)-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.skins`. |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L319)

<a id="function-function-mq3-renderer-tr-image-runtime-resampletexture-function-resampletexture-data-inwidth-inheight-outwidth-outheight-src-mq3-renderer-tr-image-runtime-ml-1350500368"></a>
### ResampleTexture

```ml
function ResampleTexture(data, inWidth, inHeight, outWidth, outHeight)
```

Calls `mq3.renderer.image_processing.resample` with `(data,inWidth,inHeight,outWidth,outHeight)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.image_processing.resample`. |
| `inWidth` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.image_processing.resample`. |
| `inHeight` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.image_processing.resample`. |
| `outWidth` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.image_processing.resample`. |
| `outHeight` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.image_processing.resample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L172)

<a id="function-function-mq3-renderer-tr-image-runtime-savejpg-function-savejpg-state-filename-quality-width-height-pixels-src-mq3-renderer-tr-image-runtime-ml-537509397"></a>
### SaveJPG

```ml
function SaveJPG(state, filename, quality, width, height, pixels)
```

Returns `state.services.writeJpegFn(state.services.context,filename,quality,width,height,pixels)` from `mq3.renderer.tr_image_runtime.SaveJPG`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |
| `filename` | `dynamic` | — | Argument 2 supplied to `state.services.writeJpegFn`. |
| `quality` | `dynamic` | — | Argument 3 supplied to `state.services.writeJpegFn`. |
| `width` | `dynamic` | — | Argument 4 supplied to `state.services.writeJpegFn`. |
| `height` | `dynamic` | — | Argument 5 supplied to `state.services.writeJpegFn`. |
| `pixels` | `dynamic` | — | Argument 6 supplied to `state.services.writeJpegFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L356)

<a id="function-function-mq3-renderer-tr-image-runtime-services-function-services-src-mq3-renderer-tr-image-runtime-ml-32781840"></a>
### services

```ml
function services()
```

Constructs `mq3.renderer.tr_image_runtime.Services` with `skinLoadFn` = `void`, `writeJpegFn` = `void`, `deleteTextureFn` = `void`, `gammaFn` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L97)

- [mq3.renderer.tr_image_runtime.Services](Type-mq3-renderer-tr-image-runtime-services-1588385876.md) — struct
- [mq3.renderer.tr_image_runtime.SkinRecord](Type-mq3-renderer-tr-image-runtime-skinrecord-367827300.md) — struct
- [mq3.renderer.tr_image_runtime.State](Type-mq3-renderer-tr-image-runtime-state-1347280449.md) — struct
<a id="function-function-mq3-renderer-tr-image-runtime-term-destination-function-term-destination-destination-used-src-mq3-renderer-tr-image-runtime-ml-1688088133"></a>
### term_destination

```ml
function term_destination(destination, used)
```

Updates `destination.used` in `mq3.renderer.tr_image_runtime.term_destination`; returns `used`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Mutable record or buffer; this call updates `destination.used`. |
| `used` | `dynamic` | — | Value assigned to `destination.used`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L348)

<a id="function-function-mq3-renderer-tr-image-runtime-u16-function-u16-data-at-src-mq3-renderer-tr-image-runtime-ml-999798245"></a>
### u16

```ml
function u16(data, at)
```

Returns `data[at]|(data[at+1]<<8)` from `mq3.renderer.tr_image_runtime.u16`; earlier branches return `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Indexed input read at `at`, `at+1`. |
| `at` | `dynamic` | — | Input tested by `at<0 or at+2>len(data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L112)

<a id="function-function-mq3-renderer-tr-image-runtime-u32-function-u32-data-at-src-mq3-renderer-tr-image-runtime-ml-358064545"></a>
### u32

```ml
function u32(data, at)
```

Returns `n.i32(data[at]|(data[at+1]<<8)|(data[at+2]<<16)|(data[at+3]<<24))` from `mq3.renderer.tr_image_runtime.u32`; earlier branches return `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Indexed input read at `at`, `at+1`, `at+2`, `at+3`. |
| `at` | `dynamic` | — | Input tested by `at<0 or at+4>len(data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L116)

<a id="function-function-mq3-renderer-tr-image-runtime-upload32-function-upload32-state-data-width-height-mipmap-allowpicmip-lightmap-src-mq3-renderer-tr-image-runtime-ml-1976337253"></a>
### Upload32

```ml
function Upload32(state, data, width, height, mipmap, allowPicmip, lightMap)
```

Calls `mq3.renderer.image_registry.prepareUpload` with `(data,width,height,mipmap,allowPicmip,lightMap,state.images.config)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.images`. |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.image_registry.prepareUpload`. |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.image_registry.prepareUpload`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.image_registry.prepareUpload`. |
| `mipmap` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.image_registry.prepareUpload`. |
| `allowPicmip` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.image_registry.prepareUpload`. |
| `lightMap` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.image_registry.prepareUpload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L206)

<a id="function-function-mq3-renderer-tr-image-runtime-warn-function-warn-state-text-src-mq3-renderer-tr-image-runtime-ml-1534089878"></a>
### warn

```ml
function warn(state, text)
```

Returns `void` from `mq3.renderer.tr_image_runtime.warn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |
| `text` | `dynamic` | — | Argument 2 supplied to `state.services.diagnosticFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L105)
