# `mq3.client.ui_mfield.DrawResult`

[Home](README.md) · [Source file](File-src-mq3-client-ui-mfield-ml-1722706615.md)

<a id="struct-struct-mq3-client-ui-mfield-drawresult-struct-drawresult-src-mq3-client-ui-mfield-ml-2041803783"></a>
## DrawResult

```ml
struct DrawResult
```

Stores UI mfield draw result record, including `text`, `x`, `y`, `style`, `cursorX`, `cursorChar` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L59)

## Members

<a id="field-field-mq3-client-ui-mfield-drawresult-actions-actions-src-mq3-client-ui-mfield-ml-4513298"></a>
### actions

```ml
actions
```

Host requests queued while editing a text field and drawing its visible text and cursor, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L76)

<a id="field-field-mq3-client-ui-mfield-drawresult-charwidth-charwidth-src-mq3-client-ui-mfield-ml-444642586"></a>
### charWidth

```ml
charWidth
```

When constructing this record, `MField_Draw` supplies `charWidth` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L73)

<a id="field-field-mq3-client-ui-mfield-drawresult-cursorchar-cursorchar-src-mq3-client-ui-mfield-ml-147937222"></a>
### cursorChar

```ml
cursorChar
```

When constructing this record, `MField_Draw` supplies `cursorChar` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L71)

<a id="field-field-mq3-client-ui-mfield-drawresult-cursorx-cursorx-src-mq3-client-ui-mfield-ml-1943374222"></a>
### cursorX

```ml
cursorX
```

Horizontal position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L69)

<a id="field-field-mq3-client-ui-mfield-drawresult-style-style-src-mq3-client-ui-mfield-ml-930435890"></a>
### style

```ml
style
```

UI drawing-style flags controlling alignment, font selection, and text emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L67)

<a id="field-field-mq3-client-ui-mfield-drawresult-text-text-src-mq3-client-ui-mfield-ml-1442831088"></a>
### text

```ml
text
```

Visible substring of the menu edit field after horizontal scrolling and width clipping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L61)

<a id="field-field-mq3-client-ui-mfield-drawresult-x-x-src-mq3-client-ui-mfield-ml-650406374"></a>
### x

```ml
x
```

Horizontal coordinate of the visible text returned by the menu text-field renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L63)

<a id="field-field-mq3-client-ui-mfield-drawresult-y-y-src-mq3-client-ui-mfield-ml-1901745410"></a>
### y

```ml
y
```

Vertical coordinate of the visible text returned by the menu text-field renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_mfield.ml#L65)
