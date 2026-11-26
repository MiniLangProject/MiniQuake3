# `src/mq3/renderer/tr_backend_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_backend_runtime`](Package-mq3-renderer-tr-backend-runtime-79157111.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/command_queue.ml` as `commands` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)
- `mq3/renderer/draw_surfs.ml` as `drawSurfs` → [src/mq3/renderer/draw_surfs.ml](File-src-mq3-renderer-draw-surfs-ml-75092385.md)
- `mq3/renderer/qgl.ml` as `qgl` → [src/mq3/renderer/qgl.ml](File-src-mq3-renderer-qgl-ml-2071350969.md)
- `mq3/renderer/texture_state.ml` as `textures` → [src/mq3/renderer/texture_state.ml](File-src-mq3-renderer-texture-state-ml-1230714594.md)
- `mq3/renderer/tr_local.ml` as `trLocal` → [src/mq3/renderer/tr_local.ml](File-src-mq3-renderer-tr-local-ml-841068495.md)

## Declarations

<a id="function-function-mq3-renderer-tr-backend-runtime-beginsurface-function-beginsurface-state-shader-fog-dlight-src-mq3-renderer-tr-backend-runtime-ml-571602366"></a>
### beginSurface

```ml
function beginSurface(state, shader, fog, dlight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `fog` | `dynamic` | — |  |
| `dlight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L149)

- [mq3.renderer.tr_backend_runtime.Command](Type-mq3-renderer-tr-backend-runtime-command-886743832.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-create-function-create-texturestate-width-height-host-src-mq3-renderer-tr-backend-runtime-ml-2066661597"></a>
### create

```ml
function create(textureState, width, height, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureState` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L61)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-ct-back-sided-const-ct-back-sided-1-src-mq3-renderer-tr-backend-runtime-ml-914273440"></a>
### CT_BACK_SIDED

```ml
const CT_BACK_SIDED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L16)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-ct-front-sided-const-ct-front-sided-0-src-mq3-renderer-tr-backend-runtime-ml-660886569"></a>
### CT_FRONT_SIDED

```ml
const CT_FRONT_SIDED = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L15)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-ct-two-sided-const-ct-two-sided-2-src-mq3-renderer-tr-backend-runtime-ml-65917749"></a>
### CT_TWO_SIDED

```ml
const CT_TWO_SIDED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L17)

- [mq3.renderer.tr_backend_runtime.DrawPayload](Type-mq3-renderer-tr-backend-runtime-drawpayload-1811928793.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-dstfactor-function-dstfactor-bits-src-mq3-renderer-tr-backend-runtime-ml-551716278"></a>
### dstFactor

```ml
function dstFactor(bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L101)

<a id="function-function-mq3-renderer-tr-backend-runtime-emit-function-emit-state-kind-value-src-mq3-renderer-tr-backend-runtime-ml-688575570"></a>
### emit

```ml
function emit(state, kind, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L67)

<a id="function-function-mq3-renderer-tr-backend-runtime-endsurface-function-endsurface-state-src-mq3-renderer-tr-backend-runtime-ml-35622313"></a>
### endSurface

```ml
function endSurface(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L145)

<a id="function-function-mq3-renderer-tr-backend-runtime-entity-function-entity-src-mq3-renderer-tr-backend-runtime-ml-1480913574"></a>
### entity

```ml
function entity()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L60)

- [mq3.renderer.tr_backend_runtime.Entity](Type-mq3-renderer-tr-backend-runtime-entity-41286948.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-entityat-function-entityat-state-index-src-mq3-renderer-tr-backend-runtime-ml-2045034993"></a>
### entityAt

```ml
function entityAt(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L152)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-entitynum-world-const-entitynum-world-1022-src-mq3-renderer-tr-backend-runtime-ml-1954960320"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L21)

