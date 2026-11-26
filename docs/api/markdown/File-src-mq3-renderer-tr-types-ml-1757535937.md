# `src/mq3/renderer/tr_types.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_types`](Package-mq3-renderer-tr-types-1125534709.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-renderer-tr-types-3dfx-driver-name-const-3dfx-driver-name-3dfxvgl-src-mq3-renderer-tr-types-ml-1307782899"></a>
### _3DFX_DRIVER_NAME

```ml
const _3DFX_DRIVER_NAME = "3dfxvgl"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L44)

- [mq3.renderer.tr_types.Glconfig](Type-mq3-renderer-tr-types-glconfig-991674164.md) — struct
<a id="constant-constant-mq3-renderer-tr-types-gldrv-icd-const-gldrv-icd-0-src-mq3-renderer-tr-types-ml-1009483317"></a>
### GLDRV_ICD

```ml
const GLDRV_ICD = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L36)

<a id="constant-constant-mq3-renderer-tr-types-gldrv-standalone-const-gldrv-standalone-1-src-mq3-renderer-tr-types-ml-2135225588"></a>
### GLDRV_STANDALONE

```ml
const GLDRV_STANDALONE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L37)

<a id="constant-constant-mq3-renderer-tr-types-gldrv-voodoo-const-gldrv-voodoo-2-src-mq3-renderer-tr-types-ml-1497157757"></a>
### GLDRV_VOODOO

```ml
const GLDRV_VOODOO = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L38)

<a id="constant-constant-mq3-renderer-tr-types-glhw-3dfx-2d3d-const-glhw-3dfx-2d3d-1-src-mq3-renderer-tr-types-ml-1828037098"></a>
### GLHW_3DFX_2D3D

```ml
const GLHW_3DFX_2D3D = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L40)

<a id="constant-constant-mq3-renderer-tr-types-glhw-generic-const-glhw-generic-0-src-mq3-renderer-tr-types-ml-1250024471"></a>
### GLHW_GENERIC

```ml
const GLHW_GENERIC = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L39)

<a id="constant-constant-mq3-renderer-tr-types-glhw-permedia2-const-glhw-permedia2-4-src-mq3-renderer-tr-types-ml-39479627"></a>
### GLHW_PERMEDIA2

```ml
const GLHW_PERMEDIA2 = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L43)

<a id="constant-constant-mq3-renderer-tr-types-glhw-ragepro-const-glhw-ragepro-3-src-mq3-renderer-tr-types-ml-1538774014"></a>
### GLHW_RAGEPRO

```ml
const GLHW_RAGEPRO = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L42)

<a id="constant-constant-mq3-renderer-tr-types-glhw-riva128-const-glhw-riva128-2-src-mq3-renderer-tr-types-ml-855461645"></a>
### GLHW_RIVA128

```ml
const GLHW_RIVA128 = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L41)

<a id="function-function-mq3-renderer-tr-types-isworldrequired-function-isworldrequired-rdflags-src-mq3-renderer-tr-types-ml-1260245599"></a>
### isWorldRequired

```ml
function isWorldRequired(rdflags)
```

Computes `(rdflags&RDF_NOWORLDMODEL)==0` for `mq3.renderer.tr_types.isWorldRequired`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rdflags` | `dynamic` | — | Input used in the result expression `(rdflags&RDF_NOWORLDMODEL)==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L73)

<a id="constant-constant-mq3-renderer-tr-types-max-dlights-const-max-dlights-32-src-mq3-renderer-tr-types-ml-1230943876"></a>
### MAX_DLIGHTS

```ml
const MAX_DLIGHTS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L6)

<a id="constant-constant-mq3-renderer-tr-types-max-entities-const-max-entities-1023-src-mq3-renderer-tr-types-ml-2090079475"></a>
### MAX_ENTITIES

```ml
const MAX_ENTITIES = 1023
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L7)

<a id="constant-constant-mq3-renderer-tr-types-max-render-string-length-const-max-render-string-length-32-src-mq3-renderer-tr-types-ml-1268720866"></a>
### MAX_RENDER_STRING_LENGTH

```ml
const MAX_RENDER_STRING_LENGTH = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L30)

