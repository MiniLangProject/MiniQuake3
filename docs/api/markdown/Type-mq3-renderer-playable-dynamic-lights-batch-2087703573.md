# `mq3.renderer.playable_dynamic_lights.Batch`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)

<a id="struct-struct-mq3-renderer-playable-dynamic-lights-batch-struct-batch-src-mq3-renderer-playable-dynamic-lights-ml-1213533661"></a>
## Batch

```ml
struct Batch
```

origins/axes are parallel to triangles for moving brush models.  The original R_DlightBmodel transforms each world-space light into the model's local orientation before ProjectDlightTexture derives S/T and attenuation. Static world batches keep both arrays void and retain the cheaper path.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L17)

## Members

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-axes-axes-src-mq3-renderer-playable-dynamic-lights-ml-810734321"></a>
### axes

```ml
axes
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L17)

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-bounds-bounds-src-mq3-renderer-playable-dynamic-lights-ml-162852657"></a>
### bounds

```ml
bounds
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L17)

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-commands-commands-src-mq3-renderer-playable-dynamic-lights-ml-111700635"></a>
### commands

```ml
commands
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L17)

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-origins-origins-src-mq3-renderer-playable-dynamic-lights-ml-11694343"></a>
### origins

```ml
origins
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L17)

<a id="field-field-mq3-renderer-playable-dynamic-lights-batch-triangles-triangles-src-mq3-renderer-playable-dynamic-lights-ml-925159047"></a>
### triangles

```ml
triangles
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L17)
