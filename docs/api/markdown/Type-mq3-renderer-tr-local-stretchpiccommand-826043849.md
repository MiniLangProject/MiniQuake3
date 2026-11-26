# `mq3.renderer.tr_local.StretchPicCommand`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-local-ml-841068495.md)

<a id="struct-struct-mq3-renderer-tr-local-stretchpiccommand-struct-stretchpiccommand-src-mq3-renderer-tr-local-ml-1983130793"></a>
## StretchPicCommand

```ml
struct StretchPicCommand
```

Data record for `mq3.renderer.tr_local.StretchPicCommand`; groups `commandId`, `shader`, `x`, `y`, `w`, `h`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L143)

## Members

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-commandid-commandid-src-mq3-renderer-tr-local-ml-1909744445"></a>
### commandId

```ml
commandId
```

Renderer command identifier selecting the backend operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L145)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-h-h-src-mq3-renderer-tr-local-ml-2060713609"></a>
### h

```ml
h
```

Height of the textured drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L155)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-s1-s1-src-mq3-renderer-tr-local-ml-1930684761"></a>
### s1

```ml
s1
```

Horizontal normalized texture coordinate of the first corner of the textured rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L157)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-s2-s2-src-mq3-renderer-tr-local-ml-251286643"></a>
### s2

```ml
s2
```

Horizontal normalized texture coordinate of the second corner of the textured rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L161)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-shader-shader-src-mq3-renderer-tr-local-ml-1545101899"></a>
### shader

```ml
shader
```

Resolved shader record or handle used for this drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L147)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-t1-t1-src-mq3-renderer-tr-local-ml-1512917927"></a>
### t1

```ml
t1
```

Vertical normalized texture coordinate of the first corner of the textured rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L159)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-t2-t2-src-mq3-renderer-tr-local-ml-1653909337"></a>
### t2

```ml
t2
```

Vertical normalized texture coordinate of the second corner of the textured rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L163)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-w-w-src-mq3-renderer-tr-local-ml-429114109"></a>
### w

```ml
w
```

Width of the textured drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L153)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-x-x-src-mq3-renderer-tr-local-ml-311016745"></a>
### x

```ml
x
```

Horizontal position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L149)

<a id="field-field-mq3-renderer-tr-local-stretchpiccommand-y-y-src-mq3-renderer-tr-local-ml-1220229325"></a>
### y

```ml
y
```

Vertical position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L151)
