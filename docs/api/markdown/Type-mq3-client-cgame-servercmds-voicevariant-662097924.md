# `mq3.client.cgame_servercmds.VoiceVariant`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-voicevariant-struct-voicevariant-src-mq3-client-cgame-servercmds-ml-27574831"></a>
## VoiceVariant

```ml
struct VoiceVariant
```

Stores client game servercmds voice variant record, including `sound`, `chat`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L167)

## Members

<a id="field-field-mq3-client-cgame-servercmds-voicevariant-chat-chat-src-mq3-client-cgame-servercmds-ml-1121978102"></a>
### chat

```ml
chat
```

When constructing this record, `parseVoiceChats` supplies `chat` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L171)

<a id="field-field-mq3-client-cgame-servercmds-voicevariant-sound-sound-src-mq3-client-cgame-servercmds-ml-1254983666"></a>
### sound

```ml
sound
```

Registered voice sound, or its virtual asset path when no sound-registration callback is supplied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L169)
