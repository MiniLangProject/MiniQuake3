# `src/mq3/format/qfiles.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.qfiles`](Package-mq3-format-qfiles-741404451.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-format-qfiles-angle-down-const-angle-down-2-src-mq3-format-qfiles-ml-2142460464"></a>
### ANGLE_DOWN

```ml
const ANGLE_DOWN = -2
```

Special entity-angle value indicating a vertically downward direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L94)

<a id="constant-constant-mq3-format-qfiles-angle-up-const-angle-up-1-src-mq3-format-qfiles-ml-314428221"></a>
### ANGLE_UP

```ml
const ANGLE_UP = -1
```

Special entity-angle value indicating a vertically upward direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L92)

<a id="constant-constant-mq3-format-qfiles-bsp-ident-const-bsp-ident-1347633737-src-mq3-format-qfiles-ml-1344270213"></a>
### BSP_IDENT

```ml
const BSP_IDENT = 1347633737
```

Magic value identifying a Quake III BSP map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L44)

<a id="constant-constant-mq3-format-qfiles-bsp-version-const-bsp-version-46-src-mq3-format-qfiles-ml-1520666633"></a>
### BSP_VERSION

```ml
const BSP_VERSION = 46
```

Serialized format or interface version expected by qfiles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L46)

- [mq3.format.qfiles.Dbrush](Type-mq3-format-qfiles-dbrush-854019175.md) — struct
- [mq3.format.qfiles.Dbrushside](Type-mq3-format-qfiles-dbrushside-496386428.md) — struct
- [mq3.format.qfiles.Dfog](Type-mq3-format-qfiles-dfog-64313251.md) — struct
- [mq3.format.qfiles.Dheader](Type-mq3-format-qfiles-dheader-337590908.md) — struct
- [mq3.format.qfiles.Dleaf](Type-mq3-format-qfiles-dleaf-965581665.md) — struct
- [mq3.format.qfiles.Dmodel](Type-mq3-format-qfiles-dmodel-1870947390.md) — struct
- [mq3.format.qfiles.Dnode](Type-mq3-format-qfiles-dnode-1552118801.md) — struct
- [mq3.format.qfiles.Dplane](Type-mq3-format-qfiles-dplane-189776713.md) — struct
- [mq3.format.qfiles.DrawVert](Type-mq3-format-qfiles-drawvert-167231698.md) — struct
- [mq3.format.qfiles.Dshader](Type-mq3-format-qfiles-dshader-1730500748.md) — struct
- [mq3.format.qfiles.Dsurface](Type-mq3-format-qfiles-dsurface-1670522672.md) — struct
<a id="constant-constant-mq3-format-qfiles-header-lumps-const-header-lumps-17-src-mq3-format-qfiles-ml-1398633223"></a>
### HEADER_LUMPS

```ml
const HEADER_LUMPS = 17
```

Number of entries in the BSP file lump directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L141)

<a id="constant-constant-mq3-format-qfiles-lightmap-height-const-lightmap-height-128-src-mq3-format-qfiles-ml-768564410"></a>
### LIGHTMAP_HEIGHT

```ml
const LIGHTMAP_HEIGHT = 128
```

Height in texels of one BSP lightmap image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L98)

<a id="constant-constant-mq3-format-qfiles-lightmap-width-const-lightmap-width-128-src-mq3-format-qfiles-ml-749740462"></a>
### LIGHTMAP_WIDTH

```ml
const LIGHTMAP_WIDTH = 128
```

Width in texels of one BSP lightmap image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L96)

- [mq3.format.qfiles.Lump](Type-mq3-format-qfiles-lump-306297161.md) — struct
<a id="constant-constant-mq3-format-qfiles-lump-brushes-const-lump-brushes-8-src-mq3-format-qfiles-ml-267602689"></a>
### LUMP_BRUSHES

```ml
const LUMP_BRUSHES = 8
```

Lump-directory index for brushes in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L123)

<a id="constant-constant-mq3-format-qfiles-lump-brushsides-const-lump-brushsides-9-src-mq3-format-qfiles-ml-198325464"></a>
### LUMP_BRUSHSIDES

```ml
const LUMP_BRUSHSIDES = 9
```

Lump-directory index for brushsides in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L125)

<a id="constant-constant-mq3-format-qfiles-lump-drawindexes-const-lump-drawindexes-11-src-mq3-format-qfiles-ml-654696177"></a>
### LUMP_DRAWINDEXES

```ml
const LUMP_DRAWINDEXES = 11
```

