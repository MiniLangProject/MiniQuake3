# `mq3.client.baseq3_console_background.Media`

[Home](README.md) · [Source file](File-src-mq3-client-baseq3-console-background-ml-1394936477.md)

<a id="struct-struct-mq3-client-baseq3-console-background-media-struct-media-src-mq3-client-baseq3-console-background-ml-1388600785"></a>
## Media

```ml
struct Media
```

Stores base Quake III console background media record, including `shaderName`, `layers`, `firstTextureSlot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L30)

## Members

<a id="field-field-mq3-client-baseq3-console-background-media-firsttextureslot-firsttextureslot-src-mq3-client-baseq3-console-background-ml-1685785685"></a>
### firstTextureSlot

```ml
firstTextureSlot
```

First texture-cache slot reserved for this module's media resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L37)

<a id="field-field-mq3-client-baseq3-console-background-media-layers-layers-src-mq3-client-baseq3-console-background-ml-1495142575"></a>
### layers

```ml
layers
```

When constructing this record, `load` supplies `layers` for this member. Used by `upload` and `release` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L35)

<a id="field-field-mq3-client-baseq3-console-background-media-shadername-shadername-src-mq3-client-baseq3-console-background-ml-2099058283"></a>
### shaderName

```ml
shaderName
```

Virtual shader name used to register or resolve the displayed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/baseq3_console_background.ml#L32)
