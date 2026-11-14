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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L32)

<a id="function-function-mq3-renderer-qgl-address-function-address-registry-name-src-mq3-renderer-qgl-ml-1465922362"></a>
### address

```ml
function address(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L28)

<a id="function-function-mq3-renderer-qgl-allentrypoints-function-allentrypoints-src-mq3-renderer-qgl-ml-1088780866"></a>
### allEntryPoints

```ml
function allEntryPoints()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L21)

<a id="function-function-mq3-renderer-qgl-bind-function-bind-registry-name-address-extension-src-mq3-renderer-qgl-ml-397525989"></a>
### bind

```ml
function bind(registry, name, address, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L23)

- [mq3.renderer.qgl.Binding](Type-mq3-renderer-qgl-binding-1733404316.md) — struct
<a id="function-function-mq3-renderer-qgl-coreentrypoints-function-coreentrypoints-src-mq3-renderer-qgl-ml-1531107578"></a>
### coreEntryPoints

```ml
function coreEntryPoints()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L17)

<a id="function-function-mq3-renderer-qgl-createregistry-function-createregistry-src-mq3-renderer-qgl-ml-314655282"></a>
### createRegistry

```ml
function createRegistry()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L22)

<a id="constant-constant-mq3-renderer-qgl-gl-active-texture-arb-const-gl-active-texture-arb-34016-src-mq3-renderer-qgl-ml-687394577"></a>
### GL_ACTIVE_TEXTURE_ARB

```ml
const GL_ACTIVE_TEXTURE_ARB = 34016
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L6)

<a id="constant-constant-mq3-renderer-qgl-gl-client-active-texture-arb-const-gl-client-active-texture-arb-34017-src-mq3-renderer-qgl-ml-1439065592"></a>
### GL_CLIENT_ACTIVE_TEXTURE_ARB

```ml
const GL_CLIENT_ACTIVE_TEXTURE_ARB = 34017
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L7)

<a id="constant-constant-mq3-renderer-qgl-gl-max-active-textures-arb-const-gl-max-active-textures-arb-34018-src-mq3-renderer-qgl-ml-632731941"></a>
### GL_MAX_ACTIVE_TEXTURES_ARB

```ml
const GL_MAX_ACTIVE_TEXTURES_ARB = 34018
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L8)

<a id="constant-constant-mq3-renderer-qgl-gl-rgb4-s3tc-const-gl-rgb4-s3tc-33697-src-mq3-renderer-qgl-ml-697838119"></a>
### GL_RGB4_S3TC

```ml
const GL_RGB4_S3TC = 33697
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L14)

<a id="constant-constant-mq3-renderer-qgl-gl-rgb-s3tc-const-gl-rgb-s3tc-33696-src-mq3-renderer-qgl-ml-1286779984"></a>
### GL_RGB_S3TC

```ml
const GL_RGB_S3TC = 33696
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L13)

<a id="constant-constant-mq3-renderer-qgl-gl-texture0-arb-const-gl-texture0-arb-33984-src-mq3-renderer-qgl-ml-493826042"></a>
### GL_TEXTURE0_ARB

```ml
const GL_TEXTURE0_ARB = 33984
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L9)

<a id="constant-constant-mq3-renderer-qgl-gl-texture1-arb-const-gl-texture1-arb-33985-src-mq3-renderer-qgl-ml-1166427285"></a>
### GL_TEXTURE1_ARB

```ml
const GL_TEXTURE1_ARB = 33985
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L10)

<a id="constant-constant-mq3-renderer-qgl-gl-texture2-arb-const-gl-texture2-arb-33986-src-mq3-renderer-qgl-ml-1330009912"></a>
### GL_TEXTURE2_ARB

```ml
const GL_TEXTURE2_ARB = 33986
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L11)

<a id="constant-constant-mq3-renderer-qgl-gl-texture3-arb-const-gl-texture3-arb-33987-src-mq3-renderer-qgl-ml-970837915"></a>
### GL_TEXTURE3_ARB

```ml
const GL_TEXTURE3_ARB = 33987
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L12)

<a id="function-function-mq3-renderer-qgl-has-function-has-registry-name-src-mq3-renderer-qgl-ml-1312593986"></a>
### has

```ml
function has(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L29)

<a id="function-function-mq3-renderer-qgl-missingrequired-function-missingrequired-registry-src-mq3-renderer-qgl-ml-1508667805"></a>
### missingRequired

```ml
function missingRequired(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L31)

<a id="function-function-mq3-renderer-qgl-platformentrypoints-function-platformentrypoints-src-mq3-renderer-qgl-ml-1488356746"></a>
### platformEntryPoints

```ml
function platformEntryPoints()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L19)

<a id="function-function-mq3-renderer-qgl-proceduretypes-function-proceduretypes-src-mq3-renderer-qgl-ml-1175900874"></a>
### procedureTypes

```ml
function procedureTypes()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L20)

- [mq3.renderer.qgl.Registry](Type-mq3-renderer-qgl-registry-1489148500.md) — struct
<a id="function-function-mq3-renderer-qgl-requiredentrypoints-function-requiredentrypoints-src-mq3-renderer-qgl-ml-482584458"></a>
### requiredEntryPoints

```ml
function requiredEntryPoints()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L30)

<a id="function-function-mq3-renderer-qgl-reset-function-reset-registry-src-mq3-renderer-qgl-ml-280883181"></a>
### reset

```ml
function reset(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L33)

<a id="function-function-mq3-renderer-qgl-wglentrypoints-function-wglentrypoints-src-mq3-renderer-qgl-ml-1204612094"></a>
### wglEntryPoints

```ml
function wglEntryPoints()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qgl.ml#L18)
