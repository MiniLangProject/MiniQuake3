# `mq3.botlib.l_struct.FieldDef`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-struct-ml-34381902.md)

<a id="struct-struct-mq3-botlib-l-struct-fielddef-struct-fielddef-src-mq3-botlib-l-struct-ml-1226358233"></a>
## FieldDef

```ml
struct FieldDef
```

`FieldDef` record for l struct, containing `name`, `offset`, `type`, `maxarray` and `floatmin` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L32)

## Members

<a id="field-field-mq3-botlib-l-struct-fielddef-floatmax-floatmax-src-mq3-botlib-l-struct-ml-90926300"></a>
### floatmax

```ml
floatmax
```

Maximum accepted numeric value for this field when range checking is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L44)

<a id="field-field-mq3-botlib-l-struct-fielddef-floatmin-floatmin-src-mq3-botlib-l-struct-ml-1670553004"></a>
### floatmin

```ml
floatmin
```

Minimum allowed value of a bounded floating-point field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L42)

<a id="field-field-mq3-botlib-l-struct-fielddef-maxarray-maxarray-src-mq3-botlib-l-struct-ml-1268097658"></a>
### maxarray

```ml
maxarray
```

Maximum array size.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L40)

<a id="field-field-mq3-botlib-l-struct-fielddef-name-name-src-mq3-botlib-l-struct-ml-434998914"></a>
### name

```ml
name
```

Name of the field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L34)

<a id="field-field-mq3-botlib-l-struct-fielddef-offset-offset-src-mq3-botlib-l-struct-ml-1187120358"></a>
### offset

```ml
offset
```

Offset in the structure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L36)

<a id="field-field-mq3-botlib-l-struct-fielddef-substruct-substruct-src-mq3-botlib-l-struct-ml-927045628"></a>
### substruct

```ml
substruct
```

Descriptor of the nested structure stored in this field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L46)

<a id="field-field-mq3-botlib-l-struct-fielddef-type-type-src-mq3-botlib-l-struct-ml-486651892"></a>
### type

```ml
type
```

Type of the field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_struct.ml#L38)
