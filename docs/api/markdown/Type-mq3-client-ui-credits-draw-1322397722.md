# `mq3.client.ui_credits.Draw`

[Home](README.md) · [Source file](File-src-mq3-client-ui-credits-ml-1753415280.md)

<a id="struct-struct-mq3-client-ui-credits-draw-struct-draw-src-mq3-client-ui-credits-ml-1501891177"></a>
## Draw

```ml
struct Draw
```

Stores UI credits draw record, including `text`, `x`, `y`, `style`, `color`, `proportional`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L21)

## Members

<a id="field-field-mq3-client-ui-credits-draw-color-color-src-mq3-client-ui-credits-ml-1001883703"></a>
### color

```ml
color
```

RGBA text color assigned to this centered credits-screen row.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L31)

<a id="field-field-mq3-client-ui-credits-draw-proportional-proportional-src-mq3-client-ui-credits-ml-1884300829"></a>
### proportional

```ml
proportional
```

When constructing this record, `row` supplies `proportional` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L33)

<a id="field-field-mq3-client-ui-credits-draw-style-style-src-mq3-client-ui-credits-ml-568745871"></a>
### style

```ml
style
```

UI drawing-style flags controlling alignment, font selection, and text emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L29)

<a id="field-field-mq3-client-ui-credits-draw-text-text-src-mq3-client-ui-credits-ml-35579073"></a>
### text

```ml
text
```

One line of credit text drawn with its configured alignment, color, and font style.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L23)

<a id="field-field-mq3-client-ui-credits-draw-x-x-src-mq3-client-ui-credits-ml-202441643"></a>
### x

```ml
x
```

Horizontal coordinate of a credits text row in the virtual menu layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L25)

<a id="field-field-mq3-client-ui-credits-draw-y-y-src-mq3-client-ui-credits-ml-1312597407"></a>
### y

```ml
y
```

Vertical coordinate of a credits text row in the virtual menu layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L27)
