# `mq3.client.console_input.State`

[Home](README.md) · [Source file](File-src-mq3-client-console-input-ml-896040399.md)

<a id="struct-struct-mq3-client-console-input-state-struct-state-src-mq3-client-console-input-ml-853245135"></a>
## State

```ml
struct State
```

Stores console input state, including `console`, `chat`, `history`, `nextHistoryLine`, `historyLine`, `overstrike` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L95)

## Members

<a id="field-field-mq3-client-console-input-state-catcher-catcher-src-mq3-client-console-input-ml-1200788318"></a>
### catcher

```ml
catcher
```

When constructing this record, `create` supplies `0` for this member. Used by `toggleConsole` and `beginMessage` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L116)

<a id="field-field-mq3-client-console-input-state-chat-chat-src-mq3-client-console-input-ml-1086297730"></a>
### chat

```ml
chat
```

When constructing this record, `create` supplies `field(30)` for this member. Used by `beginMessage` and `messageKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L101)

<a id="field-field-mq3-client-console-input-state-chatplayernum-chatplayernum-src-mq3-client-console-input-ml-23728946"></a>
### chatPlayerNum

```ml
chatPlayerNum
```

When constructing this record, `create` supplies `-1` for this member. Used by `beginMessage` and `messageKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L124)

<a id="field-field-mq3-client-console-input-state-chatteam-chatteam-src-mq3-client-console-input-ml-758331552"></a>
### chatTeam

```ml
chatTeam
```

When constructing this record, `create` supplies `false` for this member. Used by `beginMessage` and `messageKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L121)

<a id="field-field-mq3-client-console-input-state-connectionstate-connectionstate-src-mq3-client-console-input-ml-1187804218"></a>
### connectionState

```ml
connectionState
```

Client connection-state identifier controlling handshake, loading, and active-play behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L118)

<a id="field-field-mq3-client-console-input-state-console-console-src-mq3-client-console-input-ml-1473470478"></a>
### console

```ml
console
```

When constructing this record, `create` supplies `field(width)` for this member. Used by `toggleConsole` and `consoleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L98)

<a id="field-field-mq3-client-console-input-state-consoleruntime-consoleruntime-src-mq3-client-console-input-ml-1304643840"></a>
### consoleRuntime

```ml
consoleRuntime
```

Optional console rendering state attached by the console runtime constructor, linking line editing to scrollback presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L129)

<a id="field-field-mq3-client-console-input-state-history-history-src-mq3-client-console-input-ml-895681430"></a>
### history

```ml
history
```

When constructing this record, `create` supplies `history` for this member. Used by `consoleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L104)

<a id="field-field-mq3-client-console-input-state-historyline-historyline-src-mq3-client-console-input-ml-1035765458"></a>
### historyLine

```ml
historyLine
```

When constructing this record, `create` supplies `0` for this member. Used by `consoleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L110)

<a id="field-field-mq3-client-console-input-state-nexthistoryline-nexthistoryline-src-mq3-client-console-input-ml-1064025902"></a>
### nextHistoryLine

```ml
nextHistoryLine
```

When constructing this record, `create` supplies `0` for this member. Used by `consoleKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L107)

<a id="field-field-mq3-client-console-input-state-overstrike-overstrike-src-mq3-client-console-input-ml-1422360070"></a>
### overstrike

```ml
overstrike
```

When constructing this record, `create` supplies `false` for this member. Used by `insertByte` and `fieldKeyDown` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L113)

<a id="field-field-mq3-client-console-input-state-services-services-src-mq3-client-console-input-ml-1399596858"></a>
### services

```ml
services
```

Service callbacks and context used to access the host engine from this client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L126)
