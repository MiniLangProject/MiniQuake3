# `mq3.botlib.elementary_actions.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-elementary-actions-ml-737481412.md)

<a id="struct-struct-mq3-botlib-elementary-actions-state-struct-state-src-mq3-botlib-elementary-actions-ml-1502527129"></a>
## State

```ml
struct State
```

`State` record for elementary actions, containing `initialized`, `maxClients`, `inputs`, `commandFn` and `context` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_actions.ml#L125)

## Members

<a id="field-field-mq3-botlib-elementary-actions-state-commandcount-commandcount-src-mq3-botlib-elementary-actions-ml-811243502"></a>
### commandCount

```ml
commandCount
```

Number of command recorded by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_actions.ml#L137)

<a id="field-field-mq3-botlib-elementary-actions-state-commandfn-commandfn-src-mq3-botlib-elementary-actions-ml-54355462"></a>
### commandFn

```ml
commandFn
```

Host callback that executes a command through the host command interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_actions.ml#L133)

<a id="field-field-mq3-botlib-elementary-actions-state-context-context-src-mq3-botlib-elementary-actions-ml-1311931886"></a>
### context

```ml
context
```

Caller-supplied data associated with issuing textual game commands for elementary bot actions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_actions.ml#L135)

<a id="field-field-mq3-botlib-elementary-actions-state-initialized-initialized-src-mq3-botlib-elementary-actions-ml-2057515590"></a>
### initialized

```ml
initialized
```

True after the per-client elementary bot input storage has been created.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_actions.ml#L127)

<a id="field-field-mq3-botlib-elementary-actions-state-inputs-inputs-src-mq3-botlib-elementary-actions-ml-1198683388"></a>
### inputs

```ml
inputs
```

Elementary input records indexed by bot client number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_actions.ml#L131)

<a id="field-field-mq3-botlib-elementary-actions-state-maxclients-maxclients-src-mq3-botlib-elementary-actions-ml-339086302"></a>
### maxClients

```ml
maxClients
```

Number of client input slots allocated for elementary bot actions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_actions.ml#L129)
