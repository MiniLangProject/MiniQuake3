# `mq3.client.cl_console.Glyph`

[Home](README.md) · [Source file](File-src-mq3-client-cl-console-ml-1724798958.md)

<a id="struct-struct-mq3-client-cl-console-glyph-struct-glyph-src-mq3-client-cl-console-ml-765782479"></a>
## Glyph

```ml
struct Glyph
```

Stores engine client console glyph record, including `x`, `y`, `ch`, `color`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L55)

## Members

<a id="field-field-mq3-client-cl-console-glyph-ch-ch-src-mq3-client-cl-console-ml-343257921"></a>
### ch

```ml
ch
```

When constructing this record, `lineGlyphs` supplies `ch` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L61)

<a id="field-field-mq3-client-cl-console-glyph-color-color-src-mq3-client-cl-console-ml-1773872779"></a>
### color

```ml
color
```

Console palette index from zero through seven encoded with this glyph character.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L63)

<a id="field-field-mq3-client-cl-console-glyph-x-x-src-mq3-client-cl-console-ml-2070631863"></a>
### x

```ml
x
```

Horizontal coordinate of a console character in the target display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L57)

<a id="field-field-mq3-client-cl-console-glyph-y-y-src-mq3-client-cl-console-ml-612353379"></a>
### y

```ml
y
```

Vertical coordinate of a console character in the target display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L59)
