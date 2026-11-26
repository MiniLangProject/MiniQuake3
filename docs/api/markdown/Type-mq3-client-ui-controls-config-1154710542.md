# `mq3.client.ui_controls.Config`

[Home](README.md) · [Source file](File-src-mq3-client-ui-controls-ml-1689765730.md)

<a id="struct-struct-mq3-client-ui-controls-config-struct-config-src-mq3-client-ui-controls-ml-667910775"></a>
## Config

```ml
struct Config
```

Stores UI controls config record, including `name`, `defaultValue`, `value`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L205)

## Members

<a id="field-field-mq3-client-ui-controls-config-defaultvalue-defaultvalue-src-mq3-client-ui-controls-ml-2103348427"></a>
### defaultValue

```ml
defaultValue
```

When constructing this record, `initCvars` supplies `fallback` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L209)

<a id="field-field-mq3-client-ui-controls-config-name-name-src-mq3-client-ui-controls-ml-2044538401"></a>
### name

```ml
name
```

Engine configuration-variable name used to read, update, or register this setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L207)

<a id="field-field-mq3-client-ui-controls-config-value-value-src-mq3-client-ui-controls-ml-89467935"></a>
### value

```ml
value
```

Current or default setting value held by this configuration variable or UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L211)
