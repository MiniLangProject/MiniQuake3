# `mq3.renderer.world_surface_selection.SelectionConfig`

[Home](README.md) · [Source file](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)

<a id="struct-struct-mq3-renderer-world-surface-selection-selectionconfig-struct-selectionconfig-src-mq3-renderer-world-surface-selection-ml-2112954145"></a>
## SelectionConfig

```ml
struct SelectionConfig
```

Data record for `mq3.renderer.world_surface_selection.SelectionConfig`; groups `width`, `height`, `horizontalFov`, `nearDistance`, `farDistance`, `triangleBudget`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L43)

## Members

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-areamask-areamask-src-mq3-renderer-world-surface-selection-ml-495733683"></a>
### areaMask

```ml
areaMask
```

Area-visibility mask; set bits suppress rendering of the associated areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L65)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-backfacecull-backfacecull-src-mq3-renderer-world-surface-selection-ml-92603657"></a>
### backfaceCull

```ml
backfaceCull
```

Whether faces pointing away from the camera are rejected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L57)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-fardistance-fardistance-src-mq3-renderer-world-surface-selection-ml-1072897241"></a>
### farDistance

```ml
farDistance
```

Distance threshold for the most distant model-detail tier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L53)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-height-height-src-mq3-renderer-world-surface-selection-ml-65034707"></a>
### height

```ml
height
```

Height in pixels of the camera viewport used for world visibility and detail selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L47)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-horizontalfov-horizontalfov-src-mq3-renderer-world-surface-selection-ml-1573632705"></a>
### horizontalFov

```ml
horizontalFov
```

Horizontal camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L49)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-lodcurveerror-lodcurveerror-src-mq3-renderer-world-surface-selection-ml-513416257"></a>
### lodCurveError

```ml
lodCurveError
```

View-dependent error threshold used to reduce patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L67)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-neardistance-neardistance-src-mq3-renderer-world-surface-selection-ml-769903699"></a>
### nearDistance

```ml
nearDistance
```

Distance of the camera's near clipping plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L51)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-patcherror-patcherror-src-mq3-renderer-world-surface-selection-ml-1956964601"></a>
### patchError

```ml
patchError
```

Permitted geometric error when tessellating curved patches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L59)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-runtime-runtime-src-mq3-renderer-world-surface-selection-ml-1016978417"></a>
### runtime

```ml
runtime
```

Runtime object used to execute the subsystem's operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L61)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-trianglebudget-trianglebudget-src-mq3-renderer-world-surface-selection-ml-2074508471"></a>
### triangleBudget

```ml
triangleBudget
```

Maximum triangle workload accepted by surface selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L55)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-verticalfov-verticalfov-src-mq3-renderer-world-surface-selection-ml-661225777"></a>
### verticalFov

```ml
verticalFov
```

Vertical camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L63)

<a id="field-field-mq3-renderer-world-surface-selection-selectionconfig-width-width-src-mq3-renderer-world-surface-selection-ml-639768069"></a>
### width

```ml
width
```

Width in pixels of the camera viewport used for world visibility and detail selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L45)
