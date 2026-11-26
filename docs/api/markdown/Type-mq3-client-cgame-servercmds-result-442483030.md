# `mq3.client.cgame_servercmds.Result`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-result-struct-result-src-mq3-client-cgame-servercmds-ml-154289603"></a>
## Result

```ml
struct Result
```

Stores client game servercmds operation result, including `handled`, `actions`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L230)

## Members

<a id="field-field-mq3-client-cgame-servercmds-result-actions-actions-src-mq3-client-cgame-servercmds-ml-1123145584"></a>
### actions

```ml
actions
```

Host requests queued while applying reliable server commands and playing server-directed feedback, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L235)

<a id="field-field-mq3-client-cgame-servercmds-result-handled-handled-src-mq3-client-cgame-servercmds-ml-174784156"></a>
### handled

```ml
handled
```

When constructing this record, `result` supplies `handled` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L232)
