# `mq3.server.operator_commands.Action`

[Home](README.md) · [Source file](File-src-mq3-server-operator-commands-ml-2061061336.md)

<a id="struct-struct-mq3-server-operator-commands-action-struct-action-src-mq3-server-operator-commands-ml-257974355"></a>
## Action

```ml
struct Action
```

Action record for server.operator_commands, containing `boundary`, `kind`, `target`, `text`, `values`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L76)

## Members

<a id="field-field-mq3-server-operator-commands-action-boundary-boundary-src-mq3-server-operator-commands-ml-278532079"></a>
### boundary

```ml
boundary
```

Subsystem boundary at which this host action must be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L78)

<a id="field-field-mq3-server-operator-commands-action-dispatched-dispatched-src-mq3-server-operator-commands-ml-1533183757"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L88)

<a id="field-field-mq3-server-operator-commands-action-kind-kind-src-mq3-server-operator-commands-ml-216111759"></a>
### kind

```ml
kind
```

Operator-action discriminator used by the host dispatcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L80)

<a id="field-field-mq3-server-operator-commands-action-target-target-src-mq3-server-operator-commands-ml-1445242417"></a>
### target

```ml
target
```

Client, map, or other resource targeted by the operator action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L82)

<a id="field-field-mq3-server-operator-commands-action-text-text-src-mq3-server-operator-commands-ml-1204103029"></a>
### text

```ml
text
```

Command or diagnostic text carried by the operator action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L84)

<a id="field-field-mq3-server-operator-commands-action-values-values-src-mq3-server-operator-commands-ml-414080399"></a>
### values

```ml
values
```

Additional argument values associated with the operator action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L86)
