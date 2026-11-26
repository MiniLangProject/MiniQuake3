# `mq3.qcommon.cvar.VmCvar`

[Home](README.md) · [Source file](File-src-mq3-qcommon-cvar-ml-558393614.md)

<a id="struct-struct-mq3-qcommon-cvar-vmcvar-struct-vmcvar-src-mq3-qcommon-cvar-ml-330378797"></a>
## VmCvar

```ml
struct VmCvar
```

VmCvar record for qcommon.cvar, containing `handle`, `modificationCount`, `value`, `integer`, `string`, `copyGeneration`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L85)

## Members

<a id="field-field-mq3-qcommon-cvar-vmcvar-copygeneration-copygeneration-src-mq3-qcommon-cvar-ml-1210339314"></a>
### copyGeneration

```ml
copyGeneration
```

Generation marker used to detect whether VM-facing data needs to be refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L97)

<a id="field-field-mq3-qcommon-cvar-vmcvar-handle-handle-src-mq3-qcommon-cvar-ml-1292940160"></a>
### handle

```ml
handle
```

Registry handle identifying the corresponding engine configuration variable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L87)

<a id="field-field-mq3-qcommon-cvar-vmcvar-integer-integer-src-mq3-qcommon-cvar-ml-1280281376"></a>
### integer

```ml
integer
```

Integer representation of the configured or parsed value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L93)

<a id="field-field-mq3-qcommon-cvar-vmcvar-modificationcount-modificationcount-src-mq3-qcommon-cvar-ml-1988875620"></a>
### modificationCount

```ml
modificationCount
```

Number of modification recorded by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L89)

<a id="field-field-mq3-qcommon-cvar-vmcvar-string-string-src-mq3-qcommon-cvar-ml-427168874"></a>
### string

```ml
string
```

Current text copied into the VM-visible configuration-variable record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L95)

<a id="field-field-mq3-qcommon-cvar-vmcvar-value-value-src-mq3-qcommon-cvar-ml-1174185116"></a>
### value

```ml
value
```

Floating-point interpretation of the variable's current text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L91)
