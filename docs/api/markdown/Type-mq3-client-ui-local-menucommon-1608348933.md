# `mq3.client.ui_local.MenuCommon`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-menucommon-struct-menucommon-src-mq3-client-ui-local-ml-1476200519"></a>
## MenuCommon

```ml
struct MenuCommon
```

Stores UI local menu common record, including `type`, `name`, `id`, `x`, `y`, `left` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L139)

## Members

<a id="field-field-mq3-client-ui-local-menucommon-bottom-bottom-src-mq3-client-ui-local-ml-1302141055"></a>
### bottom

```ml
bottom
```

Bottom boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L160)

<a id="field-field-mq3-client-ui-local-menucommon-callback-callback-src-mq3-client-ui-local-ml-1424592171"></a>
### callback

```ml
callback
```

Compatibility member corresponding to native `menucommon_s.callback`; the original declaration is `void (*callback)( void *self, int event )`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L170)

<a id="field-field-mq3-client-ui-local-menucommon-flags-flags-src-mq3-client-ui-local-ml-991695541"></a>
### flags

```ml
flags
```

Compatibility member corresponding to native `menucommon_s.flags`; the original declaration is `unsigned flags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L167)

<a id="field-field-mq3-client-ui-local-menucommon-id-id-src-mq3-client-ui-local-ml-1266492351"></a>
### id

```ml
id
```

Event-routing identifier of this selectable control in the original UI compatibility records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L146)

<a id="field-field-mq3-client-ui-local-menucommon-left-left-src-mq3-client-ui-local-ml-1162800431"></a>
### left

```ml
left
```

Left boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L154)

<a id="field-field-mq3-client-ui-local-menucommon-menuposition-menuposition-src-mq3-client-ui-local-ml-642918653"></a>
### menuPosition

```ml
menuPosition
```

Index of this item within its owning menu's item list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L164)

<a id="field-field-mq3-client-ui-local-menucommon-name-name-src-mq3-client-ui-local-ml-884933403"></a>
### name

```ml
name
```

Menu item label or bitmap resource name interpreted according to the common item's type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L144)

<a id="field-field-mq3-client-ui-local-menucommon-ownerdraw-ownerdraw-src-mq3-client-ui-local-ml-450579833"></a>
### ownerdraw

```ml
ownerdraw
```

Compatibility member corresponding to native `menucommon_s.ownerdraw`; the original declaration is `void (*ownerdraw)( void *self )`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L175)

<a id="field-field-mq3-client-ui-local-menucommon-parent-parent-src-mq3-client-ui-local-ml-1888086269"></a>
### parent

```ml
parent
```

Owning menu or container used to route this item's events and layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L162)

<a id="field-field-mq3-client-ui-local-menucommon-right-right-src-mq3-client-ui-local-ml-1074723781"></a>
### right

```ml
right
```

Right boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L158)

<a id="field-field-mq3-client-ui-local-menucommon-statusbar-statusbar-src-mq3-client-ui-local-ml-1831877797"></a>
### statusbar

```ml
statusbar
```

Optional callback used to draw the item's status-bar help or contextual information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L172)

<a id="field-field-mq3-client-ui-local-menucommon-top-top-src-mq3-client-ui-local-ml-1071372013"></a>
### top

```ml
top
```

Top boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L156)

<a id="field-field-mq3-client-ui-local-menucommon-type-type-src-mq3-client-ui-local-ml-143361661"></a>
### type

```ml
type
```

Compatibility member corresponding to native `menucommon_s.type`; the original declaration is `int type`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L142)

<a id="field-field-mq3-client-ui-local-menucommon-x-x-src-mq3-client-ui-local-ml-1819301869"></a>
### x

```ml
x
```

Horizontal position of this menu control in the virtual layout used by the original UI compatibility records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L149)

<a id="field-field-mq3-client-ui-local-menucommon-y-y-src-mq3-client-ui-local-ml-920715289"></a>
### y

```ml
y
```

Vertical position of this menu control in the virtual layout used by the original UI compatibility records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L152)
