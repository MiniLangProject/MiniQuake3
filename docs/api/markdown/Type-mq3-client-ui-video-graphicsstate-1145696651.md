# `mq3.client.ui_video.GraphicsState`

[Home](README.md) · [Source file](File-src-mq3-client-ui-video-ml-1287978223.md)

<a id="struct-struct-mq3-client-ui-video-graphicsstate-struct-graphicsstate-src-mq3-client-ui-video-ml-1012480905"></a>
## GraphicsState

```ml
struct GraphicsState
```

Stores UI video graphics state record, including `mode`, `fullscreen`, `tq`, `lighting`, `colorDepth`, `textureBits` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L185)

## Members

<a id="field-field-mq3-client-ui-video-graphicsstate-actions-actions-src-mq3-client-ui-video-ml-1364492371"></a>
### actions

```ml
actions
```

Host requests queued while listing renderer capabilities and applying graphics configuration changes, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L228)

<a id="field-field-mq3-client-ui-video-graphicsstate-applyvisible-applyvisible-src-mq3-client-ui-video-ml-1930715487"></a>
### applyVisible

```ml
applyVisible
```

When constructing this record, `graphicsState` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L210)

<a id="field-field-mq3-client-ui-video-graphicsstate-assets-assets-src-mq3-client-ui-video-ml-1066033001"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the graphics-options and driver-information menus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L225)

<a id="field-field-mq3-client-ui-video-graphicsstate-choices-choices-src-mq3-client-ui-video-ml-161605135"></a>
### choices

```ml
choices
```

When constructing this record, `graphicsState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L220)

<a id="field-field-mq3-client-ui-video-graphicsstate-colordepth-colordepth-src-mq3-client-ui-video-ml-1211919327"></a>
### colorDepth

```ml
colorDepth
```

When constructing this record, `graphicsState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L196)

<a id="field-field-mq3-client-ui-video-graphicsstate-colordepthgrayed-colordepthgrayed-src-mq3-client-ui-video-ml-818342763"></a>
### colorDepthGrayed

```ml
colorDepthGrayed
```

When constructing this record, `graphicsState` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L214)

<a id="field-field-mq3-client-ui-video-graphicsstate-driver-driver-src-mq3-client-ui-video-ml-1099707191"></a>
### driver

```ml
driver
```

When constructing this record, `graphicsState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L204)

<a id="field-field-mq3-client-ui-video-graphicsstate-driverhidden-driverhidden-src-mq3-client-ui-video-ml-1315710491"></a>
### driverHidden

```ml
driverHidden
```

When constructing this record, `graphicsState` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L216)

<a id="field-field-mq3-client-ui-video-graphicsstate-extensions-extensions-src-mq3-client-ui-video-ml-503564023"></a>
### extensions

```ml
extensions
```

Graphics extension information exposed by the renderer or selected by the video-settings UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L206)

<a id="field-field-mq3-client-ui-video-graphicsstate-filter-filter-src-mq3-client-ui-video-ml-1023723859"></a>
### filter

```ml
filter
```

When constructing this record, `graphicsState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L202)

<a id="field-field-mq3-client-ui-video-graphicsstate-fullscreen-fullscreen-src-mq3-client-ui-video-ml-1749616601"></a>
### fullscreen

```ml
fullscreen
```

Current fullscreen choice in the graphics menu, applied to the renderer when settings are accepted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L190)

<a id="field-field-mq3-client-ui-video-graphicsstate-fullscreengrayed-fullscreengrayed-src-mq3-client-ui-video-ml-1668172841"></a>
### fullscreenGrayed

```ml
fullscreenGrayed
```

When constructing this record, `graphicsState` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L212)

<a id="field-field-mq3-client-ui-video-graphicsstate-geometry-geometry-src-mq3-client-ui-video-ml-212394767"></a>
### geometry

```ml
geometry
```

When constructing this record, `graphicsState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L200)

<a id="field-field-mq3-client-ui-video-graphicsstate-initial-initial-src-mq3-client-ui-video-ml-1141042187"></a>
### initial

```ml
initial
```

When constructing this record, `graphicsState` supplies `base` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L218)

<a id="field-field-mq3-client-ui-video-graphicsstate-items-items-src-mq3-client-ui-video-ml-1155103715"></a>
### items

```ml
items
```

When constructing this record, `graphicsState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L222)

<a id="field-field-mq3-client-ui-video-graphicsstate-lighting-lighting-src-mq3-client-ui-video-ml-2004340423"></a>
### lighting

```ml
lighting
```

When constructing this record, `graphicsState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L194)

<a id="field-field-mq3-client-ui-video-graphicsstate-mode-mode-src-mq3-client-ui-video-ml-670737729"></a>
### mode

```ml
mode
```

When constructing this record, `graphicsState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L187)

<a id="field-field-mq3-client-ui-video-graphicsstate-preset-preset-src-mq3-client-ui-video-ml-1992073673"></a>
### preset

```ml
preset
```

When constructing this record, `graphicsState` supplies `4` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L208)

<a id="field-field-mq3-client-ui-video-graphicsstate-texturebits-texturebits-src-mq3-client-ui-video-ml-2060954387"></a>
### textureBits

```ml
textureBits
```

Requested color precision for texture storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L198)

<a id="field-field-mq3-client-ui-video-graphicsstate-tq-tq-src-mq3-client-ui-video-ml-2061067145"></a>
### tq

```ml
tq
```

When constructing this record, `graphicsState` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_video.ml#L192)
