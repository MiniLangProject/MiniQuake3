# `mq3.client.cgame_servercmds.VoiceChat`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-voicechat-struct-voicechat-src-mq3-client-cgame-servercmds-ml-1301109593"></a>
## VoiceChat

```ml
struct VoiceChat
```

Stores client game servercmds voice chat record, including `id`, `variants`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L174)

## Members

<a id="field-field-mq3-client-cgame-servercmds-voicechat-id-id-src-mq3-client-cgame-servercmds-ml-1241209683"></a>
### id

```ml
id
```

Voice-chat command identifier used to find the requested sound and text alternatives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L176)

<a id="field-field-mq3-client-cgame-servercmds-voicechat-variants-variants-src-mq3-client-cgame-servercmds-ml-243810997"></a>
### variants

```ml
variants
```

When constructing this record, `parseVoiceChats` supplies `variants` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_servercmds.ml#L178)
