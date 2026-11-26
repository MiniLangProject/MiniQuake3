# `mq3.client.ui_qmenu.Item`

[Home](README.md) · [Source file](File-src-mq3-client-ui-qmenu-ml-201905758.md)

<a id="struct-struct-mq3-client-ui-qmenu-item-struct-item-src-mq3-client-ui-qmenu-ml-1337145049"></a>
## Item

```ml
struct Item
```

Stores UI qmenu menu item, including `type`, `name`, `id`, `x`, `y`, `left` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L239)

## Members

<a id="field-field-mq3-client-ui-qmenu-item-bottom-bottom-src-mq3-client-ui-qmenu-ml-1434774"></a>
### bottom

```ml
bottom
```

Bottom boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L259)

<a id="field-field-mq3-client-ui-qmenu-item-buffer-buffer-src-mq3-client-ui-qmenu-ml-1490403044"></a>
### buffer

```ml
buffer
```

When constructing this record, `item` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L317)

<a id="field-field-mq3-client-ui-qmenu-item-callback-callback-src-mq3-client-ui-qmenu-ml-421189402"></a>
### callback

```ml
callback
```

When constructing this record, `item` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L265)

<a id="field-field-mq3-client-ui-qmenu-item-color-color-src-mq3-client-ui-qmenu-ml-698772340"></a>
### color

```ml
color
```

Base RGBA item color used before disabled, focused, or pulsing menu styling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L275)

<a id="field-field-mq3-client-ui-qmenu-item-columns-columns-src-mq3-client-ui-qmenu-ml-60915148"></a>
### columns

```ml
columns
```

Column descriptors used to lay out a listbox's displayed data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L307)

<a id="field-field-mq3-client-ui-qmenu-item-curvalue-curvalue-src-mq3-client-ui-qmenu-ml-1173175174"></a>
### curvalue

```ml
curvalue
```

When constructing this record, `item` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L295)

<a id="field-field-mq3-client-ui-qmenu-item-errorpic-errorpic-src-mq3-client-ui-qmenu-ml-1860087944"></a>
### errorpic

```ml
errorpic
```

Fallback image asset used when the menu bitmap's requested image cannot be loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L279)

<a id="field-field-mq3-client-ui-qmenu-item-events-events-src-mq3-client-ui-qmenu-ml-36272194"></a>
### events

```ml
events
```

When constructing this record, `item` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L321)

<a id="field-field-mq3-client-ui-qmenu-item-fieldcursor-fieldcursor-src-mq3-client-ui-qmenu-ml-1308454728"></a>
### fieldCursor

```ml
fieldCursor
```

When constructing this record, `item` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L311)

<a id="field-field-mq3-client-ui-qmenu-item-fieldscroll-fieldscroll-src-mq3-client-ui-qmenu-ml-1572151524"></a>
### fieldScroll

```ml
fieldScroll
```

Character offset used to scroll the editable field's visible text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L313)

<a id="field-field-mq3-client-ui-qmenu-item-flags-flags-src-mq3-client-ui-qmenu-ml-32130664"></a>
### flags

```ml
flags
```

When constructing this record, `item` supplies `flags` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L263)

<a id="field-field-mq3-client-ui-qmenu-item-focuscolor-focuscolor-src-mq3-client-ui-qmenu-ml-177102722"></a>
### focuscolor

```ml
focuscolor
```

When constructing this record, `item` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L289)

<a id="field-field-mq3-client-ui-qmenu-item-focuspic-focuspic-src-mq3-client-ui-qmenu-ml-518277184"></a>
### focuspic

```ml
focuspic
```

When constructing this record, `item` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L277)

<a id="field-field-mq3-client-ui-qmenu-item-focusshader-focusshader-src-mq3-client-ui-qmenu-ml-200101480"></a>
### focusshader

```ml
focusshader
```

When constructing this record, `item` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L283)

<a id="field-field-mq3-client-ui-qmenu-item-height-height-src-mq3-client-ui-qmenu-ml-1748101382"></a>
### height

```ml
height
```

Bitmap height in UI units, or visible row count per column for a scrolling-list item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L287)

<a id="field-field-mq3-client-ui-qmenu-item-id-id-src-mq3-client-ui-qmenu-ml-1126119814"></a>
### id

```ml
id
```

Event-routing identifier of this selectable control in the shared base-game menu-widget toolkit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L245)

<a id="field-field-mq3-client-ui-qmenu-item-itemnames-itemnames-src-mq3-client-ui-qmenu-ml-704867648"></a>
### itemnames

```ml
itemnames
```

When constructing this record, `item` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L305)

<a id="field-field-mq3-client-ui-qmenu-item-left-left-src-mq3-client-ui-qmenu-ml-145299110"></a>
### left

```ml
left
```

Left boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L253)

<a id="field-field-mq3-client-ui-qmenu-item-listtop-listtop-src-mq3-client-ui-qmenu-ml-162791088"></a>
### listTop

```ml
listTop
```

When constructing this record, `item` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L303)

