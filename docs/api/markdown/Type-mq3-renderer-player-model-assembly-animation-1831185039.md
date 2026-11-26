# `mq3.renderer.player_model_assembly.Animation`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-model-assembly-ml-170504265.md)

<a id="struct-struct-mq3-renderer-player-model-assembly-animation-struct-animation-src-mq3-renderer-player-model-assembly-ml-1622240733"></a>
## Animation

```ml
struct Animation
```

Data record for `mq3.renderer.player_model_assembly.Animation`; groups `frame`, `oldFrame`, `backlerp`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L19)

## Members

<a id="field-field-mq3-renderer-player-model-assembly-animation-backlerp-backlerp-src-mq3-renderer-player-model-assembly-ml-953952189"></a>
### backlerp

```ml
backlerp
```

Interpolation weight of the previous frame: zero selects current, one selects previous.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L25)

<a id="field-field-mq3-renderer-player-model-assembly-animation-frame-frame-src-mq3-renderer-player-model-assembly-ml-100082437"></a>
### frame

```ml
frame
```

Current model animation-frame index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L21)

<a id="field-field-mq3-renderer-player-model-assembly-animation-oldframe-oldframe-src-mq3-renderer-player-model-assembly-ml-456663465"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L23)
