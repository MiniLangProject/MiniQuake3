# `mq3.renderer.tr_scene_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-scene-runtime-ml-1958871231.md)

<a id="struct-struct-mq3-renderer-tr-scene-runtime-state-struct-state-src-mq3-renderer-tr-scene-runtime-ml-214032375"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.tr_scene_runtime.State`; groups `scene`, `smpEnabled`, `smpFrame`, `commandUsed`, `registered`, `noRefresh`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L118)

## Members

<a id="field-field-mq3-renderer-tr-scene-runtime-state-areamask-areamask-src-mq3-renderer-tr-scene-runtime-ml-48307112"></a>
### areaMask

```ml
areaMask
```

Area-visibility mask; set bits suppress rendering of the associated areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L150)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-commandused-commandused-src-mq3-renderer-tr-scene-runtime-ml-320929006"></a>
### commandUsed

```ml
commandUsed
```

Number of bytes occupied in the current renderer command buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L126)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-dynamiclight-dynamiclight-src-mq3-renderer-tr-scene-runtime-ml-1554336728"></a>
### dynamicLight

```ml
dynamicLight
```

Dynamic-light selection or state used when drawing this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L134)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-firstscenedrawsurf-firstscenedrawsurf-src-mq3-renderer-tr-scene-runtime-ml-1951202630"></a>
### firstSceneDrawSurf

```ml
firstSceneDrawSurf
```

First draw-surface slot belonging to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L142)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-framescenenum-framescenenum-src-mq3-renderer-tr-scene-runtime-ml-1260660798"></a>
### frameSceneNum

```ml
frameSceneNum
```

Sequence number of the scene within the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L144)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-frontendmsec-frontendmsec-src-mq3-renderer-tr-scene-runtime-ml-105431614"></a>
### frontEndMsec

```ml
frontEndMsec
```

Milliseconds spent preparing the frontend's scene commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L148)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-hardwaretype-hardwaretype-src-mq3-renderer-tr-scene-runtime-ml-989526022"></a>
### hardwareType

```ml
hardwareType
```

Detected graphics-hardware family used to select compatibility behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L138)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-norefresh-norefresh-src-mq3-renderer-tr-scene-runtime-ml-2018357590"></a>
### noRefresh

```ml
noRefresh
```

Whether scene rendering is disabled by the refresh setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L130)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-refdef-refdef-src-mq3-renderer-tr-scene-runtime-ml-1379174494"></a>
### refdef

```ml
refdef
```

Camera, viewport, timing, and rendering flags for the view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L152)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-registered-registered-src-mq3-renderer-tr-scene-runtime-ml-799552210"></a>
### registered

```ml
registered
```

Whether the subsystem has completed resource registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L128)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-scene-scene-src-mq3-renderer-tr-scene-runtime-ml-1970069282"></a>
### scene

```ml
scene
```

Scene entities, lights, and polygons collected for drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L120)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-scenecount-scenecount-src-mq3-renderer-tr-scene-runtime-ml-581639088"></a>
### sceneCount

```ml
sceneCount
```

Number of scene submissions processed by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L146)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-services-services-src-mq3-renderer-tr-scene-runtime-ml-167656270"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L154)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-smpenabled-smpenabled-src-mq3-renderer-tr-scene-runtime-ml-1361068144"></a>
### smpEnabled

```ml
smpEnabled
```

Whether configuration permits a separate renderer thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L122)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-smpframe-smpframe-src-mq3-renderer-tr-scene-runtime-ml-1045625172"></a>
### smpFrame

```ml
smpFrame
```

Index of the frame buffer shared between frontend and render thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L124)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-vertexlight-vertexlight-src-mq3-renderer-tr-scene-runtime-ml-550616358"></a>
### vertexLight

```ml
vertexLight
```

Whether lighting is reduced to the vertex-lighting path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L136)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-vidheight-vidheight-src-mq3-renderer-tr-scene-runtime-ml-1788178830"></a>
### vidHeight

```ml
vidHeight
```

Height of the active video mode in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L140)

<a id="field-field-mq3-renderer-tr-scene-runtime-state-worldloaded-worldloaded-src-mq3-renderer-tr-scene-runtime-ml-169879986"></a>
### worldLoaded

```ml
worldLoaded
```

Whether a world map is available to the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L132)
