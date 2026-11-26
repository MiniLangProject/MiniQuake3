# `mq3.client.gamestate.State`

[Home](README.md) · [Source file](File-src-mq3-client-gamestate-ml-1690167636.md)

<a id="struct-struct-mq3-client-gamestate-state-struct-state-src-mq3-client-gamestate-ml-1036852243"></a>
## State

```ml
struct State
```

Stores gamestate state, including `stringOffsets`, `stringData`, `dataCount`, `baselines`, `serverCommandSequence`, `clientNum` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L25)

## Members

<a id="field-field-mq3-client-gamestate-state-baselines-baselines-src-mq3-client-gamestate-ml-1239011272"></a>
### baselines

```ml
baselines
```

When constructing this record, `create` supplies `array(MAX_GENTITIES,void)` for this member. Used by `clear` and `parse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L37)

<a id="field-field-mq3-client-gamestate-state-checksumfeed-checksumfeed-src-mq3-client-gamestate-ml-2097104278"></a>
### checksumFeed

```ml
checksumFeed
```

Server-provided seed used when calculating the client's content checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L43)

<a id="field-field-mq3-client-gamestate-state-clientnum-clientnum-src-mq3-client-gamestate-ml-1347335316"></a>
### clientNum

```ml
clientNum
```

Client slot assigned by the server in the received game-state message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L41)

<a id="field-field-mq3-client-gamestate-state-closefn-closefn-src-mq3-client-gamestate-ml-1766273044"></a>
### closeFn

```ml
closeFn
```

Host callback for the close operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L50)

<a id="field-field-mq3-client-gamestate-state-connectpacketcount-connectpacketcount-src-mq3-client-gamestate-ml-1177919926"></a>
### connectPacketCount

```ml
connectPacketCount
```

Number of connection-handshake packets sent, also used by progress displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L45)

<a id="field-field-mq3-client-gamestate-state-context-context-src-mq3-client-gamestate-ml-1463942568"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for initial game-state decoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L63)

<a id="field-field-mq3-client-gamestate-state-datacount-datacount-src-mq3-client-gamestate-ml-349813348"></a>
### dataCount

```ml
dataCount
```

When constructing this record, `create` supplies `1` for this member. Used by `clear` and `parse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L34)

<a id="field-field-mq3-client-gamestate-state-downloadsfn-downloadsfn-src-mq3-client-gamestate-ml-1468307044"></a>
### downloadsFn

```ml
downloadsFn
```

Host callback for the downloads operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L58)

<a id="field-field-mq3-client-gamestate-state-paused-paused-src-mq3-client-gamestate-ml-282370936"></a>
### paused

```ml
paused
```

When constructing this record, `create` supplies `0` for this member. Used by `clear` and `parse` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L48)

<a id="field-field-mq3-client-gamestate-state-pausefn-pausefn-src-mq3-client-gamestate-ml-1945047784"></a>
### pauseFn

```ml
pauseFn
```

Host callback for the pause operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L60)

<a id="field-field-mq3-client-gamestate-state-restartfn-restartfn-src-mq3-client-gamestate-ml-1551291796"></a>
### restartFn

```ml
restartFn
```

Host callback for the restart operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L55)

<a id="field-field-mq3-client-gamestate-state-servercommandsequence-servercommandsequence-src-mq3-client-gamestate-ml-1574262008"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Reliable server-command sequence read at the start of the server game-state payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L39)

<a id="field-field-mq3-client-gamestate-state-stringdata-stringdata-src-mq3-client-gamestate-ml-1864440606"></a>
### stringData

```ml
stringData
```

When constructing this record, `create` supplies `bytes(MAX_GAMESTATE_CHARS,0)` for this member. Used by `clear` and `configString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L31)

<a id="field-field-mq3-client-gamestate-state-stringoffsets-stringoffsets-src-mq3-client-gamestate-ml-432338152"></a>
### stringOffsets

```ml
stringOffsets
```

When constructing this record, `create` supplies `array(MAX_CONFIGSTRINGS,0)` for this member. Used by `clear` and `configString` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L28)

<a id="field-field-mq3-client-gamestate-state-systeminfofn-systeminfofn-src-mq3-client-gamestate-ml-1988682510"></a>
### systemInfoFn

```ml
systemInfoFn
```

Host callback for the system info operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/gamestate.ml#L53)