<a id="field-field-mq3-client-ui-qmenu-item-maxchars-maxchars-src-mq3-client-ui-qmenu-ml-2106503682"></a>
### maxchars

```ml
maxchars
```

When constructing this record, `item` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L319)

<a id="field-field-mq3-client-ui-qmenu-item-maxvalue-maxvalue-src-mq3-client-ui-qmenu-ml-1379930910"></a>
### maxvalue

```ml
maxvalue
```

When constructing this record, `item` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L293)

<a id="field-field-mq3-client-ui-qmenu-item-menuposition-menuposition-src-mq3-client-ui-qmenu-ml-899900528"></a>
### menuPosition

```ml
menuPosition
```

Index of this item within its owning menu's item list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L261)

<a id="field-field-mq3-client-ui-qmenu-item-minvalue-minvalue-src-mq3-client-ui-qmenu-ml-847451530"></a>
### minvalue

```ml
minvalue
```

When constructing this record, `item` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L291)

<a id="field-field-mq3-client-ui-qmenu-item-name-name-src-mq3-client-ui-qmenu-ml-1653580810"></a>
### name

```ml
name
```

Item label or bitmap asset path selected by the menu widget's type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L243)

<a id="field-field-mq3-client-ui-qmenu-item-numitems-numitems-src-mq3-client-ui-qmenu-ml-1218664160"></a>
### numitems

```ml
numitems
```

Number of entries currently present in the menu or selection list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L301)

<a id="field-field-mq3-client-ui-qmenu-item-oldvalue-oldvalue-src-mq3-client-ui-qmenu-ml-2050077884"></a>
### oldvalue

```ml
oldvalue
```

When constructing this record, `item` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L299)

<a id="field-field-mq3-client-ui-qmenu-item-ownerdraw-ownerdraw-src-mq3-client-ui-qmenu-ml-1887598164"></a>
### ownerdraw

```ml
ownerdraw
```

When constructing this record, `item` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L269)

<a id="field-field-mq3-client-ui-qmenu-item-range-range-src-mq3-client-ui-qmenu-ml-60200456"></a>
### range

```ml
range
```

When constructing this record, `item` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L297)

<a id="field-field-mq3-client-ui-qmenu-item-right-right-src-mq3-client-ui-qmenu-ml-1533863800"></a>
### right

```ml
right
```

Right boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L257)

<a id="field-field-mq3-client-ui-qmenu-item-separation-separation-src-mq3-client-ui-qmenu-ml-120059760"></a>
### separation

```ml
separation
```

When constructing this record, `item` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L309)

<a id="field-field-mq3-client-ui-qmenu-item-shader-shader-src-mq3-client-ui-qmenu-ml-1268687122"></a>
### shader

```ml
shader
```

Normal bitmap material cache slot, reset to zero when the menu bitmap is initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L281)

<a id="field-field-mq3-client-ui-qmenu-item-statusbar-statusbar-src-mq3-client-ui-qmenu-ml-1947532632"></a>
### statusbar

```ml
statusbar
```

When constructing this record, `item` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L267)

<a id="field-field-mq3-client-ui-qmenu-item-string-string-src-mq3-client-ui-qmenu-ml-1928544298"></a>
### string

```ml
string
```

When constructing this record, `item` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L271)

<a id="field-field-mq3-client-ui-qmenu-item-style-style-src-mq3-client-ui-qmenu-ml-1003779828"></a>
### style

```ml
style
```

UI drawing-style flags controlling alignment, font selection, and text emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L273)

<a id="field-field-mq3-client-ui-qmenu-item-top-top-src-mq3-client-ui-qmenu-ml-488873280"></a>
### top

```ml
top
```

Top boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L255)

<a id="field-field-mq3-client-ui-qmenu-item-type-type-src-mq3-client-ui-qmenu-ml-1986096240"></a>
### type

```ml
type
```

UI item kind selecting its type-specific behavior and payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L241)

<a id="field-field-mq3-client-ui-qmenu-item-width-width-src-mq3-client-ui-qmenu-ml-1639339532"></a>
### width

```ml
width
```

Bitmap width in UI units, or character-cell column width for a scrolling-list item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L285)

<a id="field-field-mq3-client-ui-qmenu-item-widthinchars-widthinchars-src-mq3-client-ui-qmenu-ml-1368781712"></a>
### widthInChars

```ml
widthInChars
```

Number of character columns visible in the editable text or console field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L315)

<a id="field-field-mq3-client-ui-qmenu-item-x-x-src-mq3-client-ui-qmenu-ml-1069048960"></a>
### x

```ml
x
```

Horizontal position of this menu control in the virtual layout used by the shared base-game menu-widget toolkit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L248)

<a id="field-field-mq3-client-ui-qmenu-item-y-y-src-mq3-client-ui-qmenu-ml-399476964"></a>
### y

```ml
y
```

Vertical position of this menu control in the virtual layout used by the shared base-game menu-widget toolkit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_qmenu.ml#L251)
