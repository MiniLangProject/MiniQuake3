# `mq3.format.aas.BBox`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-bbox-struct-bbox-src-mq3-format-aas-ml-1890601415"></a>
## BBox

```ml
struct BBox
```

BBox record for format.aas, containing `presenceType`, `flags`, `mins`, `maxs`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L235)

## Members

<a id="field-field-mq3-format-aas-bbox-flags-flags-src-mq3-format-aas-ml-1937596354"></a>
### flags

```ml
flags
```

Presence-box flags retained from the AAS navigation file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L239)

<a id="field-field-mq3-format-aas-bbox-maxs-maxs-src-mq3-format-aas-ml-1933369148"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the AAS presence shape relative to the moving entity origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L243)

<a id="field-field-mq3-format-aas-bbox-mins-mins-src-mq3-format-aas-ml-1577484008"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the AAS presence shape relative to the moving entity origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L241)

<a id="field-field-mq3-format-aas-bbox-presencetype-presencetype-src-mq3-format-aas-ml-1143237792"></a>
### presenceType

```ml
presenceType
```

Presence-type mask describing the bot hull or stance allowed here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L237)
