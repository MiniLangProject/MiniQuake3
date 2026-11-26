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

Updates `state.tessShader`, `state.tessFog`, `state.tessDlight`, `state.numIndexes` in `mq3.renderer.tr_backend_runtime.beginSurface`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.tessShader`, `state.tessFog`, `state.tessDlight`, `state.numIndexes`. |
| `shader` | `dynamic` | — | Record providing `shader.name`. |
| `fog` | `dynamic` | — | Value assigned to `state.tessFog`. |
| `dlight` | `dynamic` | — | Value assigned to `state.tessDlight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L226)

- [mq3.renderer.tr_backend_runtime.Command](Type-mq3-renderer-tr-backend-runtime-command-886743832.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-create-function-create-texturestate-width-height-host-src-mq3-renderer-tr-backend-runtime-ml-2066661597"></a>
### create

```ml
function create(textureState, width, height, host)
```

Builds `mq3.renderer.tr_backend_runtime.State` using `mq3.renderer.command_queue.backend`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureState` | `dynamic` | — | Initial value for `mq3.renderer.tr_backend_runtime.State.textureState`. |
| `width` | `dynamic` | — | Initial value for `mq3.renderer.tr_backend_runtime.State.width`. |
| `height` | `dynamic` | — | Initial value for `mq3.renderer.tr_backend_runtime.State.height`. |
| `host` | `dynamic` | — | Initial value for `mq3.renderer.tr_backend_runtime.State.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L91)

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

Returns `error(7721,"invalid destination blend bits")` from `mq3.renderer.tr_backend_runtime.dstFactor`; earlier branches return `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — | Input used by `value=(bits&GLS_DSTBLEND_BITS)>>4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L156)

<a id="function-function-mq3-renderer-tr-backend-runtime-emit-function-emit-state-kind-value-src-mq3-renderer-tr-backend-runtime-ml-688575570"></a>
### emit

```ml
function emit(state, kind, value)
```

Returns `void` from `mq3.renderer.tr_backend_runtime.emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |
| `kind` | `dynamic` | — | Argument 2 supplied to `state.services.eventFn`. |
| `value` | `dynamic` | — | Argument 3 supplied to `state.services.eventFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L101)

<a id="function-function-mq3-renderer-tr-backend-runtime-endsurface-function-endsurface-state-src-mq3-renderer-tr-backend-runtime-ml-35622313"></a>
### endSurface

```ml
function endSurface(state)
```

Updates `state.numIndexes` in `mq3.renderer.tr_backend_runtime.endSurface`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.numIndexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L217)

<a id="function-function-mq3-renderer-tr-backend-runtime-entity-function-entity-src-mq3-renderer-tr-backend-runtime-ml-1480913574"></a>
### entity

```ml
function entity()
```

Constructs `mq3.renderer.tr_backend_runtime.Entity` with `shaderTime` = `0.0`, `renderfx` = `0`, `needDlights` = `false`, `modelMatrix` = `identityMatrix()`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L85)

- [mq3.renderer.tr_backend_runtime.Entity](Type-mq3-renderer-tr-backend-runtime-entity-41286948.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-entityat-function-entityat-state-index-src-mq3-renderer-tr-backend-runtime-ml-2045034993"></a>
### entityAt

```ml
function entityAt(state, index)
```

Returns `state.refdef.entities[index]` from `mq3.renderer.tr_backend_runtime.entityAt`; earlier branches return `state.worldEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.refdef`, `state.worldEntity`. |
| `index` | `dynamic` | — | Input tested by `index<0 or index>=len(state.refdef.entities)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L232)

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

Creates error `7720` with message `"tr_backend: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7720,"tr_backend: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L67)

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
| `state` | `dynamic` | — | Record providing `state.textureState`. |
| `image` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.texture_state.bind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L109)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-bindmultitexture-function-gl-bindmultitexture-state-image0-env0-image1-env1-src-mq3-renderer-tr-backend-runtime-ml-1116782723"></a>
### GL_BindMultitexture

```ml
function GL_BindMultitexture(state, image0, env0, image1, env1)
```

