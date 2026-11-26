# `mq3.client.ui_save_config.SaveConfigMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-save-config-ml-261621298.md)

<a id="struct-struct-mq3-client-ui-save-config-saveconfigmenu-struct-saveconfigmenu-src-mq3-client-ui-save-config-ml-447643149"></a>
## SaveConfigMenu

```ml
struct SaveConfigMenu
```

Stores UI save config save config menu record, including `wrapAround`, `fullscreen`, `name`, `maxchars`, `widthInChars`, `assets` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L10)

## Members

<a id="field-field-mq3-client-ui-save-config-saveconfigmenu-actions-actions-src-mq3-client-ui-save-config-ml-1580376137"></a>
### actions

```ml
actions
```

Host requests queued while accepting a filename and writing the current configuration, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L30)

<a id="field-field-mq3-client-ui-save-config-saveconfigmenu-assets-assets-src-mq3-client-ui-save-config-ml-1290254027"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the configuration-file saving menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L25)

<a id="field-field-mq3-client-ui-save-config-saveconfigmenu-commands-commands-src-mq3-client-ui-save-config-ml-1726728477"></a>
### commands

```ml
commands
```

When constructing this record, `init` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L27)

<a id="field-field-mq3-client-ui-save-config-saveconfigmenu-fullscreen-fullscreen-src-mq3-client-ui-save-config-ml-1057760923"></a>
### fullscreen

```ml
fullscreen
```

Whether the configuration-saving menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L16)

<a id="field-field-mq3-client-ui-save-config-saveconfigmenu-maxchars-maxchars-src-mq3-client-ui-save-config-ml-799893319"></a>
### maxchars

```ml
maxchars
```

When constructing this record, `init` supplies `20` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L20)

<a id="field-field-mq3-client-ui-save-config-saveconfigmenu-name-name-src-mq3-client-ui-save-config-ml-1699875703"></a>
### name

```ml
name
```

Editable configuration filename; saving removes an existing extension and appends .cfg.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L18)

<a id="field-field-mq3-client-ui-save-config-saveconfigmenu-widthinchars-widthinchars-src-mq3-client-ui-save-config-ml-620066109"></a>
### widthInChars

```ml
widthInChars
```

Number of character columns visible in the editable text or console field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L22)

<a id="field-field-mq3-client-ui-save-config-saveconfigmenu-wraparound-wraparound-src-mq3-client-ui-save-config-ml-189294907"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the configuration-file saving menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_save_config.ml#L13)
