# `mq3.renderer.playable_dynamic_lights.Batch`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)

<a id="struct-struct-mq3-renderer-playable-dynamic-lights-batch-struct-batch-src-mq3-renderer-playable-dynamic-lights-ml-1213533661"></a>
## Batch

```ml
struct Batch
```

origins/axes are parallel to triangles for moving brush models.  The original R_DlightBmodel transforms each world-space light into the model's local orientation before ProjectDlightTexture derives S/T and attenuation. Static world batches keep both arrays void and retain the cheaper path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L24)

## Members

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-axes-axes-src-mq3-renderer-playable-dynamic-lights-ml-810734321"></a>
### axes

```ml
axes
```

Orientation bases associated with the prepared batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L32)

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-bounds-bounds-src-mq3-renderer-playable-dynamic-lights-ml-162852657"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners enclosing the object or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L34)

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-commands-commands-src-mq3-renderer-playable-dynamic-lights-ml-111700635"></a>
### commands

```ml
commands
```

Operations or drawing commands queued by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L26)

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-origins-origins-src-mq3-renderer-playable-dynamic-lights-ml-11694343"></a>
### origins

```ml
origins
```

Light or entity origins associated with the prepared batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L30)

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-triangles-triangles-src-mq3-renderer-playable-dynamic-lights-ml-925159047"></a>
### triangles

```ml
triangles
```

Triangle records or index triplets represented by this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L28)
