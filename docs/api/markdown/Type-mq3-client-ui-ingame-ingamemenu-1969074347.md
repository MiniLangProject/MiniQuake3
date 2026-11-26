# `mq3.client.ui_ingame.InGameMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-ingame-ml-232608247.md)

<a id="struct-struct-mq3-client-ui-ingame-ingamemenu-struct-ingamemenu-src-mq3-client-ui-ingame-ml-97849239"></a>
## InGameMenu

```ml
struct InGameMenu
```

Stores UI ingame in game menu record, including `wrapAround`, `fullscreen`, `frame`, `items`, `assets`, `commands` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L52)

## Members

<a id="field-field-mq3-client-ui-ingame-ingamemenu-actions-actions-src-mq3-client-ui-ingame-ml-1067756587"></a>
### actions

```ml
actions
```

Host requests queued while offering pause-menu commands and returning control to the game, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L68)

<a id="field-field-mq3-client-ui-ingame-ingamemenu-assets-assets-src-mq3-client-ui-ingame-ml-39467765"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the in-game pause menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L63)

<a id="field-field-mq3-client-ui-ingame-ingamemenu-commands-commands-src-mq3-client-ui-ingame-ml-331344507"></a>
### commands

```ml
commands
```

When constructing this record, `init` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L65)

<a id="field-field-mq3-client-ui-ingame-ingamemenu-cursorx-cursorx-src-mq3-client-ui-ingame-ml-294537999"></a>
### cursorX

```ml
cursorX
```

Horizontal position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L70)

<a id="field-field-mq3-client-ui-ingame-ingamemenu-cursory-cursory-src-mq3-client-ui-ingame-ml-843967923"></a>
### cursorY

```ml
cursorY
```

Vertical position of the pointer in the local display coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L72)

<a id="field-field-mq3-client-ui-ingame-ingamemenu-frame-frame-src-mq3-client-ui-ingame-ml-117430763"></a>
### frame

```ml
frame
```

Virtual image path of the decorative border displayed around the in-game menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L59)

<a id="field-field-mq3-client-ui-ingame-ingamemenu-fullscreen-fullscreen-src-mq3-client-ui-ingame-ml-1529037669"></a>
### fullscreen

```ml
fullscreen
```

Whether the in-game options menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L57)

<a id="field-field-mq3-client-ui-ingame-ingamemenu-items-items-src-mq3-client-ui-ingame-ml-845962395"></a>
### items

```ml
items
```

When constructing this record, `init` supplies `items` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L61)

<a id="field-field-mq3-client-ui-ingame-ingamemenu-wraparound-wraparound-src-mq3-client-ui-ingame-ml-9056861"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the in-game pause menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_ingame.ml#L54)
