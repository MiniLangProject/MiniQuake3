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
| `md3Value` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L45)

<a id="function-function-mq3-renderer-model-tags-identityaxis-function-identityaxis-src-mq3-renderer-model-tags-ml-475131076"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L26)

<a id="function-function-mq3-renderer-model-tags-lerptag-function-lerptag-modelvalue-startframe-endframe-frac-name-src-mq3-renderer-model-tags-ml-469679668"></a>
### lerpTag

```ml
function lerpTag(modelValue, startFrame, endFrame, frac, name)
```

R_LerpTag uses frac for the end tag and (1-frac) for the start tag, then normalizes every interpolated basis vector independently.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelValue` | `dynamic` | — |  |
| `startFrame` | `dynamic` | — |  |
| `endFrame` | `dynamic` | — |  |
| `frac` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L70)

<a id="function-function-mq3-renderer-model-tags-md3-function-md3-frames-mins-maxs-src-mq3-renderer-model-tags-ml-366502300"></a>
### md3

```ml
function md3(frames, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frames` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L18)

- [mq3.renderer.model_tags.Md3](Type-mq3-renderer-model-tags-md3-182646194.md) — struct
<a id="function-function-mq3-renderer-model-tags-missingorientation-function-missingorientation-src-mq3-renderer-model-tags-ml-591855432"></a>
### missingOrientation

```ml
function missingOrientation()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L64)

<a id="function-function-mq3-renderer-model-tags-model-function-model-brushbounds-md3value-src-mq3-renderer-model-tags-ml-987131124"></a>
### model

```ml
function model(brushBounds, md3Value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `brushBounds` | `dynamic` | — |  |
| `md3Value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L22)

- [mq3.renderer.model_tags.Model](Type-mq3-renderer-model-tags-model-1330836601.md) — struct
<a id="function-function-mq3-renderer-model-tags-modelbounds-function-modelbounds-modelvalue-src-mq3-renderer-model-tags-ml-570943922"></a>
### modelBounds

```ml
function modelBounds(modelValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelValue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L90)

<a id="function-function-mq3-renderer-model-tags-normalize-function-normalize-value-src-mq3-renderer-model-tags-ml-2006409615"></a>
### normalize

```ml
function normalize(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L58)

- [mq3.renderer.model_tags.Orientation](Type-mq3-renderer-model-tags-orientation-257182758.md) — struct
<a id="function-function-mq3-renderer-model-tags-tag-function-tag-name-origin-axis-src-mq3-renderer-model-tags-ml-1504637808"></a>
### tag

```ml
function tag(name, origin, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L14)

- [mq3.renderer.model_tags.Tag](Type-mq3-renderer-model-tags-tag-240708516.md) — struct
<a id="function-function-mq3-renderer-model-tags-validatetag-function-validatetag-value-src-mq3-renderer-model-tags-ml-1678396033"></a>
### validateTag

```ml
function validateTag(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L38)

<a id="function-function-mq3-renderer-model-tags-validaxis-function-validaxis-value-src-mq3-renderer-model-tags-ml-735402655"></a>
### validAxis

```ml
function validAxis(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L34)

<a id="function-function-mq3-renderer-model-tags-validvector-function-validvector-value-src-mq3-renderer-model-tags-ml-486669695"></a>
### validVector

```ml
function validVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L30)
