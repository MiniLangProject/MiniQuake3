# `src/mq3/qcommon/headers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.headers`](Package-mq3-qcommon-headers-1647495328.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-qcommon-headers-authorize-server-name-const-authorize-server-name-authorize-quake3arena-com-src-mq3-qcommon-headers-ml-840634596"></a>
### AUTHORIZE_SERVER_NAME

```ml
const AUTHORIZE_SERVER_NAME = "authorize.quake3arena.com"
```

Host name of the legacy client-authorization service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L66)

<a id="constant-constant-mq3-qcommon-headers-axis-forward-const-axis-forward-1-src-mq3-qcommon-headers-ml-1952829026"></a>
### AXIS_FORWARD

```ml
const AXIS_FORWARD = 1
```

Vector-component index used for forward movement input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L191)

<a id="constant-constant-mq3-qcommon-headers-axis-pitch-const-axis-pitch-5-src-mq3-qcommon-headers-ml-1906619336"></a>
### AXIS_PITCH

```ml
const AXIS_PITCH = 5
```

Angle-component index used for pitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L199)

<a id="constant-constant-mq3-qcommon-headers-axis-roll-const-axis-roll-3-src-mq3-qcommon-headers-ml-1632421432"></a>
### AXIS_ROLL

```ml
const AXIS_ROLL = 3
```

Angle-component index used for roll.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L195)

<a id="constant-constant-mq3-qcommon-headers-axis-side-const-axis-side-0-src-mq3-qcommon-headers-ml-1336001823"></a>
### AXIS_SIDE

```ml
const AXIS_SIDE = 0
```

Vector-component index used for side movement input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L189)

<a id="constant-constant-mq3-qcommon-headers-axis-up-const-axis-up-2-src-mq3-qcommon-headers-ml-821913301"></a>
### AXIS_UP

```ml
const AXIS_UP = 2
```

Vector-component index used for vertical movement input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L193)

<a id="constant-constant-mq3-qcommon-headers-axis-yaw-const-axis-yaw-4-src-mq3-qcommon-headers-ml-855905123"></a>
### AXIS_YAW

```ml
const AXIS_YAW = 4
```

Angle-component index used for yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L197)

<a id="constant-constant-mq3-qcommon-headers-basegame-const-basegame-baseq3-src-mq3-qcommon-headers-ml-1462301430"></a>
### BASEGAME

```ml
const BASEGAME = "baseq3"
```

Name of the base-game asset directory searched by the filesystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L90)

<a id="constant-constant-mq3-qcommon-headers-box-model-handle-const-box-model-handle-255-src-mq3-qcommon-headers-ml-1291268877"></a>
### BOX_MODEL_HANDLE

```ml
const BOX_MODEL_HANDLE = 255
```

Reserved collision-model handle for a temporary axis-aligned box.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L9)

<a id="constant-constant-mq3-qcommon-headers-capsule-model-handle-const-capsule-model-handle-254-src-mq3-qcommon-headers-ml-335673600"></a>
### CAPSULE_MODEL_HANDLE

```ml
const CAPSULE_MODEL_HANDLE = 254
```

Reserved collision-model handle for a temporary capsule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L11)

<a id="constant-constant-mq3-qcommon-headers-cl-decode-start-const-cl-decode-start-4-src-mq3-qcommon-headers-ml-679237107"></a>
### CL_DECODE_START

```ml
const CL_DECODE_START = 4
```

Byte offset at which server-to-client payload decoding begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L122)

<a id="constant-constant-mq3-qcommon-headers-cl-encode-start-const-cl-encode-start-12-src-mq3-qcommon-headers-ml-1304159610"></a>
### CL_ENCODE_START

```ml
const CL_ENCODE_START = 12
```

Byte offset at which client-to-server payload obfuscation begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L120)

<a id="constant-constant-mq3-qcommon-headers-clip-epsilon-const-clip-epsilon-0-1-src-mq3-qcommon-headers-ml-684962640"></a>
### CLIP_EPSILON

```ml
const CLIP_EPSILON = 0.1
```

Distance tolerance used when clipping a trace against a plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L37)

<a id="function-function-mq3-qcommon-headers-cmlocalfieldnames-function-cmlocalfieldnames-src-mq3-qcommon-headers-ml-1364770340"></a>
### cmlocalFieldNames

```ml
function cmlocalFieldNames()
```

List the 81 names in qcommon.headers.cmlocalFieldNames, beginning with `cArea_t.floodnum`, `cArea_t.floodvalid`, `cLeaf_t.area`, `cLeaf_t.cluster`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L249)

<a id="function-function-mq3-qcommon-headers-cmlocalfunctionnames-function-cmlocalfunctionnames-src-mq3-qcommon-headers-ml-1498691682"></a>
### cmlocalFunctionNames

```ml
function cmlocalFunctionNames()
```

List the 9 names in qcommon.headers.cmlocalFunctionNames, beginning with `CM_BoxBrushes`, `CM_BoxLeafnums_r`, `CM_ClearLevelPatches`, `CM_ClipHandleToModel`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L245)

<a id="function-function-mq3-qcommon-headers-cmlocalglobalnames-function-cmlocalglobalnames-src-mq3-qcommon-headers-ml-1233706826"></a>
### cmlocalGlobalNames

```ml
function cmlocalGlobalNames()
```

List the 6 names in qcommon.headers.cmlocalGlobalNames, beginning with `c_patch_traces`, `c_pointcontents`, `cm`, `cm_noAreas`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L247)

<a id="function-function-mq3-qcommon-headers-cmlocalmacronames-function-cmlocalmacronames-src-mq3-qcommon-headers-ml-1843590856"></a>
### cmlocalMacroNames

```ml
function cmlocalMacroNames()
```

List the 4 names in qcommon.headers.cmlocalMacroNames, beginning with `BOX_MODEL_HANDLE`, `CAPSULE_MODEL_HANDLE`, `MAX_SUBMODELS`, `SURFACE_CLIP_EPSILON`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L241)

<a id="function-function-mq3-qcommon-headers-cmlocaltypenames-function-cmlocaltypenames-src-mq3-qcommon-headers-ml-561555678"></a>
### cmlocalTypeNames

```ml
function cmlocalTypeNames()
```

