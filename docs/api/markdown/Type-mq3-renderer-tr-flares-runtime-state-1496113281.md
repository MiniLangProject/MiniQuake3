# `mq3.renderer.tr_flares_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-flares-runtime-ml-1405723862.md)

<a id="struct-struct-mq3-renderer-tr-flares-runtime-state-struct-state-src-mq3-renderer-tr-flares-runtime-ml-64614251"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.tr_flares_runtime.State`; groups `slots`, `active`, `inactive`, `projection`, `area`, `frameCount`, and 12 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L68)

## Members

<a id="field-field-mq3-renderer-tr-flares-runtime-state-active-active-src-mq3-renderer-tr-flares-runtime-ml-1965836428"></a>
### active

```ml
active
```

Indices of flare slots currently participating in visibility and fade updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L72)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-adds-adds-src-mq3-renderer-tr-flares-runtime-ml-956358320"></a>
### adds

```ml
adds
```

Number of flare additions processed by the flare system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L98)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-area-area-src-mq3-renderer-tr-flares-runtime-ml-1750706590"></a>
### area

```ml
area
```

Viewport rectangle used to project and depth-test flares.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L78)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-enabled-enabled-src-mq3-renderer-tr-flares-runtime-ml-1628355864"></a>
### enabled

```ml
enabled
```

Whether this feature is enabled by the current configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L94)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-faderate-faderate-src-mq3-renderer-tr-flares-runtime-ml-656182248"></a>
### fadeRate

```ml
fadeRate
```

Rate used to fade flare intensity after visibility changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L88)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-finishcalled-finishcalled-src-mq3-renderer-tr-flares-runtime-ml-633474676"></a>
### finishCalled

```ml
finishCalled
```

Whether a graphics completion barrier was already issued for this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L104)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-fogcatalog-fogcatalog-src-mq3-renderer-tr-flares-runtime-ml-1034618134"></a>
### fogCatalog

```ml
fogCatalog
```

Fog volumes and shared fog resources used by the batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L96)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-framecount-framecount-src-mq3-renderer-tr-flares-runtime-ml-189243352"></a>
### frameCount

```ml
frameCount
```

Sequence count of frames processed by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L80)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-framescenenum-framescenenum-src-mq3-renderer-tr-flares-runtime-ml-866308864"></a>
### frameSceneNum

```ml
frameSceneNum
```

Sequence number of the scene within the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L82)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-identitylight-identitylight-src-mq3-renderer-tr-flares-runtime-ml-2017222136"></a>
### identityLight

```ml
identityLight
```

Identity lighting scale after accounting for overbright settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L92)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-inactive-inactive-src-mq3-renderer-tr-flares-runtime-ml-1574659690"></a>
### inactive

```ml
inactive
```

Indices of flare slots currently available for allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L74)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-isportal-isportal-src-mq3-renderer-tr-flares-runtime-ml-28039152"></a>
### isPortal

```ml
isPortal
```

Whether this view renders through a portal surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L84)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-projection-projection-src-mq3-renderer-tr-flares-runtime-ml-1901674514"></a>
### projection

```ml
projection
```

Projection parameters or matrix used to map the view into the viewport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L76)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-renders-renders-src-mq3-renderer-tr-flares-runtime-ml-980484492"></a>
### renders

```ml
renders
```

Number of flare quads submitted by the flare system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L102)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-sizevalue-sizevalue-src-mq3-renderer-tr-flares-runtime-ml-1119717888"></a>
### sizeValue

```ml
sizeValue
```

Configured flare size used to construct its screen-space quad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L90)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-slots-slots-src-mq3-renderer-tr-flares-runtime-ml-678326052"></a>
### slots

```ml
slots
```

Resource slots or backing arrays retained by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L70)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-tests-tests-src-mq3-renderer-tr-flares-runtime-ml-248334344"></a>
### tests

```ml
tests
```

Number of visibility tests performed by the flare system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L100)

<a id="field-field-mq3-renderer-tr-flares-runtime-state-time-time-src-mq3-renderer-tr-flares-runtime-ml-1751301554"></a>
### time

```ml
time
```

Current view time in milliseconds used to update flare visibility transitions and fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L86)
