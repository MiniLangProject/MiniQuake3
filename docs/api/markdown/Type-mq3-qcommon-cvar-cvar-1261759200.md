# `mq3.qcommon.cvar.Cvar`

[Home](README.md) · [Source file](File-src-mq3-qcommon-cvar-ml-558393614.md)

<a id="struct-struct-mq3-qcommon-cvar-cvar-struct-cvar-src-mq3-qcommon-cvar-ml-1239950581"></a>
## Cvar

```ml
struct Cvar
```

Cvar record for qcommon.cvar, containing `name`, `string`, `resetString`, `latchedString`, `flags`, `modified`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L49)

## Members

<a id="field-field-mq3-qcommon-cvar-cvar-flags-flags-src-mq3-qcommon-cvar-ml-1726330677"></a>
### flags

```ml
flags
```

Combined configuration-variable policy flags, such as archive, latch, and cheat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L59)

<a id="field-field-mq3-qcommon-cvar-cvar-index-index-src-mq3-qcommon-cvar-ml-2010041057"></a>
### index

```ml
index
```

Stable registry index used by VM-visible variable handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L69)

<a id="field-field-mq3-qcommon-cvar-cvar-integer-integer-src-mq3-qcommon-cvar-ml-521015005"></a>
### integer

```ml
integer
```

Integer representation of the configured or parsed value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L67)

<a id="field-field-mq3-qcommon-cvar-cvar-latchedstring-latchedstring-src-mq3-qcommon-cvar-ml-1472554509"></a>
### latchedString

```ml
latchedString
```

Pending text value to apply when a latched configuration change takes effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L57)

<a id="field-field-mq3-qcommon-cvar-cvar-modificationcount-modificationcount-src-mq3-qcommon-cvar-ml-273074089"></a>
### modificationCount

```ml
modificationCount
```

Incremented each time the cvar is changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L63)

<a id="field-field-mq3-qcommon-cvar-cvar-modified-modified-src-mq3-qcommon-cvar-ml-272585063"></a>
### modified

```ml
modified
```

Set each time the cvar is changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L61)

<a id="field-field-mq3-qcommon-cvar-cvar-name-name-src-mq3-qcommon-cvar-ml-345636179"></a>
### name

```ml
name
```

Canonical configuration-variable name used for registry lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L51)

<a id="field-field-mq3-qcommon-cvar-cvar-resetstring-resetstring-src-mq3-qcommon-cvar-ml-1144336925"></a>
### resetString

```ml
resetString
```

Default text restored when configuration variables are reset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L55)

<a id="field-field-mq3-qcommon-cvar-cvar-string-string-src-mq3-qcommon-cvar-ml-1765362815"></a>
### string

```ml
string
```

Current text value of the configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L53)

<a id="field-field-mq3-qcommon-cvar-cvar-value-value-src-mq3-qcommon-cvar-ml-287049001"></a>
### value

```ml
value
```

Cached floating-point conversion of the current string value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L65)
