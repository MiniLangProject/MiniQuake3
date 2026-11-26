# `mq3.client.ui_mfield.MenuField`

[Home](README.md) · [Source file](File-src-mq3-client-ui-mfield-ml-1722706615.md)

<a id="struct-struct-mq3-client-ui-mfield-menufield-struct-menufield-src-mq3-client-ui-mfield-ml-243140907"></a>
## MenuField

```ml
struct MenuField
```

Stores UI mfield menu field record, including `field`, `name`, `flags`, `x`, `y`, `left` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L79)

## Members

<a id="field-field-mq3-client-ui-mfield-menufield-bottom-bottom-src-mq3-client-ui-mfield-ml-1539700084"></a>
### bottom

```ml
bottom
```

Bottom boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L98)

<a id="field-field-mq3-client-ui-mfield-menufield-field-field-src-mq3-client-ui-mfield-ml-497026194"></a>
### field

```ml
field
```

Compatibility member corresponding to native `menufield_s.field`; the original declaration is `mfield_t field`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L82)

<a id="field-field-mq3-client-ui-mfield-menufield-flags-flags-src-mq3-client-ui-mfield-ml-2055020710"></a>
### flags

```ml
flags
```

Menu-item flags selecting the field's font, focus style, and interaction behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L86)

<a id="field-field-mq3-client-ui-mfield-menufield-left-left-src-mq3-client-ui-mfield-ml-1177469868"></a>
### left

```ml
left
```

Left boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L92)

<a id="field-field-mq3-client-ui-mfield-menufield-menuposition-menuposition-src-mq3-client-ui-mfield-ml-1547984942"></a>
### menuPosition

```ml
menuPosition
```

Index of this item within its owning menu's item list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L100)

<a id="field-field-mq3-client-ui-mfield-menufield-name-name-src-mq3-client-ui-mfield-ml-1397396584"></a>
### name

```ml
name
```

Label drawn immediately to the left of the editable menu field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L84)

<a id="field-field-mq3-client-ui-mfield-menufield-parentcursor-parentcursor-src-mq3-client-ui-mfield-ml-1586965630"></a>
### parentCursor

```ml
parentCursor
```

Currently focused item index in the parent menu, compared with this field's menu position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L102)

<a id="field-field-mq3-client-ui-mfield-menufield-right-right-src-mq3-client-ui-mfield-ml-46507534"></a>
### right

```ml
right
```

Right boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L96)

<a id="field-field-mq3-client-ui-mfield-menufield-top-top-src-mq3-client-ui-mfield-ml-1568119278"></a>
### top

```ml
top
```

Top boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L94)

<a id="field-field-mq3-client-ui-mfield-menufield-x-x-src-mq3-client-ui-mfield-ml-1346119766"></a>
### x

```ml
x
```

Horizontal coordinate of the editable text-field widget in the virtual menu layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L88)

<a id="field-field-mq3-client-ui-mfield-menufield-y-y-src-mq3-client-ui-mfield-ml-230570930"></a>
### y

```ml
y
```

Vertical coordinate of the editable text-field widget in the virtual menu layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L90)
