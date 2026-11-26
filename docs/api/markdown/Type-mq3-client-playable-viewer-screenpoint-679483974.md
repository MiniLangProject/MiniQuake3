# `mq3.client.playable_viewer.ScreenPoint`

[Home](README.md) · [Source file](File-src-mq3-client-playable-viewer-ml-2126962810.md)

<a id="struct-struct-mq3-client-playable-viewer-screenpoint-struct-screenpoint-src-mq3-client-playable-viewer-ml-1107011433"></a>
## ScreenPoint

```ml
struct ScreenPoint
```

Stores playable viewer screen point record, including `x`, `y`, `depth`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L52)

## Members

<a id="field-field-mq3-client-playable-viewer-screenpoint-depth-depth-src-mq3-client-playable-viewer-ml-784438559"></a>
### depth

```ml
depth
```

When constructing this record, `projectViewPoint` supplies `point[2]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L58)

<a id="field-field-mq3-client-playable-viewer-screenpoint-x-x-src-mq3-client-playable-viewer-ml-1789246415"></a>
### x

```ml
x
```

Horizontal coordinate of a camera-projected point in output-screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L54)

<a id="field-field-mq3-client-playable-viewer-screenpoint-y-y-src-mq3-client-playable-viewer-ml-1505287155"></a>
### y

```ml
y
```

Vertical coordinate of a camera-projected point in output-screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewer.ml#L56)
