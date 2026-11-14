# `src/mq3/format/aas.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.aas`](Package-mq3-format-aas-1612217060.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

- [mq3.format.aas.AAS](Type-mq3-format-aas-aas-1432772725.md) — struct
<a id="constant-constant-mq3-format-aas-aas-id-const-aas-id-1396785477-src-mq3-format-aas-ml-416093966"></a>
### AAS_ID

```ml
const AAS_ID = 1396785477
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L8)

<a id="constant-constant-mq3-format-aas-aas-lumps-const-aas-lumps-lump-count-src-mq3-format-aas-ml-1915869759"></a>
### AAS_LUMPS

```ml
const AAS_LUMPS = LUMP_COUNT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L30)

<a id="constant-constant-mq3-format-aas-aas-version-const-aas-version-5-src-mq3-format-aas-ml-1672573822"></a>
### AAS_VERSION

```ml
const AAS_VERSION = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L10)

<a id="constant-constant-mq3-format-aas-aas-version-old-const-aas-version-old-4-src-mq3-format-aas-ml-1460676701"></a>
### AAS_VERSION_OLD

```ml
const AAS_VERSION_OLD = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L9)

<a id="constant-constant-mq3-format-aas-aasid-const-aasid-aas-id-src-mq3-format-aas-ml-1937881228"></a>
### AASID

```ml
const AASID = AAS_ID
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L27)

<a id="constant-constant-mq3-format-aas-aaslump-areas-const-aaslump-areas-lump-areas-src-mq3-format-aas-ml-715660202"></a>
### AASLUMP_AREAS

```ml
const AASLUMP_AREAS = LUMP_AREAS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L38)

<a id="constant-constant-mq3-format-aas-aaslump-areasettings-const-aaslump-areasettings-lump-areasettings-src-mq3-format-aas-ml-525454784"></a>
### AASLUMP_AREASETTINGS

```ml
const AASLUMP_AREASETTINGS = LUMP_AREASETTINGS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L39)

<a id="constant-constant-mq3-format-aas-aaslump-bboxes-const-aaslump-bboxes-lump-bboxes-src-mq3-format-aas-ml-398088565"></a>
### AASLUMP_BBOXES

```ml
const AASLUMP_BBOXES = LUMP_BBOXES
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L31)

<a id="constant-constant-mq3-format-aas-aaslump-clusters-const-aaslump-clusters-lump-clusters-src-mq3-format-aas-ml-904299101"></a>
### AASLUMP_CLUSTERS

```ml
const AASLUMP_CLUSTERS = LUMP_CLUSTERS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L44)

<a id="constant-constant-mq3-format-aas-aaslump-edgeindex-const-aaslump-edgeindex-lump-edgeindex-src-mq3-format-aas-ml-1538349995"></a>
### AASLUMP_EDGEINDEX

```ml
const AASLUMP_EDGEINDEX = LUMP_EDGEINDEX
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L35)

<a id="constant-constant-mq3-format-aas-aaslump-edges-const-aaslump-edges-lump-edges-src-mq3-format-aas-ml-962538702"></a>
### AASLUMP_EDGES

```ml
const AASLUMP_EDGES = LUMP_EDGES
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L34)

<a id="constant-constant-mq3-format-aas-aaslump-faceindex-const-aaslump-faceindex-lump-faceindex-src-mq3-format-aas-ml-136130615"></a>
### AASLUMP_FACEINDEX

```ml
const AASLUMP_FACEINDEX = LUMP_FACEINDEX
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L37)

<a id="constant-constant-mq3-format-aas-aaslump-faces-const-aaslump-faces-lump-faces-src-mq3-format-aas-ml-1095050826"></a>
### AASLUMP_FACES

```ml
const AASLUMP_FACES = LUMP_FACES
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L36)

<a id="constant-constant-mq3-format-aas-aaslump-nodes-const-aaslump-nodes-lump-nodes-src-mq3-format-aas-ml-326065177"></a>
### AASLUMP_NODES

```ml
const AASLUMP_NODES = LUMP_NODES
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L41)

<a id="constant-constant-mq3-format-aas-aaslump-planes-const-aaslump-planes-lump-planes-src-mq3-format-aas-ml-1735503909"></a>
### AASLUMP_PLANES

