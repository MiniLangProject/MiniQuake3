# `mq3.client.ui_local.MenuBitmap`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-menubitmap-struct-menubitmap-src-mq3-client-ui-local-ml-1509624727"></a>
## MenuBitmap

```ml
struct MenuBitmap
```

Stores UI local menu bitmap record, including `generic`, `focuspic`, `errorpic`, `shader`, `focusshader`, `width` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L260)

## Members

<a id="field-field-mq3-client-ui-local-menubitmap-errorpic-errorpic-src-mq3-client-ui-local-ml-275917271"></a>
### errorpic

```ml
errorpic
```

Fallback image asset used when the menu bitmap's requested image cannot be loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L267)

<a id="field-field-mq3-client-ui-local-menubitmap-focuscolor-focuscolor-src-mq3-client-ui-local-ml-1810672381"></a>
### focuscolor

```ml
focuscolor
```

Compatibility member corresponding to native `menubitmap_s.focuscolor`; the original declaration is `float* focuscolor`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L278)

<a id="field-field-mq3-client-ui-local-menubitmap-focuspic-focuspic-src-mq3-client-ui-local-ml-930364311"></a>
### focuspic

```ml
focuspic
```

Compatibility member corresponding to native `menubitmap_s.focuspic`; the original declaration is `char* focuspic`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L265)

<a id="field-field-mq3-client-ui-local-menubitmap-focusshader-focusshader-src-mq3-client-ui-local-ml-1321744103"></a>
### focusshader

```ml
focusshader
```

Renderer resource handle used for focusshader; mirrors native `menubitmap_s.focusshader`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L271)

<a id="field-field-mq3-client-ui-local-menubitmap-generic-generic-src-mq3-client-ui-local-ml-71804559"></a>
### generic

```ml
generic
```

Common menu-item record containing the shared identity, layout, and callback data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L262)

<a id="field-field-mq3-client-ui-local-menubitmap-height-height-src-mq3-client-ui-local-ml-123992945"></a>
### height

```ml
height
```

Bitmap drawing height in the native-compatible menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L275)

<a id="field-field-mq3-client-ui-local-menubitmap-shader-shader-src-mq3-client-ui-local-ml-1397268645"></a>
### shader

```ml
shader
```

Cached renderer material handle for the normal bitmap image, separate from the focus-image handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L269)

<a id="field-field-mq3-client-ui-local-menubitmap-width-width-src-mq3-client-ui-local-ml-218795227"></a>
### width

```ml
width
```

Bitmap drawing width in the native-compatible menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L273)
