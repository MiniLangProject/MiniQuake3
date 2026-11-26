# `mq3.renderer.tr_shade_runtime.ShaderState`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-shaderstate-struct-shaderstate-src-mq3-renderer-tr-shade-runtime-ml-1134616283"></a>
## ShaderState

```ml
struct ShaderState
```

Data record for `mq3.renderer.tr_shade_runtime.ShaderState`; groups `name`, `remappedShader`, `timeOffset`, `clampTime`, `sort`, `fogPass`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L81)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-clamptime-clamptime-src-mq3-renderer-tr-shade-runtime-ml-194176323"></a>
### clampTime

```ml
clampTime
```

Upper limit applied to the shader's effect time; zero disables clamping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L89)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-fogpass-fogpass-src-mq3-renderer-tr-shade-runtime-ml-119466151"></a>
### fogPass

```ml
fogPass
```

Fog pass mode used after the material's ordinary stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L93)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-iteratorname-iteratorname-src-mq3-renderer-tr-shade-runtime-ml-1016777665"></a>
### iteratorName

```ml
iteratorName
```

Backend iterator selected to execute the shader's drawing stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L101)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-name-name-src-mq3-renderer-tr-shade-runtime-ml-1978440145"></a>
### name

```ml
name
```

Active material name retained while preparing and finishing a tessellated shader batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L83)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-numpasses-numpasses-src-mq3-renderer-tr-shade-runtime-ml-903009503"></a>
### numPasses

```ml
numPasses
```

Number of material passes required to draw the current surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L99)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-polygonoffset-polygonoffset-src-mq3-renderer-tr-shade-runtime-ml-158716187"></a>
### polygonOffset

```ml
polygonOffset
```

Whether polygon-offset depth bias is applied while drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L95)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-remappedshader-remappedshader-src-mq3-renderer-tr-shade-runtime-ml-1089789245"></a>
### remappedShader

```ml
remappedShader
```

Shader selected after applying a material remap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L85)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-sort-sort-src-mq3-renderer-tr-shade-runtime-ml-1931324347"></a>
### sort

```ml
sort
```

Shader ordering category used to schedule this material relative to other surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L91)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-surfaceflags-surfaceflags-src-mq3-renderer-tr-shade-runtime-ml-1833194035"></a>
### surfaceFlags

```ml
surfaceFlags
```

Surface behavior flags carried by the BSP shader or material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L97)

<a id="field-field-mq3-renderer-tr-shade-runtime-shaderstate-timeoffset-timeoffset-src-mq3-renderer-tr-shade-runtime-ml-1610973091"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L87)
