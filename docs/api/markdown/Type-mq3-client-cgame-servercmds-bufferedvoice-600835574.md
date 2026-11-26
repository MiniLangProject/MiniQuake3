# `mq3.client.cgame_servercmds.BufferedVoice`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-bufferedvoice-struct-bufferedvoice-src-mq3-client-cgame-servercmds-ml-670606215"></a>
## BufferedVoice

```ml
struct BufferedVoice
```

Stores client game servercmds buffered voice record, including `clientNum`, `sound`, `voiceOnly`, `cmd`, `message`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L197)

## Members

<a id="field-field-mq3-client-cgame-servercmds-bufferedvoice-clientnum-clientnum-src-mq3-client-cgame-servercmds-ml-1423543568"></a>
### clientNum

```ml
clientNum
```

Client slot of the speaker associated with this queued voice-chat message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L199)

<a id="field-field-mq3-client-cgame-servercmds-bufferedvoice-cmd-cmd-src-mq3-client-cgame-servercmds-ml-100657176"></a>
### cmd

```ml
cmd
```

When constructing this record, `voiceChatLocal` supplies `cmd` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L205)

<a id="field-field-mq3-client-cgame-servercmds-bufferedvoice-message-message-src-mq3-client-cgame-servercmds-ml-1247521920"></a>
### message

```ml
message
```

When constructing this record, `voiceChatLocal` supplies `message` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L207)

<a id="field-field-mq3-client-cgame-servercmds-bufferedvoice-sound-sound-src-mq3-client-cgame-servercmds-ml-1283977360"></a>
### sound

```ml
sound
```

Voice sound resource queued together with its speaker and chat message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L201)

<a id="field-field-mq3-client-cgame-servercmds-bufferedvoice-voiceonly-voiceonly-src-mq3-client-cgame-servercmds-ml-899615568"></a>
### voiceOnly

```ml
voiceOnly
```

When constructing this record, `voiceChatLocal` supplies `voiceOnly` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L203)
