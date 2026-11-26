# `src/mq3/renderer/model_tags.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.model_tags`](Package-mq3-renderer-model-tags-1065700362.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-model-tags-gettag-function-gettag-md3value-frame-name-src-mq3-renderer-model-tags-ml-1095759687"></a>
### getTag

```ml
function getTag(md3Value, frame, name)
```

R_GetTag accepts transiently oversized animation frames and clamps them to the final model frame while model switches settle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `md3Value` | `dynamic` | — | Record providing `md3Value.frames`. |
| `frame` | `dynamic` | — | Input tested by `frame<0`. |
| `name` | `dynamic` | — | Input tested by `entries[i].name==name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L94)

<a id="function-function-mq3-renderer-model-tags-identityaxis-function-identityaxis-src-mq3-renderer-model-tags-ml-475131076"></a>
### identityAxis

```ml
function identityAxis()
```

Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.model_tags.identityAxis`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L66)

<a id="function-function-mq3-renderer-model-tags-lerptag-function-lerptag-modelvalue-startframe-endframe-frac-name-src-mq3-renderer-model-tags-ml-469679668"></a>
### lerpTag

```ml
function lerpTag(modelValue, startFrame, endFrame, frac, name)
```

R_LerpTag uses frac for the end tag and (1-frac) for the start tag, then normalizes every interpolated basis vector independently.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelValue` | `dynamic` | — | Record providing `modelValue.md3`. |
| `startFrame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.model_tags.getTag`. |
| `endFrame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.model_tags.getTag`. |
| `frac` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.model_tags.getTag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L127)

<a id="function-function-mq3-renderer-model-tags-md3-function-md3-frames-mins-maxs-src-mq3-renderer-model-tags-ml-366502300"></a>
### md3

```ml
function md3(frames, mins, maxs)
```

Constructs `mq3.renderer.model_tags.Md3` with `bounds` = `[mins,maxs]` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frames` | `dynamic` | — | Initial value for `mq3.renderer.model_tags.Md3.frames`. |
| `mins` | `dynamic` | — | Input used in the result expression `Md3(frames,[mins,maxs])`. |
| `maxs` | `dynamic` | — | Input used in the result expression `Md3(frames,[mins,maxs])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L54)

- [mq3.renderer.model_tags.Md3](Type-mq3-renderer-model-tags-md3-182646194.md) — struct
<a id="function-function-mq3-renderer-model-tags-missingorientation-function-missingorientation-src-mq3-renderer-model-tags-ml-591855432"></a>
### missingOrientation

```ml
function missingOrientation()
```

Constructs `mq3.renderer.model_tags.Orientation` with `found` = `false`, `origin` = `[0.0,0.0,0.0]`, `axis` = `identityAxis()`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L116)

<a id="function-function-mq3-renderer-model-tags-model-function-model-brushbounds-md3value-src-mq3-renderer-model-tags-ml-987131124"></a>
### model

```ml
function model(brushBounds, md3Value)
```

Constructs `mq3.renderer.model_tags.Model` from `brushBounds`, `md3Value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `brushBounds` | `dynamic` | — | Initial value for `mq3.renderer.model_tags.Model.brushBounds`. |
| `md3Value` | `dynamic` | — | Initial value for `mq3.renderer.model_tags.Model.md3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L61)

- [mq3.renderer.model_tags.Model](Type-mq3-renderer-model-tags-model-1330836601.md) — struct
<a id="function-function-mq3-renderer-model-tags-modelbounds-function-modelbounds-modelvalue-src-mq3-renderer-model-tags-ml-570943922"></a>
### modelBounds

```ml
function modelBounds(modelValue)
```

Computes `modelBounds` from `[[bounds[0][0],bounds[0][1],bounds[0][2]],[bounds[1][0],bounds[1][1],bounds[1][2]]]` using `mq3.renderer.model_tags.validVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelValue` | `dynamic` | — | Record providing `modelValue.brushBounds`, `modelValue.md3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L149)

<a id="function-function-mq3-renderer-model-tags-normalize-function-normalize-value-src-mq3-renderer-model-tags-ml-2006409615"></a>
### normalize

```ml
function normalize(value)
```

Returns `copy` from `mq3.renderer.model_tags.normalize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L109)

- [mq3.renderer.model_tags.Orientation](Type-mq3-renderer-model-tags-orientation-257182758.md) — struct
<a id="function-function-mq3-renderer-model-tags-tag-function-tag-name-origin-axis-src-mq3-renderer-model-tags-ml-1504637808"></a>
### tag

```ml
function tag(name, origin, axis)
```

Constructs `mq3.renderer.model_tags.Tag` from `name`, `origin`, `axis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Initial value for `mq3.renderer.model_tags.Tag.name`. |
| `origin` | `dynamic` | — | Initial value for `mq3.renderer.model_tags.Tag.origin`. |
| `axis` | `dynamic` | — | Initial value for `mq3.renderer.model_tags.Tag.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L46)

- [mq3.renderer.model_tags.Tag](Type-mq3-renderer-model-tags-tag-240708516.md) — struct
<a id="function-function-mq3-renderer-model-tags-validatetag-function-validatetag-value-src-mq3-renderer-model-tags-ml-1678396033"></a>
### validateTag

```ml
function validateTag(value)
```

Returns `true` from `mq3.renderer.model_tags.validateTag`; earlier branches return `error(7420,"malformed MD3 tag")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.name`, `value.origin`, `value.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L84)

<a id="function-function-mq3-renderer-model-tags-validaxis-function-validaxis-value-src-mq3-renderer-model-tags-ml-735402655"></a>
### validAxis

```ml
function validAxis(value)
```

Computes `value!=void and len(value)==3 and validVector(value[0]) and validVector(value[1]) and validVector(value[2])` for `mq3.renderer.model_tags.validAxis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L78)

<a id="function-function-mq3-renderer-model-tags-validvector-function-validvector-value-src-mq3-renderer-model-tags-ml-486669695"></a>
### validVector

```ml
function validVector(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.model_tags.validVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/model_tags.ml#L72)
