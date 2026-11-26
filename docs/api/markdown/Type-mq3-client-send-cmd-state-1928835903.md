# `mq3.client.send_cmd.State`

[Home](README.md) · [Source file](File-src-mq3-client-send-cmd-ml-1342588170.md)

<a id="struct-struct-mq3-client-send-cmd-state-struct-state-src-mq3-client-send-cmd-ml-1955042837"></a>
## State

```ml
struct State
```

Stores send cmd state, including `connectionState`, `realtime`, `oldFrameTime`, `frameMsec`, `lastPacketSentTime`, `demoPlaying` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L53)

## Members

<a id="field-field-mq3-client-send-cmd-state-checksumfeed-checksumfeed-src-mq3-client-send-cmd-ml-857009788"></a>
### checksumFeed

```ml
checksumFeed
```

Server-provided seed used when calculating the client's content checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L112)

<a id="field-field-mq3-client-send-cmd-state-clientpaused-clientpaused-src-mq3-client-send-cmd-ml-1939473892"></a>
### clientPaused

```ml
clientPaused
```

When constructing this record, `create` supplies `false` for this member. Used by `send` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L95)

<a id="field-field-mq3-client-send-cmd-state-cmdnumber-cmdnumber-src-mq3-client-send-cmd-ml-1835272574"></a>
### cmdNumber

```ml
cmdNumber
```

Monotonically advancing user-command sequence number for the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L123)

<a id="field-field-mq3-client-send-cmd-state-codec-codec-src-mq3-client-send-cmd-ml-872554514"></a>
### codec

```ml
codec
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L131)

<a id="field-field-mq3-client-send-cmd-state-commands-commands-src-mq3-client-send-cmd-ml-899282342"></a>
### commands

```ml
commands
```

When constructing this record, `create` supplies `commands` for this member. Used by `createNewCommand` and `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L126)

<a id="field-field-mq3-client-send-cmd-state-connectionstate-connectionstate-src-mq3-client-send-cmd-ml-607476386"></a>
### connectionState

```ml
connectionState
```

Client connection-state identifier controlling handshake, loading, and active-play behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L55)

<a id="field-field-mq3-client-send-cmd-state-demoplaying-demoplaying-src-mq3-client-send-cmd-ml-128706454"></a>
### demoPlaying

```ml
demoPlaying
```

True while the client receives its game data from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L66)

<a id="field-field-mq3-client-send-cmd-state-demowaiting-demowaiting-src-mq3-client-send-cmd-ml-969861218"></a>
### demoWaiting

```ml
demoWaiting
```

When constructing this record, `create` supplies `false` for this member. Used by `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L69)

<a id="field-field-mq3-client-send-cmd-state-downloadtempname-downloadtempname-src-mq3-client-send-cmd-ml-202800708"></a>
### downloadTempName

```ml
downloadTempName
```

When constructing this record, `create` supplies an empty string for this member. Used by `ready` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L72)

<a id="field-field-mq3-client-send-cmd-state-framemsec-framemsec-src-mq3-client-send-cmd-ml-591828790"></a>
### frameMsec

```ml
frameMsec
```

When constructing this record, `create` supplies `0` for this member. Used by `createNewCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L62)

<a id="field-field-mq3-client-send-cmd-state-lanaddress-lanaddress-src-mq3-client-send-cmd-ml-210067292"></a>
### lanAddress

```ml
lanAddress
```

When constructing this record, `create` supplies `false` for this member. Used by `ready` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L78)

<a id="field-field-mq3-client-send-cmd-state-lastpacketsenttime-lastpacketsenttime-src-mq3-client-send-cmd-ml-1243239144"></a>
### lastPacketSentTime

```ml
lastPacketSentTime
```

Client timestamp of the latest outgoing packet, used to schedule retransmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L64)

<a id="field-field-mq3-client-send-cmd-state-maxpackets-maxpackets-src-mq3-client-send-cmd-ml-1720785684"></a>
### maxPackets

```ml
maxPackets
```

When constructing this record, `create` supplies `30` for this member. Used by `ready` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L81)

<a id="field-field-mq3-client-send-cmd-state-nodelta-nodelta-src-mq3-client-send-cmd-ml-1579516154"></a>
### noDelta

```ml
noDelta
```