```ml
const AASLUMP_PLANES = LUMP_PLANES
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L33)

<a id="constant-constant-mq3-format-aas-aaslump-portalindex-const-aaslump-portalindex-lump-portalindex-src-mq3-format-aas-ml-1460213750"></a>
### AASLUMP_PORTALINDEX

```ml
const AASLUMP_PORTALINDEX = LUMP_PORTALINDEX
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L43)

<a id="constant-constant-mq3-format-aas-aaslump-portals-const-aaslump-portals-lump-portals-src-mq3-format-aas-ml-1048836959"></a>
### AASLUMP_PORTALS

```ml
const AASLUMP_PORTALS = LUMP_PORTALS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L42)

<a id="constant-constant-mq3-format-aas-aaslump-reachability-const-aaslump-reachability-lump-reachability-src-mq3-format-aas-ml-58608245"></a>
### AASLUMP_REACHABILITY

```ml
const AASLUMP_REACHABILITY = LUMP_REACHABILITY
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L40)

<a id="constant-constant-mq3-format-aas-aaslump-vertexes-const-aaslump-vertexes-lump-vertexes-src-mq3-format-aas-ml-1609387142"></a>
### AASLUMP_VERTEXES

```ml
const AASLUMP_VERTEXES = LUMP_VERTEXES
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L32)

<a id="constant-constant-mq3-format-aas-aasversion-const-aasversion-aas-version-src-mq3-format-aas-ml-935249361"></a>
### AASVERSION

```ml
const AASVERSION = AAS_VERSION
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L29)

<a id="constant-constant-mq3-format-aas-aasversion-old-const-aasversion-old-aas-version-old-src-mq3-format-aas-ml-1677982375"></a>
### AASVERSION_OLD

```ml
const AASVERSION_OLD = AAS_VERSION_OLD
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L28)

<a id="function-function-mq3-format-aas-area-function-area-map-index-src-mq3-format-aas-ml-1803847756"></a>
### area

```ml
function area(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L163)

- [mq3.format.aas.Area](Type-mq3-format-aas-area-75941019.md) — struct
<a id="constant-constant-mq3-format-aas-area-bridge-const-area-bridge-16-src-mq3-format-aas-ml-1238121210"></a>
### AREA_BRIDGE

```ml
const AREA_BRIDGE = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L100)

<a id="constant-constant-mq3-format-aas-area-disabled-const-area-disabled-8-src-mq3-format-aas-ml-1102338505"></a>
### AREA_DISABLED

```ml
const AREA_DISABLED = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L99)

<a id="constant-constant-mq3-format-aas-area-grounded-const-area-grounded-1-src-mq3-format-aas-ml-882981062"></a>
### AREA_GROUNDED

```ml
const AREA_GROUNDED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L96)

<a id="constant-constant-mq3-format-aas-area-ladder-const-area-ladder-2-src-mq3-format-aas-ml-666979567"></a>
### AREA_LADDER

```ml
const AREA_LADDER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L97)

<a id="constant-constant-mq3-format-aas-area-liquid-const-area-liquid-4-src-mq3-format-aas-ml-1982967205"></a>
### AREA_LIQUID

```ml
const AREA_LIQUID = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L98)

<a id="constant-constant-mq3-format-aas-area-settings-size-const-area-settings-size-28-src-mq3-format-aas-ml-1632800363"></a>
### AREA_SETTINGS_SIZE

```ml
const AREA_SETTINGS_SIZE = 28
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L109)

<a id="constant-constant-mq3-format-aas-area-size-const-area-size-48-src-mq3-format-aas-ml-1194169761"></a>
### AREA_SIZE

```ml
const AREA_SIZE = 48
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L108)

<a id="constant-constant-mq3-format-aas-areacontents-clusterportal-const-areacontents-clusterportal-8-src-mq3-format-aas-ml-1259257123"></a>
### AREACONTENTS_CLUSTERPORTAL

```ml
const AREACONTENTS_CLUSTERPORTAL = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L83)

<a id="constant-constant-mq3-format-aas-areacontents-donotenter-const-areacontents-donotenter-256-src-mq3-format-aas-ml-982687988"></a>
### AREACONTENTS_DONOTENTER

