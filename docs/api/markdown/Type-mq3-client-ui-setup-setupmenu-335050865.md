# `mq3.client.ui_setup.SetupMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-setup-ml-1274257905.md)

<a id="struct-struct-mq3-client-ui-setup-setupmenu-struct-setupmenu-src-mq3-client-ui-setup-ml-1833461649"></a>
## SetupMenu

```ml
struct SetupMenu
```

Stores UI setup setup menu record, including `wrapAround`, `fullscreen`, `items`, `assets`, `commands`, `actions`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L34)

## Members

<a id="field-field-mq3-client-ui-setup-setupmenu-actions-actions-src-mq3-client-ui-setup-ml-1840823971"></a>
### actions

```ml
actions
```

Host requests queued while opening player, controls, system, and other setup destinations, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L50)

<a id="field-field-mq3-client-ui-setup-setupmenu-assets-assets-src-mq3-client-ui-setup-ml-2121801413"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the player and system setup menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L45)

<a id="field-field-mq3-client-ui-setup-setupmenu-commands-commands-src-mq3-client-ui-setup-ml-173571587"></a>
### commands

```ml
commands
```

When constructing this record, `init` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L47)

<a id="field-field-mq3-client-ui-setup-setupmenu-fullscreen-fullscreen-src-mq3-client-ui-setup-ml-319455133"></a>
### fullscreen

```ml
fullscreen
```

Whether the player setup menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L40)

<a id="field-field-mq3-client-ui-setup-setupmenu-items-items-src-mq3-client-ui-setup-ml-1487104507"></a>
### items

```ml
items
```

When constructing this record, `init` supplies `items` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L42)

<a id="field-field-mq3-client-ui-setup-setupmenu-wraparound-wraparound-src-mq3-client-ui-setup-ml-1052020885"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the player and system setup menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_setup.ml#L37)