Calls `mq3.renderer.texture_state.bindMultitexture` with `(state.textureState,image0,env0,image1,env1)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.textureState`. |
| `image0` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.texture_state.bindMultitexture`. |
| `env0` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.texture_state.bindMultitexture`. |
| `image1` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.texture_state.bindMultitexture`. |
| `env1` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.texture_state.bindMultitexture`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L120)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-cull-function-gl-cull-state-culltype-src-mq3-renderer-tr-backend-runtime-ml-708200009"></a>
### GL_Cull

```ml
function GL_Cull(state, cullType)
```

Updates `state.gl.faceCulling` in `mq3.renderer.tr_backend_runtime.GL_Cull`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.gl.faceCulling`. |
| `cullType` | `dynamic` | — | Value assigned to `state.gl.faceCulling`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L125)

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

Calls `mq3.renderer.texture_state.selectTexture` with `(state.textureState,unit)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.textureState`. |
| `unit` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.texture_state.selectTexture`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L113)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-state-function-gl-state-state-statebits-src-mq3-renderer-tr-backend-runtime-ml-1505834368"></a>
### GL_State

```ml
function GL_State(state, stateBits)
```

Updates `state.gl.depthEqual`, `state.gl.blendEnabled`, `state.gl.srcBlend`, `state.gl.dstBlend`, `state.gl.depthWrite` in `mq3.renderer.tr_backend_runtime.GL_State`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.gl.depthEqual`, `state.gl.blendEnabled`, `state.gl.srcBlend`, `state.gl.dstBlend`, `state.gl.depthWrite`. |
| `stateBits` | `dynamic` | — | Value assigned to `state.gl.stateBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L162)

<a id="function-function-mq3-renderer-tr-backend-runtime-gl-texenv-function-gl-texenv-state-env-src-mq3-renderer-tr-backend-runtime-ml-1427232982"></a>
### GL_TexEnv

```ml
function GL_TexEnv(state, env)
```

Updates `state.gl.texEnv[unit]` in `mq3.renderer.tr_backend_runtime.GL_TexEnv`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.gl.texEnv[unit]`. |
| `env` | `dynamic` | — | Value assigned to `state.gl.texEnv[unit]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L141)

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

Constructs `mq3.renderer.tr_backend_runtime.GLState` with `faceCulling` = `-1`, `texEnv` = `[0,0]`, `stateBits` = `0`, `depthEqual` = `false` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L73)

- [mq3.renderer.tr_backend_runtime.GLState](Type-mq3-renderer-tr-backend-runtime-glstate-190043501.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-identityaxis-function-identityaxis-src-mq3-renderer-tr-backend-runtime-ml-283361342"></a>
### identityAxis

```ml
function identityAxis()
```

Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.tr_backend_runtime.identityAxis`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L77)

<a id="function-function-mq3-renderer-tr-backend-runtime-identitymatrix-function-identitymatrix-src-mq3-renderer-tr-backend-runtime-ml-994065822"></a>
### identityMatrix

```ml
function identityMatrix()
```

Returns `[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0]` for `mq3.renderer.tr_backend_runtime.identityMatrix`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L75)

- [mq3.renderer.tr_backend_runtime.ImageInfo](Type-mq3-renderer-tr-backend-runtime-imageinfo-829918140.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-portalplane-function-portalplane-view-src-mq3-renderer-tr-backend-runtime-ml-1552942819"></a>
### portalPlane

```ml
function portalPlane(view)
```

Transforms the portal clipping plane into the current view orientation and origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Record providing `view.portalNormal`, `view.orientationAxis`, `view.orientationOrigin`, `view.portalDist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L194)

<a id="function-function-mq3-renderer-tr-backend-runtime-poweroftwo-function-poweroftwo-value-src-mq3-renderer-tr-backend-runtime-ml-818435229"></a>
### powerOfTwo

```ml
function powerOfTwo(value)
```