```ml
const AREACONTENTS_DONOTENTER = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L88)

<a id="constant-constant-mq3-format-aas-areacontents-jumppad-const-areacontents-jumppad-128-src-mq3-format-aas-ml-1515167364"></a>
### AREACONTENTS_JUMPPAD

```ml
const AREACONTENTS_JUMPPAD = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L87)

<a id="constant-constant-mq3-format-aas-areacontents-lava-const-areacontents-lava-2-src-mq3-format-aas-ml-1231017563"></a>
### AREACONTENTS_LAVA

```ml
const AREACONTENTS_LAVA = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L81)

<a id="constant-constant-mq3-format-aas-areacontents-maxmodelnum-const-areacontents-maxmodelnum-255-src-mq3-format-aas-ml-989844217"></a>
### AREACONTENTS_MAXMODELNUM

```ml
const AREACONTENTS_MAXMODELNUM = 255
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L94)

<a id="constant-constant-mq3-format-aas-areacontents-modelnum-const-areacontents-modelnum-4278190080-src-mq3-format-aas-ml-329827274"></a>
### AREACONTENTS_MODELNUM

```ml
const AREACONTENTS_MODELNUM = 4278190080
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L95)

<a id="constant-constant-mq3-format-aas-areacontents-modelnumshift-const-areacontents-modelnumshift-24-src-mq3-format-aas-ml-896328375"></a>
### AREACONTENTS_MODELNUMSHIFT

```ml
const AREACONTENTS_MODELNUMSHIFT = 24
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L93)

<a id="constant-constant-mq3-format-aas-areacontents-mover-const-areacontents-mover-1024-src-mq3-format-aas-ml-1444446550"></a>
### AREACONTENTS_MOVER

```ml
const AREACONTENTS_MOVER = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L90)

<a id="constant-constant-mq3-format-aas-areacontents-notteam1-const-areacontents-notteam1-2048-src-mq3-format-aas-ml-821061475"></a>
### AREACONTENTS_NOTTEAM1

```ml
const AREACONTENTS_NOTTEAM1 = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L91)

<a id="constant-constant-mq3-format-aas-areacontents-notteam2-const-areacontents-notteam2-4096-src-mq3-format-aas-ml-1610329702"></a>
### AREACONTENTS_NOTTEAM2

```ml
const AREACONTENTS_NOTTEAM2 = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L92)

<a id="constant-constant-mq3-format-aas-areacontents-routeportal-const-areacontents-routeportal-32-src-mq3-format-aas-ml-1848403564"></a>
### AREACONTENTS_ROUTEPORTAL

```ml
const AREACONTENTS_ROUTEPORTAL = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L85)

<a id="constant-constant-mq3-format-aas-areacontents-slime-const-areacontents-slime-4-src-mq3-format-aas-ml-890672095"></a>
### AREACONTENTS_SLIME

```ml
const AREACONTENTS_SLIME = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L82)

<a id="constant-constant-mq3-format-aas-areacontents-teleportal-const-areacontents-teleportal-16-src-mq3-format-aas-ml-1953951806"></a>
### AREACONTENTS_TELEPORTAL

```ml
const AREACONTENTS_TELEPORTAL = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L84)

<a id="constant-constant-mq3-format-aas-areacontents-teleporter-const-areacontents-teleporter-64-src-mq3-format-aas-ml-786292659"></a>
### AREACONTENTS_TELEPORTER

```ml
const AREACONTENTS_TELEPORTER = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L86)

<a id="constant-constant-mq3-format-aas-areacontents-viewportal-const-areacontents-viewportal-512-src-mq3-format-aas-ml-438587801"></a>
### AREACONTENTS_VIEWPORTAL

```ml
const AREACONTENTS_VIEWPORTAL = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L89)

<a id="constant-constant-mq3-format-aas-areacontents-water-const-areacontents-water-1-src-mq3-format-aas-ml-641797714"></a>
### AREACONTENTS_WATER

```ml
const AREACONTENTS_WATER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L80)

<a id="function-function-mq3-format-aas-areasettings-function-areasettings-map-index-src-mq3-format-aas-ml-1408605908"></a>
### areaSettings

```ml
function areaSettings(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L164)

