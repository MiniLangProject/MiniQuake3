# `mq3.renderer.player_render_cache.DrawTriangle`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-render-cache-ml-273188728.md)

<a id="struct-struct-mq3-renderer-player-render-cache-drawtriangle-struct-drawtriangle-src-mq3-renderer-player-render-cache-ml-1085920643"></a>
## DrawTriangle

```ml
struct DrawTriangle
```

Data record for `mq3.renderer.player_render_cache.DrawTriangle`; groups `positions`, `texCoords`, `normals`, `lights`, `part`, `surfaceIndex`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L68)

## Members

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-imagename-imagename-src-mq3-renderer-player-render-cache-ml-1080292843"></a>
### imageName

```ml
imageName
```

Virtual image path selected for this texture or material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L87)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-lights-lights-src-mq3-renderer-player-render-cache-ml-688090937"></a>
### lights

```ml
lights
```

Lighting contributions applied to the cached draw triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L77)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-lod-lod-src-mq3-renderer-player-render-cache-ml-1594342523"></a>
### lod

```ml
lod
```

Level-of-detail selection used for this model or draw result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L89)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-normals-normals-src-mq3-renderer-player-render-cache-ml-1842449331"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L75)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-part-part-src-mq3-renderer-player-render-cache-ml-1532393721"></a>
### part

```ml
part
```

Player-model component from which this geometry originated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L79)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-positions-positions-src-mq3-renderer-player-render-cache-ml-966059743"></a>
### positions

```ml
positions
```

Cached player-triangle positions reused for the selected animation and detail level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L70)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-shadername-shadername-src-mq3-renderer-player-render-cache-ml-511963187"></a>
### shaderName

```ml
shaderName
```

Material name retained with the cached player-model triangle for drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L85)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-surfaceindex-surfaceindex-src-mq3-renderer-player-render-cache-ml-1849596561"></a>
### surfaceIndex

```ml
surfaceIndex
```

Index of the source surface within the model or world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L81)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-surfacename-surfacename-src-mq3-renderer-player-render-cache-ml-1276020463"></a>
### surfaceName

```ml
surfaceName
```

Model-surface name used to select a skin or material mapping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L83)

<a id="field-field-mq3-renderer-player-render-cache-drawtriangle-texcoords-texcoords-src-mq3-renderer-player-render-cache-ml-456267575"></a>
### texCoords

```ml
texCoords
```

Cached texture coordinates reused when drawing a player-model triangle at the selected detail level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L73)