Computes `value>0 and (value&(value-1))==0` for `mq3.renderer.tr_backend_runtime.powerOfTwo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value>0 and (value&(value-1))==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L277)

<a id="function-function-mq3-renderer-tr-backend-runtime-qglrequiredcount-function-qglrequiredcount-src-mq3-renderer-tr-backend-runtime-ml-660600014"></a>
### qglRequiredCount

```ml
function qglRequiredCount()
```

Calls `len` with `(qgl.requiredEntryPoints())` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L69)

- [mq3.renderer.tr_backend_runtime.RawQuad](Type-mq3-renderer-tr-backend-runtime-rawquad-264403308.md) — struct
- [mq3.renderer.tr_backend_runtime.RawUpload](Type-mq3-renderer-tr-backend-runtime-rawupload-2063821790.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-rb-begindrawingview-function-rb-begindrawingview-state-finishmode-measureoverdraw-shadowmode-fastsky-src-mq3-renderer-tr-backend-runtime-ml-1073826677"></a>
### RB_BeginDrawingView

```ml
function RB_BeginDrawingView(state, finishMode, measureOverdraw, shadowMode, fastSky)
```

Updates `state.finishCalled`, `state.projection2D`, `state.commandBackend.projection2D`, `state.isHyperspace`, `state.gl.faceCulling` in `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.finishCalled`, `state.projection2D`, `state.commandBackend.projection2D`, `state.isHyperspace`, `state.gl.faceCulling`. |
| `finishMode` | `dynamic` | — | Input tested by `finishMode==1 and not state.finishCalled`. |
| `measureOverdraw` | `dynamic` | — | Input tested by `measureOverdraw or shadowMode==2`. |
| `shadowMode` | `dynamic` | — | Input tested by `measureOverdraw or shadowMode==2`. |
| `fastSky` | `dynamic` | — | Input tested by `fastSky and (state.refdef.rdflags&RDF_NOWORLDMODEL)==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L204)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-drawbuffer-function-rb-drawbuffer-state-command-cleardebug-src-mq3-renderer-tr-backend-runtime-ml-317275902"></a>
### RB_DrawBuffer

```ml
function RB_DrawBuffer(state, command, clearDebug)
```

Returns `true` from `mq3.renderer.tr_backend_runtime.RB_DrawBuffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_backend_runtime.emit`. |
| `command` | `dynamic` | — | Record providing `command.payload`. |
| `clearDebug` | `dynamic` | — | Input tested by `clearDebug`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L352)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-drawsurfs-function-rb-drawsurfs-state-command-finishmode-measureoverdraw-shadowmode-fastsky-src-mq3-renderer-tr-backend-runtime-ml-2070467178"></a>
### RB_DrawSurfs

```ml
function RB_DrawSurfs(state, command, finishMode, measureOverdraw, shadowMode, fastSky)
```

Updates `state.refdef`, `state.viewParms` in `mq3.renderer.tr_backend_runtime.RB_DrawSurfs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.refdef`, `state.viewParms`. |
| `command` | `dynamic` | — | Record providing `command.payload`. |
| `finishMode` | `dynamic` | — | Value forwarded as `finishMode` to `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`. |
| `measureOverdraw` | `dynamic` | — | Value forwarded as `measureOverdraw` to `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`. |
| `fastSky` | `dynamic` | — | Value forwarded as `fastSky` to `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L345)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-executerendercommands-function-rb-executerendercommands-state-stream-smpenabled-secondbuffer-now-src-mq3-renderer-tr-backend-runtime-ml-207199408"></a>
### RB_ExecuteRenderCommands

```ml
function RB_ExecuteRenderCommands(state, stream, smpEnabled, secondBuffer, now)
```

Updates `state.smpFrame`, `state.msec` in `mq3.renderer.tr_backend_runtime.RB_ExecuteRenderCommands`; returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.smpFrame`, `state.msec`. |
| `stream` | `dynamic` | — | Sequence traversed as `command` while producing this result. |
| `smpEnabled` | `dynamic` | — | Input tested by `smpEnabled and secondBuffer`. |
| `secondBuffer` | `dynamic` | — | Input tested by `smpEnabled and secondBuffer`. |
| `now` | `dynamic` | — | Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_StretchPic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L385)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-hyperspace-function-rb-hyperspace-state-src-mq3-renderer-tr-backend-runtime-ml-590255791"></a>
### RB_Hyperspace