- [mq3.format.aas.AreaSettings](Type-mq3-format-aas-areasettings-162440038.md) — struct
<a id="function-function-mq3-format-aas-bbox-function-bbox-map-index-src-mq3-format-aas-ml-967415512"></a>
### bbox

```ml
function bbox(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L157)

- [mq3.format.aas.BBox](Type-mq3-format-aas-bbox-641438653.md) — struct
<a id="constant-constant-mq3-format-aas-bbox-size-const-bbox-size-32-src-mq3-format-aas-ml-1168350004"></a>
### BBOX_SIZE

```ml
const BBOX_SIZE = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L102)

<a id="function-function-mq3-format-aas-checkbspchecksum-function-checkbspchecksum-map-expected-src-mq3-format-aas-ml-1182330228"></a>
### checkBspChecksum

```ml
function checkBspChecksum(map, expected)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `expected` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L203)

<a id="function-function-mq3-format-aas-cluster-function-cluster-map-index-src-mq3-format-aas-ml-1936897892"></a>
### cluster

```ml
function cluster(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L169)

- [mq3.format.aas.Cluster](Type-mq3-format-aas-cluster-1380852344.md) — struct
<a id="constant-constant-mq3-format-aas-cluster-size-const-cluster-size-16-src-mq3-format-aas-ml-1429990880"></a>
### CLUSTER_SIZE

```ml
const CLUSTER_SIZE = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L113)

<a id="function-function-mq3-format-aas-ddata-function-ddata-data-src-mq3-format-aas-ml-617163118"></a>
### ddata

```ml
function ddata(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L215)

<a id="function-function-mq3-format-aas-decodedheader-function-decodedheader-data-version-src-mq3-format-aas-ml-267961200"></a>
### decodedHeader

```ml
function decodedHeader(data, version)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `version` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L150)

<a id="function-function-mq3-format-aas-edge-function-edge-map-index-src-mq3-format-aas-ml-2063502856"></a>
### edge

```ml
function edge(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L159)

<a id="constant-constant-mq3-format-aas-edge-size-const-edge-size-8-src-mq3-format-aas-ml-532984413"></a>
### EDGE_SIZE

```ml
const EDGE_SIZE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L105)

<a id="function-function-mq3-format-aas-edgeindex-function-edgeindex-map-index-src-mq3-format-aas-ml-1959943374"></a>
### edgeIndex

```ml
function edgeIndex(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L160)

<a id="function-function-mq3-format-aas-encode-function-encode-map-src-mq3-format-aas-ml-67605492"></a>
### encode

```ml
function encode(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L220)

<a id="function-function-mq3-format-aas-f32-function-f32-data-offset-label-src-mq3-format-aas-ml-1745371125"></a>
### f32

```ml
function f32(data, offset, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L136)

<a id="function-function-mq3-format-aas-face-function-face-map-index-src-mq3-format-aas-ml-1316691416"></a>
### face

```ml
function face(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L161)

- [mq3.format.aas.Face](Type-mq3-format-aas-face-875082823.md) — struct
<a id="constant-constant-mq3-format-aas-face-bridge-const-face-bridge-64-src-mq3-format-aas-ml-1454235907"></a>
### FACE_BRIDGE

```ml
const FACE_BRIDGE = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L79)

<a id="constant-constant-mq3-format-aas-face-gap-const-face-gap-8-src-mq3-format-aas-ml-112001243"></a>
### FACE_GAP

```ml
const FACE_GAP = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L76)

<a id="constant-constant-mq3-format-aas-face-ground-const-face-ground-4-src-mq3-format-aas-ml-1026308177"></a>
### FACE_GROUND

```ml
const FACE_GROUND = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L75)

<a id="constant-constant-mq3-format-aas-face-ladder-const-face-ladder-2-src-mq3-format-aas-ml-51303743"></a>
### FACE_LADDER

```ml
const FACE_LADDER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L74)

<a id="constant-constant-mq3-format-aas-face-liquid-const-face-liquid-16-src-mq3-format-aas-ml-1282238698"></a>
### FACE_LIQUID

```ml
const FACE_LIQUID = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L77)

<a id="constant-constant-mq3-format-aas-face-liquidsurface-const-face-liquidsurface-32-src-mq3-format-aas-ml-533505492"></a>
### FACE_LIQUIDSURFACE

