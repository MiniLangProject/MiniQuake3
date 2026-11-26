# `mq3.client.ui_mfield.Field`

[Home](README.md) · [Source file](File-src-mq3-client-ui-mfield-ml-1722706615.md)

<a id="struct-struct-mq3-client-ui-mfield-field-struct-field-src-mq3-client-ui-mfield-ml-1130597417"></a>
## Field

```ml
struct Field
```

Stores UI mfield field record, including `buffer`, `cursor`, `scroll`, `widthInChars`, `maxchars`, `overstrike` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L39)

## Members

<a id="field-field-mq3-client-ui-mfield-field-actions-actions-src-mq3-client-ui-mfield-ml-141132987"></a>
### actions

```ml
actions
```

Host requests queued while editing a text field and drawing its visible text and cursor, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L56)

<a id="field-field-mq3-client-ui-mfield-field-buffer-buffer-src-mq3-client-ui-mfield-ml-112823187"></a>
### buffer

```ml
buffer
```

When constructing this record, `field` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L41)

<a id="field-field-mq3-client-ui-mfield-field-clipboard-clipboard-src-mq3-client-ui-mfield-ml-1874335303"></a>
### clipboard

```ml
clipboard
```

When constructing this record, `field` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L53)

<a id="field-field-mq3-client-ui-mfield-field-cursor-cursor-src-mq3-client-ui-mfield-ml-1607744583"></a>
### cursor

```ml
cursor
```

When constructing this record, `field` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L43)

<a id="field-field-mq3-client-ui-mfield-field-maxchars-maxchars-src-mq3-client-ui-mfield-ml-1643173925"></a>
### maxchars

```ml
maxchars
```

When constructing this record, `field` supplies `maxchars` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L49)

<a id="field-field-mq3-client-ui-mfield-field-overstrike-overstrike-src-mq3-client-ui-mfield-ml-720979863"></a>
### overstrike

```ml
overstrike
```

When constructing this record, `field` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L51)

<a id="field-field-mq3-client-ui-mfield-field-scroll-scroll-src-mq3-client-ui-mfield-ml-1466073089"></a>
### scroll

```ml
scroll
```

When constructing this record, `field` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L45)

<a id="field-field-mq3-client-ui-mfield-field-widthinchars-widthinchars-src-mq3-client-ui-mfield-ml-245464951"></a>
### widthInChars

```ml
widthInChars
```

Number of character columns visible in the editable text or console field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L47)
