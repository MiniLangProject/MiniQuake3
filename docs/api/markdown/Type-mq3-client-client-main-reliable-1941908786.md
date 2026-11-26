# `mq3.client.client_main.Reliable`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-reliable-struct-reliable-src-mq3-client-client-main-ml-724653627"></a>
## Reliable

```ml
struct Reliable
```

Stores client main reliable record, including `sequence`, `acknowledge`, `commands`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L66)

## Members

<a id="field-field-mq3-client-client-main-reliable-acknowledge-acknowledge-src-mq3-client-client-main-ml-1326529911"></a>
### acknowledge

```ml
acknowledge
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_AddReliableCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L72)

<a id="field-field-mq3-client-client-main-reliable-commands-commands-src-mq3-client-client-main-ml-1786256679"></a>
### commands

```ml
commands
```

When constructing this record, `create` supplies `array(MAX_RELIABLE_COMMANDS,"")` for this member. Used by `CL_AddReliableCommand` and `CL_ChangeReliableCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L76)

<a id="field-field-mq3-client-client-main-reliable-sequence-sequence-src-mq3-client-client-main-ml-1549143377"></a>
### sequence

```ml
sequence
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_AddReliableCommand` and `CL_ChangeReliableCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L69)
