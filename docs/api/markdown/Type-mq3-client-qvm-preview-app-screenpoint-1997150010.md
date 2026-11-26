# `mq3.client.qvm_preview_app.ScreenPoint`

[Home](README.md) · [Source file](File-src-mq3-client-qvm-preview-app-ml-1410259322.md)

<a id="struct-struct-mq3-client-qvm-preview-app-screenpoint-struct-screenpoint-src-mq3-client-qvm-preview-app-ml-795046921"></a>
## ScreenPoint

```ml
struct ScreenPoint
```

Stores QVM preview app screen point record, including `x`, `y`, `depth`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L138)

## Members

<a id="field-field-mq3-client-qvm-preview-app-screenpoint-depth-depth-src-mq3-client-qvm-preview-app-ml-810510063"></a>
### depth

```ml
depth
```

When constructing this record, `drawCinematics` supplies `depth` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L144)

<a id="field-field-mq3-client-qvm-preview-app-screenpoint-x-x-src-mq3-client-qvm-preview-app-ml-1829869343"></a>
### x

```ml
x
```

Horizontal coordinate of a textured quad vertex in the QVM gameplay preview's output coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L140)

<a id="field-field-mq3-client-qvm-preview-app-screenpoint-y-y-src-mq3-client-qvm-preview-app-ml-1150620787"></a>
### y

```ml
y
```

Vertical coordinate of a textured quad vertex in the QVM gameplay preview's output coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_preview_app.ml#L142)
