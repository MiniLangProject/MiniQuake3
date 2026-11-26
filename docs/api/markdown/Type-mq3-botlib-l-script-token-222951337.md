# `mq3.botlib.l_script.Token`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-script-ml-301363504.md)

<a id="struct-struct-mq3-botlib-l-script-token-struct-token-src-mq3-botlib-l-script-ml-1519930129"></a>
## Token

```ml
struct Token
```

`Token` record for l script, containing `string`, `type`, `subtype`, `intValue` and `floatValue` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L167)

## Members

<a id="field-field-mq3-botlib-l-script-token-floatvalue-floatvalue-src-mq3-botlib-l-script-ml-1325695004"></a>
### floatValue

```ml
floatValue
```

Floating point value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L177)

<a id="field-field-mq3-botlib-l-script-token-intvalue-intvalue-src-mq3-botlib-l-script-ml-1112501270"></a>
### intValue

```ml
intValue
```

Integer interpretation of a numeric or character token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L175)

<a id="field-field-mq3-botlib-l-script-token-line-line-src-mq3-botlib-l-script-ml-1920159490"></a>
### line

```ml
line
```

Source-line number associated with the token, diagnostic, or allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L183)

<a id="field-field-mq3-botlib-l-script-token-linescrossed-linescrossed-src-mq3-botlib-l-script-ml-496456634"></a>
### linescrossed

```ml
linescrossed
```

Lines crossed in white space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L185)

<a id="field-field-mq3-botlib-l-script-token-next-next-src-mq3-botlib-l-script-ml-1324483436"></a>
### next

```ml
next
```

Next token in a retained token chain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L187)

<a id="field-field-mq3-botlib-l-script-token-string-string-src-mq3-botlib-l-script-ml-1960118176"></a>
### string

```ml
string
```

Token spelling copied from the script source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L169)

<a id="field-field-mq3-botlib-l-script-token-subtype-subtype-src-mq3-botlib-l-script-ml-196542346"></a>
### subtype

```ml
subtype
```

Last read token sub type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L173)

<a id="field-field-mq3-botlib-l-script-token-type-type-src-mq3-botlib-l-script-ml-208871274"></a>
### type

```ml
type
```

Last read token type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L171)

<a id="field-field-mq3-botlib-l-script-token-whitespaceend-whitespaceend-src-mq3-botlib-l-script-ml-1669388618"></a>
### whitespaceEnd

```ml
whitespaceEnd
```

Source offset immediately after whitespace preceding the token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L181)

<a id="field-field-mq3-botlib-l-script-token-whitespacestart-whitespacestart-src-mq3-botlib-l-script-ml-1228751350"></a>
### whitespaceStart

```ml
whitespaceStart
```

Source offset at the beginning of whitespace preceding the token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L179)
