# `src/mq3/botlib/aas_bspq3.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_bspq3`](Package-mq3-botlib-aas-bspq3-649368793.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/server_imports.ml` as `imports` → [src/mq3/botlib/server_imports.ml](File-src-mq3-botlib-server-imports-ml-1126004744.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)

## Declarations

<a id="function-function-mq3-botlib-aas-bspq3-aas-areasconnected-function-aas-areasconnected-area1-area2-src-mq3-botlib-aas-bspq3-ml-1469472165"></a>
### AAS_AreasConnected

```ml
function AAS_AreasConnected(area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L36)

<a id="function-function-mq3-botlib-aas-bspq3-aas-boxentities-function-aas-boxentities-absmins-absmaxs-list-maxcount-src-mq3-botlib-aas-bspq3-ml-567765257"></a>
### AAS_BoxEntities

```ml
function AAS_BoxEntities(absmins, absmaxs, list, maxcount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `absmins` | `dynamic` | — |  |
| `absmaxs` | `dynamic` | — |  |
| `list` | `dynamic` | — |  |
| `maxcount` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L31)

<a id="function-function-mq3-botlib-aas-bspq3-aas-bspentityinrange-function-aas-bspentityinrange-state-entity-src-mq3-botlib-aas-bspq3-ml-202152350"></a>
### AAS_BSPEntityInRange

```ml
function AAS_BSPEntityInRange(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L41)

<a id="function-function-mq3-botlib-aas-bspq3-aas-bsplinkentity-function-aas-bsplinkentity-absmins-absmaxs-entnum-modelnum-src-mq3-botlib-aas-bspq3-ml-1552015382"></a>
### AAS_BSPLinkEntity

```ml
function AAS_BSPLinkEntity(absmins, absmaxs, entnum, modelnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `absmins` | `dynamic` | — |  |
| `absmaxs` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |
| `modelnum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L30)

<a id="function-function-mq3-botlib-aas-bspq3-aas-bspmodelminsmaxsorigin-function-aas-bspmodelminsmaxsorigin-host-modelnum-angles-src-mq3-botlib-aas-bspq3-ml-243538977"></a>
### AAS_BSPModelMinsMaxsOrigin

```ml
function AAS_BSPModelMinsMaxsOrigin(host, modelnum, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `modelnum` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L26)

<a id="function-function-mq3-botlib-aas-bspq3-aas-bsptracelight-function-aas-bsptracelight-start-finish-endpos-red-green-blue-src-mq3-botlib-aas-bspq3-ml-1064103204"></a>
### AAS_BSPTraceLight

```ml
function AAS_BSPTraceLight(start, finish, endpos, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `endpos` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L32)

<a id="function-function-mq3-botlib-aas-bspq3-aas-dumpbspdata-function-aas-dumpbspdata-state-src-mq3-botlib-aas-bspq3-ml-1605030729"></a>
### AAS_DumpBSPData

```ml
function AAS_DumpBSPData(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L74)

<a id="function-function-mq3-botlib-aas-bspq3-aas-entitycollision-function-aas-entitycollision-host-entnum-start-boxmins-boxmaxs-finish-contentmask-originaltrace-src-mq3-botlib-aas-bspq3-ml-1585740989"></a>
### AAS_EntityCollision

```ml
function AAS_EntityCollision(host, entnum, start, boxmins, boxmaxs, finish, contentmask, originalTrace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `boxmins` | `dynamic` | — |  |
| `boxmaxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `contentmask` | `dynamic` | — |  |
| `originalTrace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L20)

<a id="function-function-mq3-botlib-aas-bspq3-aas-floatforbspepairkey-function-aas-floatforbspepairkey-state-entity-key-src-mq3-botlib-aas-bspq3-ml-2095844105"></a>
### AAS_FloatForBSPEpairKey

```ml
function AAS_FloatForBSPEpairKey(state, entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L50)

<a id="function-function-mq3-botlib-aas-bspq3-aas-freebspentities-function-aas-freebspentities-state-src-mq3-botlib-aas-bspq3-ml-1994323403"></a>
### AAS_FreeBSPEntities

```ml
function AAS_FreeBSPEntities(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L57)

<a id="function-function-mq3-botlib-aas-bspq3-aas-inphs-function-aas-inphs-p1-p2-src-mq3-botlib-aas-bspq3-ml-1023662685"></a>
### AAS_inPHS

```ml
function AAS_inPHS(p1, p2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | `dynamic` | — |  |
| `p2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L25)

<a id="function-function-mq3-botlib-aas-bspq3-aas-inpvs-function-aas-inpvs-host-p1-p2-src-mq3-botlib-aas-bspq3-ml-635954931"></a>
### AAS_inPVS

```ml
function AAS_inPVS(host, p1, p2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `p1` | `dynamic` | — |  |
| `p2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L24)

<a id="function-function-mq3-botlib-aas-bspq3-aas-intforbspepairkey-function-aas-intforbspepairkey-state-entity-key-src-mq3-botlib-aas-bspq3-ml-1495945307"></a>
### AAS_IntForBSPEpairKey

```ml
function AAS_IntForBSPEpairKey(state, entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L53)

<a id="function-function-mq3-botlib-aas-bspq3-aas-loadbspfile-function-aas-loadbspfile-state-entitydata-src-mq3-botlib-aas-bspq3-ml-1221409816"></a>
### AAS_LoadBSPFile

```ml
function AAS_LoadBSPFile(state, entityData)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entityData` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L77)

<a id="function-function-mq3-botlib-aas-bspq3-aas-nextbspentity-function-aas-nextbspentity-state-entity-src-mq3-botlib-aas-bspq3-ml-109412452"></a>
### AAS_NextBSPEntity

```ml
function AAS_NextBSPEntity(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L38)

<a id="function-function-mq3-botlib-aas-bspq3-aas-parsebspentities-function-aas-parsebspentities-state-src-mq3-botlib-aas-bspq3-ml-1901848971"></a>
### AAS_ParseBSPEntities

```ml
function AAS_ParseBSPEntities(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L58)

<a id="function-function-mq3-botlib-aas-bspq3-aas-pointcontents-function-aas-pointcontents-host-point-src-mq3-botlib-aas-bspq3-ml-797317848"></a>
### AAS_PointContents

```ml
function AAS_PointContents(host, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L19)

<a id="function-function-mq3-botlib-aas-bspq3-aas-printfreebsplinks-function-aas-printfreebsplinks-text-src-mq3-botlib-aas-bspq3-ml-815027497"></a>
### AAS_PrintFreeBSPLinks

```ml
function AAS_PrintFreeBSPLinks(text)
```

Declared by be_aas_bsp.h but not defined by the released Q3 BSP backend. Keep explicit compatibility entry points so callers see the same inert path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L35)

<a id="function-function-mq3-botlib-aas-bspq3-aas-trace-function-aas-trace-host-start-mins-maxs-finish-passent-contentmask-src-mq3-botlib-aas-bspq3-ml-1647102370"></a>
### AAS_Trace

```ml
function AAS_Trace(host, start, mins, maxs, finish, passent, contentmask)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `passent` | `dynamic` | — |  |
| `contentmask` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L18)

<a id="function-function-mq3-botlib-aas-bspq3-aas-unlinkfrombspleaves-function-aas-unlinkfrombspleaves-leaves-src-mq3-botlib-aas-bspq3-ml-1614857814"></a>
### AAS_UnlinkFromBSPLeaves

```ml
function AAS_UnlinkFromBSPLeaves(leaves)
```

These are intentional empty Q3 implementations, not missing adapters.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `leaves` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L29)