List the 11 names in qcommon.headers.cmlocalTypeNames, beginning with `cArea_t`, `cLeaf_t`, `cNode_t`, `cPatch_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L243)

<a id="function-function-mq3-qcommon-headers-cmpatchfieldnames-function-cmpatchfieldnames-src-mq3-qcommon-headers-ml-313193486"></a>
### cmpatchFieldNames

```ml
function cmpatchFieldNames()
```

List the 17 names in qcommon.headers.cmpatchFieldNames, beginning with `cGrid_t.points`, `cGrid_t.height`, `cGrid_t.width`, `cGrid_t.wrapHeight`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L260)

<a id="function-function-mq3-qcommon-headers-cmpatchfunctionnames-function-cmpatchfunctionnames-src-mq3-qcommon-headers-ml-589128942"></a>
### cmpatchFunctionNames

```ml
function cmpatchFunctionNames()
```

List the 1 names in qcommon.headers.cmpatchFunctionNames, beginning with `CM_GeneratePatchCollide`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L256)

<a id="function-function-mq3-qcommon-headers-cmpatchglobalnames-function-cmpatchglobalnames-src-mq3-qcommon-headers-ml-95006114"></a>
### cmpatchGlobalNames

```ml
function cmpatchGlobalNames()
```

List the 0 names in qcommon.headers.cmpatchGlobalNames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L258)

<a id="function-function-mq3-qcommon-headers-cmpatchmacronames-function-cmpatchmacronames-src-mq3-qcommon-headers-ml-805500158"></a>
### cmpatchMacroNames

```ml
function cmpatchMacroNames()
```

List the 6 names in qcommon.headers.cmpatchMacroNames, beginning with `MAX_FACETS`, `MAX_GRID_SIZE`, `MAX_PATCH_PLANES`, `PLANE_TRI_EPSILON`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L252)

<a id="function-function-mq3-qcommon-headers-cmpatchtypenames-function-cmpatchtypenames-src-mq3-qcommon-headers-ml-1794261422"></a>
### cmpatchTypeNames

```ml
function cmpatchTypeNames()
```

List the 4 names in qcommon.headers.cmpatchTypeNames, beginning with `cGrid_t`, `facet_t`, `patchCollide_t`, `patchPlane_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L254)

<a id="function-function-mq3-qcommon-headers-cmpolylibfieldnames-function-cmpolylibfieldnames-src-mq3-qcommon-headers-ml-1447197320"></a>
### cmpolylibFieldNames

```ml
function cmpolylibFieldNames()
```

List the 2 names in qcommon.headers.cmpolylibFieldNames, beginning with `winding_t.numpoints`, `winding_t.p`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L271)

<a id="function-function-mq3-qcommon-headers-cmpolylibfunctionnames-function-cmpolylibfunctionnames-src-mq3-qcommon-headers-ml-1038321674"></a>
### cmpolylibFunctionNames

```ml
function cmpolylibFunctionNames()
```

List the 17 names in qcommon.headers.cmpolylibFunctionNames, beginning with `AddWindingToConvexHull`, `AllocWinding`, `BaseWindingForPlane`, `CheckWinding`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L267)

<a id="function-function-mq3-qcommon-headers-cmpolylibglobalnames-function-cmpolylibglobalnames-src-mq3-qcommon-headers-ml-1483566494"></a>
### cmpolylibGlobalNames

```ml
function cmpolylibGlobalNames()
```

List the 0 names in qcommon.headers.cmpolylibGlobalNames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L269)

<a id="function-function-mq3-qcommon-headers-cmpolylibmacronames-function-cmpolylibmacronames-src-mq3-qcommon-headers-ml-2046443340"></a>
### cmpolylibMacroNames

```ml
function cmpolylibMacroNames()
```

List the 8 names in qcommon.headers.cmpolylibMacroNames, beginning with `CLIP_EPSILON`, `MAX_MAP_BOUNDS`, `MAX_POINTS_ON_WINDING`, `ON_EPSILON`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L263)

<a id="function-function-mq3-qcommon-headers-cmpolylibtypenames-function-cmpolylibtypenames-src-mq3-qcommon-headers-ml-1318799202"></a>
### cmpolylibTypeNames

```ml
function cmpolylibTypeNames()
```

List the 1 names in qcommon.headers.cmpolylibTypeNames, beginning with `winding_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L265)

<a id="function-function-mq3-qcommon-headers-cmpublicfieldnames-function-cmpublicfieldnames-src-mq3-qcommon-headers-ml-428680614"></a>
### cmpublicFieldNames

```ml
function cmpublicFieldNames()
```

List the 0 names in qcommon.headers.cmpublicFieldNames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L282)

<a id="function-function-mq3-qcommon-headers-cmpublicfunctionnames-function-cmpublicfunctionnames-src-mq3-qcommon-headers-ml-1667045624"></a>
### cmpublicFunctionNames

```ml
function cmpublicFunctionNames()
```

List the 23 names in qcommon.headers.cmpublicFunctionNames, beginning with `CM_AdjustAreaPortalState`, `CM_AreasConnected`, `CM_BoxLeafnums`, `CM_BoxTrace`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L278)

<a id="function-function-mq3-qcommon-headers-cmpublicglobalnames-function-cmpublicglobalnames-src-mq3-qcommon-headers-ml-857906766"></a>
### cmpublicGlobalNames

```ml
function cmpublicGlobalNames()
```

List the 0 names in qcommon.headers.cmpublicGlobalNames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L280)

<a id="function-function-mq3-qcommon-headers-cmpublicmacronames-function-cmpublicmacronames-src-mq3-qcommon-headers-ml-1354846970"></a>
### cmpublicMacroNames

```ml
function cmpublicMacroNames()
```

List the 0 names in qcommon.headers.cmpublicMacroNames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L274)

<a id="function-function-mq3-qcommon-headers-cmpublictypenames-function-cmpublictypenames-src-mq3-qcommon-headers-ml-421178636"></a>
### cmpublicTypeNames

```ml
function cmpublicTypeNames()
```

List the 0 names in qcommon.headers.cmpublicTypeNames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L276)

<a id="constant-constant-mq3-qcommon-headers-cpuid-amd-3dnow-const-cpuid-amd-3dnow-48-src-mq3-qcommon-headers-ml-1507624491"></a>
### CPUID_AMD_3DNOW

```ml
const CPUID_AMD_3DNOW = 48
```

AMD K6 3DNOW!


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L106)

<a id="constant-constant-mq3-qcommon-headers-cpuid-axp-const-cpuid-axp-16-src-mq3-qcommon-headers-ml-1206367102"></a>
### CPUID_AXP

```ml
const CPUID_AXP = 16
```

Legacy CPU classification for the Alpha AXP architecture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L96)

<a id="constant-constant-mq3-qcommon-headers-cpuid-generic-const-cpuid-generic-0-src-mq3-qcommon-headers-ml-952501471"></a>
### CPUID_GENERIC

```ml
const CPUID_GENERIC = 0
```

Any unrecognized processor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L94)

<a id="constant-constant-mq3-qcommon-headers-cpuid-intel-katmai-const-cpuid-intel-katmai-35-src-mq3-qcommon-headers-ml-853415053"></a>
### CPUID_INTEL_KATMAI

```ml
const CPUID_INTEL_KATMAI = 35
```

Legacy CPU classification for Intel processors with Katmai-era extensions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L104)

<a id="constant-constant-mq3-qcommon-headers-cpuid-intel-mmx-const-cpuid-intel-mmx-34-src-mq3-qcommon-headers-ml-2082572214"></a>
### CPUID_INTEL_MMX

```ml
const CPUID_INTEL_MMX = 34
```

Intel Pentium/MMX or P2/MMX.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L102)

<a id="constant-constant-mq3-qcommon-headers-cpuid-intel-pentium-const-cpuid-intel-pentium-33-src-mq3-qcommon-headers-ml-985145237"></a>
### CPUID_INTEL_PENTIUM

```ml
const CPUID_INTEL_PENTIUM = 33
```

Intel Pentium or PPro.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L100)

<a id="constant-constant-mq3-qcommon-headers-cpuid-intel-unsupported-const-cpuid-intel-unsupported-32-src-mq3-qcommon-headers-ml-2077841520"></a>
### CPUID_INTEL_UNSUPPORTED

```ml
const CPUID_INTEL_UNSUPPORTED = 32
```

Legacy CPU classification for an unsupported Intel instruction set.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L98)

<a id="function-function-mq3-qcommon-headers-enumnames-function-enumnames-src-mq3-qcommon-headers-ml-475516276"></a>
### enumNames

```ml
function enumNames()
```

Return `mq3.qcommon.headers.qcommonEnumNames()` from `qcommon.headers.enumNames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L313)

