# `mq3.client.playable_viewmodel.FrameSample`

[Home](README.md) · [Source file](File-src-mq3-client-playable-viewmodel-ml-1609227520.md)

<a id="struct-struct-mq3-client-playable-viewmodel-framesample-struct-framesample-src-mq3-client-playable-viewmodel-ml-879597929"></a>
## FrameSample

```ml
struct FrameSample
```

Stores playable viewmodel frame sample record, including `classname`, `oldFrame`, `frame`, `backlerp`, `switching`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L114)

## Members

<a id="field-field-mq3-client-playable-viewmodel-framesample-backlerp-backlerp-src-mq3-client-playable-viewmodel-ml-173482264"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the submitted model entity presented by first-person weapon animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L123)

<a id="field-field-mq3-client-playable-viewmodel-framesample-classname-classname-src-mq3-client-playable-viewmodel-ml-1866230184"></a>
### classname

```ml
classname
```

Weapon classname identifying the model whose animation frames were sampled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L116)

<a id="field-field-mq3-client-playable-viewmodel-framesample-frame-frame-src-mq3-client-playable-viewmodel-ml-1363116400"></a>
### frame

```ml
frame
```

Current weapon-model animation frame selected for interpolation with oldFrame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L120)

<a id="field-field-mq3-client-playable-viewmodel-framesample-oldframe-oldframe-src-mq3-client-playable-viewmodel-ml-263449204"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L118)

<a id="field-field-mq3-client-playable-viewmodel-framesample-switching-switching-src-mq3-client-playable-viewmodel-ml-359028552"></a>
### switching

```ml
switching
```

When constructing this record, `animatedFrames` supplies `switching` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L125)
