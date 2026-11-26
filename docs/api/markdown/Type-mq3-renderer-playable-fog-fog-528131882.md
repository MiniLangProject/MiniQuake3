# `mq3.renderer.playable_fog.Fog`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-fog-ml-140703890.md)

<a id="struct-struct-mq3-renderer-playable-fog-fog-struct-fog-src-mq3-renderer-playable-fog-ml-551734915"></a>
## Fog

```ml
struct Fog
```

Data record for `mq3.renderer.playable_fog.Fog`; groups `shaderName`, `color`, `depth`, `tcScale`, `bounds`, `surface`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L27)

## Members

<a id="field-field-mq3-renderer-playable-fog-fog-bounds-bounds-src-mq3-renderer-playable-fog-ml-792543579"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners enclosing the object or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L37)

<a id="field-field-mq3-renderer-playable-fog-fog-color-color-src-mq3-renderer-playable-fog-ml-918260977"></a>
### color

```ml
color
```

RGB fog color obtained from the volume's material shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L31)

<a id="field-field-mq3-renderer-playable-fog-fog-depth-depth-src-mq3-renderer-playable-fog-ml-873115149"></a>
### depth

```ml
depth
```

Material fog-depth parameter used to scale the fog texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L33)

<a id="field-field-mq3-renderer-playable-fog-fog-hassurface-hassurface-src-mq3-renderer-playable-fog-ml-310184303"></a>
### hasSurface

```ml
hasSurface
```

Whether the fog volume has a clipping surface at its boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L41)

<a id="field-field-mq3-renderer-playable-fog-fog-shadername-shadername-src-mq3-renderer-playable-fog-ml-1157273045"></a>
### shaderName

```ml
shaderName
```

Shader defining the fog volume's color and depth parameters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L29)

<a id="field-field-mq3-renderer-playable-fog-fog-surface-surface-src-mq3-renderer-playable-fog-ml-950886713"></a>
### surface

```ml
surface
```

Plane defining the visible boundary of the fog volume, when present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L39)

<a id="field-field-mq3-renderer-playable-fog-fog-tcscale-tcscale-src-mq3-renderer-playable-fog-ml-1774927273"></a>
### tcScale

```ml
tcScale
```

Scale used to convert distance into fog texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L35)
