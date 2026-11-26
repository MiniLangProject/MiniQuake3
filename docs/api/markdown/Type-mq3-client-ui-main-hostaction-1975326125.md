# `mq3.client.ui_main.HostAction`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-ml-1850214811.md)

<a id="struct-struct-mq3-client-ui-main-hostaction-struct-hostaction-src-mq3-client-ui-main-ml-692380143"></a>
## HostAction

```ml
struct HostAction
```

Stores UI main host action record, including `boundary`, `kind`, `name`, `args`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L59)

## Members

<a id="field-field-mq3-client-ui-main-hostaction-args-args-src-mq3-client-ui-main-ml-1736608895"></a>
### args

```ml
args
```

When constructing this record, `hostAction` supplies `args` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L69)

<a id="field-field-mq3-client-ui-main-hostaction-boundary-boundary-src-mq3-client-ui-main-ml-1704894417"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while dispatching base-game UI entry points to engine services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L62)

<a id="field-field-mq3-client-ui-main-hostaction-dispatched-dispatched-src-mq3-client-ui-main-ml-1128729551"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while dispatching base-game UI entry points to engine services; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L72)

<a id="field-field-mq3-client-ui-main-hostaction-kind-kind-src-mq3-client-ui-main-ml-40049785"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while dispatching base-game UI entry points to engine services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L65)

<a id="field-field-mq3-client-ui-main-hostaction-name-name-src-mq3-client-ui-main-ml-1771864243"></a>
### name

```ml
name
```

Target resource, command, or setting name addressed by this queued host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L67)
