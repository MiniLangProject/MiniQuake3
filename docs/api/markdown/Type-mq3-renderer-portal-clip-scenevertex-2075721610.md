# `mq3.renderer.portal_clip.SceneVertex`

[Home](README.md) · [Source file](File-src-mq3-renderer-portal-clip-ml-347930170.md)

<a id="struct-struct-mq3-renderer-portal-clip-scenevertex-struct-scenevertex-src-mq3-renderer-portal-clip-ml-1111583337"></a>
## SceneVertex

```ml
struct SceneVertex
```

Data record for `mq3.renderer.portal_clip.SceneVertex`; groups `position`, `texCoord`, `lightmapCoord`, `normal`, `color`, `entityColor`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L129)

## Members

<a id="field-field-mq3-renderer-portal-clip-scenevertex-color-color-src-mq3-renderer-portal-clip-ml-802572771"></a>
### color

```ml
color
```

Vertex color retained and interpolated as scene geometry is clipped at the portal boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L139)

<a id="field-field-mq3-renderer-portal-clip-scenevertex-entitycolor-entitycolor-src-mq3-renderer-portal-clip-ml-250720727"></a>
### entityColor

```ml
entityColor
```

Entity-supplied color used by entity-driven shader stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L141)

<a id="field-field-mq3-renderer-portal-clip-scenevertex-lightmapcoord-lightmapcoord-src-mq3-renderer-portal-clip-ml-1012499027"></a>
### lightmapCoord

```ml
lightmapCoord
```

Baked-lightmap coordinates of the clipped scene vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L135)

<a id="field-field-mq3-renderer-portal-clip-scenevertex-normal-normal-src-mq3-renderer-portal-clip-ml-1871390117"></a>
### normal

```ml
normal
```

Scene vertex normal preserved or interpolated while clipping geometry against a portal plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L137)

<a id="field-field-mq3-renderer-portal-clip-scenevertex-position-position-src-mq3-renderer-portal-clip-ml-882731353"></a>
### position

```ml
position
```

Three-dimensional position of the vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L131)

<a id="field-field-mq3-renderer-portal-clip-scenevertex-texcoord-texcoord-src-mq3-renderer-portal-clip-ml-1673878839"></a>
### texCoord

```ml
texCoord
```

Base texture coordinates of the clipped scene vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L133)
