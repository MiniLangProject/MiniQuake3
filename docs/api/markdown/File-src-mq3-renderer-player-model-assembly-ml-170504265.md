# `src/mq3/renderer/player_model_assembly.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.player_model_assembly`](Package-mq3-renderer-player-model-assembly-1412466931.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/renderer/model_tags.ml` as `modelTags` → [src/mq3/renderer/model_tags.ml](File-src-mq3-renderer-model-tags-ml-707870696.md)
- `mq3/renderer/view_math.ml` as `viewMath` → [src/mq3/renderer/view_math.ml](File-src-mq3-renderer-view-math-ml-126526929.md)

## Declarations

<a id="function-function-mq3-renderer-player-model-assembly-animation-function-animation-frame-oldframe-backlerp-src-mq3-renderer-player-model-assembly-ml-1558886583"></a>
### animation

```ml
function animation(frame, oldFrame, backlerp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L24)

- [mq3.renderer.player_model_assembly.Animation](Type-mq3-renderer-player-model-assembly-animation-1831185039.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-assemble-function-assemble-value-loweranimation-upperanimation-headanimation-root-src-mq3-renderer-player-model-assembly-ml-1964310744"></a>
### assemble

```ml
function assemble(value, lowerAnimation, upperAnimation, headAnimation, root)
```

Builds the hierarchy lower -> tag_torso -> upper -> tag_head -> head. The root transform places the complete player in the caller's model space.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `lowerAnimation` | `dynamic` | — |  |
| `upperAnimation` | `dynamic` | — |  |
| `headAnimation` | `dynamic` | — |  |
| `root` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L93)

- [mq3.renderer.player_model_assembly.Assembly](Type-mq3-renderer-player-model-assembly-assembly-1783200075.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-attach-function-attach-parent-orientation-src-mq3-renderer-player-model-assembly-ml-600203022"></a>
### attach

```ml
function attach(parent, orientation)
```

Equivalent to the identity-local-axis case of CG_PositionRotatedEntityOnTag: tag.axis * parent.axis.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — |  |
| `orientation` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L75)

<a id="function-function-mq3-renderer-player-model-assembly-fail-function-fail-message-src-mq3-renderer-player-model-assembly-ml-1178438689"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L22)

<a id="constant-constant-mq3-renderer-player-model-assembly-head-part-const-head-part-2-src-mq3-renderer-player-model-assembly-ml-2098405269"></a>
### HEAD_PART

```ml
const HEAD_PART = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L13)

<a id="function-function-mq3-renderer-player-model-assembly-identityaxis-function-identityaxis-src-mq3-renderer-player-model-assembly-ml-692348486"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L28)

<a id="function-function-mq3-renderer-player-model-assembly-identitytransform-function-identitytransform-src-mq3-renderer-player-model-assembly-ml-1761918846"></a>
### identityTransform

```ml
function identityTransform()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L33)

<a id="function-function-mq3-renderer-player-model-assembly-load-function-load-lowerdata-upperdata-headdata-src-mq3-renderer-player-model-assembly-ml-818310733"></a>
### load

```ml
function load(lowerData, upperData, headData)
```

Loads the three conventional player-model pieces without taking ownership of an archive or filesystem. This keeps asset lookup policy outside the renderer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lowerData` | `dynamic` | — |  |
| `upperData` | `dynamic` | — |  |
| `headData` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L38)

<a id="constant-constant-mq3-renderer-player-model-assembly-lower-part-const-lower-part-0-src-mq3-renderer-player-model-assembly-ml-1789675923"></a>
### LOWER_PART

```ml
const LOWER_PART = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L11)

<a id="function-function-mq3-renderer-player-model-assembly-models-function-models-lower-upper-head-src-mq3-renderer-player-model-assembly-ml-1422572053"></a>
### models

```ml
function models(lower, upper, head)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lower` | `dynamic` | — |  |
| `upper` | `dynamic` | — |  |
| `head` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L34)

- [mq3.renderer.player_model_assembly.Models](Type-mq3-renderer-player-model-assembly-models-1634678389.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-multiplyaxis-function-multiplyaxis-left-right-src-mq3-renderer-player-model-assembly-ml-810262175"></a>
### multiplyAxis

```ml
function multiplyAxis(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L60)

- [mq3.renderer.player_model_assembly.Part](Type-mq3-renderer-player-model-assembly-part-2100611194.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-render-function-render-value-maxtrianglespersurface-src-mq3-renderer-player-model-assembly-ml-1585438684"></a>
### render

```ml
function render(value, maxTrianglesPerSurface)
```

Returns lower, upper and head triangles in one shared coordinate system. The limit applies independently to every surface, matching renderTriangles.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L147)

<a id="function-function-mq3-renderer-player-model-assembly-renderpart-function-renderpart-part-maxtrianglespersurface-src-mq3-renderer-player-model-assembly-ml-130237370"></a>
### renderPart

```ml
function renderPart(part, maxTrianglesPerSurface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L128)

<a id="function-function-mq3-renderer-player-model-assembly-tagorientation-function-tagorientation-model-anim-name-src-mq3-renderer-player-model-assembly-ml-1117807541"></a>
### tagOrientation

```ml
function tagOrientation(model, anim, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L84)

<a id="function-function-mq3-renderer-player-model-assembly-transform-function-transform-origin-axis-src-mq3-renderer-player-model-assembly-ml-2015906987"></a>
### transform

```ml
function transform(origin, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L32)

- [mq3.renderer.player_model_assembly.Transform](Type-mq3-renderer-player-model-assembly-transform-1044141097.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-transformtriangle-function-transformtriangle-source-part-src-mq3-renderer-player-model-assembly-ml-1161552786"></a>
### transformTriangle

```ml
function transformTriangle(source, part)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L118)

- [mq3.renderer.player_model_assembly.Triangle](Type-mq3-renderer-player-model-assembly-triangle-885326363.md) — struct
<a id="constant-constant-mq3-renderer-player-model-assembly-upper-part-const-upper-part-1-src-mq3-renderer-player-model-assembly-ml-574345578"></a>
### UPPER_PART

```ml
const UPPER_PART = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L12)

<a id="function-function-mq3-renderer-player-model-assembly-upperattachment-function-upperattachment-value-name-src-mq3-renderer-player-model-assembly-ml-2034669636"></a>
### upperAttachment

```ml
function upperAttachment(value, name)
```

CG_AddPlayerWeapon attaches the weapon model to the animated torso rather than to the player root. Keep this transform renderer-neutral so view and world weapon models share the same item-model path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L112)

<a id="function-function-mq3-renderer-player-model-assembly-valid3-function-valid3-value-src-mq3-renderer-player-model-assembly-ml-1389421459"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L45)

<a id="function-function-mq3-renderer-player-model-assembly-validateanimation-function-validateanimation-model-anim-src-mq3-renderer-player-model-assembly-ml-733614556"></a>
### validateAnimation

```ml
function validateAnimation(model, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L52)

<a id="function-function-mq3-renderer-player-model-assembly-validatetransform-function-validatetransform-value-src-mq3-renderer-player-model-assembly-ml-795784799"></a>
### validateTransform

```ml
function validateTransform(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L46)
