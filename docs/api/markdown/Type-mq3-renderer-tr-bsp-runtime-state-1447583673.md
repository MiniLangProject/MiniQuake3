# `mq3.renderer.tr_bsp_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-state-struct-state-src-mq3-renderer-tr-bsp-runtime-ml-423057533"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.tr_bsp_runtime.State`; groups `worldMapLoaded`, `externalVisData`, `world`, `sunDirection`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L188)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-state-externalvisdata-externalvisdata-src-mq3-renderer-tr-bsp-runtime-ml-996688526"></a>
### externalVisData

```ml
externalVisData
```

Visibility data shared with the renderer by another subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L192)

<a id="field-field-mq3-renderer-tr-bsp-runtime-state-sundirection-sundirection-src-mq3-renderer-tr-bsp-runtime-ml-366881884"></a>
### sunDirection

```ml
sunDirection
```

Direction used for the shader-defined sunlight contribution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L196)

<a id="field-field-mq3-renderer-tr-bsp-runtime-state-world-world-src-mq3-renderer-tr-bsp-runtime-ml-1578605082"></a>
### world

```ml
world
```

Loaded world geometry and associated scene state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L194)

<a id="field-field-mq3-renderer-tr-bsp-runtime-state-worldmaploaded-worldmaploaded-src-mq3-renderer-tr-bsp-runtime-ml-858755264"></a>
### worldMapLoaded

```ml
worldMapLoaded
```

Whether the renderer has finished loading a world map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L190)