<a id="function-function-mq3-qcommon-headers-fieldnames-function-fieldnames-src-mq3-qcommon-headers-ml-654966062"></a>
### fieldNames

```ml
function fieldNames()
```

List the 222 names in qcommon.headers.fieldNames, beginning with `cArea_t.floodnum`, `cArea_t.floodvalid`, `cGrid_t.points`, `cGrid_t.height`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L319)

<a id="constant-constant-mq3-qcommon-headers-fs-cgame-ref-const-fs-cgame-ref-4-src-mq3-qcommon-headers-ml-442733163"></a>
### FS_CGAME_REF

```ml
const FS_CGAME_REF = 4
```

Package-reference bit recording use by the client-game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L82)

<a id="constant-constant-mq3-qcommon-headers-fs-general-ref-const-fs-general-ref-1-src-mq3-qcommon-headers-ml-1777809828"></a>
### FS_GENERAL_REF

```ml
const FS_GENERAL_REF = 1
```

Package-reference bit recording ordinary asset use.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L78)

<a id="constant-constant-mq3-qcommon-headers-fs-qagame-ref-const-fs-qagame-ref-8-src-mq3-qcommon-headers-ml-2095583687"></a>
### FS_QAGAME_REF

```ml
const FS_QAGAME_REF = 8
```

Package-reference bit recording use by the server game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L84)

<a id="constant-constant-mq3-qcommon-headers-fs-ui-ref-const-fs-ui-ref-2-src-mq3-qcommon-headers-ml-448401737"></a>
### FS_UI_REF

```ml
const FS_UI_REF = 2
```

Package-reference bit recording use by the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L80)

<a id="function-function-mq3-qcommon-headers-functionnames-function-functionnames-src-mq3-qcommon-headers-ml-284466554"></a>
### functionNames

```ml
function functionNames()
```

List the 343 names in qcommon.headers.functionNames, beginning with `AddWindingToConvexHull`, `AllocWinding`, `BaseWindingForPlane`, `CL_CDDialog`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L315)

<a id="function-function-mq3-qcommon-headers-globalnames-function-globalnames-src-mq3-qcommon-headers-ml-369867820"></a>
### globalNames

```ml
function globalNames()
```

List the 32 names in qcommon.headers.globalNames, beginning with `c_patch_traces`, `c_pointcontents`, `cl_cdkey`, `cl_paused`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L317)

<a id="function-function-mq3-qcommon-headers-headercounts-function-headercounts-src-mq3-qcommon-headers-ml-510587890"></a>
### headerCounts

```ml
function headerCounts()
```

Compute qcommon.headers.headerCounts as `[75, 46, 45, 344, 32, 222]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L337)

<a id="constant-constant-mq3-qcommon-headers-hmax-const-hmax-256-src-mq3-qcommon-headers-ml-51674810"></a>
### HMAX

```ml
const HMAX = 256
```

Number of byte values in the Huffman symbol alphabet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L110)

<a id="constant-constant-mq3-qcommon-headers-internal-node-const-internal-node-257-src-mq3-qcommon-headers-ml-1296652749"></a>
### INTERNAL_NODE

```ml
const INTERNAL_NODE = 257
```

Huffman symbol code reserved for an internal tree node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L114)

<a id="function-function-mq3-qcommon-headers-macronames-function-macronames-src-mq3-qcommon-headers-ml-1927420590"></a>
### macroNames

```ml
function macroNames()
```

List the 75 names in qcommon.headers.macroNames, beginning with `AUTHORIZE_SERVER_NAME`, `BASEGAME`, `BOX_MODEL_HANDLE`, `CAPSULE_MODEL_HANDLE`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L309)

<a id="constant-constant-mq3-qcommon-headers-master-server-name-const-master-server-name-master-quake3arena-com-src-mq3-qcommon-headers-ml-685183335"></a>
### MASTER_SERVER_NAME

```ml
const MASTER_SERVER_NAME = "master.quake3arena.com"
```

Host name of the master-server directory service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L64)

<a id="constant-constant-mq3-qcommon-headers-max-download-blksize-const-max-download-blksize-2048-src-mq3-qcommon-headers-ml-1149443011"></a>
### MAX_DOWNLOAD_BLKSIZE

```ml
const MAX_DOWNLOAD_BLKSIZE = 2048
```

2048 byte block chunks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L58)

<a id="constant-constant-mq3-qcommon-headers-max-download-window-const-max-download-window-8-src-mq3-qcommon-headers-ml-1229585183"></a>
### MAX_DOWNLOAD_WINDOW

```ml
const MAX_DOWNLOAD_WINDOW = 8
```

Max of eight download frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L56)

<a id="constant-constant-mq3-qcommon-headers-max-edit-line-const-max-edit-line-256-src-mq3-qcommon-headers-ml-1295695624"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = 256
```