<a id="function-function-mq3-botlib-aas-bspq3-aas-valueforbspepairkey-function-aas-valueforbspepairkey-state-entity-key-src-mq3-botlib-aas-bspq3-ml-1085814063"></a>
### AAS_ValueForBSPEpairKey

```ml
function AAS_ValueForBSPEpairKey(state, entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L42)

<a id="function-function-mq3-botlib-aas-bspq3-aas-vectorforbspepairkey-function-aas-vectorforbspepairkey-state-entity-key-src-mq3-botlib-aas-bspq3-ml-1330432161"></a>
### AAS_VectorForBSPEpairKey

```ml
function AAS_VectorForBSPEpairKey(state, entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L46)

<a id="constant-constant-mq3-botlib-aas-bspq3-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-aas-bspq3-ml-444693151"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L13)

<a id="function-function-mq3-botlib-aas-bspq3-create-function-create-src-mq3-botlib-aas-bspq3-ml-1812771406"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L16)

<a id="constant-constant-mq3-botlib-aas-bspq3-max-bspentities-const-max-bspentities-2048-src-mq3-botlib-aas-bspq3-ml-1296339775"></a>
### MAX_BSPENTITIES

```ml
const MAX_BSPENTITIES = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L12)

<a id="function-function-mq3-botlib-aas-bspq3-printcontents-function-printcontents-contents-src-mq3-botlib-aas-bspq3-ml-314720146"></a>
### PrintContents

```ml
function PrintContents(contents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `contents` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L83)

- [mq3.botlib.aas_bspq3.State](Type-mq3-botlib-aas-bspq3-state-1438629734.md) — struct
