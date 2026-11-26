# `mq3.client.playable_viewmodel.Attachment`

[Home](README.md) · [Source file](File-src-mq3-client-playable-viewmodel-ml-1609227520.md)

<a id="struct-struct-mq3-client-playable-viewmodel-attachment-struct-attachment-src-mq3-client-playable-viewmodel-ml-304004921"></a>
## Attachment

```ml
struct Attachment
```

Stores playable viewmodel attachment record, including `classname`, `path`, `frames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L85)

## Members

<a id="field-field-mq3-client-playable-viewmodel-attachment-classname-classname-src-mq3-client-playable-viewmodel-ml-1565597170"></a>
### classname

```ml
classname
```

Weapon classname identifying the first-person model attachment being prepared.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L87)

<a id="field-field-mq3-client-playable-viewmodel-attachment-frames-frames-src-mq3-client-playable-viewmodel-ml-151501086"></a>
### frames

```ml
frames
```

When constructing this record, `loadCatalog` supplies `model.tags` for this member. Used by `attachmentTag` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L92)

<a id="field-field-mq3-client-playable-viewmodel-attachment-path-path-src-mq3-client-playable-viewmodel-ml-1714699568"></a>
### path

```ml
path
```

When constructing this record, `loadCatalog` supplies `path` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L89)
