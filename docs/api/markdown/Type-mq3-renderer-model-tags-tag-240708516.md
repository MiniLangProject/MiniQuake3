# `mq3.renderer.model_tags.Tag`

[Home](README.md) · [Source file](File-src-mq3-renderer-model-tags-ml-707870696.md)

<a id="struct-struct-mq3-renderer-model-tags-tag-struct-tag-src-mq3-renderer-model-tags-ml-1674921083"></a>
## Tag

```ml
struct Tag
```

Data record for `mq3.renderer.model_tags.Tag`; groups `name`, `origin`, `axis`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L10)

## Members

<a id="field-field-mq3-renderer-model-tags-tag-axis-axis-src-mq3-renderer-model-tags-ml-520917287"></a>
### axis

```ml
axis
```

Attachment-tag basis vectors stored for one MD3 model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L16)

<a id="field-field-mq3-renderer-model-tags-tag-name-name-src-mq3-renderer-model-tags-ml-1884220583"></a>
### name

```ml
name
```

MD3 attachment label used to locate a tag such as tag_torso or tag_weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L12)

<a id="field-field-mq3-renderer-model-tags-tag-origin-origin-src-mq3-renderer-model-tags-ml-1798116121"></a>
### origin

```ml
origin
```

Attachment-tag translation in the coordinate system of its MD3 model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/model_tags.ml#L14)
