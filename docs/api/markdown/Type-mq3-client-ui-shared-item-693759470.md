# `mq3.client.ui_shared.Item`

[Home](README.md) · [Source file](File-src-mq3-client-ui-shared-ml-1094733975.md)

<a id="struct-struct-mq3-client-ui-shared-item-struct-item-src-mq3-client-ui-shared-ml-1663762491"></a>
## Item

```ml
struct Item
```

Stores UI shared menu item, including `window`, `parent`, `text`, `textRect`, `type`, `alignment` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L297)

## Members

<a id="field-field-mq3-client-ui-shared-item-action-action-src-mq3-client-ui-shared-ml-1904196106"></a>
### action

```ml
action
```

Script executed when the menu item is activated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L321)

<a id="field-field-mq3-client-ui-shared-item-alignment-alignment-src-mq3-client-ui-shared-ml-1198223086"></a>
### alignment

```ml
alignment
```

Horizontal alignment mode for the item within its layout region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L309)

<a id="field-field-mq3-client-ui-shared-item-colorranges-colorranges-src-mq3-client-ui-shared-ml-664787474"></a>
### colorRanges

```ml
colorRanges
```

Value ranges selecting conditional colors for the displayed item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L355)

<a id="field-field-mq3-client-ui-shared-item-cvar-cvar-src-mq3-client-ui-shared-ml-934698202"></a>
### cvar

```ml
cvar
```

Configuration-variable name bound to this UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L323)

<a id="field-field-mq3-client-ui-shared-item-cvarflags-cvarflags-src-mq3-client-ui-shared-ml-1871047222"></a>
### cvarFlags

```ml
cvarFlags
```

Flags selecting whether a cvar condition enables, disables, shows, or hides the item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L329)

<a id="field-field-mq3-client-ui-shared-item-cvartest-cvartest-src-mq3-client-ui-shared-ml-120182658"></a>
### cvarTest

```ml
cvarTest
```

Configuration-variable name consulted by the control's enable or visibility test.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L325)

<a id="field-field-mq3-client-ui-shared-item-enablecvar-enablecvar-src-mq3-client-ui-shared-ml-1295504884"></a>
### enableCvar

```ml
enableCvar
```

Accepted configuration-variable values used by the enable or visibility expression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L327)

<a id="field-field-mq3-client-ui-shared-item-focussound-focussound-src-mq3-client-ui-shared-ml-1912961960"></a>
### focusSound

```ml
focusSound
```

Sound resource selected for the focus event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L339)

<a id="field-field-mq3-client-ui-shared-item-leavefocus-leavefocus-src-mq3-client-ui-shared-ml-2030819036"></a>
### leaveFocus

```ml
leaveFocus
```

Script executed when the UI item loses keyboard focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L343)

<a id="field-field-mq3-client-ui-shared-item-mouseenter-mouseenter-src-mq3-client-ui-shared-ml-158252068"></a>
### mouseEnter

```ml
mouseEnter
```

Script executed when the pointer enters the item's rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L345)

<a id="field-field-mq3-client-ui-shared-item-mouseentertext-mouseentertext-src-mq3-client-ui-shared-ml-311655326"></a>
### mouseEnterText

```ml
mouseEnterText
```

Script executed when the pointer enters the item's text rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L349)

<a id="field-field-mq3-client-ui-shared-item-mouseexit-mouseexit-src-mq3-client-ui-shared-ml-315233206"></a>
### mouseExit

```ml
mouseExit
```

Script executed when the pointer leaves the item's rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L347)

<a id="field-field-mq3-client-ui-shared-item-mouseexittext-mouseexittext-src-mq3-client-ui-shared-ml-1921637034"></a>
### mouseExitText

```ml
mouseExitText
```

Script executed when the pointer leaves the item's text rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L351)

<a id="field-field-mq3-client-ui-shared-item-onfocus-onfocus-src-mq3-client-ui-shared-ml-1444325014"></a>
### onFocus

```ml
onFocus
```

Script executed when the UI item acquires keyboard focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L341)

<a id="field-field-mq3-client-ui-shared-item-ownerdraw-ownerdraw-src-mq3-client-ui-shared-ml-1234167278"></a>
### ownerDraw

```ml
ownerDraw
```

Owner-draw identifier selecting the specialized renderer for the UI element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L335)

<a id="field-field-mq3-client-ui-shared-item-ownerdrawflags-ownerdrawflags-src-mq3-client-ui-shared-ml-2026226810"></a>
### ownerDrawFlags

```ml
ownerDrawFlags
```

Visibility and presentation flags evaluated by the owner-draw renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L337)

<a id="field-field-mq3-client-ui-shared-item-parent-parent-src-mq3-client-ui-shared-ml-73864302"></a>
### parent

```ml
parent
```

Owning menu or container used to route this item's events and layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L301)

<a id="field-field-mq3-client-ui-shared-item-properties-properties-src-mq3-client-ui-shared-ml-1109385388"></a>
### properties

```ml
properties
```

Parsed property entries retained for type-specific menu behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L353)

<a id="field-field-mq3-client-ui-shared-item-special-special-src-mq3-client-ui-shared-ml-1597956674"></a>
### special

```ml
special
```

Additional numeric parameter interpreted by the selected item or owner-draw type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L333)

<a id="field-field-mq3-client-ui-shared-item-text-text-src-mq3-client-ui-shared-ml-257419592"></a>
### text

```ml
text
```

Display text painted by this menu item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L303)

<a id="field-field-mq3-client-ui-shared-item-textalignment-textalignment-src-mq3-client-ui-shared-ml-7849814"></a>
### textalignment

```ml
textalignment
```

Horizontal alignment mode for text within the item's text rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L311)

<a id="field-field-mq3-client-ui-shared-item-textalignx-textalignx-src-mq3-client-ui-shared-ml-528773270"></a>
### textalignx

```ml
textalignx
```

Horizontal offset applied when positioning the item's text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L313)

<a id="field-field-mq3-client-ui-shared-item-textaligny-textaligny-src-mq3-client-ui-shared-ml-1596699988"></a>
### textaligny

```ml
textaligny
```

Vertical offset applied when positioning the item's text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L315)

<a id="field-field-mq3-client-ui-shared-item-textrect-textrect-src-mq3-client-ui-shared-ml-519559504"></a>
### textRect

```ml
textRect
```

Rectangle occupied by the laid-out text within the UI item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L305)

<a id="field-field-mq3-client-ui-shared-item-textscale-textscale-src-mq3-client-ui-shared-ml-1485127218"></a>
### textscale

```ml
textscale
```

Scale factor applied to the UI text font metrics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L317)

<a id="field-field-mq3-client-ui-shared-item-textstyle-textstyle-src-mq3-client-ui-shared-ml-1845143094"></a>
### textStyle

```ml
textStyle
```

Text-rendering style selecting effects such as shadows or blinking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L319)

<a id="field-field-mq3-client-ui-shared-item-type-type-src-mq3-client-ui-shared-ml-2075067582"></a>
### type

```ml
type
```

UI item kind selecting its type-specific behavior and payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L307)

<a id="field-field-mq3-client-ui-shared-item-typedata-typedata-src-mq3-client-ui-shared-ml-1886150518"></a>
### typeData

```ml
typeData
```

Type-specific payload for the edit, slider, listbox, model, or other UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L331)

<a id="field-field-mq3-client-ui-shared-item-window-window-src-mq3-client-ui-shared-ml-1563233870"></a>
### window

```ml
window
```

When constructing this record, `item` supplies `window()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L299)
