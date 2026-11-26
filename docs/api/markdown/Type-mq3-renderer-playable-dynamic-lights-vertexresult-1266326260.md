# `mq3.renderer.playable_dynamic_lights.VertexResult`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)

<a id="struct-struct-mq3-renderer-playable-dynamic-lights-vertexresult-struct-vertexresult-src-mq3-renderer-playable-dynamic-lights-ml-1686807575"></a>
## VertexResult

```ml
struct VertexResult
```

Data record for `mq3.renderer.playable_dynamic_lights.VertexResult`; groups `uv`, `color`, `clip`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L37)

## Members

<a id="field-field-mq3-renderer-playable-dynamic-lights-vertexresult-clip-clip-src-mq3-renderer-playable-dynamic-lights-ml-41452382"></a>
### clip

```ml
clip
```

Clipping flags identifying vertices outside the light's projected region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L43)

<a id="field-field-mq3-renderer-playable-dynamic-lights-vertexresult-color-color-src-mq3-renderer-playable-dynamic-lights-ml-1939745818"></a>
### color

```ml
color
```

Computed dynamic-light color contribution for the projected surface vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L41)

<a id="field-field-mq3-renderer-playable-dynamic-lights-vertexresult-uv-uv-src-mq3-renderer-playable-dynamic-lights-ml-890641288"></a>
### uv

```ml
uv
```

Texture coordinates associated with this vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L39)
