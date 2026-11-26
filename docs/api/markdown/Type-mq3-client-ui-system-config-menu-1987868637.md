# `mq3.client.ui_system_config.Menu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-system-config-ml-909169878.md)

<a id="struct-struct-mq3-client-ui-system-config-menu-struct-menu-src-mq3-client-ui-system-config-ml-2120520789"></a>
## Menu

```ml
struct Menu
```

Stores UI system config menu, including `wrapAround`, `fullscreen`, `items`, `assets`, `actions`, `pushed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_system_config.ml#L38)

## Members

<a id="field-field-mq3-client-ui-system-config-menu-actions-actions-src-mq3-client-ui-system-config-ml-870235820"></a>
### actions

```ml
actions
```

Host requests queued while opening graphics, display, sound, and network option screens, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_system_config.ml#L52)

<a id="field-field-mq3-client-ui-system-config-menu-assets-assets-src-mq3-client-ui-system-config-ml-1917868306"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the system-configuration submenu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_system_config.ml#L49)

<a id="field-field-mq3-client-ui-system-config-menu-fullscreen-fullscreen-src-mq3-client-ui-system-config-ml-2091881450"></a>
### fullscreen

```ml
fullscreen
```

Whether the system-configuration menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_system_config.ml#L44)

<a id="field-field-mq3-client-ui-system-config-menu-items-items-src-mq3-client-ui-system-config-ml-1741239364"></a>
### items

```ml
items
```

Ordered child items participating in this menu's rendering and navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_system_config.ml#L46)

<a id="field-field-mq3-client-ui-system-config-menu-pushed-pushed-src-mq3-client-ui-system-config-ml-353745858"></a>
### pushed

```ml
pushed
```

Records that the system-configuration submenu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_system_config.ml#L54)

<a id="field-field-mq3-client-ui-system-config-menu-wraparound-wraparound-src-mq3-client-ui-system-config-ml-700927170"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the system-configuration submenu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_system_config.ml#L41)
