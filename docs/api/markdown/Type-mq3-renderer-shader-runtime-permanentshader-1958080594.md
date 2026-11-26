# `mq3.renderer.shader_runtime.PermanentShader`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-runtime-ml-1808980679.md)

<a id="struct-struct-mq3-renderer-shader-runtime-permanentshader-struct-permanentshader-src-mq3-renderer-shader-runtime-ml-1970509023"></a>
## PermanentShader

```ml
struct PermanentShader
```

Data record for `mq3.renderer.shader_runtime.PermanentShader`; groups `handle`, `name`, `lightmapIndex`, `mipRawImage`, `shader`, `image`, and 10 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L65)

## Members

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-collapse-collapse-src-mq3-renderer-shader-runtime-ml-1662288046"></a>
### collapse

```ml
collapse
```

Result of combining compatible shader stages into fewer drawing passes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L87)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-defaultshader-defaultshader-src-mq3-renderer-shader-runtime-ml-394582980"></a>
### defaultShader

```ml
defaultShader
```

Whether shader resolution fell back to the renderer's default material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L79)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-explicitlydefined-explicitlydefined-src-mq3-renderer-shader-runtime-ml-535897812"></a>
### explicitlyDefined

```ml
explicitlyDefined
```

Whether the material was defined in a shader script.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L81)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-handle-handle-src-mq3-renderer-shader-runtime-ml-1565722936"></a>
### handle

```ml
handle
```

Resource handle used to identify the registered or opened object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L67)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-image-image-src-mq3-renderer-shader-runtime-ml-1194048712"></a>
### image

```ml
image
```

Image associated with the registered shader's implicit or fallback material path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L77)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-internal-internal-src-mq3-renderer-shader-runtime-ml-1131649694"></a>
### internal

```ml
internal
```

Whether the shader is an internal renderer resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L83)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-iteratorname-iteratorname-src-mq3-renderer-shader-runtime-ml-772137122"></a>
### iteratorName

```ml
iteratorName
```

Backend iterator selected to execute the shader's drawing stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L85)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-lightmapindex-lightmapindex-src-mq3-renderer-shader-runtime-ml-496202712"></a>
### lightmapIndex

```ml
lightmapIndex
```

Index or special selector identifying the surface's baked lightmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L71)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-miprawimage-miprawimage-src-mq3-renderer-shader-runtime-ml-581201544"></a>
### mipRawImage

```ml
mipRawImage
```

Whether a shader's implicit image is loaded with mipmap generation enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L73)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-name-name-src-mq3-renderer-shader-runtime-ml-733107698"></a>
### name

```ml
name
```

Registered material name used to find the permanent shader and its remappings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L69)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-passes-passes-src-mq3-renderer-shader-runtime-ml-671153294"></a>
### passes

```ml
passes
```

Drawing passes required by the material or retained batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L91)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-remappedname-remappedname-src-mq3-renderer-shader-runtime-ml-907980938"></a>
### remappedName

```ml
remappedName
```

Shader name selected after applying active remaps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L95)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-shader-shader-src-mq3-renderer-shader-runtime-ml-781270230"></a>
### shader

```ml
shader
```

Resolved shader record or handle used for this drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L75)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-sortedindex-sortedindex-src-mq3-renderer-shader-runtime-ml-501953724"></a>
### sortedIndex

```ml
sortedIndex
```

Position of this shader in the renderer's sort order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L93)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-timeoffset-timeoffset-src-mq3-renderer-shader-runtime-ml-1020289720"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L97)

<a id="field-field-mq3-renderer-shader-runtime-permanentshader-vertexcollapsed-vertexcollapsed-src-mq3-renderer-shader-runtime-ml-903586024"></a>
### vertexCollapsed

```ml
vertexCollapsed
```

Whether stage colors and lighting were collapsed to the vertex-lighting path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L89)
