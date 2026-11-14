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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `requested` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L50)

<a id="function-function-mq3-renderer-texture-state-bindmultitexture-function-bindmultitexture-state-image0-env0-image1-env1-src-mq3-renderer-texture-state-ml-847371181"></a>
### bindMultitexture

```ml
function bindMultitexture(state, image0, env0, image1, env1)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `image0` | `dynamic` | — |  |
| `env0` | `dynamic` | — |  |
| `image1` | `dynamic` | — |  |
| `env1` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L63)

<a id="function-function-mq3-renderer-texture-state-create-function-create-host-defaultimage-src-mq3-renderer-texture-state-ml-814002454"></a>
### create

```ml
function create(host, defaultImage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `defaultImage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L18)

<a id="function-function-mq3-renderer-texture-state-emitlog-function-emitlog-state-message-src-mq3-renderer-texture-state-ml-455318900"></a>
### emitLog

```ml
function emitLog(state, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L24)

<a id="function-function-mq3-renderer-texture-state-fail-function-fail-message-src-mq3-renderer-texture-state-ml-1596140763"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L14)

<a id="constant-constant-mq3-renderer-texture-state-gl-texture0-arb-const-gl-texture0-arb-33984-src-mq3-renderer-texture-state-ml-1734616596"></a>
### GL_TEXTURE0_ARB

```ml
const GL_TEXTURE0_ARB = 33984
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L7)

<a id="constant-constant-mq3-renderer-texture-state-gl-texture1-arb-const-gl-texture1-arb-33985-src-mq3-renderer-texture-state-ml-2030731451"></a>
### GL_TEXTURE1_ARB

```ml
const GL_TEXTURE1_ARB = 33985
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L8)

<a id="constant-constant-mq3-renderer-texture-state-gl-texture-2d-const-gl-texture-2d-3553-src-mq3-renderer-texture-state-ml-1473559641"></a>
### GL_TEXTURE_2D

```ml
const GL_TEXTURE_2D = 3553
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L6)

<a id="function-function-mq3-renderer-texture-state-image-function-image-texnum-src-mq3-renderer-texture-state-ml-1971539513"></a>
### image

```ml
function image(texnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `texnum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L16)

- [mq3.renderer.texture_state.Image](Type-mq3-renderer-texture-state-image-1196657097.md) — struct
<a id="function-function-mq3-renderer-texture-state-requestedimage-function-requestedimage-state-requested-src-mq3-renderer-texture-state-ml-2028756463"></a>
### requestedImage

```ml
function requestedImage(state, requested)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `requested` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L44)

<a id="function-function-mq3-renderer-texture-state-selecttexture-function-selecttexture-state-unit-src-mq3-renderer-texture-state-ml-1620181749"></a>
### selectTexture

```ml
function selectTexture(state, unit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `unit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L28)

<a id="function-function-mq3-renderer-texture-state-services-function-services-src-mq3-renderer-texture-state-ml-388774650"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L15)

- [mq3.renderer.texture_state.Services](Type-mq3-renderer-texture-state-services-1901593252.md) — struct
- [mq3.renderer.texture_state.State](Type-mq3-renderer-texture-state-state-1178098449.md) — struct
