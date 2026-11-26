# `mq3.renderer.playable_materials.RuntimeStage`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-materials-ml-320329628.md)

<a id="struct-struct-mq3-renderer-playable-materials-runtimestage-struct-runtimestage-src-mq3-renderer-playable-materials-ml-1999178905"></a>
## RuntimeStage

```ml
struct RuntimeStage
```

Data record for `mq3.renderer.playable_materials.RuntimeStage`; groups `imageNames`, `images`, `slots`, `animationSpeed`, `uvMods`, `blend`, and 13 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L88)

## Members

<a id="field-field-mq3-renderer-playable-materials-runtimestage-alphagen-alphagen-src-mq3-renderer-playable-materials-ml-1253772059"></a>
### alphaGen

```ml
alphaGen
```

Generator used to compute the stage's alpha component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L110)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-alphatest-alphatest-src-mq3-renderer-playable-materials-ml-1705016231"></a>
### alphaTest

```ml
alphaTest
```

Alpha comparison used to reject fragments in this pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L102)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-alphawave-alphawave-src-mq3-renderer-playable-materials-ml-777844611"></a>
### alphaWave

```ml
alphaWave
```

Waveform used by the alpha generator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L112)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-animationspeed-animationspeed-src-mq3-renderer-playable-materials-ml-1898044805"></a>
### animationSpeed

```ml
animationSpeed
```

Rate at which animated shader images advance, in frames per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L96)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-blend-blend-src-mq3-renderer-playable-materials-ml-1806353267"></a>
### blend

```ml
blend
```

Blend mode selected for the material or merged stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L100)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-bsplightmap-bsplightmap-src-mq3-renderer-playable-materials-ml-567845039"></a>
### bspLightmap

```ml
bspLightmap
```

Whether the stage samples the BSP surface's baked lightmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L116)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-clamptexture-clamptexture-src-mq3-renderer-playable-materials-ml-372197379"></a>
### clampTexture

```ml
clampTexture
```

Whether texture coordinates clamp at the image edges.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L118)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-constantcolor-constantcolor-src-mq3-renderer-playable-materials-ml-332966807"></a>
### constantColor

```ml
constantColor
```

Constant color components used by the shader stage's color generators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L114)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-depthequal-depthequal-src-mq3-renderer-playable-materials-ml-114946593"></a>
### depthEqual

```ml
depthEqual
```

Whether depth testing accepts only fragments at the existing surface depth.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L122)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-depthwrite-depthwrite-src-mq3-renderer-playable-materials-ml-184737327"></a>
### depthWrite

```ml
depthWrite
```

Whether drawing this pass writes to the depth buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L120)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-imagenames-imagenames-src-mq3-renderer-playable-materials-ml-346831341"></a>
### imageNames

```ml
imageNames
```

Virtual image paths used by the stage's animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L90)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-images-images-src-mq3-renderer-playable-materials-ml-681982859"></a>
### images

```ml
images
```

Image resources or image-animation frames retained by the record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L92)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-portalrange-portalrange-src-mq3-renderer-playable-materials-ml-1545261719"></a>
### portalRange

```ml
portalRange
```

Distance over which portal alpha fades between transparent and opaque.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L124)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-rgbgen-rgbgen-src-mq3-renderer-playable-materials-ml-360327981"></a>
### rgbGen

```ml
rgbGen
```

Generator used to compute the stage's RGB color components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L106)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-rgbwave-rgbwave-src-mq3-renderer-playable-materials-ml-1948425067"></a>
### rgbWave

```ml
rgbWave
```

Waveform used by the RGB color generator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L108)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-slots-slots-src-mq3-renderer-playable-materials-ml-1019992823"></a>
### slots

```ml
slots
```

Resource slots or backing arrays retained by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L94)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-tcgen-tcgen-src-mq3-renderer-playable-materials-ml-1721875043"></a>
### tcGen

```ml
tcGen
```

Generator used to produce the stage's texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L104)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-tcgenvectors-tcgenvectors-src-mq3-renderer-playable-materials-ml-719453061"></a>
### tcGenVectors

```ml
tcGenVectors
```

Projection vectors used by vector-generated texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L126)

<a id="field-field-mq3-renderer-playable-materials-runtimestage-uvmods-uvmods-src-mq3-renderer-playable-materials-ml-1886781387"></a>
### uvMods

```ml
uvMods
```

Ordered texture-coordinate modifiers applied by this runtime stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L98)
