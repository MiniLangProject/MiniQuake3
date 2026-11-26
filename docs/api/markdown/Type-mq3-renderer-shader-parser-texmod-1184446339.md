# `mq3.renderer.shader_parser.TexMod`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-parser-ml-2114769074.md)

<a id="struct-struct-mq3-renderer-shader-parser-texmod-struct-texmod-src-mq3-renderer-shader-parser-ml-2127525859"></a>
## TexMod

```ml
struct TexMod
```

Data record for `mq3.renderer.shader_parser.TexMod`; groups `kind`, `values`, `wave`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L78)

## Members

<a id="field-field-mq3-renderer-shader-parser-texmod-kind-kind-src-mq3-renderer-shader-parser-ml-1836862274"></a>
### kind

```ml
kind
```

Parsed texture-coordinate operation selecting scale, scroll, rotate, transform, turbulence, or another modifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L81)

<a id="field-field-mq3-renderer-shader-parser-texmod-values-values-src-mq3-renderer-shader-parser-ml-230014362"></a>
### values

```ml
values
```

Numeric parameters interpreted according to the texture modifier's kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L83)

<a id="field-field-mq3-renderer-shader-parser-texmod-wave-wave-src-mq3-renderer-shader-parser-ml-193639880"></a>
### wave

```ml
wave
```

Waveform parameters driving this texture or vertex modification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L85)
