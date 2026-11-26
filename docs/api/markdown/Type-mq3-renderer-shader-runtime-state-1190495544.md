# `mq3.renderer.shader_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-runtime-ml-1808980679.md)

<a id="struct-struct-mq3-renderer-shader-runtime-state-struct-state-src-mq3-renderer-shader-runtime-ml-2101855075"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.shader_runtime.State`; groups `text`, `index`, `shaders`, `sorted`, `remaps`, `assets`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L100)

## Members

<a id="field-field-mq3-renderer-shader-runtime-state-assets-assets-src-mq3-renderer-shader-runtime-ml-1695838320"></a>
### assets

```ml
assets
```

Registered resource handles and their backing asset data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L112)

<a id="field-field-mq3-renderer-shader-runtime-state-commandfixfn-commandfixfn-src-mq3-renderer-shader-runtime-ml-187325278"></a>
### commandFixFn

```ml
commandFixFn
```

Host callback used to perform command fix operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L120)

<a id="field-field-mq3-renderer-shader-runtime-state-context-context-src-mq3-renderer-shader-runtime-ml-1051222762"></a>
### context

```ml
context
```

Asset-host state passed when loading shader images or repairing queued shader references.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L116)

<a id="field-field-mq3-renderer-shader-runtime-state-detailtextures-detailtextures-src-mq3-renderer-shader-runtime-ml-119292764"></a>
### detailTextures

```ml
detailTextures
```

Whether optional detail-texture stages are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L124)

<a id="field-field-mq3-renderer-shader-runtime-state-ignorefastpath-ignorefastpath-src-mq3-renderer-shader-runtime-ml-351703124"></a>
### ignoreFastPath

```ml
ignoreFastPath
```

Whether optimized single-stage drawing paths are disabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L128)

<a id="field-field-mq3-renderer-shader-runtime-state-index-index-src-mq3-renderer-shader-runtime-ml-1252783238"></a>
### index

```ml
index
```

Parsed shader-text index used to find definitions by material name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L104)

<a id="field-field-mq3-renderer-shader-runtime-state-initialized-initialized-src-mq3-renderer-shader-runtime-ml-652559842"></a>
### initialized

```ml
initialized
```

Whether initialization completed successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L134)

<a id="field-field-mq3-renderer-shader-runtime-state-kinds-kinds-src-mq3-renderer-shader-runtime-ml-1264554022"></a>
### kinds

```ml
kinds
```

Resource categories associated with the registered shader assets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L114)

<a id="field-field-mq3-renderer-shader-runtime-state-loadimagefn-loadimagefn-src-mq3-renderer-shader-runtime-ml-49234958"></a>
### loadImageFn

```ml
loadImageFn
```

Host callback used to perform load image operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L118)

<a id="field-field-mq3-renderer-shader-runtime-state-multitexture-multitexture-src-mq3-renderer-shader-runtime-ml-821653746"></a>
### multitexture

```ml
multitexture
```

Whether multiple texture units may be used in one drawing pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L132)

<a id="field-field-mq3-renderer-shader-runtime-state-numlightmaps-numlightmaps-src-mq3-renderer-shader-runtime-ml-1871156708"></a>
### numLightmaps

```ml
numLightmaps
```

Number of BSP lightmaps available to shader registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L122)

<a id="field-field-mq3-renderer-shader-runtime-state-remaps-remaps-src-mq3-renderer-shader-runtime-ml-1705629058"></a>
### remaps

```ml
remaps
```

Shader remapping entries applied during material lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L110)

<a id="field-field-mq3-renderer-shader-runtime-state-shaders-shaders-src-mq3-renderer-shader-runtime-ml-903055306"></a>
### shaders

```ml
shaders
```

Shader records available to resolve the queued drawing surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L106)

<a id="field-field-mq3-renderer-shader-runtime-state-sorted-sorted-src-mq3-renderer-shader-runtime-ml-37444404"></a>
### sorted

```ml
sorted
```

Shader records ordered by their rendering sort keys.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L108)

<a id="field-field-mq3-renderer-shader-runtime-state-text-text-src-mq3-renderer-shader-runtime-ml-1962492316"></a>
### text

```ml
text
```

Text payload, script source, or message associated with this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L102)

<a id="field-field-mq3-renderer-shader-runtime-state-textureenvadd-textureenvadd-src-mq3-renderer-shader-runtime-ml-1178381526"></a>
### textureEnvAdd

```ml
textureEnvAdd
```

Whether additive texture-environment combining is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L130)

<a id="field-field-mq3-renderer-shader-runtime-state-vertexlight-vertexlight-src-mq3-renderer-shader-runtime-ml-1957388066"></a>
### vertexLight

```ml
vertexLight
```

Whether lighting is reduced to the vertex-lighting path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L126)

<a id="field-field-mq3-renderer-shader-runtime-state-warnings-warnings-src-mq3-renderer-shader-runtime-ml-89604328"></a>
### warnings

```ml
warnings
```

Nonfatal diagnostics retained by the subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L136)
