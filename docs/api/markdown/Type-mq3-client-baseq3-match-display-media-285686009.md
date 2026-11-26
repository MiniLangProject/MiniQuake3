# `mq3.client.baseq3_match_display.Media`

[Home](README.md) · [Source file](File-src-mq3-client-baseq3-match-display-ml-1367704051.md)

<a id="struct-struct-mq3-client-baseq3-match-display-media-struct-media-src-mq3-client-baseq3-match-display-ml-1916321733"></a>
## Media

```ml
struct Media
```

Stores base Quake III match display media record, including `imageName`, `image`, `slot`, `glyphBatch`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L35)

## Members

<a id="field-field-mq3-client-baseq3-match-display-media-glyphbatch-glyphbatch-src-mq3-client-baseq3-match-display-ml-1773013009"></a>
### glyphBatch

```ml
glyphBatch
```

When constructing this record, `load` supplies an absent (`void`) value for this member. Used by `beginGlyphBatch` and `reserveGlyphBatch` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L45)

<a id="field-field-mq3-client-baseq3-match-display-media-image-image-src-mq3-client-baseq3-match-display-ml-117167153"></a>
### image

```ml
image
```

When constructing this record, `load` supplies `loaded[1]` for this member. Used by `upload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L40)

<a id="field-field-mq3-client-baseq3-match-display-media-imagename-imagename-src-mq3-client-baseq3-match-display-ml-363809857"></a>
### imageName

```ml
imageName
```

Resolved font-atlas image path used to draw match messages and score overlays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L37)

<a id="field-field-mq3-client-baseq3-match-display-media-slot-slot-src-mq3-client-baseq3-match-display-ml-1070368393"></a>
### slot

```ml
slot
```

Texture or media-cache slot assigned to this asset for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L42)
