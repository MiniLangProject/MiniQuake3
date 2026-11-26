# `mq3.client.playable_viewer.Projection`

[Home](README.md) · [Source file](File-src-mq3-client-playable-viewer-ml-2126962810.md)

<a id="struct-struct-mq3-client-playable-viewer-projection-struct-projection-src-mq3-client-playable-viewer-ml-392767179"></a>
## Projection

```ml
struct Projection
```

Stores playable viewer projection record, including `position`, `right`, `up`, `forward`, `halfWidth`, `halfHeight` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L72)

## Members

<a id="field-field-mq3-client-playable-viewer-projection-focal-focal-src-mq3-client-playable-viewer-ml-604902084"></a>
### focal

```ml
focal
```

When constructing this record, `prepareProjection` supplies `focal` for this member. Used by `projectPreparedView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L89)

<a id="field-field-mq3-client-playable-viewer-projection-forward-forward-src-mq3-client-playable-viewer-ml-529237996"></a>
### forward

```ml
forward
```

When constructing this record, `prepareProjection` supplies `axes[0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L80)

<a id="field-field-mq3-client-playable-viewer-projection-halfheight-halfheight-src-mq3-client-playable-viewer-ml-835250960"></a>
### halfHeight

```ml
halfHeight
```

When constructing this record, `prepareProjection` supplies `height*0.5` for this member. Used by `projectPreparedView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L86)

<a id="field-field-mq3-client-playable-viewer-projection-halfwidth-halfwidth-src-mq3-client-playable-viewer-ml-1357704396"></a>
### halfWidth

```ml
halfWidth
```

When constructing this record, `prepareProjection` supplies `width*0.5` for this member. Used by `projectPreparedView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L83)

<a id="field-field-mq3-client-playable-viewer-projection-neardistance-neardistance-src-mq3-client-playable-viewer-ml-1792654218"></a>
### nearDistance

```ml
nearDistance
```

When constructing this record, `prepareProjection` supplies `nearDistance` for this member. Used by `projectPreparedView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L92)

<a id="field-field-mq3-client-playable-viewer-projection-position-position-src-mq3-client-playable-viewer-ml-1174111586"></a>
### position

```ml
position
```

When constructing this record, `prepareProjection` supplies `state.position` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L74)

<a id="field-field-mq3-client-playable-viewer-projection-right-right-src-mq3-client-playable-viewer-ml-1182385748"></a>
### right

```ml
right
```

Right boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L76)

<a id="field-field-mq3-client-playable-viewer-projection-up-up-src-mq3-client-playable-viewer-ml-330129746"></a>
### up

```ml
up
```

When constructing this record, `prepareProjection` supplies `axes[2]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L78)

<a id="field-field-mq3-client-playable-viewer-projection-verticalfocal-verticalfocal-src-mq3-client-playable-viewer-ml-2136311600"></a>
### verticalFocal

```ml
verticalFocal
```

When constructing this record, `prepareProjection` supplies `focal` for this member. Used by `projectPreparedView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L95)