```ml
const FACE_LIQUIDSURFACE = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L78)

<a id="constant-constant-mq3-format-aas-face-size-const-face-size-24-src-mq3-format-aas-ml-1735604155"></a>
### FACE_SIZE

```ml
const FACE_SIZE = 24
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L107)

<a id="constant-constant-mq3-format-aas-face-solid-const-face-solid-1-src-mq3-format-aas-ml-1153827178"></a>
### FACE_SOLID

```ml
const FACE_SOLID = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L73)

<a id="function-function-mq3-format-aas-faceindex-function-faceindex-map-index-src-mq3-format-aas-ml-1749235178"></a>
### faceIndex

```ml
function faceIndex(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L162)

<a id="function-function-mq3-format-aas-fail-function-fail-message-src-mq3-format-aas-ml-1664961607"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L128)

<a id="function-function-mq3-format-aas-header-function-header-map-src-mq3-format-aas-ml-451164932"></a>
### header

```ml
function header(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L205)

- [mq3.format.aas.Header](Type-mq3-format-aas-header-899928079.md) — struct
<a id="constant-constant-mq3-format-aas-header-size-const-header-size-124-src-mq3-format-aas-ml-1689934416"></a>
### HEADER_SIZE

```ml
const HEADER_SIZE = 124
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L11)

<a id="function-function-mq3-format-aas-i32-function-i32-data-offset-label-src-mq3-format-aas-ml-1622329451"></a>
### i32

```ml
function i32(data, offset, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L134)

<a id="constant-constant-mq3-format-aas-index-size-const-index-size-4-src-mq3-format-aas-ml-1179747435"></a>
### INDEX_SIZE

```ml
const INDEX_SIZE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L106)

<a id="function-function-mq3-format-aas-indexedrange-function-indexedrange-first-count-limit-label-src-mq3-format-aas-ml-1473754500"></a>
### indexedRange

```ml
function indexedRange(first, count, limit, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L144)

<a id="function-function-mq3-format-aas-load-function-load-data-src-mq3-format-aas-ml-734195262"></a>
### load

```ml
function load(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L188)

- [mq3.format.aas.Lump](Type-mq3-format-aas-lump-1209201636.md) — struct
<a id="constant-constant-mq3-format-aas-lump-areas-const-lump-areas-7-src-mq3-format-aas-ml-830829240"></a>
### LUMP_AREAS

```ml
const LUMP_AREAS = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L20)

<a id="constant-constant-mq3-format-aas-lump-areasettings-const-lump-areasettings-8-src-mq3-format-aas-ml-1455468061"></a>
### LUMP_AREASETTINGS

```ml
const LUMP_AREASETTINGS = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L21)

<a id="constant-constant-mq3-format-aas-lump-bboxes-const-lump-bboxes-0-src-mq3-format-aas-ml-438463929"></a>
### LUMP_BBOXES

```ml
const LUMP_BBOXES = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L13)

<a id="constant-constant-mq3-format-aas-lump-clusters-const-lump-clusters-13-src-mq3-format-aas-ml-1381156473"></a>
### LUMP_CLUSTERS

```ml
const LUMP_CLUSTERS = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L26)

<a id="constant-constant-mq3-format-aas-lump-count-const-lump-count-14-src-mq3-format-aas-ml-65495178"></a>
### LUMP_COUNT

```ml
const LUMP_COUNT = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L12)

<a id="constant-constant-mq3-format-aas-lump-edgeindex-const-lump-edgeindex-4-src-mq3-format-aas-ml-1946614259"></a>
### LUMP_EDGEINDEX

```ml
const LUMP_EDGEINDEX = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L17)

<a id="constant-constant-mq3-format-aas-lump-edges-const-lump-edges-3-src-mq3-format-aas-ml-342998020"></a>
### LUMP_EDGES

```ml
const LUMP_EDGES = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L16)

<a id="constant-constant-mq3-format-aas-lump-faceindex-const-lump-faceindex-6-src-mq3-format-aas-ml-1524119825"></a>
### LUMP_FACEINDEX

```ml
const LUMP_FACEINDEX = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L19)

<a id="constant-constant-mq3-format-aas-lump-faces-const-lump-faces-5-src-mq3-format-aas-ml-410580626"></a>
### LUMP_FACES

