# `src/mq3/renderer/qgl_linked.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qgl_linked`](Package-mq3-renderer-qgl-linked-260094657.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-renderer-qgl-linked-aliases-function-aliases-src-mq3-renderer-qgl-linked-ml-1884096534"></a>
### aliases

```ml
function aliases()
```

Builds the 334-element result for `mq3.renderer.qgl_linked.aliases` from `["qglAccum","glAccum"]`, `["qglAlphaFunc","glAlphaFunc"]`, `["qglAreTexturesResident","glAreTexturesResident"]`, `["qglArrayElement","glArrayElement"]`, `["qglBegin","glBegin"]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl_linked.ml#L7)

<a id="function-function-mq3-renderer-qgl-linked-contains-function-contains-name-src-mq3-renderer-qgl-linked-ml-785105001"></a>
### contains

```ml
function contains(name)
```

Computes `glName(name)!=""` for `mq3.renderer.qgl_linked.contains`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.qgl_linked.glName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl_linked.ml#L15)

<a id="function-function-mq3-renderer-qgl-linked-glname-function-glname-name-src-mq3-renderer-qgl-linked-ml-1696570521"></a>
### glName

```ml
function glName(name)
```

Returns `""` from `mq3.renderer.qgl_linked.glName`; earlier branches return `pair[1]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Input used by `for each pair in aliases() if pair[0]==name then return pair[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl_linked.ml#L12)

<a id="function-function-mq3-renderer-qgl-linked-qglnames-function-qglnames-src-mq3-renderer-qgl-linked-ml-1498378886"></a>
### qglNames

```ml
function qglNames()
```

Returns `result` from `mq3.renderer.qgl_linked.qglNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qgl_linked.ml#L9)