Capacity of the editable console input line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L92)

<a id="constant-constant-mq3-qcommon-headers-max-facets-const-max-facets-1024-src-mq3-qcommon-headers-ml-553106266"></a>
### MAX_FACETS

```ml
const MAX_FACETS = 1024
```

Maximum number of convex collision facets generated for one patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L15)

<a id="constant-constant-mq3-qcommon-headers-max-file-handles-const-max-file-handles-64-src-mq3-qcommon-headers-ml-48267249"></a>
### MAX_FILE_HANDLES

```ml
const MAX_FILE_HANDLES = 64
```

Maximum number of simultaneous virtual-filesystem file handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L88)

<a id="constant-constant-mq3-qcommon-headers-max-grid-size-const-max-grid-size-129-src-mq3-qcommon-headers-ml-1549447165"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 129
```

Maximum control-grid dimension used while subdividing a collision patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L19)

<a id="constant-constant-mq3-qcommon-headers-max-joystick-axis-const-max-joystick-axis-6-src-mq3-qcommon-headers-ml-398341705"></a>
### MAX_JOYSTICK_AXIS

```ml
const MAX_JOYSTICK_AXIS = 6
```

Number of supported joystick axes in system input events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L201)

<a id="constant-constant-mq3-qcommon-headers-max-map-bounds-const-max-map-bounds-65535-src-mq3-qcommon-headers-ml-227728923"></a>
### MAX_MAP_BOUNDS

```ml
const MAX_MAP_BOUNDS = 65535
```

Largest accepted absolute coordinate in a collision winding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L39)

<a id="constant-constant-mq3-qcommon-headers-max-msglen-const-max-msglen-16384-src-mq3-qcommon-headers-ml-941447619"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```

Maximum byte length of a complete sequenced network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L54)

<a id="constant-constant-mq3-qcommon-headers-max-packet-usercmds-const-max-packet-usercmds-32-src-mq3-qcommon-headers-ml-381665828"></a>
### MAX_PACKET_USERCMDS

```ml
const MAX_PACKET_USERCMDS = 32
```

Max number of usercmd_t in a packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L48)

<a id="constant-constant-mq3-qcommon-headers-max-patch-planes-const-max-patch-planes-2048-src-mq3-qcommon-headers-ml-754042733"></a>
### MAX_PATCH_PLANES

```ml
const MAX_PATCH_PLANES = 2048
```

Maximum number of collision planes retained for one patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L17)

<a id="constant-constant-mq3-qcommon-headers-max-points-on-winding-const-max-points-on-winding-64-src-mq3-qcommon-headers-ml-1205762025"></a>
### MAX_POINTS_ON_WINDING

```ml
const MAX_POINTS_ON_WINDING = 64
```

Maximum number of vertices in a clipped winding polygon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L27)

<a id="constant-constant-mq3-qcommon-headers-max-reliable-commands-const-max-reliable-commands-64-src-mq3-qcommon-headers-ml-1445607729"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity of the reliable-command ring retained until acknowledgment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L52)

<a id="constant-constant-mq3-qcommon-headers-max-submodels-const-max-submodels-256-src-mq3-qcommon-headers-ml-901561996"></a>
### MAX_SUBMODELS

```ml
const MAX_SUBMODELS = 256
```

Maximum number of inline collision models accepted from a BSP map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L7)

<a id="constant-constant-mq3-qcommon-headers-maxprintmsg-const-maxprintmsg-4096-src-mq3-qcommon-headers-ml-1193451142"></a>
### MAXPRINTMSG

```ml
const MAXPRINTMSG = 4096
```

Maximum character capacity of a formatted engine diagnostic message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L108)

<a id="constant-constant-mq3-qcommon-headers-na-bad-const-na-bad-1-src-mq3-qcommon-headers-ml-706886546"></a>
### NA_BAD

```ml
const NA_BAD = 1
```

Network-address kind indicating an invalid or unsupported endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L127)

<a id="constant-constant-mq3-qcommon-headers-na-bot-const-na-bot-0-src-mq3-qcommon-headers-ml-2075830867"></a>
### NA_BOT

```ml
const NA_BOT = 0
```

Network-address kind reserved for an in-process bot client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L125)

<a id="constant-constant-mq3-qcommon-headers-na-broadcast-const-na-broadcast-3-src-mq3-qcommon-headers-ml-1238997368"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```

Network-address kind for an IPv4 broadcast destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L131)

<a id="constant-constant-mq3-qcommon-headers-na-broadcast-ipx-const-na-broadcast-ipx-6-src-mq3-qcommon-headers-ml-1468800913"></a>
### NA_BROADCAST_IPX

```ml
const NA_BROADCAST_IPX = 6
```

Legacy network-address kind for IPX broadcast delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L137)

<a id="constant-constant-mq3-qcommon-headers-na-ip-const-na-ip-4-src-mq3-qcommon-headers-ml-98030875"></a>
### NA_IP

```ml
const NA_IP = 4
```

Network-address kind for an IPv4 endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L133)

<a id="constant-constant-mq3-qcommon-headers-na-ipx-const-na-ipx-5-src-mq3-qcommon-headers-ml-1770865590"></a>
### NA_IPX

```ml
const NA_IPX = 5
```

Legacy network-address kind for an IPX endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L135)

<a id="constant-constant-mq3-qcommon-headers-na-loopback-const-na-loopback-2-src-mq3-qcommon-headers-ml-503209321"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```

Network-address kind for local loopback delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L129)

<a id="constant-constant-mq3-qcommon-headers-ns-client-const-ns-client-0-src-mq3-qcommon-headers-ml-370994019"></a>
### NS_CLIENT

```ml
const NS_CLIENT = 0
```

Network socket-side selector for the client endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L139)

<a id="constant-constant-mq3-qcommon-headers-ns-server-const-ns-server-1-src-mq3-qcommon-headers-ml-2118982014"></a>
### NS_SERVER

```ml
const NS_SERVER = 1
```

Network socket-side selector for the server endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L141)

<a id="constant-constant-mq3-qcommon-headers-num-id-paks-const-num-id-paks-9-src-mq3-qcommon-headers-ml-1492715758"></a>
### NUM_ID_PAKS

```ml
const NUM_ID_PAKS = 9
```

Number of original game packages recognized by the filesystem policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L86)

<a id="constant-constant-mq3-qcommon-headers-num-server-ports-const-num-server-ports-4-src-mq3-qcommon-headers-ml-1690361187"></a>
### NUM_SERVER_PORTS

