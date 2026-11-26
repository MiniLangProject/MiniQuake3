# `mq3.renderer.world_surface_selection.WorldCache`

[Home](README.md) · [Source file](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)

<a id="struct-struct-mq3-renderer-world-surface-selection-worldcache-struct-worldcache-src-mq3-renderer-world-surface-selection-ml-1524062675"></a>
## WorldCache

```ml
struct WorldCache
```

Data record for `mq3.renderer.world_surface_selection.WorldCache`; groups `map`, `faceCenters`, `faceRadii`, `faceTriangleCounts`, `faceKinds`, `faceNormals`, and 15 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L126)

## Members

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-areamask-areamask-src-mq3-renderer-world-surface-selection-ml-818028349"></a>
### areaMask

```ml
areaMask
```

Area-visibility mask; set bits suppress rendering of the associated areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L166)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-cullmodes-cullmodes-src-mq3-renderer-world-surface-selection-ml-2063468463"></a>
### cullModes

```ml
cullModes
```

Resolved face-culling mode for each material or face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L142)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-facecenters-facecenters-src-mq3-renderer-world-surface-selection-ml-887004719"></a>
### faceCenters

```ml
faceCenters
```

Cached center position of each BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L130)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-facekinds-facekinds-src-mq3-renderer-world-surface-selection-ml-444916047"></a>
### faceKinds

```ml
faceKinds
```

BSP surface type associated with each face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L136)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-facenormals-facenormals-src-mq3-renderer-world-surface-selection-ml-1422472803"></a>
### faceNormals

```ml
faceNormals
```

Cached normals used for planar-face culling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L138)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-faceradii-faceradii-src-mq3-renderer-world-surface-selection-ml-1479071075"></a>
### faceRadii

```ml
faceRadii
```

Cached bounding-sphere radius of each BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L132)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-facetextureindexes-facetextureindexes-src-mq3-renderer-world-surface-selection-ml-2081506011"></a>
### faceTextureIndexes

```ml
faceTextureIndexes
```

BSP shader or texture index associated with each face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L140)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-facetrianglecounts-facetrianglecounts-src-mq3-renderer-world-surface-selection-ml-1353956521"></a>
### faceTriangleCounts

```ml
faceTriangleCounts
```

Cached triangle workload associated with each BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L134)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-map-map-src-mq3-renderer-world-surface-selection-ml-496776915"></a>
### map

```ml
map
```

Parsed BSP map used by geometry, visibility, or lighting operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L128)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-nativefaces-nativefaces-src-mq3-renderer-world-surface-selection-ml-388038791"></a>
### nativeFaces

```ml
nativeFaces
```

Packed native representation of BSP face metadata used by visibility selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L156)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-nativeoutput-nativeoutput-src-mq3-renderer-world-surface-selection-ml-1526441859"></a>
### nativeOutput

```ml
nativeOutput
```

Native output buffer written by accelerated world-surface selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L160)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-nativeprevious-nativeprevious-src-mq3-renderer-world-surface-selection-ml-1941901395"></a>
### nativePrevious

```ml
nativePrevious
```

Native buffer retaining the previous visible-face selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L162)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-nativeselected-nativeselected-src-mq3-renderer-world-surface-selection-ml-1919492771"></a>
### nativeSelected

```ml
nativeSelected
```

Native buffer retaining the currently selected faces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L164)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-nativevisible-nativevisible-src-mq3-renderer-world-surface-selection-ml-1826166367"></a>
### nativeVisible

```ml
nativeVisible
```

Native visibility buffer used by accelerated world-surface selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L158)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-patcherror-patcherror-src-mq3-renderer-world-surface-selection-ml-881132579"></a>
### patchError

```ml
patchError
```

Permitted geometric error when tessellating curved patches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L146)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-patches-patches-src-mq3-renderer-world-surface-selection-ml-1620611075"></a>
### patches

```ml
patches
```

Curved world patches and their cached detail variants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L168)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-pvsclustercount-pvsclustercount-src-mq3-renderer-world-surface-selection-ml-255371267"></a>
### pvsClusterCount

```ml
pvsClusterCount
```

Number of visibility clusters represented by the cached PVS state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L154)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-pvsfaces-pvsfaces-src-mq3-renderer-world-surface-selection-ml-87053337"></a>
### pvsFaces

```ml
pvsFaces
```

Face indices retained by the cached visibility-cluster query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L150)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-pvsrejected-pvsrejected-src-mq3-renderer-world-surface-selection-ml-1302994383"></a>
### pvsRejected

```ml
pvsRejected
```

Number of faces rejected by the cached visibility-cluster query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L152)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-totaltrianglecount-totaltrianglecount-src-mq3-renderer-world-surface-selection-ml-1737036257"></a>
### totalTriangleCount

```ml
totalTriangleCount
```

Total number of triangles represented by the cached world geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L148)

<a id="field-field-mq3-renderer-world-surface-selection-worldcache-trianglesbyface-trianglesbyface-src-mq3-renderer-world-surface-selection-ml-256942667"></a>
### trianglesByFace

```ml
trianglesByFace
```

Cached triangle geometry indexed by BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L144)