```ml
const LUMP_FACES = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L18)

<a id="constant-constant-mq3-format-aas-lump-nodes-const-lump-nodes-10-src-mq3-format-aas-ml-1729566626"></a>
### LUMP_NODES

```ml
const LUMP_NODES = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L23)

<a id="constant-constant-mq3-format-aas-lump-planes-const-lump-planes-2-src-mq3-format-aas-ml-1314921763"></a>
### LUMP_PLANES

```ml
const LUMP_PLANES = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L15)

<a id="constant-constant-mq3-format-aas-lump-portalindex-const-lump-portalindex-12-src-mq3-format-aas-ml-237914206"></a>
### LUMP_PORTALINDEX

```ml
const LUMP_PORTALINDEX = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L25)

<a id="constant-constant-mq3-format-aas-lump-portals-const-lump-portals-11-src-mq3-format-aas-ml-577444133"></a>
### LUMP_PORTALS

```ml
const LUMP_PORTALS = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L24)

<a id="constant-constant-mq3-format-aas-lump-reachability-const-lump-reachability-9-src-mq3-format-aas-ml-1650340246"></a>
### LUMP_REACHABILITY

```ml
const LUMP_REACHABILITY = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L22)

<a id="constant-constant-mq3-format-aas-lump-vertexes-const-lump-vertexes-1-src-mq3-format-aas-ml-765855314"></a>
### LUMP_VERTEXES

```ml
const LUMP_VERTEXES = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L14)

<a id="function-function-mq3-format-aas-lumpdata-function-lumpdata-map-lump-src-mq3-format-aas-ml-1858223350"></a>
### lumpData

```ml
function lumpData(map, lump)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `lump` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L210)

<a id="function-function-mq3-format-aas-lumpnames-function-lumpnames-src-mq3-format-aas-ml-839364286"></a>
### lumpNames

```ml
function lumpNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L130)

<a id="constant-constant-mq3-format-aas-max-traveltypes-const-max-traveltypes-32-src-mq3-format-aas-ml-1942063372"></a>
### MAX_TRAVELTYPES

```ml
const MAX_TRAVELTYPES = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L50)

<a id="function-function-mq3-format-aas-node-function-node-map-index-src-mq3-format-aas-ml-1715953904"></a>
### node

```ml
function node(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L166)

- [mq3.format.aas.Node](Type-mq3-format-aas-node-1963883082.md) — struct
<a id="constant-constant-mq3-format-aas-node-size-const-node-size-12-src-mq3-format-aas-ml-1764490274"></a>
### NODE_SIZE

```ml
const NODE_SIZE = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L111)

<a id="function-function-mq3-format-aas-plane-function-plane-map-index-src-mq3-format-aas-ml-534067156"></a>
### plane

```ml
function plane(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L158)

- [mq3.format.aas.Plane](Type-mq3-format-aas-plane-1144811296.md) — struct
<a id="constant-constant-mq3-format-aas-plane-size-const-plane-size-20-src-mq3-format-aas-ml-660074749"></a>
### PLANE_SIZE

```ml
const PLANE_SIZE = 20
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L104)

<a id="function-function-mq3-format-aas-portal-function-portal-map-index-src-mq3-format-aas-ml-1613920308"></a>
### portal

```ml
function portal(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L167)

- [mq3.format.aas.Portal](Type-mq3-format-aas-portal-1572880716.md) — struct
<a id="constant-constant-mq3-format-aas-portal-size-const-portal-size-20-src-mq3-format-aas-ml-254041211"></a>
### PORTAL_SIZE

```ml
const PORTAL_SIZE = 20
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L112)

<a id="function-function-mq3-format-aas-portalindex-function-portalindex-map-index-src-mq3-format-aas-ml-1441217348"></a>
### portalIndex

```ml
function portalIndex(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L168)

<a id="constant-constant-mq3-format-aas-presence-crouch-const-presence-crouch-4-src-mq3-format-aas-ml-622911269"></a>
### PRESENCE_CROUCH

```ml
const PRESENCE_CROUCH = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L49)

<a id="constant-constant-mq3-format-aas-presence-none-const-presence-none-1-src-mq3-format-aas-ml-331633314"></a>
### PRESENCE_NONE