<a id="function-function-mq3-renderer-tr-backend-runtime-fail-function-fail-message-src-mq3-renderer-tr-backend-runtime-ml-279868959"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L52)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gl-add-const-gl-add-260-src-mq3-renderer-tr-backend-runtime-ml-1324388993"></a>
### GL_ADD

```ml
const GL_ADD = 260
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L25)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-bind-function-gl-bind-state-image-src-mq3-renderer-tr-backend-runtime-ml-984121330"></a>
### GL_Bind

```ml
function GL_Bind(state, image)
```

C-named texture facade.  These calls use the productive two-TMU cache.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L73)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-bindmultitexture-function-gl-bindmultitexture-state-image0-env0-image1-env1-src-mq3-renderer-tr-backend-runtime-ml-1116782723"></a>
### GL_BindMultitexture

```ml
function GL_BindMultitexture(state, image0, env0, image1, env1)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `image0` | `dynamic` | — |  |
| `env0` | `dynamic` | — |  |
| `image1` | `dynamic` | — |  |
| `env1` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L75)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-cull-function-gl-cull-state-culltype-src-mq3-renderer-tr-backend-runtime-ml-708200009"></a>
### GL_Cull

```ml
function GL_Cull(state, cullType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cullType` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L77)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gl-decal-const-gl-decal-8449-src-mq3-renderer-tr-backend-runtime-ml-641674970"></a>
### GL_DECAL

```ml
const GL_DECAL = 8449
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L23)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gl-modulate-const-gl-modulate-8448-src-mq3-renderer-tr-backend-runtime-ml-149183435"></a>
### GL_MODULATE

```ml
const GL_MODULATE = 8448
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L22)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gl-replace-const-gl-replace-7681-src-mq3-renderer-tr-backend-runtime-ml-771082155"></a>
### GL_REPLACE

```ml
const GL_REPLACE = 7681
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L24)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-selecttexture-function-gl-selecttexture-state-unit-src-mq3-renderer-tr-backend-runtime-ml-1862621267"></a>
### GL_SelectTexture

```ml
function GL_SelectTexture(state, unit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `unit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L74)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-state-function-gl-state-state-statebits-src-mq3-renderer-tr-backend-runtime-ml-1505834368"></a>
### GL_State

```ml
function GL_State(state, stateBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `stateBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L104)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-texenv-function-gl-texenv-state-env-src-mq3-renderer-tr-backend-runtime-ml-1427232982"></a>
### GL_TexEnv

```ml
function GL_TexEnv(state, env)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `env` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L90)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-atest-bits-const-gls-atest-bits-trlocal-gls-atest-bits-src-mq3-renderer-tr-backend-runtime-ml-1808457655"></a>
### GLS_ATEST_BITS

```ml
const GLS_ATEST_BITS = trLocal.GLS_ATEST_BITS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L32)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-atest-ge-80-const-gls-atest-ge-80-1073741824-src-mq3-renderer-tr-backend-runtime-ml-1312314594"></a>
### GLS_ATEST_GE_80

```ml
const GLS_ATEST_GE_80 = 1073741824
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L35)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-atest-gt-0-const-gls-atest-gt-0-268435456-src-mq3-renderer-tr-backend-runtime-ml-671168728"></a>
### GLS_ATEST_GT_0

```ml
const GLS_ATEST_GT_0 = 268435456
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L33)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-atest-lt-80-const-gls-atest-lt-80-536870912-src-mq3-renderer-tr-backend-runtime-ml-254984580"></a>
### GLS_ATEST_LT_80

```ml
const GLS_ATEST_LT_80 = 536870912
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L34)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-default-const-gls-default-gls-depthmask-true-src-mq3-renderer-tr-backend-runtime-ml-1160974858"></a>
### GLS_DEFAULT

