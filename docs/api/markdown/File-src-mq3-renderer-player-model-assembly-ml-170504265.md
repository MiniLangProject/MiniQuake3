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

Constructs `mq3.renderer.player_model_assembly.Animation` with `backlerp` = `numeric.f32(backlerp)` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frame` | `dynamic` | — | Initial value for `mq3.renderer.player_model_assembly.Animation.frame`. |
| `oldFrame` | `dynamic` | — | Initial value for `mq3.renderer.player_model_assembly.Animation.oldFrame`. |
| `backlerp` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L36)

- [mq3.renderer.player_model_assembly.Animation](Type-mq3-renderer-player-model-assembly-animation-1831185039.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-assemble-function-assemble-value-loweranimation-upperanimation-headanimation-root-src-mq3-renderer-player-model-assembly-ml-1964310744"></a>
### assemble

```ml
function assemble(value, lowerAnimation, upperAnimation, headAnimation, root)
```

Builds the hierarchy lower -> tag_torso -> upper -> tag_head -> head. The root transform places the complete player in the caller's model space.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.lower`, `value.upper`, `value.head`. |
| `lowerAnimation` | `dynamic` | — | Value forwarded as `anim` to `mq3.renderer.player_model_assembly.validateAnimation`. |
| `upperAnimation` | `dynamic` | — | Value forwarded as `anim` to `mq3.renderer.player_model_assembly.validateAnimation`. |
| `headAnimation` | `dynamic` | — | Value forwarded as `anim` to `mq3.renderer.player_model_assembly.validateAnimation`. |
| `root` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.player_model_assembly.validateTransform`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L138)

- [mq3.renderer.player_model_assembly.Assembly](Type-mq3-renderer-player-model-assembly-assembly-1783200075.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-attach-function-attach-parent-orientation-src-mq3-renderer-player-model-assembly-ml-600203022"></a>
### attach

```ml
function attach(parent, orientation)
```

Equivalent to the identity-local-axis case of CG_PositionRotatedEntityOnTag: tag.axis * parent.axis.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | Record providing `parent.axis`. |
| `orientation` | `dynamic` | — | Record providing `orientation.found`, `orientation.origin`, `orientation.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L111)

<a id="function-function-mq3-renderer-player-model-assembly-fail-function-fail-message-src-mq3-renderer-player-model-assembly-ml-1178438689"></a>
### fail

```ml
function fail(message)
```

Creates error `7520` with message `"player model assembly: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7520,"player model assembly: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L30)

<a id="constant-constant-mq3-renderer-player-model-assembly-head-part-const-head-part-2-src-mq3-renderer-player-model-assembly-ml-2098405269"></a>
### HEAD_PART

```ml
const HEAD_PART = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L13)

<a id="function-function-mq3-renderer-player-model-assembly-identityaxis-function-identityaxis-src-mq3-renderer-player-model-assembly-ml-692348486"></a>
### identityAxis

```ml
function identityAxis()
```

Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.player_model_assembly.identityAxis`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L41)

<a id="function-function-mq3-renderer-player-model-assembly-identitytransform-function-identitytransform-src-mq3-renderer-player-model-assembly-ml-1761918846"></a>
### identityTransform

```ml
function identityTransform()
```

Constructs `mq3.renderer.player_model_assembly.Transform` with `origin` = `[0.0,0.0,0.0]`, `axis` = `identityAxis()`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L50)

<a id="function-function-mq3-renderer-player-model-assembly-load-function-load-lowerdata-upperdata-headdata-src-mq3-renderer-player-model-assembly-ml-818310733"></a>
### load

```ml
function load(lowerData, upperData, headData)
```

Loads the three conventional player-model pieces without taking ownership of an archive or filesystem. This keeps asset lookup policy outside the renderer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lowerData` | `dynamic` | — | Argument 1 supplied to `mq3.format.md3.load`. |
| `upperData` | `dynamic` | — | Argument 1 supplied to `mq3.format.md3.load`. |
| `headData` | `dynamic` | — | Argument 1 supplied to `mq3.format.md3.load`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L62)

<a id="constant-constant-mq3-renderer-player-model-assembly-lower-part-const-lower-part-0-src-mq3-renderer-player-model-assembly-ml-1789675923"></a>
### LOWER_PART

```ml
const LOWER_PART = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L11)

<a id="function-function-mq3-renderer-player-model-assembly-models-function-models-lower-upper-head-src-mq3-renderer-player-model-assembly-ml-1422572053"></a>
### models

```ml
function models(lower, upper, head)
```

Constructs `mq3.renderer.player_model_assembly.Models` from `lower`, `upper`, `head`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lower` | `dynamic` | — | Initial value for `mq3.renderer.player_model_assembly.Models.lower`. |
| `upper` | `dynamic` | — | Initial value for `mq3.renderer.player_model_assembly.Models.upper`. |
| `head` | `dynamic` | — | Initial value for `mq3.renderer.player_model_assembly.Models.head`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L55)

- [mq3.renderer.player_model_assembly.Models](Type-mq3-renderer-player-model-assembly-models-1634678389.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-multiplyaxis-function-multiplyaxis-left-right-src-mq3-renderer-player-model-assembly-ml-810262175"></a>
### multiplyAxis

```ml
function multiplyAxis(left, right)
```

Multiplies two 3-by-3 orientation matrices using the compatibility float arithmetic operations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Nested indexed data; outer entries read at `row`. |
| `right` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`, `2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L94)

