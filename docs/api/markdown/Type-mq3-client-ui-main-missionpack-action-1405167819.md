# `mq3.client.ui_main_missionpack.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-missionpack-ml-2627719.md)

<a id="struct-struct-mq3-client-ui-main-missionpack-action-struct-action-src-mq3-client-ui-main-missionpack-ml-894176651"></a>
## Action

```ml
struct Action
```

Stores UI main missionpack queued engine action, including `boundary`, `kind`, `name`, `text`, `values`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L131)

## Members

<a id="field-field-mq3-client-ui-main-missionpack-action-boundary-boundary-src-mq3-client-ui-main-missionpack-ml-762100019"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while running scripted Missionpack menus and updating browser or game selections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L134)

<a id="field-field-mq3-client-ui-main-missionpack-action-dispatched-dispatched-src-mq3-client-ui-main-missionpack-ml-274994821"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while running scripted Missionpack menus and updating browser or game selections; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L147)

<a id="field-field-mq3-client-ui-main-missionpack-action-kind-kind-src-mq3-client-ui-main-missionpack-ml-1730251515"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while running scripted Missionpack menus and updating browser or game selections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L137)

<a id="field-field-mq3-client-ui-main-missionpack-action-name-name-src-mq3-client-ui-main-missionpack-ml-597375465"></a>
### name

```ml
name
```

Cvar, asset, menu-script target, or command named by a Missionpack UI host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L139)

<a id="field-field-mq3-client-ui-main-missionpack-action-text-text-src-mq3-client-ui-main-missionpack-ml-2037362333"></a>
### text

```ml
text
```

Missionpack UI text argument used for displayed content, cvar values, menu scripts, and bot or server commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L142)

<a id="field-field-mq3-client-ui-main-missionpack-action-values-values-src-mq3-client-ui-main-missionpack-ml-387266803"></a>
### values

```ml
values
```

When constructing this record, `emit` supplies `values` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L144)
