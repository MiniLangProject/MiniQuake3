# `mq3.client.cgame_main.Cvar`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-main-ml-1652783738.md)

<a id="struct-struct-mq3-client-cgame-main-cvar-struct-cvar-src-mq3-client-cgame-main-ml-711499413"></a>
## Cvar

```ml
struct Cvar
```

Stores client game main cvar record, including `name`, `defaultValue`, `flags`, `value`, `integer`, `modificationCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L114)

## Members

<a id="field-field-mq3-client-cgame-main-cvar-defaultvalue-defaultvalue-src-mq3-client-cgame-main-ml-206825239"></a>
### defaultValue

```ml
defaultValue
```

When constructing this record, `cvarSpec` supplies `defaultValue` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L118)

<a id="field-field-mq3-client-cgame-main-cvar-flags-flags-src-mq3-client-cgame-main-ml-68742271"></a>
### flags

```ml
flags
```

When constructing this record, `cvarSpec` supplies `flags` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L120)

<a id="field-field-mq3-client-cgame-main-cvar-integer-integer-src-mq3-client-cgame-main-ml-2034650279"></a>
### integer

```ml
integer
```

When constructing this record, `cvarSpec` supplies `atoi(defaultValue)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L124)

<a id="field-field-mq3-client-cgame-main-cvar-modificationcount-modificationcount-src-mq3-client-cgame-main-ml-810137771"></a>
### modificationCount

```ml
modificationCount
```

When constructing this record, `cvarSpec` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L126)

<a id="field-field-mq3-client-cgame-main-cvar-name-name-src-mq3-client-cgame-main-ml-1000237445"></a>
### name

```ml
name
```

Engine configuration-variable name used to read, update, or register this setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L116)

<a id="field-field-mq3-client-cgame-main-cvar-value-value-src-mq3-client-cgame-main-ml-1423737131"></a>
### value

```ml
value
```

Current or default setting value held by this configuration variable or UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L122)
