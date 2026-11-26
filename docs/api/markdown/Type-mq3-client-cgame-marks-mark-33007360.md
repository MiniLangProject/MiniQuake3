# `mq3.client.cgame_marks.Mark`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-marks-ml-1111050399.md)

<a id="struct-struct-mq3-client-cgame-marks-mark-struct-mark-src-mq3-client-cgame-marks-ml-104913843"></a>
## Mark

```ml
struct Mark
```

Stores client game marks mark record, including `id`, `active`, `time`, `alphaFade`, `shader`, `color` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L47)

## Members

<a id="field-field-mq3-client-cgame-marks-mark-active-active-src-mq3-client-cgame-marks-ml-1352505096"></a>
### active

```ml
active
```

When constructing this record, `freshMark` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L51)

<a id="field-field-mq3-client-cgame-marks-mark-alphafade-alphafade-src-mq3-client-cgame-marks-ml-16358728"></a>
### alphaFade

```ml
alphaFade
```

True when the mark fades its alpha channel instead of its RGB components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L55)

<a id="field-field-mq3-client-cgame-marks-mark-color-color-src-mq3-client-cgame-marks-ml-408513092"></a>
### color

```ml
color
```

Base RGBA tint retained for fading this persistent surface mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L59)

<a id="field-field-mq3-client-cgame-marks-mark-id-id-src-mq3-client-cgame-marks-ml-1156251322"></a>
### id

```ml
id
```

Stable effect identifier used to track or replace this projectile, particle, or mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L49)

<a id="field-field-mq3-client-cgame-marks-mark-shader-shader-src-mq3-client-cgame-marks-ml-1128186126"></a>
### shader

```ml
shader
```

Material retained for rendering and fading this clipped persistent surface mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L57)

<a id="field-field-mq3-client-cgame-marks-mark-time-time-src-mq3-client-cgame-marks-ml-1245758794"></a>
### time

```ml
time
```

Client timestamp used as the creation or update reference for this temporary visual effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L53)

<a id="field-field-mq3-client-cgame-marks-mark-verts-verts-src-mq3-client-cgame-marks-ml-787544996"></a>
### verts

```ml
verts
```

Vertex records forming the polygon or rendered geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L61)
