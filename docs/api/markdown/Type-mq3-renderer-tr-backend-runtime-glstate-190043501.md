# `mq3.renderer.tr_backend_runtime.GLState`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-glstate-struct-glstate-src-mq3-renderer-tr-backend-runtime-ml-1614728925"></a>
## GLState

```ml
struct GLState
```

Data record for `mq3.renderer.tr_backend_runtime.GLState`; groups `faceCulling`, `texEnv`, `stateBits`, `depthEqual`, `blendEnabled`, `srcBlend`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L61)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-alphatest-alphatest-src-mq3-renderer-tr-backend-runtime-ml-2120145217"></a>
### alphaTest

```ml
alphaTest
```

Alpha comparison used to reject fragments in this pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L83)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-blendenabled-blendenabled-src-mq3-renderer-tr-backend-runtime-ml-427009165"></a>
### blendEnabled

```ml
blendEnabled
```

Whether framebuffer blending is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L71)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-depthequal-depthequal-src-mq3-renderer-tr-backend-runtime-ml-1530354447"></a>
### depthEqual

```ml
depthEqual
```

Whether depth testing accepts only fragments at the existing surface depth.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L69)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-depthtest-depthtest-src-mq3-renderer-tr-backend-runtime-ml-1301511349"></a>
### depthTest

```ml
depthTest
```

Whether depth-buffer comparison is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L81)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-depthwrite-depthwrite-src-mq3-renderer-tr-backend-runtime-ml-451871717"></a>
### depthWrite

```ml
depthWrite
```

Whether drawing this pass writes to the depth buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L77)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-dstblend-dstblend-src-mq3-renderer-tr-backend-runtime-ml-1734242349"></a>
### dstBlend

```ml
dstBlend
```

Destination factor used by framebuffer blending.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L75)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-faceculling-faceculling-src-mq3-renderer-tr-backend-runtime-ml-501800501"></a>
### faceCulling

```ml
faceCulling
```

Current front-face, back-face, or two-sided culling selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L63)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-mirror-mirror-src-mq3-renderer-tr-backend-runtime-ml-973034647"></a>
### mirror

```ml
mirror
```

Whether the view reflects handedness across a portal or mirror plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L85)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-srcblend-srcblend-src-mq3-renderer-tr-backend-runtime-ml-1833277471"></a>
### srcBlend

```ml
srcBlend
```

Source factor used by framebuffer blending.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L73)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-statebits-statebits-src-mq3-renderer-tr-backend-runtime-ml-1378415413"></a>
### stateBits

```ml
stateBits
```

Packed renderer flags specifying blending, depth, and alpha state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L67)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-texenv-texenv-src-mq3-renderer-tr-backend-runtime-ml-398579677"></a>
### texEnv

```ml
texEnv
```

Texture-environment combine mode cached for each texture unit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L65)

<a id="field-field-mq3-renderer-tr-backend-runtime-glstate-wireframe-wireframe-src-mq3-renderer-tr-backend-runtime-ml-1980429925"></a>
### wireframe

```ml
wireframe
```

Whether polygon edges are drawn instead of filled triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L79)
