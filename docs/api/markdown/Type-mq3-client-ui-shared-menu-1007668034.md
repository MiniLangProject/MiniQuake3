# `mq3.client.ui_shared.Menu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-shared-ml-1094733975.md)

<a id="struct-struct-mq3-client-ui-shared-menu-struct-menu-src-mq3-client-ui-shared-ml-298573495"></a>
## Menu

```ml
struct Menu
```

Stores UI shared menu, including `window`, `items`, `cursorItem`, `font`, `fullScreen`, `onOpen` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L358)

## Members

<a id="field-field-mq3-client-ui-shared-menu-cursoritem-cursoritem-src-mq3-client-ui-shared-ml-1712722988"></a>
### cursorItem

```ml
cursorItem
```

Index of the menu item that currently owns keyboard focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L364)

<a id="field-field-mq3-client-ui-shared-menu-disablecolor-disablecolor-src-mq3-client-ui-shared-ml-1913644040"></a>
### disableColor

```ml
disableColor
```

Color used to display disabled menu items.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L381)

<a id="field-field-mq3-client-ui-shared-menu-fadeamount-fadeamount-src-mq3-client-ui-shared-ml-1833039882"></a>
### fadeAmount

```ml
fadeAmount
```

Alpha increment applied by each menu fade update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L385)

<a id="field-field-mq3-client-ui-shared-menu-fadeclamp-fadeclamp-src-mq3-client-ui-shared-ml-1341337650"></a>
### fadeClamp

```ml
fadeClamp
```

Target alpha limit used by the menu's fade animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L383)

<a id="field-field-mq3-client-ui-shared-menu-fadecycle-fadecycle-src-mq3-client-ui-shared-ml-259347134"></a>
### fadeCycle

```ml
fadeCycle
```

Interval controlling how often the menu fade alpha is advanced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L387)

<a id="field-field-mq3-client-ui-shared-menu-focuscolor-focuscolor-src-mq3-client-ui-shared-ml-704834948"></a>
### focusColor

```ml
focusColor
```

Color used to display the currently focused menu item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L379)

<a id="field-field-mq3-client-ui-shared-menu-font-font-src-mq3-client-ui-shared-ml-529064616"></a>
### font

```ml
font
```

Font resource or font name selected for this menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L366)

<a id="field-field-mq3-client-ui-shared-menu-fullscreen-fullscreen-src-mq3-client-ui-shared-ml-421441884"></a>
### fullScreen

```ml
fullScreen
```

Whether the parsed menu fills the 640 by 480 virtual UI canvas and counts as a visible full-screen menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L369)

<a id="field-field-mq3-client-ui-shared-menu-items-items-src-mq3-client-ui-shared-ml-389235670"></a>
### items

```ml
items
```

Ordered child items participating in this menu's rendering and navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L362)

<a id="field-field-mq3-client-ui-shared-menu-onclose-onclose-src-mq3-client-ui-shared-ml-1359022838"></a>
### onClose

```ml
onClose
```

Script executed when the menu is closed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L373)

<a id="field-field-mq3-client-ui-shared-menu-onesc-onesc-src-mq3-client-ui-shared-ml-730180986"></a>
### onESC

```ml
onESC
```

Script executed when the menu receives the Escape key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L375)

<a id="field-field-mq3-client-ui-shared-menu-onopen-onopen-src-mq3-client-ui-shared-ml-1624280128"></a>
### onOpen

```ml
onOpen
```

Script executed when the menu is opened.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L371)

<a id="field-field-mq3-client-ui-shared-menu-outofbounds-outofbounds-src-mq3-client-ui-shared-ml-1293806838"></a>
### outOfBounds

```ml
outOfBounds
```

True when clicking outside the menu can dismiss or redirect the menu interaction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L395)

<a id="field-field-mq3-client-ui-shared-menu-ownerdraw-ownerdraw-src-mq3-client-ui-shared-ml-1720146182"></a>
### ownerDraw

```ml
ownerDraw
```

Owner-draw identifier selecting the specialized renderer for the UI element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L389)

<a id="field-field-mq3-client-ui-shared-menu-ownerdrawflags-ownerdrawflags-src-mq3-client-ui-shared-ml-243993778"></a>
### ownerDrawFlags

```ml
ownerDrawFlags
```

Visibility and presentation flags evaluated by the owner-draw renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L391)

<a id="field-field-mq3-client-ui-shared-menu-popup-popup-src-mq3-client-ui-shared-ml-360054826"></a>
### popup

```ml
popup
```

True when this menu behaves as a modal popup over its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L393)

<a id="field-field-mq3-client-ui-shared-menu-properties-properties-src-mq3-client-ui-shared-ml-29904804"></a>
### properties

```ml
properties
```

Parsed menu property entries retained for script and display behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L397)

<a id="field-field-mq3-client-ui-shared-menu-soundloop-soundloop-src-mq3-client-ui-shared-ml-1837374482"></a>
### soundLoop

```ml
soundLoop
```

Sound resource continuously played while this menu is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L377)

<a id="field-field-mq3-client-ui-shared-menu-window-window-src-mq3-client-ui-shared-ml-566590918"></a>
### window

```ml
window
```

When constructing this record, `menu` supplies `window()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L360)
