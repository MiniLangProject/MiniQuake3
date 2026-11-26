# `mq3.client.qvm_menu_app.ScreenPoint`

[Home](README.md) · [Source file](File-src-mq3-client-qvm-menu-app-ml-631606489.md)

<a id="struct-struct-mq3-client-qvm-menu-app-screenpoint-struct-screenpoint-src-mq3-client-qvm-menu-app-ml-1719214421"></a>
## ScreenPoint

```ml
struct ScreenPoint
```

Stores QVM menu app screen point record, including `x`, `y`, `depth`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L43)

## Members

<a id="field-field-mq3-client-qvm-menu-app-screenpoint-depth-depth-src-mq3-client-qvm-menu-app-ml-1944324887"></a>
### depth

```ml
depth
```

When constructing this record, `runCinematic` supplies `depth` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L51)

<a id="field-field-mq3-client-qvm-menu-app-screenpoint-x-x-src-mq3-client-qvm-menu-app-ml-881480727"></a>
### x

```ml
x
```

Horizontal coordinate of a textured quad vertex in the standalone QVM menu viewer's output coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L46)

<a id="field-field-mq3-client-qvm-menu-app-screenpoint-y-y-src-mq3-client-qvm-menu-app-ml-890935803"></a>
### y

```ml
y
```

Vertical coordinate of a textured quad vertex in the standalone QVM menu viewer's output coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L49)