```ml
const GLS_DEFAULT = GLS_DEPTHMASK_TRUE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L36)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-depthfunc-equal-const-gls-depthfunc-equal-trlocal-gls-depthfunc-equal-src-mq3-renderer-tr-backend-runtime-ml-1028973001"></a>
### GLS_DEPTHFUNC_EQUAL

```ml
const GLS_DEPTHFUNC_EQUAL = trLocal.GLS_DEPTHFUNC_EQUAL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L31)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-depthmask-true-const-gls-depthmask-true-trlocal-gls-depthmask-true-src-mq3-renderer-tr-backend-runtime-ml-2095693581"></a>
### GLS_DEPTHMASK_TRUE

```ml
const GLS_DEPTHMASK_TRUE = trLocal.GLS_DEPTHMASK_TRUE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L28)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-depthtest-disable-const-gls-depthtest-disable-trlocal-gls-depthtest-disable-src-mq3-renderer-tr-backend-runtime-ml-917430543"></a>
### GLS_DEPTHTEST_DISABLE

```ml
const GLS_DEPTHTEST_DISABLE = trLocal.GLS_DEPTHTEST_DISABLE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L30)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-dstblend-bits-const-gls-dstblend-bits-trlocal-gls-dstblend-bits-src-mq3-renderer-tr-backend-runtime-ml-1835743396"></a>
### GLS_DSTBLEND_BITS

```ml
const GLS_DSTBLEND_BITS = trLocal.GLS_DSTBLEND_BITS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L27)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-polymode-line-const-gls-polymode-line-trlocal-gls-polymode-line-src-mq3-renderer-tr-backend-runtime-ml-509737757"></a>
### GLS_POLYMODE_LINE

```ml
const GLS_POLYMODE_LINE = trLocal.GLS_POLYMODE_LINE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L29)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-gls-srcblend-bits-const-gls-srcblend-bits-trlocal-gls-srcblend-bits-src-mq3-renderer-tr-backend-runtime-ml-415682395"></a>
### GLS_SRCBLEND_BITS

```ml
const GLS_SRCBLEND_BITS = trLocal.GLS_SRCBLEND_BITS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L26)

<a id="function-function-mq3-renderer-tr-backend-runtime-glstate-function-glstate-src-mq3-renderer-tr-backend-runtime-ml-835994842"></a>
### glState

```ml
function glState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L55)

- [mq3.renderer.tr_backend_runtime.GLState](Type-mq3-renderer-tr-backend-runtime-glstate-190043501.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-identityaxis-function-identityaxis-src-mq3-renderer-tr-backend-runtime-ml-283361342"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L57)

<a id="function-function-mq3-renderer-tr-backend-runtime-identitymatrix-function-identitymatrix-src-mq3-renderer-tr-backend-runtime-ml-994065822"></a>
### identityMatrix

```ml
function identityMatrix()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L56)

- [mq3.renderer.tr_backend_runtime.ImageInfo](Type-mq3-renderer-tr-backend-runtime-imageinfo-829918140.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-portalplane-function-portalplane-view-src-mq3-renderer-tr-backend-runtime-ml-1552942819"></a>
### portalPlane

```ml
function portalPlane(view)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L130)

<a id="function-function-mq3-renderer-tr-backend-runtime-poweroftwo-function-poweroftwo-value-src-mq3-renderer-tr-backend-runtime-ml-818435229"></a>
### powerOfTwo

```ml
function powerOfTwo(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L184)

<a id="function-function-mq3-renderer-tr-backend-runtime-qglrequiredcount-function-qglrequiredcount-src-mq3-renderer-tr-backend-runtime-ml-660600014"></a>
### qglRequiredCount

```ml
function qglRequiredCount()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L53)

- [mq3.renderer.tr_backend_runtime.RawQuad](Type-mq3-renderer-tr-backend-runtime-rawquad-264403308.md) — struct
- [mq3.renderer.tr_backend_runtime.RawUpload](Type-mq3-renderer-tr-backend-runtime-rawupload-2063821790.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-rb-begindrawingview-function-rb-begindrawingview-state-finishmode-measureoverdraw-shadowmode-fastsky-src-mq3-renderer-tr-backend-runtime-ml-1073826677"></a>
### RB_BeginDrawingView

```ml
function RB_BeginDrawingView(state, finishMode, measureOverdraw, shadowMode, fastSky)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `finishMode` | `dynamic` | — |  |
| `measureOverdraw` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fastSky` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L134)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-drawbuffer-function-rb-drawbuffer-state-command-cleardebug-src-mq3-renderer-tr-backend-runtime-ml-317275902"></a>
### RB_DrawBuffer