```ml
const PRESENCE_NONE = 1
```

Complete code/botlib/aasfile.h public ABI.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L47)

<a id="constant-constant-mq3-format-aas-presence-normal-const-presence-normal-2-src-mq3-format-aas-ml-1795714287"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L48)

<a id="function-function-mq3-format-aas-reachability-function-reachability-map-index-src-mq3-format-aas-ml-173940504"></a>
### reachability

```ml
function reachability(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L165)

- [mq3.format.aas.Reachability](Type-mq3-format-aas-reachability-1665315537.md) — struct
<a id="constant-constant-mq3-format-aas-reachability-size-const-reachability-size-44-src-mq3-format-aas-ml-875255229"></a>
### REACHABILITY_SIZE

```ml
const REACHABILITY_SIZE = 44
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L110)

<a id="function-function-mq3-format-aas-recordoffset-function-recordoffset-map-lump-index-src-mq3-format-aas-ml-689345654"></a>
### recordOffset

```ml
function recordOffset(map, lump, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `lump` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L138)

<a id="function-function-mq3-format-aas-signedreference-function-signedreference-value-count-label-src-mq3-format-aas-ml-929920842"></a>
### signedReference

```ml
function signedReference(value, count, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L147)

<a id="function-function-mq3-format-aas-span-function-span-offset-size-limit-label-src-mq3-format-aas-ml-1635777785"></a>
### span

```ml
function span(offset, size, limit, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `offset` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L131)

<a id="function-function-mq3-format-aas-strides-function-strides-src-mq3-format-aas-ml-1591856078"></a>
### strides

```ml
function strides()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L129)

<a id="constant-constant-mq3-format-aas-travel-barrierjump-const-travel-barrierjump-4-src-mq3-format-aas-ml-1743550575"></a>
### TRAVEL_BARRIERJUMP

```ml
const TRAVEL_BARRIERJUMP = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L54)

<a id="constant-constant-mq3-format-aas-travel-bfgjump-const-travel-bfgjump-13-src-mq3-format-aas-ml-1923706691"></a>
### TRAVEL_BFGJUMP

```ml
const TRAVEL_BFGJUMP = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L63)

<a id="constant-constant-mq3-format-aas-travel-crouch-const-travel-crouch-3-src-mq3-format-aas-ml-1486833152"></a>
### TRAVEL_CROUCH

```ml
const TRAVEL_CROUCH = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L53)

<a id="constant-constant-mq3-format-aas-travel-doublejump-const-travel-doublejump-15-src-mq3-format-aas-ml-568753251"></a>
### TRAVEL_DOUBLEJUMP

```ml
const TRAVEL_DOUBLEJUMP = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L65)

<a id="constant-constant-mq3-format-aas-travel-elevator-const-travel-elevator-11-src-mq3-format-aas-ml-810788215"></a>
### TRAVEL_ELEVATOR

```ml
const TRAVEL_ELEVATOR = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L61)

<a id="constant-constant-mq3-format-aas-travel-funcbob-const-travel-funcbob-19-src-mq3-format-aas-ml-2032776857"></a>
### TRAVEL_FUNCBOB

```ml
const TRAVEL_FUNCBOB = 19
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L69)

<a id="constant-constant-mq3-format-aas-travel-grapplehook-const-travel-grapplehook-14-src-mq3-format-aas-ml-909764652"></a>
### TRAVEL_GRAPPLEHOOK

```ml
const TRAVEL_GRAPPLEHOOK = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L64)

<a id="constant-constant-mq3-format-aas-travel-invalid-const-travel-invalid-1-src-mq3-format-aas-ml-2057240520"></a>
### TRAVEL_INVALID

```ml
const TRAVEL_INVALID = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L51)

<a id="constant-constant-mq3-format-aas-travel-jump-const-travel-jump-5-src-mq3-format-aas-ml-596297286"></a>
### TRAVEL_JUMP

```ml
const TRAVEL_JUMP = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L55)

<a id="constant-constant-mq3-format-aas-travel-jumppad-const-travel-jumppad-18-src-mq3-format-aas-ml-506789622"></a>
### TRAVEL_JUMPPAD

```ml
const TRAVEL_JUMPPAD = 18
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L68)

