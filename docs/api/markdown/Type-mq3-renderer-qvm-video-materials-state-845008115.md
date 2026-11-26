# `mq3.renderer.qvm_video_materials.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-video-materials-ml-550085236.md)

<a id="struct-struct-mq3-renderer-qvm-video-materials-state-struct-state-src-mq3-renderer-qvm-video-materials-ml-2022335883"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.qvm_video_materials.State`; groups `cinematics`, `firstScratchSlot`, `scratchSlotCount`, `bindings`, `failedBindings`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L39)

## Members

<a id="field-field-mq3-renderer-qvm-video-materials-state-bindings-bindings-src-mq3-renderer-qvm-video-materials-ml-567072344"></a>
### bindings

```ml
bindings
```

Bindings associating names or handles with their backing resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L47)

<a id="field-field-mq3-renderer-qvm-video-materials-state-cinematics-cinematics-src-mq3-renderer-qvm-video-materials-ml-1941919796"></a>
### cinematics

```ml
cinematics
```

Active cinematic handles, decoded frames, and playback state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L41)

<a id="field-field-mq3-renderer-qvm-video-materials-state-failedbindings-failedbindings-src-mq3-renderer-qvm-video-materials-ml-45074198"></a>
### failedBindings

```ml
failedBindings
```

Cinematic or texture bindings that failed to initialize.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L49)

<a id="field-field-mq3-renderer-qvm-video-materials-state-firstscratchslot-firstscratchslot-src-mq3-renderer-qvm-video-materials-ml-354431808"></a>
### firstScratchSlot

```ml
firstScratchSlot
```

First texture slot reserved for cinematic frame uploads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L43)

<a id="field-field-mq3-renderer-qvm-video-materials-state-scratchslotcount-scratchslotcount-src-mq3-renderer-qvm-video-materials-ml-1041925298"></a>
### scratchSlotCount

```ml
scratchSlotCount
```

Number of texture slots reserved for cinematic frame uploads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_video_materials.ml#L45)
