# `mq3.renderer.shader_parser.Deform`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-parser-ml-2114769074.md)

<a id="struct-struct-mq3-renderer-shader-parser-deform-struct-deform-src-mq3-renderer-shader-parser-ml-1448661587"></a>
## Deform

```ml
struct Deform
```

Data record for `mq3.renderer.shader_parser.Deform`; groups `kind`, `spread`, `wave`, `vector`, `bulgeWidth`, `bulgeHeight`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L88)

## Members

<a id="field-field-mq3-renderer-shader-parser-deform-bulgeheight-bulgeheight-src-mq3-renderer-shader-parser-ml-1005061448"></a>
### bulgeHeight

```ml
bulgeHeight
```

Maximum displacement produced by the bulge deformation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L101)

<a id="field-field-mq3-renderer-shader-parser-deform-bulgespeed-bulgespeed-src-mq3-renderer-shader-parser-ml-1114282188"></a>
### bulgeSpeed

```ml
bulgeSpeed
```

Rate at which the bulge deformation moves over time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L103)

<a id="field-field-mq3-renderer-shader-parser-deform-bulgewidth-bulgewidth-src-mq3-renderer-shader-parser-ml-1844770326"></a>
### bulgeWidth

```ml
bulgeWidth
```

Spatial frequency of the texture-coordinate-driven bulge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L99)

<a id="field-field-mq3-renderer-shader-parser-deform-kind-kind-src-mq3-renderer-shader-parser-ml-122449624"></a>
### kind

```ml
kind
```

Vertex-deformation operation selecting wave, move, bulge, autosprite, text, or another shader deformation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L91)

<a id="field-field-mq3-renderer-shader-parser-deform-spread-spread-src-mq3-renderer-shader-parser-ml-962353510"></a>
### spread

```ml
spread
```

Spatial divisor controlling the phase spread of a vertex deformation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L93)

<a id="field-field-mq3-renderer-shader-parser-deform-vector-vector-src-mq3-renderer-shader-parser-ml-1502394298"></a>
### vector

```ml
vector
```

Direction and magnitude used by the deformation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L97)

<a id="field-field-mq3-renderer-shader-parser-deform-wave-wave-src-mq3-renderer-shader-parser-ml-732183806"></a>
### wave

```ml
wave
```

Waveform parameters driving this texture or vertex modification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_parser.ml#L95)
