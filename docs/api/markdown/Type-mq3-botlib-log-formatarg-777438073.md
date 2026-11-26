# `mq3.botlib.log.FormatArg`

[Home](README.md) · [Source file](File-src-mq3-botlib-log-ml-480729422.md)

<a id="struct-struct-mq3-botlib-log-formatarg-struct-formatarg-src-mq3-botlib-log-ml-460793527"></a>
## FormatArg

```ml
struct FormatArg
```

`FormatArg` record for log, containing `kind`, `text`, `integer` and `real`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L27)

## Members

<a id="field-field-mq3-botlib-log-formatarg-integer-integer-src-mq3-botlib-log-ml-398607184"></a>
### integer

```ml
integer
```

Integer representation of the configured or parsed value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L33)

<a id="field-field-mq3-botlib-log-formatarg-kind-kind-src-mq3-botlib-log-ml-425631716"></a>
### kind

```ml
kind
```

Format-argument discriminator selecting text, integer, or real storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L29)

<a id="field-field-mq3-botlib-log-formatarg-real-real-src-mq3-botlib-log-ml-434862144"></a>
### real

```ml
real
```

Floating-point value carried by this formatted-log argument.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L35)

<a id="field-field-mq3-botlib-log-formatarg-text-text-src-mq3-botlib-log-ml-761397150"></a>
### text

```ml
text
```

Text value supplied to a string-format conversion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L31)
