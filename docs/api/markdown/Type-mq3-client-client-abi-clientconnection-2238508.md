# `mq3.client.client_abi.ClientConnection`

[Home](README.md) · [Source file](File-src-mq3-client-client-abi-ml-362324391.md)

<a id="struct-struct-mq3-client-client-abi-clientconnection-struct-clientconnection-src-mq3-client-client-abi-ml-259599999"></a>
## ClientConnection

```ml
struct ClientConnection
```

Stores client ABI client connection record, including `clientNum`, `lastPacketSentTime`, `lastPacketTime`, `serverAddress`, `connectTime`, `connectPacketCount` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L101)

## Members

<a id="field-field-mq3-client-client-abi-clientconnection-challenge-challenge-src-mq3-client-client-abi-ml-1072914650"></a>
### challenge

```ml
challenge
```

Server-issued challenge token used to validate the connection handshake.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L117)

<a id="field-field-mq3-client-client-abi-clientconnection-checksumfeed-checksumfeed-src-mq3-client-client-abi-ml-1478280608"></a>
### checksumFeed

```ml
checksumFeed
```

Server-provided seed used when calculating the client's content checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L119)

<a id="field-field-mq3-client-client-abi-clientconnection-clientnum-clientnum-src-mq3-client-client-abi-ml-15989614"></a>
### clientNum

```ml
clientNum
```

Server-assigned local client slot retained for the current connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L103)

<a id="field-field-mq3-client-client-abi-clientconnection-connectpacketcount-connectpacketcount-src-mq3-client-client-abi-ml-234677156"></a>
### connectPacketCount

```ml
connectPacketCount
```

Number of connection-handshake packets sent, also used by progress displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L113)

<a id="field-field-mq3-client-client-abi-clientconnection-connecttime-connecttime-src-mq3-client-client-abi-ml-1854631978"></a>
### connectTime

```ml
connectTime
```

Timestamp of the most recent connection attempt or handshake retransmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L111)

<a id="field-field-mq3-client-client-abi-clientconnection-demofile-demofile-src-mq3-client-client-abi-ml-628841628"></a>
### demofile

```ml
demofile
```

Compatibility member corresponding to native `clientConnection_t.demofile`; the original declaration is `fileHandle_t demofile`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L174)

<a id="field-field-mq3-client-client-abi-clientconnection-demoname-demoname-src-mq3-client-client-abi-ml-1874114310"></a>
### demoName

```ml
demoName
```

Virtual demo filename associated with the current recording or playback operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L157)

<a id="field-field-mq3-client-client-abi-clientconnection-demoplaying-demoplaying-src-mq3-client-client-abi-ml-1057086766"></a>
### demoplaying

```ml
demoplaying
```

Compatibility member corresponding to native `clientConnection_t.demoplaying`; the original declaration is `qboolean demoplaying`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L166)

<a id="field-field-mq3-client-client-abi-clientconnection-demorecording-demorecording-src-mq3-client-client-abi-ml-1713810954"></a>
### demorecording

```ml
demorecording
```

Compatibility member corresponding to native `clientConnection_t.demorecording`; the original declaration is `qboolean demorecording`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L163)

<a id="field-field-mq3-client-client-abi-clientconnection-demowaiting-demowaiting-src-mq3-client-client-abi-ml-1911183770"></a>
### demowaiting

```ml
demowaiting
```

True until a full snapshot permits demo recording to begin safely.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L168)

<a id="field-field-mq3-client-client-abi-clientconnection-download-download-src-mq3-client-client-abi-ml-350374046"></a>
### download

```ml
download
```

Compatibility member corresponding to native `clientConnection_t.download`; the original declaration is `fileHandle_t download`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L136)

<a id="field-field-mq3-client-client-abi-clientconnection-downloadblock-downloadblock-src-mq3-client-client-abi-ml-265138986"></a>
### downloadBlock

```ml
downloadBlock
```

Download-block number the client is currently waiting to receive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L147)

<a id="field-field-mq3-client-client-abi-clientconnection-downloadcount-downloadcount-src-mq3-client-client-abi-ml-1402780058"></a>
### downloadCount

```ml
downloadCount
```

Number of bytes accumulated for the active download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L149)

<a id="field-field-mq3-client-client-abi-clientconnection-downloadlist-downloadlist-src-mq3-client-client-abi-ml-725109226"></a>
### downloadList

```ml
downloadList
```

Package names queued for download from the connected server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L153)

<a id="field-field-mq3-client-client-abi-clientconnection-downloadname-downloadname-src-mq3-client-client-abi-ml-147222156"></a>
### downloadName

```ml
downloadName
```

Compatibility member corresponding to native `clientConnection_t.downloadName`; the original declaration is `char downloadName[MAX_OSPATH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L142)

<a id="field-field-mq3-client-client-abi-clientconnection-downloadnumber-downloadnumber-src-mq3-client-client-abi-ml-1216553056"></a>
### downloadNumber

```ml
downloadNumber
```

Compatibility member corresponding to native `clientConnection_t.downloadNumber`; the original declaration is `int downloadNumber`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L145)

<a id="field-field-mq3-client-client-abi-clientconnection-downloadrestart-downloadrestart-src-mq3-client-client-abi-ml-1934543334"></a>
### downloadRestart

```ml
downloadRestart
```

True when a completed package download requires a filesystem restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L155)

<a id="field-field-mq3-client-client-abi-clientconnection-downloadsize-downloadsize-src-mq3-client-client-abi-ml-317803732"></a>
### downloadSize

```ml
downloadSize
```

Expected total size in bytes of the active download.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L151)

<a id="field-field-mq3-client-client-abi-clientconnection-downloadtempname-downloadtempname-src-mq3-client-client-abi-ml-1276128328"></a>
### downloadTempName

```ml
downloadTempName
```

Compatibility member corresponding to native `clientConnection_t.downloadTempName`; the original declaration is `char downloadTempName[MAX_OSPATH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L139)