```ml
function RB_DrawBuffer(state, command, clearDebug)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `clearDebug` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L210)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-drawsurfs-function-rb-drawsurfs-state-command-finishmode-measureoverdraw-shadowmode-fastsky-src-mq3-renderer-tr-backend-runtime-ml-2070467178"></a>
### RB_DrawSurfs

```ml
function RB_DrawSurfs(state, command, finishMode, measureOverdraw, shadowMode, fastSky)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `finishMode` | `dynamic` | — |  |
| `measureOverdraw` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fastSky` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L207)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-executerendercommands-function-rb-executerendercommands-state-stream-smpenabled-secondbuffer-now-src-mq3-renderer-tr-backend-runtime-ml-207199408"></a>
### RB_ExecuteRenderCommands

```ml
function RB_ExecuteRenderCommands(state, stream, smpEnabled, secondBuffer, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `stream` | `dynamic` | — |  |
| `smpEnabled` | `dynamic` | — |  |
| `secondBuffer` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L224)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-hyperspace-function-rb-hyperspace-state-src-mq3-renderer-tr-backend-runtime-ml-590255791"></a>
### RB_Hyperspace

```ml
function RB_Hyperspace(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L124)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-renderdrawsurflist-function-rb-renderdrawsurflist-state-surfaces-shaders-finishmode-measureoverdraw-shadowmode-fastsky-src-mq3-renderer-tr-backend-runtime-ml-589030527"></a>
### RB_RenderDrawSurfList

```ml
function RB_RenderDrawSurfList(state, surfaces, shaders, finishMode, measureOverdraw, shadowMode, fastSky)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `surfaces` | `dynamic` | — |  |
| `shaders` | `dynamic` | — |  |
| `finishMode` | `dynamic` | — |  |
| `measureOverdraw` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fastSky` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L155)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-renderthread-function-rb-renderthread-state-streams-smpenabled-now-src-mq3-renderer-tr-backend-runtime-ml-1949823895"></a>
### RB_RenderThread

```ml
function RB_RenderThread(state, streams, smpEnabled, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `streams` | `dynamic` | — |  |
| `smpEnabled` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L238)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-setcolor-function-rb-setcolor-state-command-src-mq3-renderer-tr-backend-runtime-ml-1152739616"></a>
### RB_SetColor

```ml
function RB_SetColor(state, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L200)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-setgl2d-function-rb-setgl2d-state-now-src-mq3-renderer-tr-backend-runtime-ml-79382669"></a>
### RB_SetGL2D

```ml
function RB_SetGL2D(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L181)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-showimages-function-rb-showimages-state-images-mode-now-src-mq3-renderer-tr-backend-runtime-ml-1385755930"></a>
### RB_ShowImages

```ml
function RB_ShowImages(state, images, mode, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `images` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L213)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-stretchpic-function-rb-stretchpic-state-command-now-src-mq3-renderer-tr-backend-runtime-ml-301714610"></a>
### RB_StretchPic

```ml
function RB_StretchPic(state, command, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L203)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-swapbuffers-function-rb-swapbuffers-state-command-showimages-images-measureoverdraw-stencil-now-src-mq3-renderer-tr-backend-runtime-ml-1923408661"></a>
### RB_SwapBuffers