```ml
const NUM_SERVER_PORTS = 4
```

Broadcast scan this many ports after.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L76)

<a id="constant-constant-mq3-qcommon-headers-nyt-const-nyt-256-src-mq3-qcommon-headers-ml-1552799760"></a>
### NYT

```ml
const NYT = 256
```

NYT = Not Yet Transmitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L112)

<a id="constant-constant-mq3-qcommon-headers-on-epsilon-const-on-epsilon-0-1-src-mq3-qcommon-headers-ml-550396774"></a>
### ON_EPSILON

```ml
const ON_EPSILON = 0.1
```

Distance tolerance for classifying a point as lying on a plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L41)

<a id="constant-constant-mq3-qcommon-headers-packet-backup-const-packet-backup-32-src-mq3-qcommon-headers-ml-639921056"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```

Number of old messages that must be kept on client and.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L44)

<a id="constant-constant-mq3-qcommon-headers-packet-mask-const-packet-mask-31-src-mq3-qcommon-headers-ml-743379759"></a>
### PACKET_MASK

```ml
const PACKET_MASK = 31
```

Mask converting a network sequence number into a circular packet-history slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L46)

<a id="constant-constant-mq3-qcommon-headers-plane-tri-epsilon-const-plane-tri-epsilon-0-1-src-mq3-qcommon-headers-ml-546390072"></a>
### PLANE_TRI_EPSILON

```ml
const PLANE_TRI_EPSILON = 0.1
```

Tolerance used when validating a plane against triangle vertices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L23)

<a id="constant-constant-mq3-qcommon-headers-port-any-const-port-any-1-src-mq3-qcommon-headers-ml-2050915431"></a>
### PORT_ANY

```ml
const PORT_ANY = -1
```

Socket-port selector asking the host to choose an available port.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L50)

<a id="constant-constant-mq3-qcommon-headers-port-authorize-const-port-authorize-27952-src-mq3-qcommon-headers-ml-2019571380"></a>
### PORT_AUTHORIZE

```ml
const PORT_AUTHORIZE = 27952
```

Default UDP port used by the authorization service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L72)

<a id="constant-constant-mq3-qcommon-headers-port-master-const-port-master-27950-src-mq3-qcommon-headers-ml-1579172478"></a>
### PORT_MASTER

```ml
const PORT_MASTER = 27950
```

Default UDP port used by the master-server directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L68)

<a id="constant-constant-mq3-qcommon-headers-port-server-const-port-server-27960-src-mq3-qcommon-headers-ml-1413569147"></a>
### PORT_SERVER

```ml
const PORT_SERVER = 27960
```

Default UDP port used by a Quake III game server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L74)

<a id="constant-constant-mq3-qcommon-headers-port-update-const-port-update-27951-src-mq3-qcommon-headers-ml-854263671"></a>
### PORT_UPDATE

```ml
const PORT_UPDATE = 27951
```

Default UDP port used by the update service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L70)

<a id="constant-constant-mq3-qcommon-headers-protocol-version-const-protocol-version-68-src-mq3-qcommon-headers-ml-128646813"></a>
### PROTOCOL_VERSION

```ml
const PROTOCOL_VERSION = 68
```

Protocol version placed in Quake III connection and discovery messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L60)

<a id="function-function-mq3-qcommon-headers-qcommonenumnames-function-qcommonenumnames-src-mq3-qcommon-headers-ml-541248282"></a>
### qcommonEnumNames

```ml
function qcommonEnumNames()
```

List the 46 names in qcommon.headers.qcommonEnumNames, beginning with `NA_BOT`, `NA_BAD`, `NA_LOOPBACK`, `NA_BROADCAST`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L289)

<a id="function-function-mq3-qcommon-headers-qcommonfieldnames-function-qcommonfieldnames-src-mq3-qcommon-headers-ml-472542190"></a>
### qcommonFieldNames

```ml
function qcommonFieldNames()
```

List the 54 names in qcommon.headers.qcommonFieldNames, beginning with `field_t.buffer`, `field_t.cursor`, `field_t.scroll`, `field_t.widthInChars`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L295)

<a id="function-function-mq3-qcommon-headers-qcommonfunctionnames-function-qcommonfunctionnames-src-mq3-qcommon-headers-ml-550811174"></a>
### qcommonFunctionNames

```ml
function qcommonFunctionNames()
```

List the 276 names in qcommon.headers.qcommonFunctionNames, beginning with `CL_CDDialog`, `CL_CharEvent`, `CL_ConsolePrint`, `CL_Disconnect`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L291)

<a id="function-function-mq3-qcommon-headers-qcommonglobalnames-function-qcommonglobalnames-src-mq3-qcommon-headers-ml-88454814"></a>
### qcommonGlobalNames

```ml
function qcommonGlobalNames()
```

List the 26 names in qcommon.headers.qcommonGlobalNames, beginning with `cl_cdkey`, `cl_paused`, `clientHuffTables`, `com_blood`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L293)

<a id="function-function-mq3-qcommon-headers-qcommonmacronames-function-qcommonmacronames-src-mq3-qcommon-headers-ml-1068576206"></a>
### qcommonMacroNames

```ml
function qcommonMacroNames()
```

List the 46 names in qcommon.headers.qcommonMacroNames, beginning with `AUTHORIZE_SERVER_NAME`, `BASEGAME`, `CL_DECODE_START`, `CL_ENCODE_START`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L285)

<a id="function-function-mq3-qcommon-headers-qcommontypenames-function-qcommontypenames-src-mq3-qcommon-headers-ml-31545350"></a>
### qcommonTypeNames

```ml
function qcommonTypeNames()
```

List the 17 names in qcommon.headers.qcommonTypeNames, beginning with `field_t`, `huff_t`, `huffman_t`, `joystickAxis_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L287)

<a id="function-function-mq3-qcommon-headers-reliableslot-function-reliableslot-sequence-src-mq3-qcommon-headers-ml-407043951"></a>
### reliableSlot

```ml
function reliableSlot(sequence)
```