Lump-directory index for drawindexes in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L129)

<a id="constant-constant-mq3-format-qfiles-lump-drawverts-const-lump-drawverts-10-src-mq3-format-qfiles-ml-1051443576"></a>
### LUMP_DRAWVERTS

```ml
const LUMP_DRAWVERTS = 10
```

Lump-directory index for drawverts in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L127)

<a id="constant-constant-mq3-format-qfiles-lump-entities-const-lump-entities-0-src-mq3-format-qfiles-ml-509766781"></a>
### LUMP_ENTITIES

```ml
const LUMP_ENTITIES = 0
```

Lump-directory index for entities in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L107)

<a id="constant-constant-mq3-format-qfiles-lump-fogs-const-lump-fogs-12-src-mq3-format-qfiles-ml-1478394958"></a>
### LUMP_FOGS

```ml
const LUMP_FOGS = 12
```

Lump-directory index for fogs in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L131)

<a id="constant-constant-mq3-format-qfiles-lump-leafbrushes-const-lump-leafbrushes-6-src-mq3-format-qfiles-ml-938929051"></a>
### LUMP_LEAFBRUSHES

```ml
const LUMP_LEAFBRUSHES = 6
```

Lump-directory index for leafbrushes in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L119)

<a id="constant-constant-mq3-format-qfiles-lump-leafs-const-lump-leafs-4-src-mq3-format-qfiles-ml-1883055343"></a>
### LUMP_LEAFS

```ml
const LUMP_LEAFS = 4
```

Lump-directory index for leafs in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L115)

<a id="constant-constant-mq3-format-qfiles-lump-leafsurfaces-const-lump-leafsurfaces-5-src-mq3-format-qfiles-ml-1053826808"></a>
### LUMP_LEAFSURFACES

```ml
const LUMP_LEAFSURFACES = 5
```

Lump-directory index for leafsurfaces in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L117)

<a id="constant-constant-mq3-format-qfiles-lump-lightgrid-const-lump-lightgrid-15-src-mq3-format-qfiles-ml-542863193"></a>
### LUMP_LIGHTGRID

```ml
const LUMP_LIGHTGRID = 15
```

Lump-directory index for lightgrid in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L137)

<a id="constant-constant-mq3-format-qfiles-lump-lightmaps-const-lump-lightmaps-14-src-mq3-format-qfiles-ml-1674559818"></a>
### LUMP_LIGHTMAPS

```ml
const LUMP_LIGHTMAPS = 14
```

Lump-directory index for lightmaps in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L135)

<a id="constant-constant-mq3-format-qfiles-lump-models-const-lump-models-7-src-mq3-format-qfiles-ml-417858486"></a>
### LUMP_MODELS

```ml
const LUMP_MODELS = 7
```

Lump-directory index for models in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L121)

<a id="constant-constant-mq3-format-qfiles-lump-nodes-const-lump-nodes-3-src-mq3-format-qfiles-ml-609194280"></a>
### LUMP_NODES

```ml
const LUMP_NODES = 3
```

Lump-directory index for nodes in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L113)

<a id="constant-constant-mq3-format-qfiles-lump-planes-const-lump-planes-2-src-mq3-format-qfiles-ml-831757143"></a>
### LUMP_PLANES

```ml
const LUMP_PLANES = 2
```

Lump-directory index for planes in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L111)

<a id="constant-constant-mq3-format-qfiles-lump-shaders-const-lump-shaders-1-src-mq3-format-qfiles-ml-829307040"></a>
### LUMP_SHADERS

```ml
const LUMP_SHADERS = 1
```

Lump-directory index for shaders in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L109)

<a id="constant-constant-mq3-format-qfiles-lump-surfaces-const-lump-surfaces-13-src-mq3-format-qfiles-ml-675493051"></a>
### LUMP_SURFACES

```ml
const LUMP_SURFACES = 13
```

Lump-directory index for surfaces in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L133)

<a id="constant-constant-mq3-format-qfiles-lump-visibility-const-lump-visibility-16-src-mq3-format-qfiles-ml-1996243966"></a>
### LUMP_VISIBILITY

```ml
const LUMP_VISIBILITY = 16
```

Lump-directory index for visibility in the serialized map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L139)

<a id="function-function-mq3-format-qfiles-lumprange-function-lumprange-header-index-totalsize-src-mq3-format-qfiles-ml-505561886"></a>
### lumpRange

```ml
function lumpRange(header, index, totalSize)
```

