# `src/mq3/renderer/texture_state.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.texture_state`](Package-mq3-renderer-texture-state-366401578.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-renderer-texture-state-bind-function-bind-state-requested-src-mq3-renderer-texture-state-ml-1424886915"></a>
### bind

```ml
function bind(state, requested)
```

Updates `requested.frameUsed`, `state.currentTextures[unit]` in `mq3.renderer.texture_state.bind`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.currentTextures[unit]`. |
| `requested` | `dynamic` | — | Mutable record or buffer; this call updates `requested.frameUsed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L112)

<a id="function-function-mq3-renderer-texture-state-bindmultitexture-function-bindmultitexture-state-image0-env0-image1-env1-src-mq3-renderer-texture-state-ml-847371181"></a>
### bindMultitexture

```ml
function bindMultitexture(state, image0, env0, image1, env1)
```

Updates `image1.frameUsed`, `state.currentTextures[1]`, `image0.frameUsed`, `state.currentTextures[0]` in `mq3.renderer.texture_state.bindMultitexture`; returns `changed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.currentTextures[1]`, `state.currentTextures[0]`. |
| `image0` | `dynamic` | — | Mutable record or buffer; this call updates `image0.frameUsed`. |
| `env0` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `image1` | `dynamic` | — | Mutable record or buffer; this call updates `image1.frameUsed`. |
| `env1` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L131)

<a id="function-function-mq3-renderer-texture-state-create-function-create-host-defaultimage-src-mq3-renderer-texture-state-ml-814002454"></a>
### create

```ml
function create(host, defaultImage)
```

Builds `mq3.renderer.texture_state.State` for `mq3.renderer.texture_state.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Initial value for `mq3.renderer.texture_state.State.services`. |
| `defaultImage` | `dynamic` | — | Initial value for `mq3.renderer.texture_state.State.defaultImage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L68)

<a id="function-function-mq3-renderer-texture-state-emitlog-function-emitlog-state-message-src-mq3-renderer-texture-state-ml-455318900"></a>
### emitLog

```ml
function emitLog(state, message)
```

Sends texture-state diagnostic text through the optional logging callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |
| `message` | `dynamic` | — | Argument 2 supplied to `state.services.logFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L77)

<a id="function-function-mq3-renderer-texture-state-fail-function-fail-message-src-mq3-renderer-texture-state-ml-1596140763"></a>
### fail

```ml
function fail(message)
```

Creates error `7200` with message `"texture state: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7200,"texture state: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L58)

<a id="constant-constant-mq3-renderer-texture-state-gl-texture0-arb-const-gl-texture0-arb-33984-src-mq3-renderer-texture-state-ml-1734616596"></a>
### GL_TEXTURE0_ARB

```ml
const GL_TEXTURE0_ARB = 33984
```

OpenGL multitexture selector for texture unit 0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L9)

<a id="constant-constant-mq3-renderer-texture-state-gl-texture1-arb-const-gl-texture1-arb-33985-src-mq3-renderer-texture-state-ml-2030731451"></a>
### GL_TEXTURE1_ARB

```ml
const GL_TEXTURE1_ARB = 33985
```

OpenGL multitexture selector for texture unit 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L11)

<a id="constant-constant-mq3-renderer-texture-state-gl-texture-2d-const-gl-texture-2d-3553-src-mq3-renderer-texture-state-ml-1473559641"></a>
### GL_TEXTURE_2D

```ml
const GL_TEXTURE_2D = 3553
```

OpenGL target for two-dimensional texture objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L7)

<a id="function-function-mq3-renderer-texture-state-image-function-image-texnum-src-mq3-renderer-texture-state-ml-1971539513"></a>
### image

```ml
function image(texnum)
```

Constructs `mq3.renderer.texture_state.Image` with `frameUsed` = `0` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `texnum` | `dynamic` | — | Initial value for `mq3.renderer.texture_state.Image.texnum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L63)

- [mq3.renderer.texture_state.Image](Type-mq3-renderer-texture-state-image-1196657097.md) — struct
<a id="function-function-mq3-renderer-texture-state-requestedimage-function-requestedimage-state-requested-src-mq3-renderer-texture-state-ml-2028756463"></a>
### requestedImage

```ml
function requestedImage(state, requested)
```

Returns `state.defaultImage` from `mq3.renderer.texture_state.requestedImage`; earlier branches return `requested`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`, `state.defaultImage`. |
| `requested` | `dynamic` | — | Input tested by `requested!=void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L103)

<a id="function-function-mq3-renderer-texture-state-selecttexture-function-selecttexture-state-unit-src-mq3-renderer-texture-state-ml-1620181749"></a>
### selectTexture

```ml
function selectTexture(state, unit)
```

Updates `state.currentTmu` in `mq3.renderer.texture_state.selectTexture`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.currentTmu`. |
| `unit` | `dynamic` | — | Value assigned to `state.currentTmu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L84)

<a id="function-function-mq3-renderer-texture-state-services-function-services-src-mq3-renderer-texture-state-ml-388774650"></a>
### services

```ml
function services()
```

Constructs `mq3.renderer.texture_state.Services` with `bindTextureFn` = `void`, `activeTextureFn` = `void`, `clientActiveTextureFn` = `void`, `logFn` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/texture_state.ml#L60)

- [mq3.renderer.texture_state.Services](Type-mq3-renderer-texture-state-services-1901593252.md) — struct
- [mq3.renderer.texture_state.State](Type-mq3-renderer-texture-state-state-1178098449.md) — struct
