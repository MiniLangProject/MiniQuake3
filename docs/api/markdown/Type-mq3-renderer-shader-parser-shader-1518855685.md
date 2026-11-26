# `mq3.renderer.shader_parser.Shader`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-parser-ml-2114769074.md)

<a id="struct-struct-mq3-renderer-shader-parser-shader-struct-shader-src-mq3-renderer-shader-parser-ml-24110307"></a>
## Shader

```ml
struct Shader
```

Data record for `mq3.renderer.shader_parser.Shader`; groups `name`, `stages`, `sort`, `cull`, `surfaceParms`, `noMipMaps`, and 10 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L153)

## Members

<a id="field-field-mq3-renderer-shader-parser-shader-clamptime-clamptime-src-mq3-renderer-shader-parser-ml-1438248472"></a>
### clampTime

```ml
clampTime
```

Upper limit applied to the shader's effect time; zero disables clamping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L175)

<a id="field-field-mq3-renderer-shader-parser-shader-cloudheight-cloudheight-src-mq3-renderer-shader-parser-ml-855564632"></a>
### cloudHeight

```ml
cloudHeight
```

Height used to project moving cloud texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L185)

<a id="field-field-mq3-renderer-shader-parser-shader-cull-cull-src-mq3-renderer-shader-parser-ml-1904847232"></a>
### cull

```ml
cull
```

Culling mode or classification applied to this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L161)

<a id="field-field-mq3-renderer-shader-parser-shader-deforms-deforms-src-mq3-renderer-shader-parser-ml-1762257432"></a>
### deforms

```ml
deforms
```

Ordered vertex deformations applied by the shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L177)

<a id="field-field-mq3-renderer-shader-parser-shader-entitymergable-entitymergable-src-mq3-renderer-shader-parser-ml-992912628"></a>
### entityMergable

```ml
entityMergable
```

Whether surfaces from separate entities may share one shader batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L171)

<a id="field-field-mq3-renderer-shader-parser-shader-fogcolor-fogcolor-src-mq3-renderer-shader-parser-ml-728645762"></a>
### fogColor

```ml
fogColor
```

Color of the fog volume defined by the material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L179)

<a id="field-field-mq3-renderer-shader-parser-shader-fogdepth-fogdepth-src-mq3-renderer-shader-parser-ml-1405259446"></a>
### fogDepth

```ml
fogDepth
```

Distance at which the shader's fog becomes opaque.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L181)

<a id="field-field-mq3-renderer-shader-parser-shader-name-name-src-mq3-renderer-shader-parser-ml-490622502"></a>
### name

```ml
name
```

Material name declared at the start of the parsed shader definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L155)

<a id="field-field-mq3-renderer-shader-parser-shader-nomipmaps-nomipmaps-src-mq3-renderer-shader-parser-ml-1906346380"></a>
### noMipMaps

```ml
noMipMaps
```

Whether mipmap generation is disabled for this material's textures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L165)

<a id="field-field-mq3-renderer-shader-parser-shader-nopicmip-nopicmip-src-mq3-renderer-shader-parser-ml-709851686"></a>
### noPicMip

```ml
noPicMip
```

Whether the material bypasses the global texture downscaling setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L167)

<a id="field-field-mq3-renderer-shader-parser-shader-polygonoffset-polygonoffset-src-mq3-renderer-shader-parser-ml-862802752"></a>
### polygonOffset

```ml
polygonOffset
```

Whether polygon-offset depth bias is applied while drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L169)

<a id="field-field-mq3-renderer-shader-parser-shader-portalrange-portalrange-src-mq3-renderer-shader-parser-ml-1433782436"></a>
### portalRange

```ml
portalRange
```

Distance over which portal alpha fades between transparent and opaque.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L173)

<a id="field-field-mq3-renderer-shader-parser-shader-sort-sort-src-mq3-renderer-shader-parser-ml-2127504568"></a>
### sort

```ml
sort
```

Shader ordering category used to schedule this material relative to other surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L159)

<a id="field-field-mq3-renderer-shader-parser-shader-stages-stages-src-mq3-renderer-shader-parser-ml-1760884934"></a>
### stages

```ml
stages
```

Ordered material stages evaluated when the shader is drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L157)

<a id="field-field-mq3-renderer-shader-parser-shader-surfaceparms-surfaceparms-src-mq3-renderer-shader-parser-ml-1013780132"></a>
### surfaceParms

```ml
surfaceParms
```

Surface flags and material properties parsed from shader directives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L163)

<a id="field-field-mq3-renderer-shader-parser-shader-warnings-warnings-src-mq3-renderer-shader-parser-ml-1738381910"></a>
### warnings

```ml
warnings
```

Nonfatal diagnostics retained by the subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L183)