```ml
function RB_Hyperspace(state)
```

Updates `state.isHyperspace` in `mq3.renderer.tr_backend_runtime.RB_Hyperspace`; returns `c`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.isHyperspace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L184)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-renderdrawsurflist-function-rb-renderdrawsurflist-state-surfaces-shaders-finishmode-measureoverdraw-shadowmode-fastsky-src-mq3-renderer-tr-backend-runtime-ml-589030527"></a>
### RB_RenderDrawSurfList

```ml
function RB_RenderDrawSurfList(state, surfaces, shaders, finishMode, measureOverdraw, shadowMode, fastSky)
```

Updates `state.numIndexes`, `state.currentEntity`, `state.refdef.floatTime` in `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`; returns `rendered`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.numIndexes`, `state.currentEntity`, `state.refdef.floatTime`. |
| `surfaces` | `dynamic` | — | Sequence traversed as `item` while producing this result. |
| `shaders` | `dynamic` | — | Indexed input read at `fields.shaderIndex`. |
| `finishMode` | `dynamic` | — | Value forwarded as `finishMode` to `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`. |
| `measureOverdraw` | `dynamic` | — | Value forwarded as `measureOverdraw` to `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`. |
| `fastSky` | `dynamic` | — | Value forwarded as `fastSky` to `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L243)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-renderthread-function-rb-renderthread-state-streams-smpenabled-now-src-mq3-renderer-tr-backend-runtime-ml-1949823895"></a>
### RB_RenderThread

```ml
function RB_RenderThread(state, streams, smpEnabled, now)
```

Returns `count` from `mq3.renderer.tr_backend_runtime.RB_RenderThread`; earlier branches return `0`, `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_backend_runtime.RB_ExecuteRenderCommands`. |
| `streams` | `dynamic` | — | Sequence traversed as `stream` while producing this result. |
| `smpEnabled` | `dynamic` | — | Value forwarded as `smpEnabled` to `mq3.renderer.tr_backend_runtime.RB_ExecuteRenderCommands`. |
| `now` | `dynamic` | — | Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_ExecuteRenderCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L404)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-setcolor-function-rb-setcolor-state-command-src-mq3-renderer-tr-backend-runtime-ml-1152739616"></a>
### RB_SetColor

```ml
function RB_SetColor(state, command)
```

