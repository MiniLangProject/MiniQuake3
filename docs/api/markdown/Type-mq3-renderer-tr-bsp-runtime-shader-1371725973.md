# `mq3.renderer.tr_bsp_runtime.Shader`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-shader-struct-shader-src-mq3-renderer-tr-bsp-runtime-ml-1802555849"></a>
## Shader

```ml
struct Shader
```

Data record for `mq3.renderer.tr_bsp_runtime.Shader`; groups `name`, `surfaceFlags`, `contentFlags`, `lightmapIndex`, `defaultShader`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L38)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-shader-contentflags-contentflags-src-mq3-renderer-tr-bsp-runtime-ml-2092275946"></a>
### contentFlags

```ml
contentFlags
```

Collision and volume-content flags carried by the BSP shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L44)

<a id="field-field-mq3-renderer-tr-bsp-runtime-shader-defaultshader-defaultshader-src-mq3-renderer-tr-bsp-runtime-ml-150054110"></a>
### defaultShader

```ml
defaultShader
```

Whether shader resolution fell back to the renderer's default material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L48)

<a id="field-field-mq3-renderer-tr-bsp-runtime-shader-lightmapindex-lightmapindex-src-mq3-renderer-tr-bsp-runtime-ml-1948124370"></a>
### lightmapIndex

```ml
lightmapIndex
```

Index or special selector identifying the surface's baked lightmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L46)

<a id="field-field-mq3-renderer-tr-bsp-runtime-shader-name-name-src-mq3-renderer-tr-bsp-runtime-ml-914099424"></a>
### name

```ml
name
```

Shader path stored in the BSP material table for this surface material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L40)

<a id="field-field-mq3-renderer-tr-bsp-runtime-shader-surfaceflags-surfaceflags-src-mq3-renderer-tr-bsp-runtime-ml-1791727194"></a>
### surfaceFlags

```ml
surfaceFlags
```

Surface behavior flags carried by the BSP shader or material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L42)