Compute lump range in format.qfiles; the normal completion returns `[lump.fileofs, lump.filelen]`.

Validation failures include `qfiles lump index`; `qfiles lump range`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `header` | `dynamic` | — | Record exposing `lumps`. |
| `index` | `dynamic` | — | Zero-based index into `header.lumps`. |
| `totalSize` | `dynamic` | — | Total size used in `(lump.filelen > totalSize)` and `(totalSize - lump.filelen)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L598)

<a id="constant-constant-mq3-format-qfiles-max-key-const-max-key-32-src-mq3-format-qfiles-ml-1982630912"></a>
### MAX_KEY

```ml
const MAX_KEY = 32
```

Maximum length of a key in the BSP entity text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L88)

<a id="constant-constant-mq3-format-qfiles-max-map-areas-const-max-map-areas-256-src-mq3-format-qfiles-ml-1392167974"></a>
### MAX_MAP_AREAS

```ml
const MAX_MAP_AREAS = 256
```

MAX_MAP_AREA_BYTES in q_shared must match!


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L58)

<a id="constant-constant-mq3-format-qfiles-max-map-brushes-const-max-map-brushes-32768-src-mq3-format-qfiles-ml-619789041"></a>
### MAX_MAP_BRUSHES

```ml
const MAX_MAP_BRUSHES = 32768
```

Maximum number of collision brush records supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L50)

<a id="constant-constant-mq3-format-qfiles-max-map-brushsides-const-max-map-brushsides-131072-src-mq3-format-qfiles-ml-1268989981"></a>
### MAX_MAP_BRUSHSIDES

```ml
const MAX_MAP_BRUSHSIDES = 131072
```

Maximum number of collision brush sides supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L66)

<a id="constant-constant-mq3-format-qfiles-max-map-draw-indexes-const-max-map-draw-indexes-524288-src-mq3-format-qfiles-ml-476406336"></a>
### MAX_MAP_DRAW_INDEXES

```ml
const MAX_MAP_DRAW_INDEXES = 524288
```

Maximum number of triangle vertex indices supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L86)

<a id="constant-constant-mq3-format-qfiles-max-map-draw-surfs-const-max-map-draw-surfs-131072-src-mq3-format-qfiles-ml-786548001"></a>
### MAX_MAP_DRAW_SURFS

```ml
const MAX_MAP_DRAW_SURFS = 131072
```

Maximum number of renderable surface records supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L82)

<a id="constant-constant-mq3-format-qfiles-max-map-draw-verts-const-max-map-draw-verts-524288-src-mq3-format-qfiles-ml-1166813820"></a>
### MAX_MAP_DRAW_VERTS

```ml
const MAX_MAP_DRAW_VERTS = 524288
```

Maximum number of renderable vertex records supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L84)

<a id="constant-constant-mq3-format-qfiles-max-map-entities-const-max-map-entities-2048-src-mq3-format-qfiles-ml-1782216741"></a>
### MAX_MAP_ENTITIES

```ml
const MAX_MAP_ENTITIES = 2048
```

Maximum number of map entity definitions supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L52)

<a id="constant-constant-mq3-format-qfiles-max-map-entstring-const-max-map-entstring-262144-src-mq3-format-qfiles-ml-758658848"></a>
### MAX_MAP_ENTSTRING

```ml
const MAX_MAP_ENTSTRING = 262144
```

Maximum byte size of map entity text in the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L54)

<a id="constant-constant-mq3-format-qfiles-max-map-fogs-const-max-map-fogs-256-src-mq3-format-qfiles-ml-805105974"></a>
### MAX_MAP_FOGS

```ml
const MAX_MAP_FOGS = 256
```

Maximum number of fog volume records supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L60)

<a id="constant-constant-mq3-format-qfiles-max-map-leafbrushes-const-max-map-leafbrushes-262144-src-mq3-format-qfiles-ml-935702004"></a>
### MAX_MAP_LEAFBRUSHES

```ml
const MAX_MAP_LEAFBRUSHES = 262144
```

Maximum number of brush references in BSP leaves supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L72)

<a id="constant-constant-mq3-format-qfiles-max-map-leaffaces-const-max-map-leaffaces-131072-src-mq3-format-qfiles-ml-731272123"></a>
### MAX_MAP_LEAFFACES

```ml
const MAX_MAP_LEAFFACES = 131072
```

Maximum number of surface references in BSP leaves supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L70)

<a id="constant-constant-mq3-format-qfiles-max-map-leafs-const-max-map-leafs-131072-src-mq3-format-qfiles-ml-1453217575"></a>
### MAX_MAP_LEAFS

```ml
const MAX_MAP_LEAFS = 131072
```

Maximum number of BSP leaf records supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L68)

<a id="constant-constant-mq3-format-qfiles-max-map-lightgrid-const-max-map-lightgrid-8388608-src-mq3-format-qfiles-ml-918453886"></a>
### MAX_MAP_LIGHTGRID

```ml
const MAX_MAP_LIGHTGRID = 8388608
```

Maximum byte size of light-grid samples in the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L78)

<a id="constant-constant-mq3-format-qfiles-max-map-lighting-const-max-map-lighting-8388608-src-mq3-format-qfiles-ml-559176176"></a>
### MAX_MAP_LIGHTING

```ml
const MAX_MAP_LIGHTING = 8388608
```

Maximum byte size of lightmap pixels in the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L76)

<a id="constant-constant-mq3-format-qfiles-max-map-models-const-max-map-models-1024-src-mq3-format-qfiles-ml-728671644"></a>
### MAX_MAP_MODELS

```ml
const MAX_MAP_MODELS = 1024
```

Maximum number of inline BSP model records supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L48)

<a id="constant-constant-mq3-format-qfiles-max-map-nodes-const-max-map-nodes-131072-src-mq3-format-qfiles-ml-1032170015"></a>
### MAX_MAP_NODES

```ml
const MAX_MAP_NODES = 131072
```

Maximum number of BSP tree nodes supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L64)

<a id="constant-constant-mq3-format-qfiles-max-map-planes-const-max-map-planes-131072-src-mq3-format-qfiles-ml-1762748735"></a>
### MAX_MAP_PLANES

```ml
const MAX_MAP_PLANES = 131072
```

Maximum number of BSP plane records supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L62)

<a id="constant-constant-mq3-format-qfiles-max-map-portals-const-max-map-portals-131072-src-mq3-format-qfiles-ml-1274066875"></a>
### MAX_MAP_PORTALS

```ml
const MAX_MAP_PORTALS = 131072
```

Maximum number of map portal records supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L74)

<a id="constant-constant-mq3-format-qfiles-max-map-shaders-const-max-map-shaders-1024-src-mq3-format-qfiles-ml-594020722"></a>
### MAX_MAP_SHADERS

```ml
const MAX_MAP_SHADERS = 1024
```

Maximum number of BSP shader references supported by the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L56)

<a id="constant-constant-mq3-format-qfiles-max-map-visibility-const-max-map-visibility-2097152-src-mq3-format-qfiles-ml-497518485"></a>
### MAX_MAP_VISIBILITY

```ml
const MAX_MAP_VISIBILITY = 2097152
```

Maximum byte size of cluster visibility data in the BSP format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L80)

<a id="constant-constant-mq3-format-qfiles-max-qpath-const-max-qpath-64-src-mq3-format-qfiles-ml-1292628609"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```

