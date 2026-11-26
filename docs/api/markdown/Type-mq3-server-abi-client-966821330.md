# `mq3.server.abi.Client`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-client-struct-client-src-mq3-server-abi-ml-2010157051"></a>
## Client

```ml
struct Client
```

Client record for server.abi, containing `state`, `userinfo`, `reliableCommands`, `reliableSequence`, `reliableAcknowledge`, `reliableSent`, and 36 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L251)

## Members

<a id="field-field-mq3-server-abi-client-challenge-challenge-src-mq3-server-abi-ml-1128488466"></a>
### challenge

```ml
challenge
```

Challenge value used to authenticate a connection attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L270)

<a id="field-field-mq3-server-abi-client-deltamessage-deltamessage-src-mq3-server-abi-ml-2034317888"></a>
### deltaMessage

```ml
deltaMessage
```

Acknowledged snapshot message selected as the base for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L306)

<a id="field-field-mq3-server-abi-client-download-download-src-mq3-server-abi-ml-590762182"></a>
### download

```ml
download
```

Open file handle used by the active asset download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L286)

<a id="field-field-mq3-server-abi-client-downloadblocks-downloadblocks-src-mq3-server-abi-ml-70235738"></a>
### downloadBlocks

```ml
downloadBlocks
```

Ring buffer of payload data for outstanding download blocks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L298)

<a id="field-field-mq3-server-abi-client-downloadblocksize-downloadblocksize-src-mq3-server-abi-ml-527994130"></a>
### downloadBlockSize

```ml
downloadBlockSize
```

Valid byte lengths of blocks retained in the download window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L300)

<a id="field-field-mq3-server-abi-client-downloadclientblock-downloadclientblock-src-mq3-server-abi-ml-1839072658"></a>
### downloadClientBlock

```ml
downloadClientBlock
```

First download block still awaiting client acknowledgment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L292)

<a id="field-field-mq3-server-abi-client-downloadcount-downloadcount-src-mq3-server-abi-ml-974199746"></a>
### downloadCount

```ml
downloadCount
```

Number of download recorded by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L290)

<a id="field-field-mq3-server-abi-client-downloadcurrentblock-downloadcurrentblock-src-mq3-server-abi-ml-1394946970"></a>
### downloadCurrentBlock

```ml
downloadCurrentBlock
```

Index of the next download block to load from the file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L294)

<a id="field-field-mq3-server-abi-client-downloadeof-downloadeof-src-mq3-server-abi-ml-2049330290"></a>
### downloadEOF

```ml
downloadEOF
```

True after the end-of-file marker has been queued for the download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L302)

<a id="field-field-mq3-server-abi-client-downloadname-downloadname-src-mq3-server-abi-ml-1572934532"></a>
### downloadName

```ml
downloadName
```

Requested asset download path, or an empty string when no download is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L284)

<a id="field-field-mq3-server-abi-client-downloadsendtime-downloadsendtime-src-mq3-server-abi-ml-71738988"></a>
### downloadSendTime

```ml
downloadSendTime
```

Server timestamp used to schedule download retransmissions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L304)

<a id="field-field-mq3-server-abi-client-downloadsize-downloadsize-src-mq3-server-abi-ml-554139980"></a>
### downloadSize

```ml
downloadSize
```

Total byte length of the requested download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L288)

<a id="field-field-mq3-server-abi-client-downloadxmitblock-downloadxmitblock-src-mq3-server-abi-ml-931232622"></a>
### downloadXmitBlock

```ml
downloadXmitBlock
```

Index of the next buffered block to transmit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L296)

<a id="field-field-mq3-server-abi-client-frames-frames-src-mq3-server-abi-ml-1483520306"></a>
### frames

```ml
frames
```

Updates can be delta'd from here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L321)

<a id="field-field-mq3-server-abi-client-gamestatemessagenum-gamestatemessagenum-src-mq3-server-abi-ml-650335578"></a>
### gamestateMessageNum

```ml
gamestateMessageNum
```

Outgoing network sequence number of the client gamestate message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L268)

<a id="field-field-mq3-server-abi-client-gentity-gentity-src-mq3-server-abi-ml-1154717450"></a>
### gentity

```ml
gentity
```

Game-VM entity associated with this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L280)

<a id="field-field-mq3-server-abi-client-gotcp-gotcp-src-mq3-server-abi-ml-2038122598"></a>
### gotCP

```ml
gotCP
```

True after the client has sent its pure-server checksum verification command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L331)

<a id="field-field-mq3-server-abi-client-lastclientcommand-lastclientcommand-src-mq3-server-abi-ml-1276549826"></a>
### lastClientCommand

```ml
lastClientCommand
```

Sequence number of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L276)

<a id="field-field-mq3-server-abi-client-lastclientcommandstring-lastclientcommandstring-src-mq3-server-abi-ml-136908206"></a>
### lastClientCommandString

```ml
lastClientCommandString
```

Text of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L278)

<a id="field-field-mq3-server-abi-client-lastconnecttime-lastconnecttime-src-mq3-server-abi-ml-1954689010"></a>
### lastConnectTime

```ml
lastConnectTime
```