<a id="field-field-mq3-client-client-abi-clientconnection-firstdemoframeskipped-firstdemoframeskipped-src-mq3-client-client-abi-ml-379438090"></a>
### firstDemoFrameSkipped

```ml
firstDemoFrameSkipped
```

Compatibility member corresponding to native `clientConnection_t.firstDemoFrameSkipped`; the original declaration is `qboolean firstDemoFrameSkipped`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L171)

<a id="field-field-mq3-client-client-abi-clientconnection-lastexecutedservercommand-lastexecutedservercommand-src-mq3-client-client-abi-ml-1957814234"></a>
### lastExecutedServerCommand

```ml
lastExecutedServerCommand
```

Highest server-command sequence already retrieved or executed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L131)

<a id="field-field-mq3-client-client-abi-clientconnection-lastpacketsenttime-lastpacketsenttime-src-mq3-client-client-abi-ml-465820892"></a>
### lastPacketSentTime

```ml
lastPacketSentTime
```

Client timestamp of the latest outgoing packet, used to schedule retransmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L105)

<a id="field-field-mq3-client-client-abi-clientconnection-lastpackettime-lastpackettime-src-mq3-client-client-abi-ml-449674144"></a>
### lastPacketTime

```ml
lastPacketTime
```

Client timestamp of the latest received server packet, used to detect timeouts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L107)

<a id="field-field-mq3-client-client-abi-clientconnection-netchan-netchan-src-mq3-client-client-abi-ml-1568477298"></a>
### netchan

```ml
netchan
```

Compatibility member corresponding to native `clientConnection_t.netchan`; the original declaration is `netchan_t netchan`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L183)

<a id="field-field-mq3-client-client-abi-clientconnection-reliableacknowledge-reliableacknowledge-src-mq3-client-client-abi-ml-858218418"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Highest reliable-command sequence acknowledged as executed by the peer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L123)

<a id="field-field-mq3-client-client-abi-clientconnection-reliablecommands-reliablecommands-src-mq3-client-client-abi-ml-1356116558"></a>
### reliableCommands

```ml
reliableCommands
```

Ring of reliable command strings awaiting acknowledgement or execution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L125)

<a id="field-field-mq3-client-client-abi-clientconnection-reliablesequence-reliablesequence-src-mq3-client-client-abi-ml-1955526200"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number assigned to the latest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L121)

<a id="field-field-mq3-client-client-abi-clientconnection-serveraddress-serveraddress-src-mq3-client-client-abi-ml-902027118"></a>
### serverAddress

```ml
serverAddress
```

Network endpoint of the server selected for this connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L109)

<a id="field-field-mq3-client-client-abi-clientconnection-servercommands-servercommands-src-mq3-client-client-abi-ml-12456540"></a>
### serverCommands

```ml
serverCommands
```

Reliable server commands retained for ordered execution by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L133)

<a id="field-field-mq3-client-client-abi-clientconnection-servercommandsequence-servercommandsequence-src-mq3-client-client-abi-ml-1249622042"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Latest reliable server-command sequence received on this client connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L129)

<a id="field-field-mq3-client-client-abi-clientconnection-servermessage-servermessage-src-mq3-client-client-abi-ml-145892042"></a>
### serverMessage

```ml
serverMessage
```

Status or error text received during the server connection handshake.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L115)

<a id="field-field-mq3-client-client-abi-clientconnection-servermessagesequence-servermessagesequence-src-mq3-client-client-abi-ml-459677942"></a>
### serverMessageSequence

```ml
serverMessageSequence
```

Highest server network-message sequence observed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L127)

<a id="field-field-mq3-client-client-abi-clientconnection-spdemorecording-spdemorecording-src-mq3-client-client-abi-ml-1806729794"></a>
### spDemoRecording

```ml
spDemoRecording
```

Compatibility member corresponding to native `clientConnection_t.spDemoRecording`; the original declaration is `qboolean spDemoRecording`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L160)

<a id="field-field-mq3-client-client-abi-clientconnection-timedemobasetime-timedemobasetime-src-mq3-client-client-abi-ml-1246742562"></a>
### timeDemoBaseTime

```ml
timeDemoBaseTime
```

Base server time from which fixed-step timed-demo frames are calculated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L180)

<a id="field-field-mq3-client-client-abi-clientconnection-timedemoframes-timedemoframes-src-mq3-client-client-abi-ml-1094208462"></a>
### timeDemoFrames

```ml
timeDemoFrames
```

Number of frames rendered during the timed-demo measurement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L176)

<a id="field-field-mq3-client-client-abi-clientconnection-timedemostart-timedemostart-src-mq3-client-client-abi-ml-867480522"></a>
### timeDemoStart

```ml
timeDemoStart
```

Client realtime timestamp at the beginning of the timed-demo measurement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L178)
