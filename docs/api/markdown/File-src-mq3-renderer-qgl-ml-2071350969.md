# `src/mq3/renderer/qgl.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qgl`](Package-mq3-renderer-qgl-1266235887.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-renderer-qgl-activate-function-activate-registry-driver-src-mq3-renderer-qgl-ml-24159473"></a>
### activate

```ml
function activate(registry, driver)
```

Updates `registry.driver`, `registry.loaded` in `mq3.renderer.qgl.activate`; returns `registry.loaded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Mutable record or buffer; this call updates `registry.driver`, `registry.loaded`. |
| `driver` | `dynamic` | — | Value assigned to `registry.driver`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L80)

<a id="function-function-mq3-renderer-qgl-address-function-address-registry-name-src-mq3-renderer-qgl-ml-1465922362"></a>
### address

```ml
function address(registry, name)
```

Returns `0` from `mq3.renderer.qgl.address`; earlier branches return `0`, `item.address`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record providing `registry.bindings`. |
| `name` | `dynamic` | — | Input used by `for each item in registry.bindings if item.name==name then return item.address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L67)

<a id="function-function-mq3-renderer-qgl-allentrypoints-function-allentrypoints-src-mq3-renderer-qgl-ml-1088780866"></a>
### allEntryPoints

```ml
function allEntryPoints()
```