Server timestamp when this client connection began, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L313)

<a id="field-field-mq3-server-abi-client-lastmessagenum-lastmessagenum-src-mq3-server-abi-ml-1443596488"></a>
### lastMessageNum

```ml
lastMessageNum
```

Sequence number of the last client message retained for delta handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L274)

<a id="field-field-mq3-server-abi-client-lastpackettime-lastpackettime-src-mq3-server-abi-ml-165011736"></a>
### lastPacketTime

```ml
lastPacketTime
```

Server timestamp of the most recently received client packet, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L311)

<a id="field-field-mq3-server-abi-client-lastusercmd-lastusercmd-src-mq3-server-abi-ml-1339578482"></a>
### lastUsercmd

```ml
lastUsercmd
```

Most recent user-command record received or processed for this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L272)

<a id="field-field-mq3-server-abi-client-messageacknowledge-messageacknowledge-src-mq3-server-abi-ml-1573111100"></a>
### messageAcknowledge

```ml
messageAcknowledge
```

Sequence number of the newest server message acknowledged by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L266)

<a id="field-field-mq3-server-abi-client-name-name-src-mq3-server-abi-ml-199365872"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L282)

<a id="field-field-mq3-server-abi-client-netchan-netchan-src-mq3-server-abi-ml-1025445514"></a>
### netchan

```ml
netchan
```

Sequenced network channel used to exchange this client's packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L333)

<a id="field-field-mq3-server-abi-client-netchanendqueue-netchanendqueue-src-mq3-server-abi-ml-125977210"></a>
### netchanEndQueue

```ml
netchanEndQueue
```

Last queued message waiting for outstanding fragments to finish.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L337)

<a id="field-field-mq3-server-abi-client-netchanstartqueue-netchanstartqueue-src-mq3-server-abi-ml-705906718"></a>
### netchanStartQueue

```ml
netchanStartQueue
```

First queued message waiting for outstanding fragments to finish.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L335)

<a id="field-field-mq3-server-abi-client-nextreliabletime-nextreliabletime-src-mq3-server-abi-ml-1333646650"></a>
### nextReliableTime

```ml
nextReliableTime
```

Millisecond deadline used by active-client command flood protection. Commands received before it can still advance reliable sequencing while game-command dispatch is denied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L309)

<a id="field-field-mq3-server-abi-client-nextsnapshottime-nextsnapshottime-src-mq3-server-abi-ml-415631282"></a>
### nextSnapshotTime

```ml
nextSnapshotTime
```

Earliest server timestamp for sending the next snapshot, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L315)

<a id="field-field-mq3-server-abi-client-ping-ping-src-mq3-server-abi-ml-1246438950"></a>
### ping

```ml
ping
```

Estimated round-trip client latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L323)

<a id="field-field-mq3-server-abi-client-pureauthentic-pureauthentic-src-mq3-server-abi-ml-286588114"></a>
### pureAuthentic

```ml
pureAuthentic
```

True after the client has passed the pure-package authentication check.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L329)

<a id="field-field-mq3-server-abi-client-rate-rate-src-mq3-server-abi-ml-2088677034"></a>
### rate

```ml
rate
```

Maximum client download and snapshot transfer rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L325)

<a id="field-field-mq3-server-abi-client-ratedelayed-ratedelayed-src-mq3-server-abi-ml-374504614"></a>
### rateDelayed

```ml
rateDelayed
```

True when rate limiting postponed the next snapshot beyond its normal interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L317)

<a id="field-field-mq3-server-abi-client-reliableacknowledge-reliableacknowledge-src-mq3-server-abi-ml-1848423386"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Native client-record cursor for reliable server commands acknowledged by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L262)

<a id="field-field-mq3-server-abi-client-reliablecommands-reliablecommands-src-mq3-server-abi-ml-662607686"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L258)

<a id="field-field-mq3-server-abi-client-reliablesent-reliablesent-src-mq3-server-abi-ml-1527568198"></a>
### reliableSent

```ml
reliableSent
```

Sequence number of the newest reliable command transmitted to the peer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L264)

<a id="field-field-mq3-server-abi-client-reliablesequence-reliablesequence-src-mq3-server-abi-ml-97261320"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L260)

<a id="field-field-mq3-server-abi-client-snapshotmsec-snapshotmsec-src-mq3-server-abi-ml-427424822"></a>
### snapshotMsec

```ml
snapshotMsec
```

Requested interval between snapshots, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L327)

<a id="field-field-mq3-server-abi-client-state-state-src-mq3-server-abi-ml-2080516550"></a>
### state

```ml
state
```

Connection lifecycle value that mirrors the native client connection-state field across the server ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L254)

<a id="field-field-mq3-server-abi-client-timeoutcount-timeoutcount-src-mq3-server-abi-ml-801456218"></a>
### timeoutCount

```ml
timeoutCount
```

Consecutive timeout checks exceeded before disconnecting the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L319)

<a id="field-field-mq3-server-abi-client-userinfo-userinfo-src-mq3-server-abi-ml-1163906032"></a>
### userinfo

```ml
userinfo
```

Backslash-delimited client information string, including name and connection settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L256)