Updates `state.color2D` in `mq3.renderer.tr_backend_runtime.RB_SetColor`; returns `state.color2D`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.color2D`. |
| `command` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.command_queue.executeSetColor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L327)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-setgl2d-function-rb-setgl2d-state-now-src-mq3-renderer-tr-backend-runtime-ml-79382669"></a>
### RB_SetGL2D

```ml
function RB_SetGL2D(state, now)
```

Updates `state.projection2D`, `state.commandBackend.projection2D`, `state.refdef.time`, `state.refdef.floatTime` in `mq3.renderer.tr_backend_runtime.RB_SetGL2D`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.projection2D`, `state.commandBackend.projection2D`, `state.refdef.time`, `state.refdef.floatTime`. |
| `now` | `dynamic` | — | Value assigned to `state.refdef.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L272)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-showimages-function-rb-showimages-state-images-mode-now-src-mq3-renderer-tr-backend-runtime-ml-1385755930"></a>
### RB_ShowImages

```ml
function RB_ShowImages(state, images, mode, now)
```

Builds a 20-by-15 image-inspection grid, optionally scaling each tile by uploaded texture dimensions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.projection2D`, `state.width`, `state.height`. |
| `images` | `dynamic` | — | Indexed input read at `index`. |
| `mode` | `dynamic` | — | Input tested by `mode==2`. |
| `now` | `dynamic` | — | Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_SetGL2D`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L360)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-stretchpic-function-rb-stretchpic-state-command-now-src-mq3-renderer-tr-backend-runtime-ml-301714610"></a>
### RB_StretchPic

```ml
function RB_StretchPic(state, command, now)
```

Updates `state.numIndexes`, `state.tessShader` in `mq3.renderer.tr_backend_runtime.RB_StretchPic`; returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.numIndexes`, `state.tessShader`. |
| `command` | `dynamic` | — | Record providing `command.shader`. |
| `now` | `dynamic` | — | Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_SetGL2D`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L334)

<a id="function-function-mq3-renderer-tr-backend-runtime-rb-swapbuffers-function-rb-swapbuffers-state-command-showimages-images-measureoverdraw-stencil-now-src-mq3-renderer-tr-backend-runtime-ml-1923408661"></a>
### RB_SwapBuffers

```ml
function RB_SwapBuffers(state, command, showImages, images, measureOverdraw, stencil, now)
```

Updates `state.overdraw`, `state.projection2D`, `state.commandBackend.projection2D`, `state.frames` in `mq3.renderer.tr_backend_runtime.RB_SwapBuffers`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.overdraw`, `state.projection2D`, `state.commandBackend.projection2D`, `state.frames`. |
| `command` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `showImages` | `dynamic` | — | Value forwarded as `mode` to `mq3.renderer.tr_backend_runtime.RB_ShowImages`. |
| `images` | `dynamic` | — | Value forwarded as `images` to `mq3.renderer.tr_backend_runtime.RB_ShowImages`. |
| `measureOverdraw` | `dynamic` | — | Input tested by `measureOverdraw`. |
| `stencil` | `dynamic` | — | Sequence traversed as `value` while producing this result. |
| `now` | `dynamic` | — | Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_ShowImages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L373)

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

Uploads raw cinematic pixels, switches to 2D projection, and emits a half-texel-corrected screen quad.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `x` | `dynamic` | — | Input used by `quad=RawQuad([[x,y],[x+w,y],[x+w,y+h],[x,y+h]],[[0.5/cols,0.5/rows],[(cols-0.5)/cols,0.5/rows],[(cols-0.5)/cols,(rows-0.5)/rows],[0.5/cols,(rows-0.5)/rows]],client)`. |
| `y` | `dynamic` | — | Input used by `quad=RawQuad([[x,y],[x+w,y],[x+w,y+h],[x,y+h]],[[0.5/cols,0.5/rows],[(cols-0.5)/cols,0.5/rows],[(cols-0.5)/cols,(rows-0.5)/rows],[0.5/cols,(rows-0.5)/rows]],client)`. |
| `w` | `dynamic` | — | Value forwarded as `w` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `h` | `dynamic` | — | Value forwarded as `h` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `cols` | `dynamic` | — | Value forwarded as `cols` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `rows` | `dynamic` | — | Value forwarded as `rows` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `client` | `dynamic` | — | Value forwarded as `client` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `dirty` | `dynamic` | — | Value forwarded as `dirty` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `now` | `dynamic` | — | Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_SetGL2D`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L319)

<a id="function-function-mq3-renderer-tr-backend-runtime-re-uploadcinematic-function-re-uploadcinematic-state-w-h-cols-rows-data-client-dirty-src-mq3-renderer-tr-backend-runtime-ml-795025203"></a>
### RE_UploadCinematic

```ml
function RE_UploadCinematic(state, w, h, cols, rows, data, client, dirty)
```

Calls `mq3.renderer.tr_backend_runtime.uploadRaw` with `(state,w,h,cols,rows,data,client,dirty,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `w` | `dynamic` | — | Value forwarded as `w` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `h` | `dynamic` | — | Value forwarded as `h` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `cols` | `dynamic` | — | Value forwarded as `cols` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `rows` | `dynamic` | — | Value forwarded as `rows` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `client` | `dynamic` | — | Value forwarded as `client` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |
| `dirty` | `dynamic` | — | Value forwarded as `dirty` to `mq3.renderer.tr_backend_runtime.uploadRaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L306)

<a id="function-function-mq3-renderer-tr-backend-runtime-refdef-function-refdef-src-mq3-renderer-tr-backend-runtime-ml-2037207058"></a>
### refdef

```ml
function refdef()
```

Constructs `mq3.renderer.tr_backend_runtime.Refdef` with `time` = `0`, `floatTime` = `0.0`, `rdflags` = `0`, `entities` = `[]` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L83)

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

Constructs `mq3.renderer.tr_backend_runtime.Services` with `eventFn` = `void`, `surfaceFn` = `void`, `screenshotFn` = `void`, `sleepFn` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L71)

- [mq3.renderer.tr_backend_runtime.Services](Type-mq3-renderer-tr-backend-runtime-services-185343063.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-setviewportandscissor-function-setviewportandscissor-state-src-mq3-renderer-tr-backend-runtime-ml-1842268011"></a>
### SetViewportAndScissor

```ml
function SetViewportAndScissor(state)
```

Emits the current view's projection matrix, viewport rectangle, and matching scissor rectangle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.viewParms`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L189)