When constructing this record, `create` supplies `false` for this member. Used by `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L87)

<a id="field-field-mq3-client-send-cmd-state-oldframetime-oldframetime-src-mq3-client-send-cmd-ml-2336088"></a>
### oldFrameTime

```ml
oldFrameTime
```

Client time in milliseconds at which the previous animation frame was exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L59)

<a id="field-field-mq3-client-send-cmd-state-outgoingsequence-outgoingsequence-src-mq3-client-send-cmd-ml-1752133516"></a>
### outgoingSequence

```ml
outgoingSequence
```

When constructing this record, `create` supplies `1` for this member. Used by `ready` and `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L121)

<a id="field-field-mq3-client-send-cmd-state-outpackets-outpackets-src-mq3-client-send-cmd-ml-962802704"></a>
### outPackets

```ml
outPackets
```

History of outgoing packet metadata used to estimate acknowledgement timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L128)

<a id="field-field-mq3-client-send-cmd-state-packetdup-packetdup-src-mq3-client-send-cmd-ml-1324394478"></a>
### packetDup

```ml
packetDup
```

When constructing this record, `create` supplies `1` for this member. Used by `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L84)

<a id="field-field-mq3-client-send-cmd-state-realtime-realtime-src-mq3-client-send-cmd-ml-1699907200"></a>
### realtime

```ml
realtime
```

Current local client clock in milliseconds used for command-packet scheduling and send timestamps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L57)

<a id="field-field-mq3-client-send-cmd-state-reliableacknowledge-reliableacknowledge-src-mq3-client-send-cmd-ml-574533026"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Highest reliable-command sequence acknowledged as executed by the peer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L104)

<a id="field-field-mq3-client-send-cmd-state-reliablecommands-reliablecommands-src-mq3-client-send-cmd-ml-661534586"></a>
### reliableCommands

```ml
reliableCommands
```

Ring of reliable command strings awaiting acknowledgement or execution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L108)

<a id="field-field-mq3-client-send-cmd-state-reliablesequence-reliablesequence-src-mq3-client-send-cmd-ml-1399986700"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number assigned to the latest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L106)

<a id="field-field-mq3-client-send-cmd-state-remoteaddresstype-remoteaddresstype-src-mq3-client-send-cmd-ml-487401834"></a>
### remoteAddressType

```ml
remoteAddressType
```

When constructing this record, `create` supplies `0` for this member. Used by `ready` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L75)

<a id="field-field-mq3-client-send-cmd-state-servercommands-servercommands-src-mq3-client-send-cmd-ml-1937931660"></a>
### serverCommands

```ml
serverCommands
```

Reliable server commands retained for ordered execution by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L110)

<a id="field-field-mq3-client-send-cmd-state-servercommandsequence-servercommandsequence-src-mq3-client-send-cmd-ml-1623848642"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Latest received reliable server-command sequence acknowledged in outgoing packets and used to select command text for encoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L102)

<a id="field-field-mq3-client-send-cmd-state-serverid-serverid-src-mq3-client-send-cmd-ml-1425966702"></a>
### serverId

```ml
serverId
```

Server-instance identifier included in client messages to reject stale connections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L97)

<a id="field-field-mq3-client-send-cmd-state-servermessagesequence-servermessagesequence-src-mq3-client-send-cmd-ml-302473638"></a>
### serverMessageSequence

```ml
serverMessageSequence
```

Highest server network-message sequence observed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L99)

<a id="field-field-mq3-client-send-cmd-state-serverpaused-serverpaused-src-mq3-client-send-cmd-ml-482723252"></a>
### serverPaused

```ml
serverPaused
```

When constructing this record, `create` supplies `false` for this member. Used by `send` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L92)

<a id="field-field-mq3-client-send-cmd-state-serverrunning-serverrunning-src-mq3-client-send-cmd-ml-146330074"></a>
### serverRunning

```ml
serverRunning
```

True when a local game server is running in the same engine instance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L89)

<a id="field-field-mq3-client-send-cmd-state-snapmessagenum-snapmessagenum-src-mq3-client-send-cmd-ml-1986928016"></a>
### snapMessageNum

```ml
snapMessageNum
```

When constructing this record, `create` supplies `0` for this member. Used by `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L118)

<a id="field-field-mq3-client-send-cmd-state-snapvalid-snapvalid-src-mq3-client-send-cmd-ml-334622842"></a>
### snapValid

```ml
snapValid
```

When constructing this record, `create` supplies `false` for this member. Used by `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L115)