- [mq3.renderer.player_model_assembly.Part](Type-mq3-renderer-player-model-assembly-part-2100611194.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-render-function-render-value-maxtrianglespersurface-src-mq3-renderer-player-model-assembly-ml-1585438684"></a>
### render

```ml
function render(value, maxTrianglesPerSurface)
```

Returns lower, upper and head triangles in one shared coordinate system. The limit applies independently to every surface, matching renderTriangles.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.lower`, `value.upper`, `value.head`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.player_model_assembly.renderPart`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L202)

<a id="function-function-mq3-renderer-player-model-assembly-renderpart-function-renderpart-part-maxtrianglespersurface-src-mq3-renderer-player-model-assembly-ml-130237370"></a>
### renderPart

```ml
function renderPart(part, maxTrianglesPerSurface)
```

Interpolates every model surface within the triangle budget and transforms the resulting triangles into the part's space.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | `dynamic` | — | Record providing `part.model`, `part.animation`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Argument 6 supplied to `mq3.format.md3.renderTriangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L181)

<a id="function-function-mq3-renderer-player-model-assembly-tagorientation-function-tagorientation-model-anim-name-src-mq3-renderer-player-model-assembly-ml-1117807541"></a>
### tagOrientation

```ml
function tagOrientation(model, anim, name)
```

Computes `tagOrientation` from `modelTags.lerpTag(wrapped,anim.oldFrame,anim.frame,numeric.fsub(1.0,anim.backlerp),name)` using `mq3.renderer.model_tags.md3`, `mq3.renderer.model_tags.model`, `mq3.renderer.model_tags.lerpTag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record providing `model.tags`, `model.bounds`. |
| `anim` | `dynamic` | — | Record providing `anim.oldFrame`, `anim.frame`, `anim.backlerp`. |
| `name` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.model_tags.lerpTag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L124)

<a id="function-function-mq3-renderer-player-model-assembly-transform-function-transform-origin-axis-src-mq3-renderer-player-model-assembly-ml-2015906987"></a>
### transform

```ml
function transform(origin, axis)
```

Constructs `mq3.renderer.player_model_assembly.Transform` from `origin`, `axis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Initial value for `mq3.renderer.player_model_assembly.Transform.origin`. |
| `axis` | `dynamic` | — | Initial value for `mq3.renderer.player_model_assembly.Transform.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L48)

- [mq3.renderer.player_model_assembly.Transform](Type-mq3-renderer-player-model-assembly-transform-1044141097.md) — struct
<a id="function-function-mq3-renderer-player-model-assembly-transformtriangle-function-transformtriangle-source-part-src-mq3-renderer-player-model-assembly-ml-1161552786"></a>
### transformTriangle

```ml
function transformTriangle(source, part)
```

Builds `mq3.renderer.player_model_assembly.Triangle` using `mq3.renderer.view_math.localPointToWorld`, `mq3.renderer.view_math.localNormalToWorld`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record providing `source.positions`, `source.normals`, `source.texCoords`, `source.surfaceIndex`, `source.shaderName`. |
| `part` | `dynamic` | — | Record providing `part.transform`, `part.kind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L168)

- [mq3.renderer.player_model_assembly.Triangle](Type-mq3-renderer-player-model-assembly-triangle-885326363.md) — struct
<a id="constant-constant-mq3-renderer-player-model-assembly-upper-part-const-upper-part-1-src-mq3-renderer-player-model-assembly-ml-574345578"></a>
### UPPER_PART

```ml
const UPPER_PART = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L12)

<a id="function-function-mq3-renderer-player-model-assembly-upperattachment-function-upperattachment-value-name-src-mq3-renderer-player-model-assembly-ml-2034669636"></a>
### upperAttachment

```ml
function upperAttachment(value, name)
```

CG_AddPlayerWeapon attaches the weapon model to the animated torso rather than to the player root. Keep this transform renderer-neutral so view and world weapon models share the same item-model path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.upper`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.player_model_assembly.tagOrientation`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L159)

<a id="function-function-mq3-renderer-player-model-assembly-valid3-function-valid3-value-src-mq3-renderer-player-model-assembly-ml-1389421459"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.player_model_assembly.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L71)

<a id="function-function-mq3-renderer-player-model-assembly-validateanimation-function-validateanimation-model-anim-src-mq3-renderer-player-model-assembly-ml-733614556"></a>
### validateAnimation

```ml
function validateAnimation(model, anim)
```

Checks current/previous animation frames against the model and bounds backlerp to zero through one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record providing `model.numFrames`. |
| `anim` | `dynamic` | — | Record providing `anim.frame`, `anim.oldFrame`, `anim.backlerp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L83)

<a id="function-function-mq3-renderer-player-model-assembly-validatetransform-function-validatetransform-value-src-mq3-renderer-player-model-assembly-ml-795784799"></a>
### validateTransform

```ml
function validateTransform(value)
```

Requires a three-component origin and three valid three-component transform axes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.origin`, `value.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L74)