```ml
function RB_SwapBuffers(state, command, showImages, images, measureOverdraw, stencil, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `showImages` | `dynamic` | — |  |
| `images` | `dynamic` | — |  |
| `measureOverdraw` | `dynamic` | — |  |
| `stencil` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L218)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-rdf-hyperspace-const-rdf-hyperspace-4-src-mq3-renderer-tr-backend-runtime-ml-581595309"></a>
### RDF_HYPERSPACE

```ml
const RDF_HYPERSPACE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-tr-backend-runtime-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-renderer-tr-backend-runtime-ml-1251112192"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L18)

<a id="function-function-mq3-renderer-tr-backend-runtime-re-stretchraw-function-re-stretchraw-state-x-y-w-h-cols-rows-data-client-dirty-now-src-mq3-renderer-tr-backend-runtime-ml-255697162"></a>
### RE_StretchRaw

```ml
function RE_StretchRaw(state, x, y, w, h, cols, rows, data, client, dirty, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `cols` | `dynamic` | — |  |
| `rows` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `dirty` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L195)

<a id="function-function-mq3-renderer-tr-backend-runtime-re-uploadcinematic-function-re-uploadcinematic-state-w-h-cols-rows-data-client-dirty-src-mq3-renderer-tr-backend-runtime-ml-795025203"></a>
### RE_UploadCinematic

```ml
function RE_UploadCinematic(state, w, h, cols, rows, data, client, dirty)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `cols` | `dynamic` | — |  |
| `rows` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `dirty` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L194)

<a id="function-function-mq3-renderer-tr-backend-runtime-refdef-function-refdef-src-mq3-renderer-tr-backend-runtime-ml-2037207058"></a>
### refdef

```ml
function refdef()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L59)

- [mq3.renderer.tr_backend_runtime.Refdef](Type-mq3-renderer-tr-backend-runtime-refdef-387149691.md) — struct
<a id="constant-constant-mq3-renderer-tr-backend-runtime-rf-depthhack-const-rf-depthhack-8-src-mq3-renderer-tr-backend-runtime-ml-68746197"></a>
### RF_DEPTHHACK

```ml
const RF_DEPTHHACK = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L20)

<a id="function-function-mq3-renderer-tr-backend-runtime-services-function-services-src-mq3-renderer-tr-backend-runtime-ml-1422059106"></a>
### services

```ml
function services()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L54)

- [mq3.renderer.tr_backend_runtime.Services](Type-mq3-renderer-tr-backend-runtime-services-185343063.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-setviewportandscissor-function-setviewportandscissor-state-src-mq3-renderer-tr-backend-runtime-ml-1842268011"></a>
### SetViewportAndScissor

```ml
function SetViewportAndScissor(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L127)

- [mq3.renderer.tr_backend_runtime.Shader](Type-mq3-renderer-tr-backend-runtime-shader-300402966.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-srcfactor-function-srcfactor-bits-src-mq3-renderer-tr-backend-runtime-ml-1237541220"></a>
### srcFactor

```ml
function srcFactor(bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L98)

- [mq3.renderer.tr_backend_runtime.State](Type-mq3-renderer-tr-backend-runtime-state-1159708060.md) — struct
- [mq3.renderer.tr_backend_runtime.Surface](Type-mq3-renderer-tr-backend-runtime-surface-943809398.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-uploadraw-function-uploadraw-state-w-h-cols-rows-data-client-dirty-requirepoweroftwo-src-mq3-renderer-tr-backend-runtime-ml-2031144796"></a>
### uploadRaw

```ml
function uploadRaw(state, w, h, cols, rows, data, client, dirty, requirePowerOfTwo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `cols` | `dynamic` | — |  |
| `rows` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `dirty` | `dynamic` | — |  |
| `requirePowerOfTwo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L185)

<a id="function-function-mq3-renderer-tr-backend-runtime-viewparms-function-viewparms-width-height-src-mq3-renderer-tr-backend-runtime-ml-1682628611"></a>
### viewParms

```ml
function viewParms(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L58)

- [mq3.renderer.tr_backend_runtime.ViewParms](Type-mq3-renderer-tr-backend-runtime-viewparms-1607762701.md) — struct
