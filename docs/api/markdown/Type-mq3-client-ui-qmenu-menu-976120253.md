# `mq3.client.ui_qmenu.Menu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-qmenu-ml-201905758.md)

<a id="struct-struct-mq3-client-ui-qmenu-menu-struct-menu-src-mq3-client-ui-qmenu-ml-394995485"></a>
## Menu

```ml
struct Menu
```

Stores UI qmenu menu, including `cursor`, `cursor_prev`, `items`, `wrapAround`, `fullscreen`, `showlogo` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L217)

## Members

<a id="field-field-mq3-client-ui-qmenu-menu-commands-commands-src-mq3-client-ui-qmenu-ml-1428094980"></a>
### commands

```ml
commands
```

When constructing this record, `menu` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L236)

<a id="field-field-mq3-client-ui-qmenu-menu-cursor-cursor-src-mq3-client-ui-qmenu-ml-1586726560"></a>
### cursor

```ml
cursor
```

When constructing this record, `menu` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L219)

<a id="field-field-mq3-client-ui-qmenu-menu-cursor-prev-cursor-prev-src-mq3-client-ui-qmenu-ml-887612736"></a>
### cursor_prev

```ml
cursor_prev
```

When constructing this record, `menu` supplies `-1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L221)

<a id="field-field-mq3-client-ui-qmenu-menu-debug-debug-src-mq3-client-ui-qmenu-ml-779547052"></a>
### debug

```ml
debug
```

When constructing this record, `menu` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L234)

<a id="field-field-mq3-client-ui-qmenu-menu-fullscreen-fullscreen-src-mq3-client-ui-qmenu-ml-1028047550"></a>
### fullscreen

```ml
fullscreen
```

Whether the active menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L228)

<a id="field-field-mq3-client-ui-qmenu-menu-items-items-src-mq3-client-ui-qmenu-ml-541454412"></a>
### items

```ml
items
```

Ordered child items participating in this menu's rendering and navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L223)

<a id="field-field-mq3-client-ui-qmenu-menu-popped-popped-src-mq3-client-ui-qmenu-ml-848180272"></a>
### popped

```ml
popped
```

Records a request to remove the shared base-game menu-widget toolkit from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L232)

<a id="field-field-mq3-client-ui-qmenu-menu-showlogo-showlogo-src-mq3-client-ui-qmenu-ml-846626684"></a>
### showlogo

```ml
showlogo
```

When constructing this record, `menu` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L230)

<a id="field-field-mq3-client-ui-qmenu-menu-wraparound-wraparound-src-mq3-client-ui-qmenu-ml-1752369414"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the shared base-game menu-widget toolkit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_qmenu.ml#L226)