- [mq3.renderer.tr_backend_runtime.Shader](Type-mq3-renderer-tr-backend-runtime-shader-300402966.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-srcfactor-function-srcfactor-bits-src-mq3-renderer-tr-backend-runtime-ml-1237541220"></a>
### srcFactor

```ml
function srcFactor(bits)
```

Returns `error(7721,"invalid source blend bits")` from `mq3.renderer.tr_backend_runtime.srcFactor`; earlier branches return `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bits` | `dynamic` | — | Input used by `value=bits&GLS_SRCBLEND_BITS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L151)

- [mq3.renderer.tr_backend_runtime.State](Type-mq3-renderer-tr-backend-runtime-state-1159708060.md) — struct
- [mq3.renderer.tr_backend_runtime.Surface](Type-mq3-renderer-tr-backend-runtime-surface-943809398.md) — struct
<a id="function-function-mq3-renderer-tr-backend-runtime-uploadraw-function-uploadraw-state-w-h-cols-rows-data-client-dirty-requirepoweroftwo-src-mq3-renderer-tr-backend-runtime-ml-2031144796"></a>
### uploadRaw

```ml
function uploadRaw(state, w, h, cols, rows, data, client, dirty, requirePowerOfTwo)
```

Updates `state.rawImages`, `state.rawImages[client]`, `state.uploads` in `mq3.renderer.tr_backend_runtime.uploadRaw`; returns `full or dirty`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.rawImages`, `state.rawImages[client]`, `state.uploads`. |
| `w` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `h` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `cols` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_backend_runtime.powerOfTwo`. |
| `rows` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_backend_runtime.powerOfTwo`. |
| `data` | `dynamic` | — | Value used for `mq3.renderer.tr_backend_runtime.RawUpload.pixels`. |
| `client` | `dynamic` | — | Value used for `mq3.renderer.tr_backend_runtime.RawUpload.client`. |
| `dirty` | `dynamic` | — | Value used for `mq3.renderer.tr_backend_runtime.RawUpload.dirty`. |
| `requirePowerOfTwo` | `dynamic` | — | Input tested by `requirePowerOfTwo and (not powerOfTwo(cols) or not powerOfTwo(rows))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L288)

<a id="function-function-mq3-renderer-tr-backend-runtime-viewparms-function-viewparms-width-height-src-mq3-renderer-tr-backend-runtime-ml-1682628611"></a>
### viewParms

```ml
function viewParms(width, height)
```

Constructs `mq3.renderer.tr_backend_runtime.ViewParms` with `projectionMatrix` = `identityMatrix()`, `viewportX` = `0`, `viewportY` = `0`, `isPortal` = `false` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Initial value for `mq3.renderer.tr_backend_runtime.ViewParms.viewportWidth`. |
| `height` | `dynamic` | — | Initial value for `mq3.renderer.tr_backend_runtime.ViewParms.viewportHeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_backend_runtime.ml#L81)

- [mq3.renderer.tr_backend_runtime.ViewParms](Type-mq3-renderer-tr-backend-runtime-viewparms-1607762701.md) — struct
