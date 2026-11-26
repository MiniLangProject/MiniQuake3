# `mq3.server.main_runtime.Master`

[Home](README.md) · [Source file](File-src-mq3-server-main-runtime-ml-68872411.md)

<a id="struct-struct-mq3-server-main-runtime-master-struct-master-src-mq3-server-main-runtime-ml-1745633983"></a>
## Master

```ml
struct Master
```

Master record for server.main_runtime, containing `name`, `value`, `modified`, `address`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L69)

## Members

<a id="field-field-mq3-server-main-runtime-master-address-address-src-mq3-server-main-runtime-ml-2110838713"></a>
### address

```ml
address
```

Network address associated with the client or packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L77)

<a id="field-field-mq3-server-main-runtime-master-modified-modified-src-mq3-server-main-runtime-ml-1712689383"></a>
### modified

```ml
modified
```

True when the configured address needs to be resolved again.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L75)

<a id="field-field-mq3-server-main-runtime-master-name-name-src-mq3-server-main-runtime-ml-1671176807"></a>
### name

```ml
name
```

Configuration-variable name for this master-server entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L71)

<a id="field-field-mq3-server-main-runtime-master-value-value-src-mq3-server-main-runtime-ml-426941657"></a>
### value

```ml
value
```

Configured textual address of this master-server endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L73)