Calls `mq3.renderer.qgl.coreEntryPoints` with `()+wglEntryPoints()+platformEntryPoints()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L51)

<a id="function-function-mq3-renderer-qgl-bind-function-bind-registry-name-address-extension-src-mq3-renderer-qgl-ml-397525989"></a>
### bind

```ml
function bind(registry, name, address, extension)
```

Updates `registry.bindings` in `mq3.renderer.qgl.bind`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Mutable record or buffer; this call updates `registry.bindings`. |
| `name` | `dynamic` | — | Value used for `mq3.renderer.qgl.Binding.name`. |
| `address` | `dynamic` | — | Value assigned to `item.address`. |
| `extension` | `dynamic` | — | Value assigned to `item.extension`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L59)

- [mq3.renderer.qgl.Binding](Type-mq3-renderer-qgl-binding-1733404316.md) — struct
<a id="function-function-mq3-renderer-qgl-coreentrypoints-function-coreentrypoints-src-mq3-renderer-qgl-ml-1531107578"></a>
### coreEntryPoints

```ml
function coreEntryPoints()
```

Lists the 341 declared names for `mq3.renderer.qgl.coreEntryPoints`, including `qglAccum`, `qglActiveTextureARB`, `qglAlphaFunc`, `qglAreTexturesResident`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L43)

<a id="function-function-mq3-renderer-qgl-createregistry-function-createregistry-src-mq3-renderer-qgl-ml-314655282"></a>
### createRegistry

```ml
function createRegistry()
```

Constructs `mq3.renderer.qgl.Registry` with `bindings` = `[]`, `loaded` = `false`, `driver` = `""`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L53)

<a id="constant-constant-mq3-renderer-qgl-gl-active-texture-arb-const-gl-active-texture-arb-34016-src-mq3-renderer-qgl-ml-687394577"></a>
### GL_ACTIVE_TEXTURE_ARB

```ml
const GL_ACTIVE_TEXTURE_ARB = 34016
```

OpenGL state-query selector for the active server-side texture unit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L7)

<a id="constant-constant-mq3-renderer-qgl-gl-client-active-texture-arb-const-gl-client-active-texture-arb-34017-src-mq3-renderer-qgl-ml-1439065592"></a>
### GL_CLIENT_ACTIVE_TEXTURE_ARB

```ml
const GL_CLIENT_ACTIVE_TEXTURE_ARB = 34017
```

OpenGL state-query selector for the active client texture-coordinate array unit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L9)

<a id="constant-constant-mq3-renderer-qgl-gl-max-active-textures-arb-const-gl-max-active-textures-arb-34018-src-mq3-renderer-qgl-ml-632731941"></a>
### GL_MAX_ACTIVE_TEXTURES_ARB

```ml
const GL_MAX_ACTIVE_TEXTURES_ARB = 34018
```

OpenGL state-query selector for the maximum number of simultaneously active texture units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L11)

<a id="constant-constant-mq3-renderer-qgl-gl-rgb4-s3tc-const-gl-rgb4-s3tc-33697-src-mq3-renderer-qgl-ml-697838119"></a>
### GL_RGB4_S3TC

```ml
const GL_RGB4_S3TC = 33697
```

OpenGL legacy RGB4_S3TC compressed RGB texture-format selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L23)

<a id="constant-constant-mq3-renderer-qgl-gl-rgb-s3tc-const-gl-rgb-s3tc-33696-src-mq3-renderer-qgl-ml-1286779984"></a>
### GL_RGB_S3TC

```ml
const GL_RGB_S3TC = 33696
```

OpenGL legacy S3TC compressed RGB texture-format selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L21)

<a id="constant-constant-mq3-renderer-qgl-gl-texture0-arb-const-gl-texture0-arb-33984-src-mq3-renderer-qgl-ml-493826042"></a>
### GL_TEXTURE0_ARB

```ml
const GL_TEXTURE0_ARB = 33984
```

OpenGL multitexture selector for texture unit 0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L13)

<a id="constant-constant-mq3-renderer-qgl-gl-texture1-arb-const-gl-texture1-arb-33985-src-mq3-renderer-qgl-ml-1166427285"></a>
### GL_TEXTURE1_ARB

```ml
const GL_TEXTURE1_ARB = 33985
```

OpenGL multitexture selector for texture unit 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L15)

<a id="constant-constant-mq3-renderer-qgl-gl-texture2-arb-const-gl-texture2-arb-33986-src-mq3-renderer-qgl-ml-1330009912"></a>
### GL_TEXTURE2_ARB

```ml
const GL_TEXTURE2_ARB = 33986
```

OpenGL multitexture selector for texture unit 2.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L17)

<a id="constant-constant-mq3-renderer-qgl-gl-texture3-arb-const-gl-texture3-arb-33987-src-mq3-renderer-qgl-ml-970837915"></a>
### GL_TEXTURE3_ARB

```ml
const GL_TEXTURE3_ARB = 33987
```

OpenGL multitexture selector for texture unit 3.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L19)

<a id="function-function-mq3-renderer-qgl-has-function-has-registry-name-src-mq3-renderer-qgl-ml-1312593986"></a>
### has

```ml
function has(registry, name)
```

Computes `address(registry,name)!=0` for `mq3.renderer.qgl.has`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value forwarded as `registry` to `mq3.renderer.qgl.address`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.qgl.address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L71)

<a id="function-function-mq3-renderer-qgl-missingrequired-function-missingrequired-registry-src-mq3-renderer-qgl-ml-1508667805"></a>
### missingRequired

```ml
function missingRequired(registry)
```

Returns `missing` from `mq3.renderer.qgl.missingRequired`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Value forwarded as `registry` to `mq3.renderer.qgl.has`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L76)

<a id="function-function-mq3-renderer-qgl-platformentrypoints-function-platformentrypoints-src-mq3-renderer-qgl-ml-1488356746"></a>
### platformEntryPoints

```ml
function platformEntryPoints()
```

Lists the 12 declared names for `mq3.renderer.qgl.platformEntryPoints`, including `qfxMesaCreateBestContext`, `qfxMesaCreateContext`, `qfxMesaDestroyContext`, `qfxMesaGetCurrentContext`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L47)

<a id="function-function-mq3-renderer-qgl-proceduretypes-function-proceduretypes-src-mq3-renderer-qgl-ml-1175900874"></a>
### procedureTypes

```ml
function procedureTypes()
```

Lists the 34 declared names for `mq3.renderer.qgl.procedureTypes`, including `PFNGLACTIVETEXTUREARBPROC`, `PFNGLCLIENTACTIVETEXTUREARBPROC`, `PFNGLMULTITEXCOORD1DARBPROC`, `PFNGLMULTITEXCOORD1DVARBPROC`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L49)

- [mq3.renderer.qgl.Registry](Type-mq3-renderer-qgl-registry-1489148500.md) — struct
<a id="function-function-mq3-renderer-qgl-requiredentrypoints-function-requiredentrypoints-src-mq3-renderer-qgl-ml-482584458"></a>
### requiredEntryPoints

```ml
function requiredEntryPoints()
```

Lists the 26 declared names for `mq3.renderer.qgl.requiredEntryPoints`, including `qglBindTexture`, `qglBlendFunc`, `qglClear`, `qglClearColor`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L73)

<a id="function-function-mq3-renderer-qgl-reset-function-reset-registry-src-mq3-renderer-qgl-ml-280883181"></a>
### reset

```ml
function reset(registry)
```

Updates `registry.bindings`, `registry.loaded`, `registry.driver` in `mq3.renderer.qgl.reset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Mutable record or buffer; this call updates `registry.bindings`, `registry.loaded`, `registry.driver`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L83)

<a id="function-function-mq3-renderer-qgl-wglentrypoints-function-wglentrypoints-src-mq3-renderer-qgl-ml-1204612094"></a>
### wglEntryPoints

```ml
function wglEntryPoints()
```

Lists the 24 declared names for `mq3.renderer.qgl.wglEntryPoints`, including `qwglChoosePixelFormat`, `qwglCopyContext`, `qwglCreateContext`, `qwglCreateLayerContext`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L45)