Maximum character capacity reserved for a Quake asset path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L11)

<a id="constant-constant-mq3-format-qfiles-max-value-const-max-value-1024-src-mq3-format-qfiles-ml-570186378"></a>
### MAX_VALUE

```ml
const MAX_VALUE = 1024
```

Maximum length of a value in the BSP entity text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L90)

<a id="constant-constant-mq3-format-qfiles-max-world-coord-const-max-world-coord-131072-src-mq3-format-qfiles-ml-1143254011"></a>
### MAX_WORLD_COORD

```ml
const MAX_WORLD_COORD = 131072
```

Largest accepted coordinate component for map geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L100)

<a id="constant-constant-mq3-format-qfiles-md3-ident-const-md3-ident-860898377-src-mq3-format-qfiles-ml-1923889307"></a>
### MD3_IDENT

```ml
const MD3_IDENT = 860898377
```

Magic value identifying an MD3 animated model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L16)

<a id="constant-constant-mq3-format-qfiles-md3-max-frames-const-md3-max-frames-1024-src-mq3-format-qfiles-ml-1652268012"></a>
### MD3_MAX_FRAMES

```ml
const MD3_MAX_FRAMES = 1024
```

Maximum number of frames supported by the MD3 model format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L28)

<a id="constant-constant-mq3-format-qfiles-md3-max-lods-const-md3-max-lods-3-src-mq3-format-qfiles-ml-1309190028"></a>
### MD3_MAX_LODS

