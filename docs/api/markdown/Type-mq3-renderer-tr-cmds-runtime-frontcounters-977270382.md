# `mq3.renderer.tr_cmds_runtime.FrontCounters`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-cmds-runtime-ml-2143950218.md)

<a id="struct-struct-mq3-renderer-tr-cmds-runtime-frontcounters-struct-frontcounters-src-mq3-renderer-tr-cmds-runtime-ml-797707577"></a>
## FrontCounters

```ml
struct FrontCounters
```

Data record for `mq3.renderer.tr_cmds_runtime.FrontCounters`; groups `leafs`, `spherePatchIn`, `spherePatchClip`, `spherePatchOut`, `boxPatchIn`, `boxPatchClip`, and 10 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L20)

## Members

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-boxmd3clip-boxmd3clip-src-mq3-renderer-tr-cmds-runtime-ml-593796173"></a>
### boxMd3Clip

```ml
boxMd3Clip
```

Number of MD3 model box bounds classified as intersecting the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L44)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-boxmd3in-boxmd3in-src-mq3-renderer-tr-cmds-runtime-ml-2105565103"></a>
### boxMd3In

```ml
boxMd3In
```

Number of MD3 model box bounds classified as fully inside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L42)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-boxmd3out-boxmd3out-src-mq3-renderer-tr-cmds-runtime-ml-1076766451"></a>
### boxMd3Out

```ml
boxMd3Out
```

Number of MD3 model box bounds classified as outside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L46)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-boxpatchclip-boxpatchclip-src-mq3-renderer-tr-cmds-runtime-ml-617951937"></a>
### boxPatchClip

```ml
boxPatchClip
```

Number of patch box bounds classified as intersecting the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L32)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-boxpatchin-boxpatchin-src-mq3-renderer-tr-cmds-runtime-ml-1292399143"></a>
### boxPatchIn

```ml
boxPatchIn
```

Number of patch box bounds classified as fully inside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L30)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-boxpatchout-boxpatchout-src-mq3-renderer-tr-cmds-runtime-ml-212158455"></a>
### boxPatchOut

```ml
boxPatchOut
```

Number of patch box bounds classified as outside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L34)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-dlightsurfaces-dlightsurfaces-src-mq3-renderer-tr-cmds-runtime-ml-1262727299"></a>
### dlightSurfaces

```ml
dlightSurfaces
```

Number of surfaces considered for dynamic lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L48)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-dlightsurfacesculled-dlightsurfacesculled-src-mq3-renderer-tr-cmds-runtime-ml-1340832105"></a>
### dlightSurfacesCulled

```ml
dlightSurfacesCulled
```

Number of surfaces rejected from dynamic-light processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L50)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-leafs-leafs-src-mq3-renderer-tr-cmds-runtime-ml-176001227"></a>
### leafs

```ml
leafs
```

Number of BSP leaves visited by frontend world traversal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L22)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-spheremd3clip-spheremd3clip-src-mq3-renderer-tr-cmds-runtime-ml-1506137527"></a>
### sphereMd3Clip

```ml
sphereMd3Clip
```

Number of MD3 model sphere bounds classified as intersecting the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L38)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-spheremd3in-spheremd3in-src-mq3-renderer-tr-cmds-runtime-ml-1887219247"></a>
### sphereMd3In

```ml
sphereMd3In
```

Number of MD3 model sphere bounds classified as fully inside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L36)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-spheremd3out-spheremd3out-src-mq3-renderer-tr-cmds-runtime-ml-1734769609"></a>
### sphereMd3Out

```ml
sphereMd3Out
```

Number of MD3 model sphere bounds classified as outside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L40)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-spherepatchclip-spherepatchclip-src-mq3-renderer-tr-cmds-runtime-ml-827061275"></a>
### spherePatchClip

```ml
spherePatchClip
```

Number of patch sphere bounds classified as intersecting the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L26)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-spherepatchin-spherepatchin-src-mq3-renderer-tr-cmds-runtime-ml-193033223"></a>
### spherePatchIn

```ml
spherePatchIn
```

Number of patch sphere bounds classified as fully inside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L24)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-spherepatchout-spherepatchout-src-mq3-renderer-tr-cmds-runtime-ml-721949565"></a>
### spherePatchOut

```ml
spherePatchOut
```

Number of patch sphere bounds classified as outside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L28)

<a id="field-field-mq3-renderer-tr-cmds-runtime-frontcounters-zfar-zfar-src-mq3-renderer-tr-cmds-runtime-ml-640029805"></a>
### zFar

```ml
zFar
```

Far clipping distance selected for the current view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L52)
