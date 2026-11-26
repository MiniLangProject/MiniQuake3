# `mq3.client.ui_main.CvarSpec`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-ml-1850214811.md)

<a id="struct-struct-mq3-client-ui-main-cvarspec-struct-cvarspec-src-mq3-client-ui-main-ml-1766235851"></a>
## CvarSpec

```ml
struct CvarSpec
```

Stores UI main cvar spec record, including `name`, `defaultValue`, `flags`, `value`, `modificationCount`, `registered` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L42)

## Members

<a id="field-field-mq3-client-ui-main-cvarspec-defaultvalue-defaultvalue-src-mq3-client-ui-main-ml-187646396"></a>
### defaultValue

```ml
defaultValue
```

When constructing this record, `spec` supplies `defaultValue` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L46)

<a id="field-field-mq3-client-ui-main-cvarspec-flags-flags-src-mq3-client-ui-main-ml-568030516"></a>
### flags

```ml
flags
```

When constructing this record, `spec` supplies `flags` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L48)

<a id="field-field-mq3-client-ui-main-cvarspec-modificationcount-modificationcount-src-mq3-client-ui-main-ml-140925160"></a>
### modificationCount

```ml
modificationCount
```

When constructing this record, `spec` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L52)

<a id="field-field-mq3-client-ui-main-cvarspec-name-name-src-mq3-client-ui-main-ml-932890886"></a>
### name

```ml
name
```

Engine configuration-variable name used to read, update, or register this setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L44)

<a id="field-field-mq3-client-ui-main-cvarspec-registered-registered-src-mq3-client-ui-main-ml-1723881056"></a>
### registered

```ml
registered
```

True once the referenced media resources have been registered with the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L54)

<a id="field-field-mq3-client-ui-main-cvarspec-updatecount-updatecount-src-mq3-client-ui-main-ml-218689936"></a>
### updateCount

```ml
updateCount
```

When constructing this record, `spec` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L56)

<a id="field-field-mq3-client-ui-main-cvarspec-value-value-src-mq3-client-ui-main-ml-237684056"></a>
### value

```ml
value
```

Current or default setting value held by this configuration variable or UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main.ml#L50)
