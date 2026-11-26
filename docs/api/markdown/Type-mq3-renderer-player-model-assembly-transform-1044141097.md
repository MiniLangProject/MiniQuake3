# `mq3.renderer.player_model_assembly.Transform`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-model-assembly-ml-170504265.md)

<a id="struct-struct-mq3-renderer-player-model-assembly-transform-struct-transform-src-mq3-renderer-player-model-assembly-ml-184111457"></a>
## Transform

```ml
struct Transform
```

Data record for `mq3.renderer.player_model_assembly.Transform`; groups `origin`, `axis`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L28)

## Members

<a id="field-field-mq3-renderer-player-model-assembly-transform-axis-axis-src-mq3-renderer-player-model-assembly-ml-926940537"></a>
### axis

```ml
axis
```

Composed orientation basis that places a player-model part relative to its parent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L32)

<a id="field-field-mq3-renderer-player-model-assembly-transform-origin-origin-src-mq3-renderer-player-model-assembly-ml-582832179"></a>
### origin

```ml
origin
```

Translation applied when placing a player-model body part through its parent attachment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_model_assembly.ml#L30)
