# `mq3.client.ui_specify_server.SpecifyServerMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-specify-server-ml-43351765.md)

<a id="struct-struct-mq3-client-ui-specify-server-specifyservermenu-struct-specifyservermenu-src-mq3-client-ui-specify-server-ml-570225019"></a>
## SpecifyServerMenu

```ml
struct SpecifyServerMenu
```

Stores UI specify server specify server menu record, including `wrapAround`, `fullscreen`, `domain`, `port`, `domainWidth`, `domainMax` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L13)

## Members

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-actions-actions-src-mq3-client-ui-specify-server-ml-1026997088"></a>
### actions

```ml
actions
```

Host requests queued while accepting a server address and issuing a connection command, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L39)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-assets-assets-src-mq3-client-ui-specify-server-ml-1695089766"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the direct server-address dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L34)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-commands-commands-src-mq3-client-ui-specify-server-ml-2123488564"></a>
### commands

```ml
commands
```

When constructing this record, `init` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L36)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-domain-domain-src-mq3-client-ui-specify-server-ml-1830362888"></a>
### domain

```ml
domain
```

When constructing this record, `init` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L21)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-domainmax-domainmax-src-mq3-client-ui-specify-server-ml-1639792284"></a>
### domainMax

```ml
domainMax
```

When constructing this record, `init` supplies `80` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L27)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-domainwidth-domainwidth-src-mq3-client-ui-specify-server-ml-1525276872"></a>
### domainWidth

```ml
domainWidth
```

When constructing this record, `init` supplies `38` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L25)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-fullscreen-fullscreen-src-mq3-client-ui-specify-server-ml-1358225942"></a>
### fullscreen

```ml
fullscreen
```

Whether the manual server-address menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L19)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-port-port-src-mq3-client-ui-specify-server-ml-304910286"></a>
### port

```ml
port
```

When constructing this record, `init` supplies `"27960"` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L23)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-portmax-portmax-src-mq3-client-ui-specify-server-ml-595345812"></a>
### portMax

```ml
portMax
```

When constructing this record, `init` supplies `5` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L31)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-portwidth-portwidth-src-mq3-client-ui-specify-server-ml-2114764668"></a>
### portWidth

```ml
portWidth
```

When constructing this record, `init` supplies `6` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L29)

<a id="field-field-mq3-client-ui-specify-server-specifyservermenu-wraparound-wraparound-src-mq3-client-ui-specify-server-ml-229053622"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the direct server-address dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_specify_server.ml#L16)
