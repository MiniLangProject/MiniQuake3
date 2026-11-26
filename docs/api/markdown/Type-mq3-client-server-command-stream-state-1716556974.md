# `mq3.client.server_command_stream.State`

[Home](README.md) · [Source file](File-src-mq3-client-server-command-stream-ml-1493457615.md)

<a id="struct-struct-mq3-client-server-command-stream-state-struct-state-src-mq3-client-server-command-stream-ml-815071335"></a>
## State

```ml
struct State
```

Stores server command stream state, including `commandState`, `configstrings`, `commandSequence`, `lastExecuted`, `commands`, `demoPlaying` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L45)

## Members

<a id="field-field-mq3-client-server-command-stream-state-bigconfigstring-bigconfigstring-src-mq3-client-server-command-stream-ml-1893323146"></a>
### bigConfigString

```ml
bigConfigString
```

When constructing this record, `create` supplies an empty string for this member. Used by `get` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L64)

<a id="field-field-mq3-client-server-command-stream-state-commands-commands-src-mq3-client-server-command-stream-ml-531856922"></a>
### commands

```ml
commands
```

When constructing this record, `create` supplies `array(MAX_RELIABLE_COMMANDS,"")` for this member. Used by `queue` and `setSequence` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L59)

<a id="field-field-mq3-client-server-command-stream-state-commandsequence-commandsequence-src-mq3-client-server-command-stream-ml-69935682"></a>
### commandSequence

```ml
commandSequence
```

When constructing this record, `create` supplies `0` for this member. Used by `queue` and `setSequence` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L53)

<a id="field-field-mq3-client-server-command-stream-state-commandstate-commandstate-src-mq3-client-server-command-stream-ml-78254498"></a>
### commandState

```ml
commandState
```

When constructing this record, `create` supplies `commandState` for this member. Used by `updateConfigstring` and `get` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L48)

<a id="field-field-mq3-client-server-command-stream-state-configstrings-configstrings-src-mq3-client-server-command-stream-ml-1864730730"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by the native protocol's configuration-string identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L50)

<a id="field-field-mq3-client-server-command-stream-state-demoplaying-demoplaying-src-mq3-client-server-command-stream-ml-1116231902"></a>
### demoPlaying

```ml
demoPlaying
```

True while the client receives its game data from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L61)

<a id="field-field-mq3-client-server-command-stream-state-lastexecuted-lastexecuted-src-mq3-client-server-command-stream-ml-1854867604"></a>
### lastExecuted

```ml
lastExecuted
```

When constructing this record, `create` supplies `0` for this member. Used by `get` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L56)