Compute qcommon.headers.reliableSlot as `(sequence & PACKET_MASK)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sequence` | `dynamic` | — | Sequence used in `(sequence & PACKET_MASK)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L326)

<a id="constant-constant-mq3-qcommon-headers-se-char-const-se-char-2-src-mq3-qcommon-headers-ml-132384981"></a>
### SE_CHAR

```ml
const SE_CHAR = 2
```

System-event type identifying a typed character.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L207)

<a id="constant-constant-mq3-qcommon-headers-se-console-const-se-console-5-src-mq3-qcommon-headers-ml-376649188"></a>
### SE_CONSOLE

```ml
const SE_CONSOLE = 5
```

System-event type identifying console command input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L213)

<a id="constant-constant-mq3-qcommon-headers-se-joystick-axis-const-se-joystick-axis-4-src-mq3-qcommon-headers-ml-1481763875"></a>
### SE_JOYSTICK_AXIS

```ml
const SE_JOYSTICK_AXIS = 4
```

System-event type identifying a joystick-axis update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L211)

<a id="constant-constant-mq3-qcommon-headers-se-key-const-se-key-1-src-mq3-qcommon-headers-ml-530263780"></a>
### SE_KEY

```ml
const SE_KEY = 1
```

System-event type identifying a key press or release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L205)

<a id="constant-constant-mq3-qcommon-headers-se-mouse-const-se-mouse-3-src-mq3-qcommon-headers-ml-594214682"></a>
### SE_MOUSE

```ml
const SE_MOUSE = 3
```

System-event type identifying relative mouse motion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L209)

<a id="constant-constant-mq3-qcommon-headers-se-none-const-se-none-0-src-mq3-qcommon-headers-ml-181389427"></a>
### SE_NONE

```ml
const SE_NONE = 0
```

System-event type identifying no pending system event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L203)

<a id="constant-constant-mq3-qcommon-headers-se-packet-const-se-packet-6-src-mq3-qcommon-headers-ml-1854640169"></a>
### SE_PACKET

```ml
const SE_PACKET = 6
```

System-event type identifying an incoming network packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L215)

<a id="constant-constant-mq3-qcommon-headers-side-back-const-side-back-1-src-mq3-qcommon-headers-ml-134591222"></a>
### SIDE_BACK

```ml
const SIDE_BACK = 1
```

Plane-classification result for geometry behind the plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L31)

<a id="constant-constant-mq3-qcommon-headers-side-cross-const-side-cross-3-src-mq3-qcommon-headers-ml-243116806"></a>
### SIDE_CROSS

```ml
const SIDE_CROSS = 3
```

Plane-classification result for geometry crossing the plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L35)

<a id="constant-constant-mq3-qcommon-headers-side-front-const-side-front-0-src-mq3-qcommon-headers-ml-1359399171"></a>
### SIDE_FRONT

```ml
const SIDE_FRONT = 0
```

Plane-classification result for geometry in front of the plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L29)

<a id="constant-constant-mq3-qcommon-headers-side-on-const-side-on-2-src-mq3-qcommon-headers-ml-1247414901"></a>
### SIDE_ON

```ml
const SIDE_ON = 2
```

Plane-classification result for geometry within the plane tolerance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L33)

<a id="constant-constant-mq3-qcommon-headers-subdivide-distance-const-subdivide-distance-16-src-mq3-qcommon-headers-ml-2136936686"></a>
### SUBDIVIDE_DISTANCE

```ml
const SUBDIVIDE_DISTANCE = 16
```

Maximum patch-curvature deviation accepted before further subdivision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L21)

<a id="constant-constant-mq3-qcommon-headers-surface-clip-epsilon-const-surface-clip-epsilon-0-125-src-mq3-qcommon-headers-ml-1707981271"></a>
### SURFACE_CLIP_EPSILON

```ml
const SURFACE_CLIP_EPSILON = 0.125
```

Distance tolerance used when clipping against patch facets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L13)

<a id="constant-constant-mq3-qcommon-headers-sv-decode-start-const-sv-decode-start-12-src-mq3-qcommon-headers-ml-8477554"></a>
### SV_DECODE_START

```ml
const SV_DECODE_START = 12
```

Byte offset at which client-to-server payload decoding begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L118)

<a id="constant-constant-mq3-qcommon-headers-sv-encode-start-const-sv-encode-start-4-src-mq3-qcommon-headers-ml-358057983"></a>
### SV_ENCODE_START

```ml
const SV_ENCODE_START = 4
```

Byte offset at which server-to-client payload obfuscation begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L116)

<a id="constant-constant-mq3-qcommon-headers-tag-botlib-const-tag-botlib-2-src-mq3-qcommon-headers-ml-1467839925"></a>
### TAG_BOTLIB

```ml
const TAG_BOTLIB = 2
```

Memory-tag value for bot-library allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L181)

<a id="constant-constant-mq3-qcommon-headers-tag-free-const-tag-free-0-src-mq3-qcommon-headers-ml-2059627827"></a>
### TAG_FREE

```ml
const TAG_FREE = 0
```

Memory-tag value marking an unused allocation block.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L177)

<a id="constant-constant-mq3-qcommon-headers-tag-general-const-tag-general-1-src-mq3-qcommon-headers-ml-358026294"></a>
### TAG_GENERAL

```ml
const TAG_GENERAL = 1
```

Memory-tag value for ordinary engine allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L179)

<a id="constant-constant-mq3-qcommon-headers-tag-renderer-const-tag-renderer-3-src-mq3-qcommon-headers-ml-1717168326"></a>
### TAG_RENDERER

```ml
const TAG_RENDERER = 3
```

Memory-tag value for renderer allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L183)

<a id="constant-constant-mq3-qcommon-headers-tag-small-const-tag-small-4-src-mq3-qcommon-headers-ml-1461501571"></a>
### TAG_SMALL

```ml
const TAG_SMALL = 4
```

Memory-tag value for allocations in the small-block zone.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L185)

<a id="constant-constant-mq3-qcommon-headers-tag-static-const-tag-static-5-src-mq3-qcommon-headers-ml-1494755954"></a>
### TAG_STATIC

```ml
const TAG_STATIC = 5
```

Memory-tag value for static data that must not be freed normally.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L187)

<a id="constant-constant-mq3-qcommon-headers-trap-anglevectors-const-trap-anglevectors-108-src-mq3-qcommon-headers-ml-321228626"></a>
### TRAP_ANGLEVECTORS

```ml
const TRAP_ANGLEVECTORS = 108
```

Game-VM trap identifier for anglevectors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L165)

<a id="constant-constant-mq3-qcommon-headers-trap-atan2-const-trap-atan2-105-src-mq3-qcommon-headers-ml-442554825"></a>
### TRAP_ATAN2

```ml
const TRAP_ATAN2 = 105
```

Game-VM trap identifier for atan2.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L159)

<a id="constant-constant-mq3-qcommon-headers-trap-ceil-const-trap-ceil-111-src-mq3-qcommon-headers-ml-1246804452"></a>
### TRAP_CEIL

```ml
const TRAP_CEIL = 111
```

Game-VM trap identifier for ceil.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L171)

<a id="constant-constant-mq3-qcommon-headers-trap-cos-const-trap-cos-104-src-mq3-qcommon-headers-ml-1970056702"></a>
### TRAP_COS

```ml
const TRAP_COS = 104
```

Game-VM trap identifier for cos.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L157)

<a id="constant-constant-mq3-qcommon-headers-trap-floor-const-trap-floor-110-src-mq3-qcommon-headers-ml-364952615"></a>
### TRAP_FLOOR

```ml
const TRAP_FLOOR = 110
```

Game-VM trap identifier for floor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L169)

<a id="constant-constant-mq3-qcommon-headers-trap-matrixmultiply-const-trap-matrixmultiply-107-src-mq3-qcommon-headers-ml-996427417"></a>
### TRAP_MATRIXMULTIPLY

```ml
const TRAP_MATRIXMULTIPLY = 107
```

Game-VM trap identifier for matrixmultiply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L163)

<a id="constant-constant-mq3-qcommon-headers-trap-memcpy-const-trap-memcpy-101-src-mq3-qcommon-headers-ml-1521127183"></a>
### TRAP_MEMCPY

```ml
const TRAP_MEMCPY = 101
```

Game-VM trap identifier for memcpy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L151)

<a id="constant-constant-mq3-qcommon-headers-trap-memset-const-trap-memset-100-src-mq3-qcommon-headers-ml-2003292022"></a>
### TRAP_MEMSET

```ml
const TRAP_MEMSET = 100
```

Game-VM trap identifier for memset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L149)

<a id="constant-constant-mq3-qcommon-headers-trap-perpendicularvector-const-trap-perpendicularvector-109-src-mq3-qcommon-headers-ml-450665147"></a>
### TRAP_PERPENDICULARVECTOR

```ml
const TRAP_PERPENDICULARVECTOR = 109
```

Game-VM trap identifier for perpendicularvector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L167)

<a id="constant-constant-mq3-qcommon-headers-trap-sin-const-trap-sin-103-src-mq3-qcommon-headers-ml-1965764787"></a>
### TRAP_SIN

```ml
const TRAP_SIN = 103
```

Game-VM trap identifier for sin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L155)

<a id="constant-constant-mq3-qcommon-headers-trap-sqrt-const-trap-sqrt-106-src-mq3-qcommon-headers-ml-847925752"></a>
### TRAP_SQRT

```ml
const TRAP_SQRT = 106
```

Game-VM trap identifier for sqrt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L161)

<a id="constant-constant-mq3-qcommon-headers-trap-strncpy-const-trap-strncpy-102-src-mq3-qcommon-headers-ml-284047548"></a>
### TRAP_STRNCPY

```ml
const TRAP_STRNCPY = 102
```

Game-VM trap identifier for strncpy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L153)

<a id="constant-constant-mq3-qcommon-headers-trap-testprintfloat-const-trap-testprintfloat-113-src-mq3-qcommon-headers-ml-382717482"></a>
### TRAP_TESTPRINTFLOAT

```ml
const TRAP_TESTPRINTFLOAT = 113
```

Game-VM trap identifier for testprintfloat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L175)

<a id="constant-constant-mq3-qcommon-headers-trap-testprintint-const-trap-testprintint-112-src-mq3-qcommon-headers-ml-990736619"></a>
### TRAP_TESTPRINTINT

```ml
const TRAP_TESTPRINTINT = 112
```

Game-VM trap identifier for testprintint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L173)

<a id="function-function-mq3-qcommon-headers-typenames-function-typenames-src-mq3-qcommon-headers-ml-1247014406"></a>
### typeNames

```ml
function typeNames()
```

List the 45 names in qcommon.headers.typeNames, beginning with `cArea_t`, `cGrid_t`, `cLeaf_t`, `cNode_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L311)

