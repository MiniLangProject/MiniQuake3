# `mq3.renderer.player_model_assembly.Triangle`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-model-assembly-ml-170504265.md)

<a id="struct-struct-mq3-renderer-player-model-assembly-triangle-struct-triangle-src-mq3-renderer-player-model-assembly-ml-1477175571"></a>
## Triangle

```ml
struct Triangle
```

Data record for `mq3.renderer.player_model_assembly.Triangle`; groups `positions`, `texCoords`, `normals`, `part`, `surfaceIndex`, `shaderName`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L66)

## Members

<a id="field-field-mq3-renderer-player-model-assembly-triangle-normals-normals-src-mq3-renderer-player-model-assembly-ml-1235919833"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L72)

<a id="field-field-mq3-renderer-player-model-assembly-triangle-part-part-src-mq3-renderer-player-model-assembly-ml-2063398375"></a>
### part

```ml
part
```

Player-model component from which this geometry originated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L74)

<a id="field-field-mq3-renderer-player-model-assembly-triangle-positions-positions-src-mq3-renderer-player-model-assembly-ml-1416233389"></a>
### positions

```ml
positions
```

Triangle corners after attaching and transforming the player's lower, upper, or head model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L68)

<a id="field-field-mq3-renderer-player-model-assembly-triangle-shadername-shadername-src-mq3-renderer-player-model-assembly-ml-1645050929"></a>
### shaderName

```ml
shaderName
```

Shader name carried from the MD3 surface of the assembled player component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L78)

<a id="field-field-mq3-renderer-player-model-assembly-triangle-surfaceindex-surfaceindex-src-mq3-renderer-player-model-assembly-ml-1996295975"></a>
### surfaceIndex

```ml
surfaceIndex
```

Index of the source surface within the model or world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L76)

<a id="field-field-mq3-renderer-player-model-assembly-triangle-texcoords-texcoords-src-mq3-renderer-player-model-assembly-ml-1386328605"></a>
### texCoords

```ml
texCoords
```

MD3 texture coordinates carried by an assembled player-body triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_model_assembly.ml#L70)
