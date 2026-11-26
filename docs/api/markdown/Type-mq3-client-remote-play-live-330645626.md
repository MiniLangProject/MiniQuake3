# `mq3.client.remote_play.Live`

[Home](README.md) · [Source file](File-src-mq3-client-remote-play-ml-1364331402.md)

<a id="struct-struct-mq3-client-remote-play-live-struct-live-src-mq3-client-remote-play-ml-219353907"></a>
## Live

```ml
struct Live
```

Stores remote play live record, including `socket`, `connection`, `connectionHost`, `ingress`, `protocol`, `outgoing` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L46)

## Members

<a id="field-field-mq3-client-remote-play-live-basedirectory-basedirectory-src-mq3-client-remote-play-ml-1084590639"></a>
### baseDirectory

```ml
baseDirectory
```

When constructing this record, `create` supplies an empty string for this member. Used by `setBasePackages` and `enterGamestate` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L83)

<a id="field-field-mq3-client-remote-play-live-connection-connection-src-mq3-client-remote-play-ml-613515751"></a>
### connection

```ml
connection
```

When constructing this record, `create` supplies `state` for this member. Used by `primed` and `status` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L51)

<a id="field-field-mq3-client-remote-play-live-connectionhost-connectionhost-src-mq3-client-remote-play-ml-1192672999"></a>
### connectionHost

```ml
connectionHost
```

When constructing this record, `create` supplies `host` for this member. Used by `pump` and `updateUserinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L54)

<a id="field-field-mq3-client-remote-play-live-connectstarted-connectstarted-src-mq3-client-remote-play-ml-1599966637"></a>
### connectStarted

```ml
connectStarted
```

When constructing this record, `create` supplies `now` for this member. Used by `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L89)

<a id="field-field-mq3-client-remote-play-live-epoch-epoch-src-mq3-client-remote-play-ml-1440594235"></a>
### epoch

```ml
epoch
```

When constructing this record, `create` supplies `protocol.dispatcher.snapshotState` for this member. Used by `enterGamestate` and `acceptPacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L74)

<a id="field-field-mq3-client-remote-play-live-game-game-src-mq3-client-remote-play-ml-1642898935"></a>
### game

```ml
game
```

When constructing this record, `create` supplies an empty string for this member. Used by `gameDirectory` and `enterGamestate` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L80)

<a id="field-field-mq3-client-remote-play-live-gamestatestarted-gamestatestarted-src-mq3-client-remote-play-ml-2014909427"></a>
### gamestateStarted

```ml
gamestateStarted
```

When constructing this record, `create` supplies `now` for this member. Used by `enterGamestate` and `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L92)

<a id="field-field-mq3-client-remote-play-live-ingress-ingress-src-mq3-client-remote-play-ml-288112159"></a>
### ingress

```ml
ingress
```

When constructing this record, `create` supplies `input` for this member. Used by `updateSendState` and `acceptPacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L57)

<a id="field-field-mq3-client-remote-play-live-lastaccepted-lastaccepted-src-mq3-client-remote-play-ml-2112696893"></a>
### lastAccepted

```ml
lastAccepted
```

When constructing this record, `create` supplies `now` for this member. Used by `acceptPacket` and `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L95)

<a id="field-field-mq3-client-remote-play-live-lastcommandsequence-lastcommandsequence-src-mq3-client-remote-play-ml-1392554859"></a>
### lastCommandSequence

```ml
lastCommandSequence
```

When constructing this record, `create` supplies `0` for this member. Used by `enterGamestate` and `checkServerCommands` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L98)

<a id="field-field-mq3-client-remote-play-live-map-map-src-mq3-client-remote-play-ml-1169225807"></a>
### map

```ml
map
```

When constructing this record, `create` supplies an empty string for this member. Used by `mapName` and `status` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L77)

<a id="field-field-mq3-client-remote-play-live-outgoing-outgoing-src-mq3-client-remote-play-ml-1484839327"></a>
### outgoing

```ml
outgoing
```

When constructing this record, `create` supplies `outgoing` for this member. Used by `updateSendState` and `appendCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L62)

<a id="field-field-mq3-client-remote-play-live-protocol-protocol-src-mq3-client-remote-play-ml-1721588575"></a>
### protocol

```ml
protocol
```

Parser runtime for this live connection; supplies decoded gamestate, snapshots, and server commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L59)

<a id="field-field-mq3-client-remote-play-live-receivebytes-receivebytes-src-mq3-client-remote-play-ml-1584817511"></a>
### receiveBytes

```ml
receiveBytes
```

When constructing this record, `create` supplies `bytes(65535,0)` for this member. Used by `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L68)

<a id="field-field-mq3-client-remote-play-live-receivemetadata-receivemetadata-src-mq3-client-remote-play-ml-2092506523"></a>
### receiveMetadata

```ml
receiveMetadata
```

When constructing this record, `create` supplies `bytes(8,0)` for this member. Used by `pump` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L71)

<a id="field-field-mq3-client-remote-play-live-sendhost-sendhost-src-mq3-client-remote-play-ml-35928307"></a>
### sendHost

```ml
sendHost
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `status` and `writePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L65)

<a id="field-field-mq3-client-remote-play-live-socket-socket-src-mq3-client-remote-play-ml-172674949"></a>
### socket

```ml
socket
```

When constructing this record, `create` supplies `socket` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L48)

<a id="field-field-mq3-client-remote-play-live-verifiedarchive-verifiedarchive-src-mq3-client-remote-play-ml-765982063"></a>
### verifiedArchive

```ml
verifiedArchive
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `approvedArchive` and `enterGamestate` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L86)