<a id="constant-constant-mq3-qcommon-headers-unz-badzipfile-const-unz-badzipfile-103-src-mq3-qcommon-headers-ml-1207521912"></a>
### UNZ_BADZIPFILE

```ml
const UNZ_BADZIPFILE = -103
```

ZIP-reader error indicating malformed or unsupported ZIP data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L228)

<a id="constant-constant-mq3-qcommon-headers-unz-casesensitive-const-unz-casesensitive-1-src-mq3-qcommon-headers-ml-523763822"></a>
### UNZ_CASESENSITIVE

```ml
const UNZ_CASESENSITIVE = 1
```

ZIP filename-comparison selector requiring matching letter case.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L234)

<a id="constant-constant-mq3-qcommon-headers-unz-crcerror-const-unz-crcerror-105-src-mq3-qcommon-headers-ml-206839158"></a>
### UNZ_CRCERROR

```ml
const UNZ_CRCERROR = -105
```

ZIP-reader error indicating a mismatch in the entry CRC-32 checksum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L232)

<a id="constant-constant-mq3-qcommon-headers-unz-end-of-list-of-file-const-unz-end-of-list-of-file-100-src-mq3-qcommon-headers-ml-73939769"></a>
### UNZ_END_OF_LIST_OF_FILE

```ml
const UNZ_END_OF_LIST_OF_FILE = -100
```

ZIP-reader result indicating that the central-directory enumeration is exhausted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L220)

<a id="constant-constant-mq3-qcommon-headers-unz-eof-const-unz-eof-0-src-mq3-qcommon-headers-ml-558514111"></a>
### UNZ_EOF

```ml
const UNZ_EOF = 0
```

ZIP-reader result indicating end of the current entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L224)

<a id="constant-constant-mq3-qcommon-headers-unz-errno-const-unz-errno-1-src-mq3-qcommon-headers-ml-1788953501"></a>
### UNZ_ERRNO

```ml
const UNZ_ERRNO = -1
```

ZIP-reader error caused by an underlying file operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L222)

<a id="constant-constant-mq3-qcommon-headers-unz-internalerror-const-unz-internalerror-104-src-mq3-qcommon-headers-ml-1751932509"></a>
### UNZ_INTERNALERROR

```ml
const UNZ_INTERNALERROR = -104
```

ZIP-reader error indicating an internal decoding failure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L230)

<a id="constant-constant-mq3-qcommon-headers-unz-notcasesensitive-const-unz-notcasesensitive-2-src-mq3-qcommon-headers-ml-279493117"></a>
### UNZ_NOTCASESENSITIVE

```ml
const UNZ_NOTCASESENSITIVE = 2
```

ZIP filename-comparison selector ignoring letter case.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L236)

<a id="constant-constant-mq3-qcommon-headers-unz-ok-const-unz-ok-0-src-mq3-qcommon-headers-ml-405119429"></a>
### UNZ_OK

