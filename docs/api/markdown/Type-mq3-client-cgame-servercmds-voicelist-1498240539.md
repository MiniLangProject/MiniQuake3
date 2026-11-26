# `mq3.client.cgame_servercmds.VoiceList`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-voicelist-struct-voicelist-src-mq3-client-cgame-servercmds-ml-1074811165"></a>
## VoiceList

```ml
struct VoiceList
```

Stores client game servercmds voice list record, including `name`, `gender`, `chats`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L181)

## Members

<a id="field-field-mq3-client-cgame-servercmds-voicelist-chats-chats-src-mq3-client-cgame-servercmds-ml-1283147815"></a>
### chats

```ml
chats
```

When constructing this record, `parseVoiceChats` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L187)

<a id="field-field-mq3-client-cgame-servercmds-voicelist-gender-gender-src-mq3-client-cgame-servercmds-ml-188061201"></a>
### gender

```ml
gender
```

Model gender used when selecting gender-specific player sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L185)

<a id="field-field-mq3-client-cgame-servercmds-voicelist-name-name-src-mq3-client-cgame-servercmds-ml-667763329"></a>
### name

```ml
name
```

Voice-script list name used to select the matching voice-chat definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L183)
