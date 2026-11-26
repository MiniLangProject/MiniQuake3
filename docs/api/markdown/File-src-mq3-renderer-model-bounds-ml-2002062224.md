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
| `model` | `dynamic` | — | Record providing `model.frames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_bounds.ml#L22)

<a id="function-function-mq3-renderer-model-bounds-vectorcopy-function-vectorcopy-value-src-mq3-renderer-model-bounds-ml-1150883753"></a>
### vectorCopy

```ml
function vectorCopy(value)
```

Returns `[value[0],value[1],value[2]]` from `mq3.renderer.model_bounds.vectorCopy`; earlier branches return `error(7470,"malformed MD3 frame bounds")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_bounds.ml#L13)

<a id="function-function-mq3-renderer-model-bounds-zero-function-zero-src-mq3-renderer-model-bounds-ml-558363144"></a>
### zero

```ml
function zero()
```

Returns `[[0.0,0.0,0.0],[0.0,0.0,0.0]]` for `mq3.renderer.model_bounds.zero`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_bounds.ml#L7)
