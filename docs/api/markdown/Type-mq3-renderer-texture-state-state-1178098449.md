# `mq3.renderer.texture_state.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-texture-state-ml-1230714594.md)

<a id="struct-struct-mq3-renderer-texture-state-state-struct-state-src-mq3-renderer-texture-state-ml-533938023"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.texture_state.State`; groups `currentTextures`, `currentTmu`, `defaultImage`, `dlightImage`, `noBind`, `frameCount`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L39)

## Members

<a id="field-field-mq3-renderer-texture-state-state-currenttextures-currenttextures-src-mq3-renderer-texture-state-ml-1317946164"></a>
### currentTextures

```ml
currentTextures
```

Texture object currently bound on each texture unit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L41)

<a id="field-field-mq3-renderer-texture-state-state-currenttmu-currenttmu-src-mq3-renderer-texture-state-ml-4231778"></a>
### currentTmu

```ml
currentTmu
```

Index of the currently selected texture unit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L43)

<a id="field-field-mq3-renderer-texture-state-state-defaultimage-defaultimage-src-mq3-renderer-texture-state-ml-1435791712"></a>
### defaultImage

```ml
defaultImage
```

Fallback image used when a requested texture is unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L45)

<a id="field-field-mq3-renderer-texture-state-state-dlightimage-dlightimage-src-mq3-renderer-texture-state-ml-66320548"></a>
### dlightImage

```ml
dlightImage
```

Texture used when projecting dynamic-light contributions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L47)

<a id="field-field-mq3-renderer-texture-state-state-framecount-framecount-src-mq3-renderer-texture-state-ml-589089156"></a>
### frameCount

```ml
frameCount
```

Sequence count of frames processed by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L51)

<a id="field-field-mq3-renderer-texture-state-state-nobind-nobind-src-mq3-renderer-texture-state-ml-651755756"></a>
### noBind

```ml
noBind
```

Debug setting that substitutes the selected debug texture for normal binds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L49)

<a id="field-field-mq3-renderer-texture-state-state-services-services-src-mq3-renderer-texture-state-ml-612851140"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/texture_state.ml#L53)
