# `mq3.client.console_input_display.Presentation`

[Home](README.md) · [Source file](File-src-mq3-client-console-input-display-ml-1771363644.md)

<a id="struct-struct-mq3-client-console-input-display-presentation-struct-presentation-src-mq3-client-console-input-display-ml-85694655"></a>
## Presentation

```ml
struct Presentation
```

Stores console input display presentation record, including `active`, `kind`, `text`, `x`, `y`, `panelTop` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L12)

## Members

<a id="field-field-mq3-client-console-input-display-presentation-active-active-src-mq3-client-console-input-display-ml-595673693"></a>
### active

```ml
active
```

When constructing this record, `present` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L14)

<a id="field-field-mq3-client-console-input-display-presentation-kind-kind-src-mq3-client-console-input-display-ml-1761437853"></a>
### kind

```ml
kind
```

Drawing primitive or presentation category selecting how this record is rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L16)

<a id="field-field-mq3-client-console-input-display-presentation-panelbottom-panelbottom-src-mq3-client-console-input-display-ml-422020205"></a>
### panelBottom

```ml
panelBottom
```

When constructing this record, `present` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L26)

<a id="field-field-mq3-client-console-input-display-presentation-paneltop-paneltop-src-mq3-client-console-input-display-ml-2048357867"></a>
### panelTop

```ml
panelTop
```

When constructing this record, `present` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L24)

<a id="field-field-mq3-client-console-input-display-presentation-text-text-src-mq3-client-console-input-display-ml-1473996803"></a>
### text

```ml
text
```

Visible console or chat input string, including the prompt and cursor marker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L18)

<a id="field-field-mq3-client-console-input-display-presentation-x-x-src-mq3-client-console-input-display-ml-1165159933"></a>
### x

```ml
x
```

Horizontal coordinate of the visible console or chat input text in the target display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L20)

<a id="field-field-mq3-client-console-input-display-presentation-y-y-src-mq3-client-console-input-display-ml-2145181937"></a>
### y

```ml
y
```

Vertical coordinate of the visible console or chat input text in the target display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L22)