<a id="constant-constant-mq3-renderer-tr-types-max-render-strings-const-max-render-strings-8-src-mq3-renderer-tr-types-ml-865350063"></a>
### MAX_RENDER_STRINGS

```ml
const MAX_RENDER_STRINGS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L29)

<a id="constant-constant-mq3-renderer-tr-types-opengl-driver-name-const-opengl-driver-name-opengl32-src-mq3-renderer-tr-types-ml-277126159"></a>
### OPENGL_DRIVER_NAME

```ml
const OPENGL_DRIVER_NAME = "opengl32"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L45)

- [mq3.renderer.tr_types.Poly](Type-mq3-renderer-tr-types-poly-1486255891.md) — struct
- [mq3.renderer.tr_types.PolyVert](Type-mq3-renderer-tr-types-polyvert-910577216.md) — struct
<a id="constant-constant-mq3-renderer-tr-types-rdf-hyperspace-const-rdf-hyperspace-4-src-mq3-renderer-tr-types-ml-1974380085"></a>
### RDF_HYPERSPACE

```ml
const RDF_HYPERSPACE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L17)

<a id="constant-constant-mq3-renderer-tr-types-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-renderer-tr-types-ml-934090216"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L16)

- [mq3.renderer.tr_types.Refdef](Type-mq3-renderer-tr-types-refdef-385142797.md) — struct
- [mq3.renderer.tr_types.RefEntity](Type-mq3-renderer-tr-types-refentity-496120309.md) — struct
<a id="constant-constant-mq3-renderer-tr-types-rf-depthhack-const-rf-depthhack-8-src-mq3-renderer-tr-types-ml-1309206565"></a>
### RF_DEPTHHACK

```ml
const RF_DEPTHHACK = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L11)

<a id="constant-constant-mq3-renderer-tr-types-rf-first-person-const-rf-first-person-4-src-mq3-renderer-tr-types-ml-219248181"></a>
### RF_FIRST_PERSON

```ml
const RF_FIRST_PERSON = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L10)

<a id="constant-constant-mq3-renderer-tr-types-rf-lighting-origin-const-rf-lighting-origin-128-src-mq3-renderer-tr-types-ml-907970760"></a>
### RF_LIGHTING_ORIGIN

```ml
const RF_LIGHTING_ORIGIN = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L13)

<a id="constant-constant-mq3-renderer-tr-types-rf-minlight-const-rf-minlight-1-src-mq3-renderer-tr-types-ml-1104450840"></a>
### RF_MINLIGHT

```ml
const RF_MINLIGHT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L8)

<a id="constant-constant-mq3-renderer-tr-types-rf-noshadow-const-rf-noshadow-64-src-mq3-renderer-tr-types-ml-954776157"></a>
### RF_NOSHADOW

```ml
const RF_NOSHADOW = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L12)

<a id="constant-constant-mq3-renderer-tr-types-rf-shadow-plane-const-rf-shadow-plane-256-src-mq3-renderer-tr-types-ml-710422682"></a>
### RF_SHADOW_PLANE

```ml
const RF_SHADOW_PLANE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L14)

<a id="constant-constant-mq3-renderer-tr-types-rf-third-person-const-rf-third-person-2-src-mq3-renderer-tr-types-ml-1862445995"></a>
### RF_THIRD_PERSON

```ml
const RF_THIRD_PERSON = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L9)

<a id="constant-constant-mq3-renderer-tr-types-rf-wrap-frames-const-rf-wrap-frames-512-src-mq3-renderer-tr-types-ml-1748423659"></a>
### RF_WRAP_FRAMES

```ml
const RF_WRAP_FRAMES = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L15)

<a id="constant-constant-mq3-renderer-tr-types-rt-beam-const-rt-beam-3-src-mq3-renderer-tr-types-ml-1360336718"></a>
### RT_BEAM

```ml
const RT_BEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L22)

<a id="constant-constant-mq3-renderer-tr-types-rt-lightning-const-rt-lightning-6-src-mq3-renderer-tr-types-ml-1285490031"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L25)

<a id="constant-constant-mq3-renderer-tr-types-rt-max-ref-entity-type-const-rt-max-ref-entity-type-8-src-mq3-renderer-tr-types-ml-1177702931"></a>
### RT_MAX_REF_ENTITY_TYPE

