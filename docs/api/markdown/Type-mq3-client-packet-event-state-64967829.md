# `mq3.client.packet_event.State`

[Home](README.md) · [Source file](File-src-mq3-client-packet-event-ml-580908436.md)

<a id="struct-struct-mq3-client-packet-event-state-struct-state-src-mq3-client-packet-event-ml-676453601"></a>
## State

```ml
struct State
```

Stores packet event state, including `connection`, `realtime`, `serverMessageSequence`, `demoRecording`, `demoWaiting`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/packet_event.ml#L13)

## Members

<a id="field-field-mq3-client-packet-event-state-connection-connection-src-mq3-client-packet-event-ml-2066889746"></a>
### connection

```ml
connection
```

When constructing this record, `create` supplies `connectionState` for this member. Used by `packetEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/packet_event.ml#L16)

<a id="field-field-mq3-client-packet-event-state-demorecording-demorecording-src-mq3-client-packet-event-ml-459093186"></a>
### demoRecording

```ml
demoRecording
```

When constructing this record, `create` supplies `false` for this member. Used by `packetEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/packet_event.ml#L23)

<a id="field-field-mq3-client-packet-event-state-demowaiting-demowaiting-src-mq3-client-packet-event-ml-74914890"></a>
### demoWaiting

```ml
demoWaiting
```

When constructing this record, `create` supplies `false` for this member. Used by `packetEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/packet_event.ml#L26)

<a id="field-field-mq3-client-packet-event-state-realtime-realtime-src-mq3-client-packet-event-ml-1144463668"></a>
### realtime

```ml
realtime
```

Local client timestamp in milliseconds associated with incoming packet processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/packet_event.ml#L18)

<a id="field-field-mq3-client-packet-event-state-servermessagesequence-servermessagesequence-src-mq3-client-packet-event-ml-1012700102"></a>
### serverMessageSequence

```ml
serverMessageSequence
```

Highest server network-message sequence observed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/packet_event.ml#L20)
