# `mq3.renderer.shader_parser.Stage`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-parser-ml-2114769074.md)

<a id="struct-struct-mq3-renderer-shader-parser-stage-struct-stage-src-mq3-renderer-shader-parser-ml-825249009"></a>
## Stage

```ml
struct Stage
```

Data record for `mq3.renderer.shader_parser.Stage`; groups `active`, `mapMode`, `images`, `animationSpeed`, `isLightmap`, `blendSrc`, and 16 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L106)

## Members

<a id="field-field-mq3-renderer-shader-parser-stage-active-active-src-mq3-renderer-shader-parser-ml-1746090211"></a>
### active

```ml
active
```

Whether this object is currently active and accepts processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L108)

<a id="field-field-mq3-renderer-shader-parser-stage-alphafunc-alphafunc-src-mq3-renderer-shader-parser-ml-783450979"></a>
### alphaFunc

```ml
alphaFunc
```

Alpha comparison selected for fragment rejection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L144)

<a id="field-field-mq3-renderer-shader-parser-stage-alphagen-alphagen-src-mq3-renderer-shader-parser-ml-4506995"></a>
### alphaGen

```ml
alphaGen
```

Generator used to compute the stage's alpha component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L124)

<a id="field-field-mq3-renderer-shader-parser-stage-alphawave-alphawave-src-mq3-renderer-shader-parser-ml-990449947"></a>
### alphaWave

```ml
alphaWave
```

Waveform used by the alpha generator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L128)

<a id="field-field-mq3-renderer-shader-parser-stage-animationspeed-animationspeed-src-mq3-renderer-shader-parser-ml-611018825"></a>
### animationSpeed

```ml
animationSpeed
```

Rate at which animated shader images advance, in frames per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L114)

<a id="field-field-mq3-renderer-shader-parser-stage-blenddst-blenddst-src-mq3-renderer-shader-parser-ml-913804339"></a>
### blendDst

```ml
blendDst
```

Destination blend factor encoded in the shader stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L120)

<a id="field-field-mq3-renderer-shader-parser-stage-blendsrc-blendsrc-src-mq3-renderer-shader-parser-ml-217552089"></a>
### blendSrc

```ml
blendSrc
```

Source blend factor encoded in the shader stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L118)

<a id="field-field-mq3-renderer-shader-parser-stage-constantcolor-constantcolor-src-mq3-renderer-shader-parser-ml-1165286631"></a>
### constantColor

```ml
constantColor
```

Constant color components used by the shader stage's color generators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L130)

<a id="field-field-mq3-renderer-shader-parser-stage-depthexplicit-depthexplicit-src-mq3-renderer-shader-parser-ml-639375839"></a>
### depthExplicit

```ml
depthExplicit
```

Whether the shader text explicitly selected depth writing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L142)

<a id="field-field-mq3-renderer-shader-parser-stage-depthfunc-depthfunc-src-mq3-renderer-shader-parser-ml-1154000519"></a>
### depthFunc

```ml
depthFunc
```

Depth comparison selected for the shader pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L146)

<a id="field-field-mq3-renderer-shader-parser-stage-depthwrite-depthwrite-src-mq3-renderer-shader-parser-ml-817206175"></a>
### depthWrite

```ml
depthWrite
```

Whether drawing this pass writes to the depth buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L140)

<a id="field-field-mq3-renderer-shader-parser-stage-detail-detail-src-mq3-renderer-shader-parser-ml-1797445389"></a>
### detail

```ml
detail
```

Whether this shader stage is an optional detail-texture pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L148)

<a id="field-field-mq3-renderer-shader-parser-stage-images-images-src-mq3-renderer-shader-parser-ml-1837192099"></a>
### images

```ml
images
```

Image resources or image-animation frames retained by the record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L112)

<a id="field-field-mq3-renderer-shader-parser-stage-islightmap-islightmap-src-mq3-renderer-shader-parser-ml-1493055331"></a>
### isLightmap

```ml
isLightmap
```

Whether the stage samples a BSP lightmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L116)

<a id="field-field-mq3-renderer-shader-parser-stage-mapmode-mapmode-src-mq3-renderer-shader-parser-ml-1771815935"></a>
### mapMode

```ml
mapMode
```

Texture-map selection mode parsed from the shader stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L110)

<a id="field-field-mq3-renderer-shader-parser-stage-portalrange-portalrange-src-mq3-renderer-shader-parser-ml-1418867623"></a>
### portalRange

```ml
portalRange
```

Distance over which portal alpha fades between transparent and opaque.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L132)

<a id="field-field-mq3-renderer-shader-parser-stage-rgbgen-rgbgen-src-mq3-renderer-shader-parser-ml-321361777"></a>
### rgbGen

```ml
rgbGen
```

Generator used to compute the stage's RGB color components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L122)

<a id="field-field-mq3-renderer-shader-parser-stage-rgbwave-rgbwave-src-mq3-renderer-shader-parser-ml-481603651"></a>
### rgbWave

```ml
rgbWave
```

Waveform used by the RGB color generator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L126)

<a id="field-field-mq3-renderer-shader-parser-stage-statebits-statebits-src-mq3-renderer-shader-parser-ml-933583475"></a>
### stateBits

```ml
stateBits
```

Packed renderer flags specifying blending, depth, and alpha state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L150)

<a id="field-field-mq3-renderer-shader-parser-stage-tcgen-tcgen-src-mq3-renderer-shader-parser-ml-2095809531"></a>
### tcGen

```ml
tcGen
```

Generator used to produce the stage's texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L134)

<a id="field-field-mq3-renderer-shader-parser-stage-tcgenvectors-tcgenvectors-src-mq3-renderer-shader-parser-ml-1128352521"></a>
### tcGenVectors

```ml
tcGenVectors
```

Projection vectors used by vector-generated texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L136)

<a id="field-field-mq3-renderer-shader-parser-stage-texmods-texmods-src-mq3-renderer-shader-parser-ml-1511335227"></a>
### texMods

```ml
texMods
```

Ordered texture-coordinate modifiers applied by the shader stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L138)