```ml
const MD3_MAX_LODS = 3
```

Maximum number of lods supported by the MD3 model format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L20)

<a id="constant-constant-mq3-format-qfiles-md3-max-shaders-const-md3-max-shaders-256-src-mq3-format-qfiles-ml-1618087806"></a>
### MD3_MAX_SHADERS

```ml
const MD3_MAX_SHADERS = 256
```

Maximum number of shaders supported by the MD3 model format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L26)

<a id="constant-constant-mq3-format-qfiles-md3-max-surfaces-const-md3-max-surfaces-32-src-mq3-format-qfiles-ml-1066319606"></a>
### MD3_MAX_SURFACES

```ml
const MD3_MAX_SURFACES = 32
```

Maximum number of surfaces supported by the MD3 model format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L30)

<a id="constant-constant-mq3-format-qfiles-md3-max-tags-const-md3-max-tags-16-src-mq3-format-qfiles-ml-1268920974"></a>
### MD3_MAX_TAGS

```ml
const MD3_MAX_TAGS = 16
```

Maximum number of tags supported by the MD3 model format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L32)

<a id="constant-constant-mq3-format-qfiles-md3-max-triangles-const-md3-max-triangles-8192-src-mq3-format-qfiles-ml-1364944047"></a>
### MD3_MAX_TRIANGLES

```ml
const MD3_MAX_TRIANGLES = 8192
```

Maximum number of triangles supported by the MD3 model format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L22)

<a id="constant-constant-mq3-format-qfiles-md3-max-verts-const-md3-max-verts-4096-src-mq3-format-qfiles-ml-1104762382"></a>
### MD3_MAX_VERTS

```ml
const MD3_MAX_VERTS = 4096
```

Maximum number of verts supported by the MD3 model format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L24)

<a id="constant-constant-mq3-format-qfiles-md3-version-const-md3-version-15-src-mq3-format-qfiles-ml-2078338605"></a>
### MD3_VERSION

```ml
const MD3_VERSION = 15
```

Serialized format or interface version expected by qfiles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L18)

<a id="constant-constant-mq3-format-qfiles-md3-xyz-scale-const-md3-xyz-scale-0-015625-src-mq3-format-qfiles-ml-518800850"></a>
### MD3_XYZ_SCALE

```ml
const MD3_XYZ_SCALE = 0.015625
```

Scale converting stored MD3 vertex coordinates to model-space units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L34)

- [mq3.format.qfiles.Md3Frame](Type-mq3-format-qfiles-md3frame-1148021084.md) — struct
- [mq3.format.qfiles.Md3Header](Type-mq3-format-qfiles-md3header-1242540958.md) — struct
- [mq3.format.qfiles.Md3Shader](Type-mq3-format-qfiles-md3shader-1102305378.md) — struct
- [mq3.format.qfiles.Md3St](Type-mq3-format-qfiles-md3st-170969256.md) — struct
- [mq3.format.qfiles.Md3Surface](Type-mq3-format-qfiles-md3surface-830923266.md) — struct
- [mq3.format.qfiles.Md3Tag](Type-mq3-format-qfiles-md3tag-1835283005.md) — struct
- [mq3.format.qfiles.Md3Triangle](Type-mq3-format-qfiles-md3triangle-928877067.md) — struct
- [mq3.format.qfiles.Md3XyzNormal](Type-mq3-format-qfiles-md3xyznormal-1754500945.md) — struct
<a id="constant-constant-mq3-format-qfiles-md4-ident-const-md4-ident-877675593-src-mq3-format-qfiles-ml-1046508436"></a>
### MD4_IDENT

```ml
const MD4_IDENT = 877675593
```

Magic value identifying an MD4 skinned model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L37)

<a id="constant-constant-mq3-format-qfiles-md4-max-bones-const-md4-max-bones-128-src-mq3-format-qfiles-ml-1251954138"></a>
### MD4_MAX_BONES

```ml
const MD4_MAX_BONES = 128
```

Maximum number of bones supported by the MD4 model format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L41)

<a id="constant-constant-mq3-format-qfiles-md4-version-const-md4-version-1-src-mq3-format-qfiles-ml-1103539008"></a>
### MD4_VERSION

```ml
const MD4_VERSION = 1
```

Serialized format or interface version expected by qfiles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L39)