```ml
const UNZ_OK = 0
```

ZIP-reader result indicating success.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L218)

<a id="constant-constant-mq3-qcommon-headers-unz-osdefaultcase-const-unz-osdefaultcase-0-src-mq3-qcommon-headers-ml-608940487"></a>
### UNZ_OSDEFAULTCASE

```ml
const UNZ_OSDEFAULTCASE = 0
```

ZIP filename-comparison selector using the platform default case policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L238)

<a id="constant-constant-mq3-qcommon-headers-unz-paramerror-const-unz-paramerror-102-src-mq3-qcommon-headers-ml-1517762811"></a>
### UNZ_PARAMERROR

```ml
const UNZ_PARAMERROR = -102
```

ZIP-reader error indicating invalid input parameters.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L226)

<a id="function-function-mq3-qcommon-headers-unzipfieldnames-function-unzipfieldnames-src-mq3-qcommon-headers-ml-1103720782"></a>
### unzipFieldNames

```ml
function unzipFieldNames()
```

List the 68 names in qcommon.headers.unzipFieldNames, beginning with `file_in_zip_read_info_s.byte_before_the_zipfile`, `file_in_zip_read_info_s.compression_method`, `file_in_zip_read_info_s.crc32`, `file_in_zip_read_info_s.crc32_wait`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L306)

<a id="function-function-mq3-qcommon-headers-unzipfunctionnames-function-unzipfunctionnames-src-mq3-qcommon-headers-ml-1536203326"></a>
### unzipFunctionNames

```ml
function unzipFunctionNames()
```

List the 18 names in qcommon.headers.unzipFunctionNames, beginning with `unzClose`, `unzCloseCurrentFile`, `unzGetCurrentFileInfo`, `unzGetCurrentFileInfoPosition`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L302)

<a id="function-function-mq3-qcommon-headers-unzipglobalnames-function-unzipglobalnames-src-mq3-qcommon-headers-ml-311101082"></a>
### unzipGlobalNames

```ml
function unzipGlobalNames()
```

List the 0 names in qcommon.headers.unzipGlobalNames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L304)

<a id="function-function-mq3-qcommon-headers-unzipmacronames-function-unzipmacronames-src-mq3-qcommon-headers-ml-205587022"></a>
### unzipMacroNames

```ml
function unzipMacroNames()
```

List the 11 names in qcommon.headers.unzipMacroNames, beginning with `UNZ_BADZIPFILE`, `UNZ_CASESENSITIVE`, `UNZ_CRCERROR`, `UNZ_END_OF_LIST_OF_FILE`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L298)

<a id="function-function-mq3-qcommon-headers-unziptypenames-function-unziptypenames-src-mq3-qcommon-headers-ml-2023462990"></a>
### unzipTypeNames

```ml
function unzipTypeNames()
```

List the 12 names in qcommon.headers.unzipTypeNames, beginning with `file_in_zip_read_info_s`, `tm_unz`, `alloc_func`, `free_func`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L300)

<a id="constant-constant-mq3-qcommon-headers-update-server-name-const-update-server-name-update-quake3arena-com-src-mq3-qcommon-headers-ml-1733998850"></a>
### UPDATE_SERVER_NAME

```ml
const UPDATE_SERVER_NAME = "update.quake3arena.com"
```

Host name of the legacy game-update service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L62)

<a id="function-function-mq3-qcommon-headers-validdownloadblock-function-validdownloadblock-size-src-mq3-qcommon-headers-ml-843540931"></a>
### validDownloadBlock

```ml
function validDownloadBlock(size)
```

Compute qcommon.headers.validDownloadBlock as `((size >= 0) and (size <= MAX_DOWNLOAD_BLKSIZE))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Size used in `(size >= 0)` and `(size <= MAX_DOWNLOAD_BLKSIZE)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L332)

<a id="function-function-mq3-qcommon-headers-validinlinemodel-function-validinlinemodel-index-count-src-mq3-qcommon-headers-ml-1539401049"></a>
### validInlineModel

```ml
function validInlineModel(index, count)
```

Compute qcommon.headers.validInlineModel as `(((index >= 0) and (index < count)) and (index < MAX_SUBMODELS))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index used in `(index >= 0)` and `(index < count)`. |
| `count` | `dynamic` | — | Count used in `(index < count)` and `((index >= 0) and (index < count))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L323)

<a id="function-function-mq3-qcommon-headers-validmessagesize-function-validmessagesize-size-src-mq3-qcommon-headers-ml-1442141983"></a>
### validMessageSize

```ml
function validMessageSize(size)
```

Compute qcommon.headers.validMessageSize as `((size >= 0) and (size <= MAX_MSGLEN))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Size used in `(size >= 0)` and `(size <= MAX_MSGLEN)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L329)

<a id="function-function-mq3-qcommon-headers-validunzipresult-function-validunzipresult-code-src-mq3-qcommon-headers-ml-1211921455"></a>
### validUnzipResult

```ml
function validUnzipResult(code)
```

Compute qcommon.headers.validUnzipResult as `(((code == UNZ_OK) or (code == UNZ_END_OF_LIST_OF_FILE)) or (code <= UNZ_PARAMERROR))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Code used in `(code == UNZ_OK)` and `(code <= UNZ_PARAMERROR)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L335)

<a id="constant-constant-mq3-qcommon-headers-vmi-bytecode-const-vmi-bytecode-1-src-mq3-qcommon-headers-ml-59925860"></a>
### VMI_BYTECODE

```ml
const VMI_BYTECODE = 1
```

VM execution-mode identifier for interpreted bytecode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L145)

<a id="constant-constant-mq3-qcommon-headers-vmi-compiled-const-vmi-compiled-2-src-mq3-qcommon-headers-ml-1312157383"></a>
### VMI_COMPILED

```ml
const VMI_COMPILED = 2
```

VM execution-mode identifier for compiled bytecode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L147)

<a id="constant-constant-mq3-qcommon-headers-vmi-native-const-vmi-native-0-src-mq3-qcommon-headers-ml-1854747049"></a>
### VMI_NATIVE

```ml
const VMI_NATIVE = 0
```

VM execution-mode identifier for a native game module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L143)

<a id="constant-constant-mq3-qcommon-headers-wrap-point-epsilon-const-wrap-point-epsilon-0-1-src-mq3-qcommon-headers-ml-791423438"></a>
### WRAP_POINT_EPSILON

```ml
const WRAP_POINT_EPSILON = 0.1
```

Tolerance for recognizing matching endpoints of a wrapping patch grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/headers.ml#L25)
