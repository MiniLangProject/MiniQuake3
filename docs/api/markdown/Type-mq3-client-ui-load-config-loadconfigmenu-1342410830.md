# `mq3.client.ui_load_config.LoadConfigMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-load-config-ml-1951111407.md)

<a id="struct-struct-mq3-client-ui-load-config-loadconfigmenu-struct-loadconfigmenu-src-mq3-client-ui-load-config-ml-1547930327"></a>
## LoadConfigMenu

```ml
struct LoadConfigMenu
```

Stores UI load config load config menu record, including `wrapAround`, `fullscreen`, `names`, `selected`, `goHidden`, `assets` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L23)

## Members

<a id="field-field-mq3-client-ui-load-config-loadconfigmenu-actions-actions-src-mq3-client-ui-load-config-ml-734946768"></a>
### actions

```ml
actions
```

Host requests queued while listing configuration files and executing the selected file, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L43)

<a id="field-field-mq3-client-ui-load-config-loadconfigmenu-assets-assets-src-mq3-client-ui-load-config-ml-551590582"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the configuration-file loading menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L38)

<a id="field-field-mq3-client-ui-load-config-loadconfigmenu-commands-commands-src-mq3-client-ui-load-config-ml-1965333836"></a>
### commands

```ml
commands
```

When constructing this record, `init` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L40)

<a id="field-field-mq3-client-ui-load-config-loadconfigmenu-fullscreen-fullscreen-src-mq3-client-ui-load-config-ml-432736710"></a>
### fullscreen

```ml
fullscreen
```

Whether the configuration-loading menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L29)

<a id="field-field-mq3-client-ui-load-config-loadconfigmenu-gohidden-gohidden-src-mq3-client-ui-load-config-ml-652668804"></a>
### goHidden

```ml
goHidden
```

When constructing this record, `init` supplies `hidden` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L35)

<a id="field-field-mq3-client-ui-load-config-loadconfigmenu-names-names-src-mq3-client-ui-load-config-ml-1311483732"></a>
### names

```ml
names
```

When constructing this record, `init` supplies `names` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L31)

<a id="field-field-mq3-client-ui-load-config-loadconfigmenu-selected-selected-src-mq3-client-ui-load-config-ml-1620268058"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L33)

<a id="field-field-mq3-client-ui-load-config-loadconfigmenu-wraparound-wraparound-src-mq3-client-ui-load-config-ml-80722598"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the configuration-file loading menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_load_config.ml#L26)
