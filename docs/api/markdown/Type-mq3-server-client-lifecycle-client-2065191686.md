# `mq3.server.client_lifecycle.Client`

[Home](README.md) · [Source file](File-src-mq3-server-client-lifecycle-ml-743240113.md)

<a id="struct-struct-mq3-server-client-lifecycle-client-struct-client-src-mq3-server-client-lifecycle-ml-52670399"></a>
## Client

```ml
struct Client
```

Client record for server.client_lifecycle, containing `state`, `name`, `userinfo`, `addressText`, `lan`, `local`, and 17 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L39)

## Members

<a id="field-field-mq3-server-client-lifecycle-client-addresstext-addresstext-src-mq3-server-client-lifecycle-ml-2076924054"></a>
### addressText

```ml
addressText
```

Formatted network address retained in the client information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L48)

<a id="field-field-mq3-server-client-lifecycle-client-bot-bot-src-mq3-server-client-lifecycle-ml-1665501534"></a>
### bot

```ml
bot
```

True when the client slot is controlled by an in-process bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L54)

<a id="field-field-mq3-server-client-lifecycle-client-deltamessage-deltamessage-src-mq3-server-client-lifecycle-ml-1073149216"></a>
### deltaMessage

```ml
deltaMessage
```

Acknowledged snapshot message selected as the base for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L64)

<a id="field-field-mq3-server-client-lifecycle-client-downloadname-downloadname-src-mq3-server-client-lifecycle-ml-2077025500"></a>
### downloadName

```ml
downloadName
```

Requested asset download path, or an empty string when no download is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L86)

<a id="field-field-mq3-server-client-lifecycle-client-gamestatemessagenum-gamestatemessagenum-src-mq3-server-client-lifecycle-ml-1500348658"></a>
### gamestateMessageNum

```ml
gamestateMessageNum
```

Outgoing network sequence number of the client gamestate message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L72)

<a id="field-field-mq3-server-client-lifecycle-client-gentitynumber-gentitynumber-src-mq3-server-client-lifecycle-ml-1555054698"></a>
### gentityNumber

```ml
gentityNumber
```

Index of the client's entity in the game VM entity array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L56)

<a id="field-field-mq3-server-client-lifecycle-client-gotcp-gotcp-src-mq3-server-client-lifecycle-ml-1686770294"></a>
### gotCP

```ml
gotCP
```

True after the client has sent its pure-server checksum verification command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L70)

<a id="field-field-mq3-server-client-lifecycle-client-lan-lan-src-mq3-server-client-lifecycle-ml-652700798"></a>
### lan

```ml
lan
```

True when this connection is classified as belonging to the local network.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L50)

<a id="field-field-mq3-server-client-lifecycle-client-lastclientcommand-lastclientcommand-src-mq3-server-client-lifecycle-ml-1983985818"></a>
### lastClientCommand

```ml
lastClientCommand
```

Sequence number of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L76)

<a id="field-field-mq3-server-client-lifecycle-client-lastusercmd-lastusercmd-src-mq3-server-client-lifecycle-ml-1008647322"></a>
### lastUsercmd

```ml
lastUsercmd
```

Most recent user-command record received or processed for this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L66)

<a id="field-field-mq3-server-client-lifecycle-client-local-local-src-mq3-server-client-lifecycle-ml-525687666"></a>
### local

```ml
local
```

True when this connection or destination is local to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L52)

<a id="field-field-mq3-server-client-lifecycle-client-name-name-src-mq3-server-client-lifecycle-ml-1129796112"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L44)

<a id="field-field-mq3-server-client-lifecycle-client-nextsnapshottime-nextsnapshottime-src-mq3-server-client-lifecycle-ml-773471850"></a>
### nextSnapshotTime

```ml
nextSnapshotTime
```

Earliest server timestamp for sending the next snapshot, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L62)

<a id="field-field-mq3-server-client-lifecycle-client-outgoingsequence-outgoingsequence-src-mq3-server-client-lifecycle-ml-2044051492"></a>
### outgoingSequence

```ml
outgoingSequence
```

Sequence number to place on the next outgoing network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L74)

<a id="field-field-mq3-server-client-lifecycle-client-pureauthentic-pureauthentic-src-mq3-server-client-lifecycle-ml-332911386"></a>
### pureAuthentic

```ml
pureAuthentic
```

True after the client has passed the pure-package authentication check.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L68)

<a id="field-field-mq3-server-client-lifecycle-client-rate-rate-src-mq3-server-client-lifecycle-ml-1937010210"></a>
### rate

```ml
rate
```

Maximum client download and snapshot transfer rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L58)

<a id="field-field-mq3-server-client-lifecycle-client-reliableacknowledge-reliableacknowledge-src-mq3-server-client-lifecycle-ml-1678310290"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Acknowledged reliable sequence preserved while managing client entry and disconnection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L80)

<a id="field-field-mq3-server-client-lifecycle-client-reliablecommands-reliablecommands-src-mq3-server-client-lifecycle-ml-157892086"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L84)

<a id="field-field-mq3-server-client-lifecycle-client-reliablesent-reliablesent-src-mq3-server-client-lifecycle-ml-423051990"></a>
### reliableSent

```ml
reliableSent
```

Sequence number of the newest reliable command transmitted to the peer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L82)

<a id="field-field-mq3-server-client-lifecycle-client-reliablesequence-reliablesequence-src-mq3-server-client-lifecycle-ml-1297757976"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L78)

<a id="field-field-mq3-server-client-lifecycle-client-snapshotmsec-snapshotmsec-src-mq3-server-client-lifecycle-ml-300722758"></a>
### snapshotMsec

```ml
snapshotMsec
```

Requested interval between snapshots, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L60)

<a id="field-field-mq3-server-client-lifecycle-client-state-state-src-mq3-server-client-lifecycle-ml-1371856022"></a>
### state

```ml
state
```

Connection lifecycle value that records progression through connection, world entry, and disconnection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L42)

<a id="field-field-mq3-server-client-lifecycle-client-userinfo-userinfo-src-mq3-server-client-lifecycle-ml-2120945072"></a>
### userinfo

```ml
userinfo
```

Backslash-delimited client information string, including name and connection settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_lifecycle.ml#L46)
