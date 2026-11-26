# `mq3.client.playable_viewmodel.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-viewmodel-ml-1609227520.md)

<a id="struct-struct-mq3-client-playable-viewmodel-catalog-struct-catalog-src-mq3-client-playable-viewmodel-ml-725673857"></a>
## Catalog

```ml
struct Catalog
```

Stores playable viewmodel catalog record, including `attachments`, `skipped`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L95)

## Members

<a id="field-field-mq3-client-playable-viewmodel-catalog-attachments-attachments-src-mq3-client-playable-viewmodel-ml-1104251596"></a>
### attachments

```ml
attachments
```

When constructing this record, `loadCatalog` supplies an empty list for this member. Used by `findAttachment` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L98)

<a id="field-field-mq3-client-playable-viewmodel-catalog-skipped-skipped-src-mq3-client-playable-viewmodel-ml-1491404956"></a>
### skipped

```ml
skipped
```

When constructing this record, `loadCatalog` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_viewmodel.ml#L100)
