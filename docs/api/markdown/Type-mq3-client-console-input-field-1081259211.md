# `mq3.client.console_input.Field`

[Home](README.md) · [Source file](File-src-mq3-client-console-input-ml-896040399.md)

<a id="struct-struct-mq3-client-console-input-field-struct-field-src-mq3-client-console-input-ml-1879958105"></a>
## Field

```ml
struct Field
```

Stores console input field record, including `cursor`, `scroll`, `widthInChars`, `text`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L63)

## Members

<a id="field-field-mq3-client-console-input-field-cursor-cursor-src-mq3-client-console-input-ml-1909979315"></a>
### cursor

```ml
cursor
```

When constructing this record, `field` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L65)

<a id="field-field-mq3-client-console-input-field-scroll-scroll-src-mq3-client-console-input-ml-125185393"></a>
### scroll

```ml
scroll
```

When constructing this record, `field` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L67)

<a id="field-field-mq3-client-console-input-field-text-text-src-mq3-client-console-input-ml-1303856593"></a>
### text

```ml
text
```

Editable or accumulated console text retained for drawing and command submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L71)

<a id="field-field-mq3-client-console-input-field-widthinchars-widthinchars-src-mq3-client-console-input-ml-739995987"></a>
### widthInChars

```ml
widthInChars
```

Number of character columns visible in the editable text or console field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input.ml#L69)
