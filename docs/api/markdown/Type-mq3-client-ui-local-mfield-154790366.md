# `mq3.client.ui_local.MField`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-mfield-struct-mfield-src-mq3-client-ui-local-ml-1093702931"></a>
## MField

```ml
struct MField
```

Stores UI local m field record, including `cursor`, `scroll`, `widthInChars`, `buffer`, `maxchars`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L178)

## Members

<a id="field-field-mq3-client-ui-local-mfield-buffer-buffer-src-mq3-client-ui-local-ml-935831868"></a>
### buffer

```ml
buffer
```

Compatibility member corresponding to native `mfield_t.buffer`; the original declaration is `char buffer[MAX_EDIT_LINE]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L189)

<a id="field-field-mq3-client-ui-local-mfield-cursor-cursor-src-mq3-client-ui-local-ml-532912316"></a>
### cursor

```ml
cursor
```

Compatibility member corresponding to native `mfield_t.cursor`; the original declaration is `int cursor`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L181)

<a id="field-field-mq3-client-ui-local-mfield-maxchars-maxchars-src-mq3-client-ui-local-ml-1729081798"></a>
### maxchars

```ml
maxchars
```

Compatibility member corresponding to native `mfield_t.maxchars`; the original declaration is `int maxchars`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L192)

<a id="field-field-mq3-client-ui-local-mfield-scroll-scroll-src-mq3-client-ui-local-ml-1888316750"></a>
### scroll

```ml
scroll
```

Compatibility member corresponding to native `mfield_t.scroll`; the original declaration is `int scroll`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L184)

<a id="field-field-mq3-client-ui-local-mfield-widthinchars-widthinchars-src-mq3-client-ui-local-ml-438903828"></a>
### widthInChars

```ml
widthInChars
```

Number of character columns visible in the editable text or console field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L186)
