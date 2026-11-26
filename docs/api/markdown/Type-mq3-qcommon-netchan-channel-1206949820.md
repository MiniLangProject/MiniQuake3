# `mq3.qcommon.netchan.Channel`

[Home](README.md) · [Source file](File-src-mq3-qcommon-netchan-ml-1381353623.md)

<a id="struct-struct-mq3-qcommon-netchan-channel-struct-channel-src-mq3-qcommon-netchan-ml-1836688453"></a>
## Channel

```ml
struct Channel
```

Channel record for qcommon.netchan, containing `sock`, `dropped`, `remoteAddress`, `qport`, `incomingSequence`, `outgoingSequence`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L46)

## Members

<a id="field-field-mq3-qcommon-netchan-channel-dropped-dropped-src-mq3-qcommon-netchan-ml-128515278"></a>
### dropped

```ml
dropped
```

Number of missing sequence numbers between the previous and current accepted packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L50)

<a id="field-field-mq3-qcommon-netchan-channel-fragmentbuffer-fragmentbuffer-src-mq3-qcommon-netchan-ml-705782982"></a>
### fragmentBuffer

```ml
fragmentBuffer
```

Storage used to reassemble one incoming fragmented network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L64)

<a id="field-field-mq3-qcommon-netchan-channel-fragmentlength-fragmentlength-src-mq3-qcommon-netchan-ml-1473756282"></a>
### fragmentLength

```ml
fragmentLength
```

Number of bytes accumulated in the incoming fragment buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L62)

<a id="field-field-mq3-qcommon-netchan-channel-fragmentsequence-fragmentsequence-src-mq3-qcommon-netchan-ml-1958325008"></a>
### fragmentSequence

```ml
fragmentSequence
```

Sequence number of the incoming message currently being reassembled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L60)

<a id="field-field-mq3-qcommon-netchan-channel-incomingsequence-incomingsequence-src-mq3-qcommon-netchan-ml-2119673656"></a>
### incomingSequence

```ml
incomingSequence
```

Sequence number of the most recently accepted incoming network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L56)

<a id="field-field-mq3-qcommon-netchan-channel-outgoingsequence-outgoingsequence-src-mq3-qcommon-netchan-ml-763333492"></a>
### outgoingSequence

```ml
outgoingSequence
```

Sequence number to place on the next outgoing network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L58)

<a id="field-field-mq3-qcommon-netchan-channel-qport-qport-src-mq3-qcommon-netchan-ml-1736300150"></a>
### qport

```ml
qport
```

Client-selected virtual port used to recognize a connection across address translation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L54)

<a id="field-field-mq3-qcommon-netchan-channel-remoteaddress-remoteaddress-src-mq3-qcommon-netchan-ml-1011263806"></a>
### remoteAddress

```ml
remoteAddress
```

Remote endpoint to which this channel sends sequenced messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L52)

<a id="field-field-mq3-qcommon-netchan-channel-sock-sock-src-mq3-qcommon-netchan-ml-1140941738"></a>
### sock

```ml
sock
```

Selector identifying the client-side or server-side network socket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L48)

<a id="field-field-mq3-qcommon-netchan-channel-unsentbuffer-unsentbuffer-src-mq3-qcommon-netchan-ml-791384348"></a>
### unsentBuffer

```ml
unsentBuffer
```

Complete outgoing payload retained until all fragments have been sent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L72)

<a id="field-field-mq3-qcommon-netchan-channel-unsentfragments-unsentfragments-src-mq3-qcommon-netchan-ml-1369025878"></a>
### unsentFragments

```ml
unsentFragments
```

True while a large outgoing message still has fragments to transmit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L66)

<a id="field-field-mq3-qcommon-netchan-channel-unsentfragmentstart-unsentfragmentstart-src-mq3-qcommon-netchan-ml-754302778"></a>
### unsentFragmentStart

```ml
unsentFragmentStart
```

Byte offset of the next outgoing fragment within that message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L68)

<a id="field-field-mq3-qcommon-netchan-channel-unsentlength-unsentlength-src-mq3-qcommon-netchan-ml-600384980"></a>
### unsentLength

```ml
unsentLength
```

Total byte length of the outgoing message being fragmented.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L70)
