# `mq3.renderer.playable_light_grid.Grid`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)

<a id="struct-struct-mq3-renderer-playable-light-grid-grid-struct-grid-src-mq3-renderer-playable-light-grid-ml-242302171"></a>
## Grid

```ml
struct Grid
```

Data record for `mq3.renderer.playable_light_grid.Grid`; groups `data`, `offset`, `length`, `origin`, `size`, `inverse`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L33)

## Members

<a id="field-field-mq3-renderer-playable-light-grid-grid-bounds-bounds-src-mq3-renderer-playable-light-grid-ml-918298767"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners enclosing the object or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L47)

<a id="field-field-mq3-renderer-playable-light-grid-grid-data-data-src-mq3-renderer-playable-light-grid-ml-417980153"></a>
### data

```ml
data
```

Packed BSP light-grid sample bytes containing ambient, directed, and angular lighting data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L35)

<a id="field-field-mq3-renderer-playable-light-grid-grid-dynamiclights-dynamiclights-src-mq3-renderer-playable-light-grid-ml-1877657713"></a>
### dynamicLights

```ml
dynamicLights
```

Dynamic lights considered in addition to baked grid lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L51)

<a id="field-field-mq3-renderer-playable-light-grid-grid-inverse-inverse-src-mq3-renderer-playable-light-grid-ml-1875493625"></a>
### inverse

```ml
inverse
```

Reciprocal grid-cell dimensions used to locate a light-grid sample.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L45)

<a id="field-field-mq3-renderer-playable-light-grid-grid-length-length-src-mq3-renderer-playable-light-grid-ml-597771145"></a>
### length

```ml
length
```

Number of bytes in the data range represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L39)

<a id="field-field-mq3-renderer-playable-light-grid-grid-offset-offset-src-mq3-renderer-playable-light-grid-ml-1521637019"></a>
### offset

```ml
offset
```

Byte offset of the current cursor or data range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L37)

<a id="field-field-mq3-renderer-playable-light-grid-grid-origin-origin-src-mq3-renderer-playable-light-grid-ml-1625935341"></a>
### origin

```ml
origin
```

World-space position of the first sample in the BSP lighting grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L41)

<a id="field-field-mq3-renderer-playable-light-grid-grid-size-size-src-mq3-renderer-playable-light-grid-ml-1222829099"></a>
### size

```ml
size
```

World-space spacing between light-grid samples along each axis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L43)

<a id="field-field-mq3-renderer-playable-light-grid-grid-valid-valid-src-mq3-renderer-playable-light-grid-ml-1045214921"></a>
### valid

```ml
valid
```

Whether the record contains usable data for the requested operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_light_grid.ml#L49)
