# `mq3.client.playable_viewer.Camera`

[Home](README.md) · [Source file](File-src-mq3-client-playable-viewer-ml-2126962810.md)

<a id="struct-struct-mq3-client-playable-viewer-camera-struct-camera-src-mq3-client-playable-viewer-ml-356179863"></a>
## Camera

```ml
struct Camera
```

Stores playable viewer camera record, including `position`, `yaw`, `pitch`, `moveSpeed`, `mouseSensitivity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L19)

## Members

<a id="field-field-mq3-client-playable-viewer-camera-mousesensitivity-mousesensitivity-src-mq3-client-playable-viewer-ml-1639257770"></a>
### mouseSensitivity

```ml
mouseSensitivity
```

When constructing this record, `camera` supplies `numeric.f32(mouseSensitivity)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L30)

<a id="field-field-mq3-client-playable-viewer-camera-movespeed-movespeed-src-mq3-client-playable-viewer-ml-1023590986"></a>
### moveSpeed

```ml
moveSpeed
```

When constructing this record, `camera` supplies `numeric.f32(moveSpeed)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L28)

<a id="field-field-mq3-client-playable-viewer-camera-pitch-pitch-src-mq3-client-playable-viewer-ml-550624070"></a>
### pitch

```ml
pitch
```

When constructing this record, `camera` supplies `numeric.f32(pitch)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L26)

<a id="field-field-mq3-client-playable-viewer-camera-position-position-src-mq3-client-playable-viewer-ml-1614740188"></a>
### position

```ml
position
```

When constructing this record, `camera` supplies `[numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L22)

<a id="field-field-mq3-client-playable-viewer-camera-yaw-yaw-src-mq3-client-playable-viewer-ml-1330788890"></a>
### yaw

```ml
yaw
```

When constructing this record, `camera` supplies `numeric.f32(yaw)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewer.ml#L24)
