# `mq3.renderer.playable_light_grid.Sample`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)

<a id="struct-struct-mq3-renderer-playable-light-grid-sample-struct-sample-src-mq3-renderer-playable-light-grid-ml-41493879"></a>
## Sample

```ml
struct Sample
```

Data record for `mq3.renderer.playable_light_grid.Sample`; groups `ambient`, `directed`, `direction`, `totalFactor`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L54)

## Members

<a id="field-field-mq3-renderer-playable-light-grid-sample-ambient-ambient-src-mq3-renderer-playable-light-grid-ml-1677851607"></a>
### ambient

```ml
ambient
```

Ambient light contribution sampled or applied by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L56)

<a id="field-field-mq3-renderer-playable-light-grid-sample-directed-directed-src-mq3-renderer-playable-light-grid-ml-377779023"></a>
### directed

```ml
directed
```

Directional light contribution sampled or applied by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L58)

<a id="field-field-mq3-renderer-playable-light-grid-sample-direction-direction-src-mq3-renderer-playable-light-grid-ml-351802483"></a>
### direction

```ml
direction
```

Direction of the dominant light contribution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L60)

<a id="field-field-mq3-renderer-playable-light-grid-sample-totalfactor-totalfactor-src-mq3-renderer-playable-light-grid-ml-1431000075"></a>
### totalFactor

```ml
totalFactor
```

Accumulated weight used to normalize interpolated light-grid samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L62)