- [mq3.format.qfiles.Md4Bone](Type-mq3-format-qfiles-md4bone-2009077608.md) — struct
- [mq3.format.qfiles.Md4Frame](Type-mq3-format-qfiles-md4frame-1214929039.md) — struct
- [mq3.format.qfiles.Md4Header](Type-mq3-format-qfiles-md4header-336518767.md) — struct
- [mq3.format.qfiles.Md4Lod](Type-mq3-format-qfiles-md4lod-1024853453.md) — struct
- [mq3.format.qfiles.Md4Surface](Type-mq3-format-qfiles-md4surface-1272192685.md) — struct
- [mq3.format.qfiles.Md4Triangle](Type-mq3-format-qfiles-md4triangle-1938973790.md) — struct
- [mq3.format.qfiles.Md4Vertex](Type-mq3-format-qfiles-md4vertex-1917320636.md) — struct
- [mq3.format.qfiles.Md4Weight](Type-mq3-format-qfiles-md4weight-1963035558.md) — struct
<a id="constant-constant-mq3-format-qfiles-min-world-coord-const-min-world-coord-131072-src-mq3-format-qfiles-ml-1318724524"></a>
### MIN_WORLD_COORD

```ml
const MIN_WORLD_COORD = -131072
```

Smallest accepted coordinate component for map geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L102)

<a id="constant-constant-mq3-format-qfiles-mst-bad-const-mst-bad-0-src-mq3-format-qfiles-ml-1395133373"></a>
### MST_BAD

```ml
const MST_BAD = 0
```

BSP surface-kind identifier for bad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L144)

<a id="constant-constant-mq3-format-qfiles-mst-flare-const-mst-flare-4-src-mq3-format-qfiles-ml-885627309"></a>
### MST_FLARE

```ml
const MST_FLARE = 4
```

BSP surface-kind identifier for flare.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L152)

<a id="constant-constant-mq3-format-qfiles-mst-patch-const-mst-patch-2-src-mq3-format-qfiles-ml-1260594323"></a>
### MST_PATCH

```ml
const MST_PATCH = 2
```

BSP surface-kind identifier for patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L148)

<a id="constant-constant-mq3-format-qfiles-mst-planar-const-mst-planar-1-src-mq3-format-qfiles-ml-503017036"></a>
### MST_PLANAR

```ml
const MST_PLANAR = 1
```

BSP surface-kind identifier for planar.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L146)

<a id="constant-constant-mq3-format-qfiles-mst-triangle-soup-const-mst-triangle-soup-3-src-mq3-format-qfiles-ml-1624781690"></a>
### MST_TRIANGLE_SOUP

```ml
const MST_TRIANGLE_SOUP = 3
```

BSP surface-kind identifier for triangle soup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L150)

- [mq3.format.qfiles.Pcx](Type-mq3-format-qfiles-pcx-1967913662.md) — struct
<a id="constant-constant-mq3-format-qfiles-shader-max-indexes-const-shader-max-indexes-6000-src-mq3-format-qfiles-ml-1486566317"></a>
### SHADER_MAX_INDEXES

```ml
const SHADER_MAX_INDEXES = 6000
```

Maximum number of index elements retained in a shader surface batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L9)

<a id="constant-constant-mq3-format-qfiles-shader-max-vertexes-const-shader-max-vertexes-1000-src-mq3-format-qfiles-ml-133348172"></a>
### SHADER_MAX_VERTEXES

```ml
const SHADER_MAX_VERTEXES = 1000
```

Maximum number of vertices retained in a shader surface batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L7)

- [mq3.format.qfiles.TargaHeader](Type-mq3-format-qfiles-targaheader-932290191.md) — struct
<a id="function-function-mq3-format-qfiles-typenames-function-typenames-src-mq3-format-qfiles-ml-335049810"></a>
### typeNames

```ml
function typeNames()
```

List the 32 names in format.qfiles.typeNames, beginning with `vmHeader_t`, `pcx_t`, `TargaHeader`, `md3Frame_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L588)

<a id="constant-constant-mq3-format-qfiles-vm-magic-const-vm-magic-309466180-src-mq3-format-qfiles-ml-1610970666"></a>
### VM_MAGIC

```ml
const VM_MAGIC = 309466180
```

Magic value identifying the supported QVM bytecode format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L13)

- [mq3.format.qfiles.VmHeader](Type-mq3-format-qfiles-vmheader-488047075.md) — struct
<a id="constant-constant-mq3-format-qfiles-world-size-const-world-size-262144-src-mq3-format-qfiles-ml-649926422"></a>
### WORLD_SIZE

```ml
const WORLD_SIZE = 262144
```

Serialized byte size of world in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L104)
