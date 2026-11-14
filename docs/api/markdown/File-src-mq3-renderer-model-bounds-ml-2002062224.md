# `src/mq3/renderer/model_bounds.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.model_bounds`](Package-mq3-renderer-model-bounds-1599457778.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-renderer-model-bounds-md3-function-md3-model-src-mq3-renderer-model-bounds-ml-1769554485"></a>
### md3

```ml
function md3(model)
```

The original renderer returns the first MD3 frame's bounds. The aggregate bounds cached by the asset reader are useful for culling, but are not the R_ModelBounds ABI and can move weapon/UI model placement for animated MD3s.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/model_bounds.ml#L18)

<a id="function-function-mq3-renderer-model-bounds-vectorcopy-function-vectorcopy-value-src-mq3-renderer-model-bounds-ml-1150883753"></a>
### vectorCopy

```ml
function vectorCopy(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/model_bounds.ml#L10)

<a id="function-function-mq3-renderer-model-bounds-zero-function-zero-src-mq3-renderer-model-bounds-ml-558363144"></a>
### zero

```ml
function zero()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/model_bounds.ml#L6)
