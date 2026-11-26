# `mq3.renderer.tr_init.Cvar`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-init-ml-1583039474.md)

<a id="struct-struct-mq3-renderer-tr-init-cvar-struct-cvar-src-mq3-renderer-tr-init-ml-1643831251"></a>
## Cvar

```ml
struct Cvar
```

Data record for `mq3.renderer.tr_init.Cvar`; groups `name`, `value`, `integer`, `flags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L27)

## Members

<a id="field-field-mq3-renderer-tr-init-cvar-flags-flags-src-mq3-renderer-tr-init-ml-1765224999"></a>
### flags

```ml
flags
```

Console-variable flags governing persistence and runtime modification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L35)

<a id="field-field-mq3-renderer-tr-init-cvar-integer-integer-src-mq3-renderer-tr-init-ml-318599207"></a>
### integer

```ml
integer
```

Integer interpretation of the console variable's value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L33)

<a id="field-field-mq3-renderer-tr-init-cvar-name-name-src-mq3-renderer-tr-init-ml-965122989"></a>
### name

```ml
name
```

Console-variable name registered or queried by renderer initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L29)

<a id="field-field-mq3-renderer-tr-init-cvar-value-value-src-mq3-renderer-tr-init-ml-655706859"></a>
### value

```ml
value
```

Value carried by the event, configuration item, or requested operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L31)