<a id="constant-constant-mq3-format-aas-travel-ladder-const-travel-ladder-6-src-mq3-format-aas-ml-551893635"></a>
### TRAVEL_LADDER

```ml
const TRAVEL_LADDER = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L56)

<a id="constant-constant-mq3-format-aas-travel-rampjump-const-travel-rampjump-16-src-mq3-format-aas-ml-394492718"></a>
### TRAVEL_RAMPJUMP

```ml
const TRAVEL_RAMPJUMP = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L66)

<a id="constant-constant-mq3-format-aas-travel-rocketjump-const-travel-rocketjump-12-src-mq3-format-aas-ml-1804091930"></a>
### TRAVEL_ROCKETJUMP

```ml
const TRAVEL_ROCKETJUMP = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L62)

<a id="constant-constant-mq3-format-aas-travel-strafejump-const-travel-strafejump-17-src-mq3-format-aas-ml-532761685"></a>
### TRAVEL_STRAFEJUMP

```ml
const TRAVEL_STRAFEJUMP = 17
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L67)

<a id="constant-constant-mq3-format-aas-travel-swim-const-travel-swim-8-src-mq3-format-aas-ml-223809909"></a>
### TRAVEL_SWIM

```ml
const TRAVEL_SWIM = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L58)

<a id="constant-constant-mq3-format-aas-travel-teleport-const-travel-teleport-10-src-mq3-format-aas-ml-823634540"></a>
### TRAVEL_TELEPORT

```ml
const TRAVEL_TELEPORT = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L60)

<a id="constant-constant-mq3-format-aas-travel-walk-const-travel-walk-2-src-mq3-format-aas-ml-815134663"></a>
### TRAVEL_WALK

```ml
const TRAVEL_WALK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L52)

<a id="constant-constant-mq3-format-aas-travel-walkoffledge-const-travel-walkoffledge-7-src-mq3-format-aas-ml-849890996"></a>
### TRAVEL_WALKOFFLEDGE

```ml
const TRAVEL_WALKOFFLEDGE = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L57)

<a id="constant-constant-mq3-format-aas-travel-waterjump-const-travel-waterjump-9-src-mq3-format-aas-ml-215115788"></a>
### TRAVEL_WATERJUMP

```ml
const TRAVEL_WATERJUMP = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L59)

<a id="constant-constant-mq3-format-aas-travelflag-notteam1-const-travelflag-notteam1-16777216-src-mq3-format-aas-ml-1730541790"></a>
### TRAVELFLAG_NOTTEAM1

```ml
const TRAVELFLAG_NOTTEAM1 = 16777216
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L71)

<a id="constant-constant-mq3-format-aas-travelflag-notteam2-const-travelflag-notteam2-33554432-src-mq3-format-aas-ml-1867187248"></a>
### TRAVELFLAG_NOTTEAM2

```ml
const TRAVELFLAG_NOTTEAM2 = 33554432
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L72)

<a id="constant-constant-mq3-format-aas-traveltype-mask-const-traveltype-mask-16777215-src-mq3-format-aas-ml-1765712999"></a>
### TRAVELTYPE_MASK

```ml
const TRAVELTYPE_MASK = 16777215
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L70)

<a id="function-function-mq3-format-aas-u16-function-u16-data-offset-label-src-mq3-format-aas-ml-66601223"></a>
### u16

```ml
function u16(data, offset, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L135)

<a id="function-function-mq3-format-aas-validatetopology-function-validatetopology-map-src-mq3-format-aas-ml-260760800"></a>
### validateTopology

```ml
function validateTopology(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L171)

<a id="function-function-mq3-format-aas-vec3-function-vec3-data-offset-label-src-mq3-format-aas-ml-1849871319"></a>
### vec3

```ml
function vec3(data, offset, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L137)

<a id="function-function-mq3-format-aas-vertex-function-vertex-map-index-src-mq3-format-aas-ml-290524028"></a>
### vertex

```ml
function vertex(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L156)

<a id="constant-constant-mq3-format-aas-vertex-size-const-vertex-size-12-src-mq3-format-aas-ml-1567632094"></a>
### VERTEX_SIZE

```ml
const VERTEX_SIZE = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/aas.ml#L103)
