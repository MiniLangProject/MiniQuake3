# `mq3.botlib.lib_variables.Variable`

[Home](README.md) · [Source file](File-src-mq3-botlib-lib-variables-ml-1792457987.md)

<a id="struct-struct-mq3-botlib-lib-variables-variable-struct-variable-src-mq3-botlib-lib-variables-ml-1153967371"></a>
## Variable

```ml
struct Variable
```

`Variable` record for lib variables, containing `name`, `value`, `numericValue` and `modified`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L8)

## Members

<a id="field-field-mq3-botlib-lib-variables-variable-modified-modified-src-mq3-botlib-lib-variables-ml-350759971"></a>
### modified

```ml
modified
```

Set each time the cvar is changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L16)

<a id="field-field-mq3-botlib-lib-variables-variable-name-name-src-mq3-botlib-lib-variables-ml-558440259"></a>
### name

```ml
name
```

Bot-library variable name used by lookup and configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L10)

<a id="field-field-mq3-botlib-lib-variables-variable-numericvalue-numericvalue-src-mq3-botlib-lib-variables-ml-241231353"></a>
### numericValue

```ml
numericValue
```

Cached numeric interpretation of the variable's text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L14)

<a id="field-field-mq3-botlib-lib-variables-variable-value-value-src-mq3-botlib-lib-variables-ml-1099349429"></a>
### value

```ml
value
```

Current text value of the bot-library variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/lib_variables.ml#L12)
