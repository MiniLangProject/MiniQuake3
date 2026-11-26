# `mq3.client.ui_main_menu.MainMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-menu-ml-1254770805.md)

<a id="struct-struct-mq3-client-ui-main-menu-mainmenu-struct-mainmenu-src-mq3-client-ui-main-menu-ml-1993254859"></a>
## MainMenu

```ml
struct MainMenu
```

Stores UI main menu main menu record, including `fullscreen`, `wrapAround`, `showlogo`, `items`, `assets`, `cvarWrites` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L54)

## Members

<a id="field-field-mq3-client-ui-main-menu-mainmenu-actions-actions-src-mq3-client-ui-main-menu-ml-1313940621"></a>
### actions

```ml
actions
```

Host requests queued while drawing the main menu and opening its selected destination, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L71)

<a id="field-field-mq3-client-ui-main-menu-mainmenu-assets-assets-src-mq3-client-ui-main-menu-ml-1952647703"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the base-game main menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L64)

<a id="field-field-mq3-client-ui-main-menu-mainmenu-commands-commands-src-mq3-client-ui-main-menu-ml-1981059101"></a>
### commands

```ml
commands
```

When constructing this record, `open` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L68)

<a id="field-field-mq3-client-ui-main-menu-mainmenu-cvarwrites-cvarwrites-src-mq3-client-ui-main-menu-ml-1136936325"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the base-game main menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L66)

<a id="field-field-mq3-client-ui-main-menu-mainmenu-errormessage-errormessage-src-mq3-client-ui-main-menu-ml-1404732899"></a>
### errorMessage

```ml
errorMessage
```

When constructing this record, `open` supplies `errorMessage` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L73)

<a id="field-field-mq3-client-ui-main-menu-mainmenu-fullscreen-fullscreen-src-mq3-client-ui-main-menu-ml-1624346887"></a>
### fullscreen

```ml
fullscreen
```

Whether the main menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L56)

<a id="field-field-mq3-client-ui-main-menu-mainmenu-items-items-src-mq3-client-ui-main-menu-ml-809051341"></a>
### items

```ml
items
```

When constructing this record, `open` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L62)

<a id="field-field-mq3-client-ui-main-menu-mainmenu-showlogo-showlogo-src-mq3-client-ui-main-menu-ml-1064630205"></a>
### showlogo

```ml
showlogo
```

When constructing this record, `open` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L60)

<a id="field-field-mq3-client-ui-main-menu-mainmenu-wraparound-wraparound-src-mq3-client-ui-main-menu-ml-986934703"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the base-game main menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_menu.ml#L58)
