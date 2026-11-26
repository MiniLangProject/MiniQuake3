# `mq3.renderer.player_model_assembly.Part`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-model-assembly-ml-170504265.md)

<a id="struct-struct-mq3-renderer-player-model-assembly-part-struct-part-src-mq3-renderer-player-model-assembly-ml-361854763"></a>
## Part

```ml
struct Part
```

Data record for `mq3.renderer.player_model_assembly.Part`; groups `kind`, `name`, `model`, `animation`, `transform`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L44)

## Members

<a id="field-field-mq3-renderer-player-model-assembly-part-animation-animation-src-mq3-renderer-player-model-assembly-ml-958041740"></a>
### animation

```ml
animation
```

Animation frame pair and interpolation weight used by the model part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L52)

<a id="field-field-mq3-renderer-player-model-assembly-part-kind-kind-src-mq3-renderer-player-model-assembly-ml-152218796"></a>
### kind

```ml
kind
```

Player-body component selector distinguishing the lower body, upper body, and head.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L46)

<a id="field-field-mq3-renderer-player-model-assembly-part-model-model-src-mq3-renderer-player-model-assembly-ml-323653596"></a>
### model

```ml
model
```

Loaded model selected for animation or drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L50)

<a id="field-field-mq3-renderer-player-model-assembly-part-name-name-src-mq3-renderer-player-model-assembly-ml-1354474522"></a>
### name

```ml
name
```

Body-part label identifying the assembled lower, upper, or head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L48)

<a id="field-field-mq3-renderer-player-model-assembly-part-transform-transform-src-mq3-renderer-player-model-assembly-ml-862008892"></a>
### transform

```ml
transform
```

Position and orientation used to place the model part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L54)
