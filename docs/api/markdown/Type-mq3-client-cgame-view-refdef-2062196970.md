# `mq3.client.cgame_view.RefDef`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-view-ml-1544499938.md)

<a id="struct-struct-mq3-client-cgame-view-refdef-struct-refdef-src-mq3-client-cgame-view-ml-509283717"></a>
## RefDef

```ml
struct RefDef
```

Stores client game view ref def record, including `x`, `y`, `width`, `height`, `fovX`, `fovY` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L114)

## Members

<a id="field-field-mq3-client-cgame-view-refdef-areamask-areamask-src-mq3-client-cgame-view-ml-949608583"></a>
### areamask

```ml
areamask
```

Portal-area visibility bitset associated with the current snapshot or rendered view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L142)

<a id="field-field-mq3-client-cgame-view-refdef-fovx-fovx-src-mq3-client-cgame-view-ml-1788451707"></a>
### fovX

```ml
fovX
```

When constructing this record, `refDef` supplies `90.0` for this member. Used by `calcFov` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L125)

<a id="field-field-mq3-client-cgame-view-refdef-fovy-fovy-src-mq3-client-cgame-view-ml-973923057"></a>
### fovY

```ml
fovY
```

When constructing this record, `refDef` supplies `90.0` for this member. Used by `calcFov` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L128)

<a id="field-field-mq3-client-cgame-view-refdef-height-height-src-mq3-client-cgame-view-ml-1164689607"></a>
### height

```ml
height
```

Pixel height of the 3D viewport submitted for this client-game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L122)

<a id="field-field-mq3-client-cgame-view-refdef-rdflags-rdflags-src-mq3-client-cgame-view-ml-826027645"></a>
### rdflags

```ml
rdflags
```

When constructing this record, `refDef` supplies `0` for this member. Used by `calcViewValues` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L137)

<a id="field-field-mq3-client-cgame-view-refdef-time-time-src-mq3-client-cgame-view-ml-1450075339"></a>
### time

```ml
time
```

Client-game timestamp in milliseconds submitted with the rendered view for time-dependent rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L140)

<a id="field-field-mq3-client-cgame-view-refdef-viewaxis-viewaxis-src-mq3-client-cgame-view-ml-1026349409"></a>
### viewaxis

```ml
viewaxis
```

When constructing this record, `refDef` supplies `identityAxis()` for this member. Used by `testModel` and `addTestModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L134)

<a id="field-field-mq3-client-cgame-view-refdef-vieworg-vieworg-src-mq3-client-cgame-view-ml-1565682469"></a>
### vieworg

```ml
vieworg
```

When constructing this record, `refDef` supplies `[0.0,0.0,0.0]` for this member. Used by `testModel` and `addTestModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L131)

<a id="field-field-mq3-client-cgame-view-refdef-width-width-src-mq3-client-cgame-view-ml-551482469"></a>
### width

```ml
width
```

Pixel width of the 3D viewport submitted for this client-game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L120)

<a id="field-field-mq3-client-cgame-view-refdef-x-x-src-mq3-client-cgame-view-ml-1399054241"></a>
### x

```ml
x
```

Horizontal coordinate of the rendered view rectangle in framebuffer pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L116)

<a id="field-field-mq3-client-cgame-view-refdef-y-y-src-mq3-client-cgame-view-ml-1760546997"></a>
### y

```ml
y
```

Vertical coordinate of the rendered view rectangle in framebuffer pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L118)
