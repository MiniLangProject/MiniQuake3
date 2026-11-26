# `mq3.renderer.portal_render_pass.Surface`

[Home](README.md) · [Source file](File-src-mq3-renderer-portal-render-pass-ml-1378707998.md)

<a id="struct-struct-mq3-renderer-portal-render-pass-surface-struct-surface-src-mq3-renderer-portal-render-pass-ml-725691865"></a>
## Surface

```ml
struct Surface
```

Data record for `mq3.renderer.portal_render_pass.Surface`; groups `normal`, `dist`, `faceIndex`, `textureIndex`, `distanceSquared`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L39)

## Members

<a id="field-field-mq3-renderer-portal-render-pass-surface-dist-dist-src-mq3-renderer-portal-render-pass-ml-1730621504"></a>
### dist

```ml
dist
```

Signed plane distance measured along its normal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L43)

<a id="field-field-mq3-renderer-portal-render-pass-surface-distancesquared-distancesquared-src-mq3-renderer-portal-render-pass-ml-719678036"></a>
### distanceSquared

```ml
distanceSquared
```

Squared distance used for ordering or rejecting the candidate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L49)

<a id="field-field-mq3-renderer-portal-render-pass-surface-faceindex-faceindex-src-mq3-renderer-portal-render-pass-ml-759566072"></a>
### faceIndex

```ml
faceIndex
```

Index of the source BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L45)

<a id="field-field-mq3-renderer-portal-render-pass-surface-normal-normal-src-mq3-renderer-portal-render-pass-ml-82289370"></a>
### normal

```ml
normal
```

Normalized portal-surface plane normal derived from its candidate world triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L41)

<a id="field-field-mq3-renderer-portal-render-pass-surface-textureindex-textureindex-src-mq3-renderer-portal-render-pass-ml-1357438862"></a>
### textureIndex

```ml
textureIndex
```

Index identifying the texture or BSP shader assigned to the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L47)
