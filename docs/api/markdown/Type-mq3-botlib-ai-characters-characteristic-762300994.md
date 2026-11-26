# `mq3.botlib.ai_characters.Characteristic`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-characters-ml-311974577.md)

<a id="struct-struct-mq3-botlib-ai-characters-characteristic-struct-characteristic-src-mq3-botlib-ai-characters-ml-623869347"></a>
## Characteristic

```ml
struct Characteristic
```

`Characteristic` record for ai characters, containing `type`, `integer`, `floatValue` and `stringValue`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L39)

## Members

<a id="field-field-mq3-botlib-ai-characters-characteristic-floatvalue-floatvalue-src-mq3-botlib-ai-characters-ml-767244134"></a>
### floatValue

```ml
floatValue
```

Floating point value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L45)

<a id="field-field-mq3-botlib-ai-characters-characteristic-integer-integer-src-mq3-botlib-ai-characters-ml-565125532"></a>
### integer

```ml
integer
```

Integer representation of the configured or parsed value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L43)

<a id="field-field-mq3-botlib-ai-characters-characteristic-stringvalue-stringvalue-src-mq3-botlib-ai-characters-ml-1692836412"></a>
### stringValue

```ml
stringValue
```

Text representation of a string-valued bot characteristic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L47)

<a id="field-field-mq3-botlib-ai-characters-characteristic-type-type-src-mq3-botlib-ai-characters-ml-278621816"></a>
### type

```ml
type
```

Characteristic-value discriminator selecting integer, float, or string storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L41)