```ml
const RT_MAX_REF_ENTITY_TYPE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L27)

<a id="constant-constant-mq3-renderer-tr-types-rt-model-const-rt-model-0-src-mq3-renderer-tr-types-ml-1639590147"></a>
### RT_MODEL

```ml
const RT_MODEL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L19)

<a id="constant-constant-mq3-renderer-tr-types-rt-poly-const-rt-poly-1-src-mq3-renderer-tr-types-ml-1282128512"></a>
### RT_POLY

```ml
const RT_POLY = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L20)

<a id="constant-constant-mq3-renderer-tr-types-rt-portalsurface-const-rt-portalsurface-7-src-mq3-renderer-tr-types-ml-1704033156"></a>
### RT_PORTALSURFACE

```ml
const RT_PORTALSURFACE = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L26)

<a id="constant-constant-mq3-renderer-tr-types-rt-rail-core-const-rt-rail-core-4-src-mq3-renderer-tr-types-ml-1582788489"></a>
### RT_RAIL_CORE

```ml
const RT_RAIL_CORE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L23)

<a id="constant-constant-mq3-renderer-tr-types-rt-rail-rings-const-rt-rail-rings-5-src-mq3-renderer-tr-types-ml-530490012"></a>
### RT_RAIL_RINGS

```ml
const RT_RAIL_RINGS = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L24)

<a id="constant-constant-mq3-renderer-tr-types-rt-sprite-const-rt-sprite-2-src-mq3-renderer-tr-types-ml-609340267"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L21)

<a id="constant-constant-mq3-renderer-tr-types-stereo-center-const-stereo-center-0-src-mq3-renderer-tr-types-ml-1918323241"></a>
### STEREO_CENTER

```ml
const STEREO_CENTER = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L31)

<a id="constant-constant-mq3-renderer-tr-types-stereo-left-const-stereo-left-1-src-mq3-renderer-tr-types-ml-18437896"></a>
### STEREO_LEFT

```ml
const STEREO_LEFT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L32)

<a id="constant-constant-mq3-renderer-tr-types-stereo-right-const-stereo-right-2-src-mq3-renderer-tr-types-ml-1162233231"></a>
### STEREO_RIGHT

```ml
const STEREO_RIGHT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L33)

<a id="constant-constant-mq3-renderer-tr-types-tc-none-const-tc-none-0-src-mq3-renderer-tr-types-ml-1708135981"></a>
### TC_NONE

```ml
const TC_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L34)

<a id="constant-constant-mq3-renderer-tr-types-tc-s3tc-const-tc-s3tc-1-src-mq3-renderer-tr-types-ml-896640936"></a>
### TC_S3TC

```ml
const TC_S3TC = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L35)

<a id="function-function-mq3-renderer-tr-types-typenames-function-typenames-src-mq3-renderer-tr-types-ml-2097482586"></a>
### typeNames

```ml
function typeNames()
```

Lists the 10 declared names for `mq3.renderer.tr_types.typeNames`, including `polyVert_t`, `poly_t`, `refEntityType_t`, `refEntity_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L59)

<a id="function-function-mq3-renderer-tr-types-validrefentitytype-function-validrefentitytype-value-src-mq3-renderer-tr-types-ml-866261001"></a>
### validRefEntityType

```ml
function validRefEntityType(value)
```

Computes `value>=RT_MODEL and value<RT_MAX_REF_ENTITY_TYPE` for `mq3.renderer.tr_types.validRefEntityType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value>=RT_MODEL and value<RT_MAX_REF_ENTITY_TYPE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L62)

<a id="function-function-mq3-renderer-tr-types-visibleinview-function-visibleinview-renderfx-isportal-src-mq3-renderer-tr-types-ml-171282686"></a>
### visibleInView

```ml
function visibleInView(renderfx, isPortal)
```

Returns `true` from `mq3.renderer.tr_types.visibleInView`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderfx` | `dynamic` | — | Input tested by `(renderfx&RF_FIRST_PERSON)!=0 and isPortal`. |
| `isPortal` | `dynamic` | — | Input tested by `(renderfx&RF_FIRST_PERSON)!=0 and isPortal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_types.ml#L66)
