# `mq3.renderer.shader_remap.Entry`

[Home](README.md) · [Source file](File-src-mq3-renderer-shader-remap-ml-1685814656.md)

<a id="struct-struct-mq3-renderer-shader-remap-entry-struct-entry-src-mq3-renderer-shader-remap-ml-154587303"></a>
## Entry

```ml
struct Entry
```

Data record for `mq3.renderer.shader_remap.Entry`; groups `oldName`, `newName`, `timeOffset`, `handles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_remap.ml#L8)

## Members

<a id="field-field-mq3-renderer-shader-remap-entry-handles-handles-src-mq3-renderer-shader-remap-ml-1405570733"></a>
### handles

```ml
handles
```

Registered shader handles affected by the remapping entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_remap.ml#L16)

<a id="field-field-mq3-renderer-shader-remap-entry-newname-newname-src-mq3-renderer-shader-remap-ml-167938929"></a>
### newName

```ml
newName
```

Shader name selected as the remapping destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_remap.ml#L12)

<a id="field-field-mq3-renderer-shader-remap-entry-oldname-oldname-src-mq3-renderer-shader-remap-ml-1450005945"></a>
### oldName

```ml
oldName
```

Original shader name that is replaced by the remap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_remap.ml#L10)

<a id="field-field-mq3-renderer-shader-remap-entry-timeoffset-timeoffset-src-mq3-renderer-shader-remap-ml-1010319729"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_remap.ml#L14)
