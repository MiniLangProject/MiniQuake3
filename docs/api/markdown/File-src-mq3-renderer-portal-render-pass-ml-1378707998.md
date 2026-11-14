# `src/mq3/renderer/portal_render_pass.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.portal_render_pass`](Package-mq3-renderer-portal-render-pass-616994596.md)

Reachable from entry: **yes**

## Imports

- `mq3/renderer/portal_view.ml` as `portalView` → [src/mq3/renderer/portal_view.ml](File-src-mq3-renderer-portal-view-ml-1859210863.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-portal-render-pass-compose-function-compose-services-portal-src-mq3-renderer-portal-render-pass-ml-42640574"></a>
### compose

```ml
function compose(services, portal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `portal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L55)

- [mq3.renderer.portal_render_pass.ComposeServices](Type-mq3-renderer-portal-render-pass-composeservices-375393362.md) — struct
<a id="function-function-mq3-renderer-portal-render-pass-fail-function-fail-message-src-mq3-renderer-portal-render-pass-ml-736748327"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L12)

- [mq3.renderer.portal_render_pass.Plan](Type-mq3-renderer-portal-render-pass-plan-1216886981.md) — struct
<a id="function-function-mq3-renderer-portal-render-pass-planefor-function-planefor-triangle-vieworigin-src-mq3-renderer-portal-render-pass-ml-970024339"></a>
### planeFor

```ml
function planeFor(triangle, viewOrigin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L19)

<a id="function-function-mq3-renderer-portal-render-pass-portalmaterial-function-portalmaterial-catalog-textureindex-src-mq3-renderer-portal-render-pass-ml-1707931086"></a>
### portalMaterial

```ml
function portalMaterial(catalog, textureIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `textureIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L13)

<a id="function-function-mq3-renderer-portal-render-pass-prepare-function-prepare-renderdata-catalog-geometry-sourcerefdef-isportal-src-mq3-renderer-portal-render-pass-ml-2049993458"></a>
### prepare

```ml
function prepare(renderData, catalog, geometry, sourceRefdef, isPortal)
```

Baseq3 renders at most the first viable portal view in a main view and refuses recursion.  Here distance provides deterministic draw-surface ordering when several selected portal faces share sort == SS_PORTAL.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `geometry` | `dynamic` | — |  |
| `sourceRefdef` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L33)

- [mq3.renderer.portal_render_pass.Refdef](Type-mq3-renderer-portal-render-pass-refdef-994927790.md) — struct
<a id="function-function-mq3-renderer-portal-render-pass-seenface-function-seenface-values-faceindex-src-mq3-renderer-portal-render-pass-ml-2114617569"></a>
### seenFace

```ml
function seenFace(values, faceIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `faceIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L28)

<a id="function-function-mq3-renderer-portal-render-pass-squareddistance-function-squareddistance-a-b-src-mq3-renderer-portal-render-pass-ml-931224495"></a>
### squaredDistance

```ml
function squaredDistance(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L18)

- [mq3.renderer.portal_render_pass.Surface](Type-mq3-renderer-portal-render-pass-surface-600674701.md) — struct
