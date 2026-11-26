# `mq3.renderer.tr_public.RefExport`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-public-ml-911183383.md)

<a id="struct-struct-mq3-renderer-tr-public-refexport-struct-refexport-src-mq3-renderer-tr-public-ml-1199353219"></a>
## RefExport

```ml
struct RefExport
```

Callback table for `mq3.renderer.tr_public.RefExport`; exposes `Shutdown`, `BeginRegistration`, `RegisterModel`, `RegisterSkin`, `RegisterShader`, `RegisterShaderNoMip`, and 24 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L9)

## Members

<a id="field-field-mq3-renderer-tr-public-refexport-a3d-rendergeometry-a3d-rendergeometry-src-mq3-renderer-tr-public-ml-1236187834"></a>
### A3D_RenderGeometry

```ml
A3D_RenderGeometry
```

Renderer API callback used to submit world geometry to the legacy A3D geometry interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L62)

<a id="field-field-mq3-renderer-tr-public-refexport-addadditivelighttoscene-addadditivelighttoscene-src-mq3-renderer-tr-public-ml-1090407284"></a>
### AddAdditiveLightToScene

```ml
AddAdditiveLightToScene
```

Renderer API callback used to append an additive dynamic light to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L40)

<a id="field-field-mq3-renderer-tr-public-refexport-addlighttoscene-addlighttoscene-src-mq3-renderer-tr-public-ml-1257005160"></a>
### AddLightToScene

```ml
AddLightToScene
```

Renderer API callback used to append a modulating dynamic light to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L38)

<a id="field-field-mq3-renderer-tr-public-refexport-addpolytoscene-addpolytoscene-src-mq3-renderer-tr-public-ml-334133692"></a>
### AddPolyToScene

```ml
AddPolyToScene
```

Renderer API callback used to append a shader-bound polygon to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L34)

<a id="field-field-mq3-renderer-tr-public-refexport-addrefentitytoscene-addrefentitytoscene-src-mq3-renderer-tr-public-ml-1826824012"></a>
### AddRefEntityToScene

```ml
AddRefEntityToScene
```

Renderer API callback used to append a model, sprite, beam, or portal entity to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L32)

<a id="field-field-mq3-renderer-tr-public-refexport-beginframe-beginframe-src-mq3-renderer-tr-public-ml-1048004572"></a>
### BeginFrame

```ml
BeginFrame
```

Renderer API callback used to begin a renderer frame for the selected stereo eye.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L52)

<a id="field-field-mq3-renderer-tr-public-refexport-beginregistration-beginregistration-src-mq3-renderer-tr-public-ml-12683368"></a>
### BeginRegistration

```ml
BeginRegistration
```

Renderer API callback used to begin renderer registration and return the active graphics configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L14)

<a id="field-field-mq3-renderer-tr-public-refexport-clearscene-clearscene-src-mq3-renderer-tr-public-ml-1864421058"></a>
### ClearScene

```ml
ClearScene
```

Renderer API callback used to clear the current scene entity, light, and polygon submissions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L30)

<a id="field-field-mq3-renderer-tr-public-refexport-drawstretchpic-drawstretchpic-src-mq3-renderer-tr-public-ml-1667267606"></a>
### DrawStretchPic

```ml
DrawStretchPic
```

Renderer API callback used to draw a shader-bound textured rectangle in two dimensions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L46)

<a id="field-field-mq3-renderer-tr-public-refexport-drawstretchraw-drawstretchraw-src-mq3-renderer-tr-public-ml-350116122"></a>
### DrawStretchRaw

```ml
DrawStretchRaw
```

Renderer API callback used to draw an uploaded raw or cinematic image as a rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L48)

<a id="field-field-mq3-renderer-tr-public-refexport-endframe-endframe-src-mq3-renderer-tr-public-ml-1197601084"></a>
### EndFrame

```ml
EndFrame
```

Renderer API callback used to finish rendering and present the completed frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L54)

<a id="field-field-mq3-renderer-tr-public-refexport-endregistration-endregistration-src-mq3-renderer-tr-public-ml-642909648"></a>
### EndRegistration

```ml
EndRegistration
```

Renderer API callback used to finish resource registration and prepare registered images for use.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L28)

<a id="field-field-mq3-renderer-tr-public-refexport-getentitytoken-getentitytoken-src-mq3-renderer-tr-public-ml-1389917324"></a>
### GetEntityToken

```ml
GetEntityToken
```

Renderer API callback used to read the next token from the loaded map entity text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L68)

<a id="field-field-mq3-renderer-tr-public-refexport-inpvs-inpvs-src-mq3-renderer-tr-public-ml-530510580"></a>
### inPVS

```ml
inPVS
```

Renderer API callback used to test whether two positions share the potentially visible set.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L70)

<a id="field-field-mq3-renderer-tr-public-refexport-lerptag-lerptag-src-mq3-renderer-tr-public-ml-1701201304"></a>
### LerpTag

```ml
LerpTag
```

Renderer API callback used to interpolate a model attachment tag between animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L58)

<a id="field-field-mq3-renderer-tr-public-refexport-lightforpoint-lightforpoint-src-mq3-renderer-tr-public-ml-190122856"></a>
### LightForPoint

```ml
LightForPoint
```

Renderer API callback used to sample ambient and directed world lighting at a point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L36)

<a id="field-field-mq3-renderer-tr-public-refexport-loadworld-loadworld-src-mq3-renderer-tr-public-ml-85019868"></a>
### LoadWorld

```ml
LoadWorld
```

Renderer API callback used to load the BSP world used by subsequent scene rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L24)

<a id="field-field-mq3-renderer-tr-public-refexport-markfragments-markfragments-src-mq3-renderer-tr-public-ml-577662620"></a>
### MarkFragments

```ml
MarkFragments
```

Renderer API callback used to clip a projected polygon against world geometry for impact marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L56)

<a id="field-field-mq3-renderer-tr-public-refexport-modelbounds-modelbounds-src-mq3-renderer-tr-public-ml-1167235352"></a>
### ModelBounds

```ml
ModelBounds
```

Renderer API callback used to return the minimum and maximum bounds of a registered model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L60)

<a id="field-field-mq3-renderer-tr-public-refexport-registerfont-registerfont-src-mq3-renderer-tr-public-ml-683091036"></a>
### RegisterFont

```ml
RegisterFont
```

Renderer API callback used to load or rasterize a font and return glyph metadata.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L64)

<a id="field-field-mq3-renderer-tr-public-refexport-registermodel-registermodel-src-mq3-renderer-tr-public-ml-1232406268"></a>
### RegisterModel

```ml
RegisterModel
```

Renderer API callback used to load or find a model and return its registered handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L16)

<a id="field-field-mq3-renderer-tr-public-refexport-registershader-registershader-src-mq3-renderer-tr-public-ml-1191410312"></a>
### RegisterShader

```ml
RegisterShader
```

Renderer API callback used to load or find a shader and return its registered handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L20)

<a id="field-field-mq3-renderer-tr-public-refexport-registershadernomip-registershadernomip-src-mq3-renderer-tr-public-ml-644496748"></a>
### RegisterShaderNoMip

```ml
RegisterShaderNoMip
```

Renderer API callback used to register a two-dimensional shader without image mipmaps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L22)

<a id="field-field-mq3-renderer-tr-public-refexport-registerskin-registerskin-src-mq3-renderer-tr-public-ml-132738244"></a>
### RegisterSkin

```ml
RegisterSkin
```

Renderer API callback used to load or find a skin and return its registered handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L18)

<a id="field-field-mq3-renderer-tr-public-refexport-remapshader-remapshader-src-mq3-renderer-tr-public-ml-549332744"></a>
### RemapShader

```ml
RemapShader
```

Renderer API callback used to replace references to one shader name with another shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L66)

<a id="field-field-mq3-renderer-tr-public-refexport-renderscene-renderscene-src-mq3-renderer-tr-public-ml-1809040412"></a>
### RenderScene

```ml
RenderScene
```

Renderer API callback used to render the submitted scene using a view definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L42)

<a id="field-field-mq3-renderer-tr-public-refexport-setcolor-setcolor-src-mq3-renderer-tr-public-ml-1504404894"></a>
### SetColor

```ml
SetColor
```

Renderer API callback used to set the modulation color used by subsequent two-dimensional drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L44)

<a id="field-field-mq3-renderer-tr-public-refexport-setworldvisdata-setworldvisdata-src-mq3-renderer-tr-public-ml-74061756"></a>
### SetWorldVisData

```ml
SetWorldVisData
```

Renderer API callback used to supply shared BSP visibility data to the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L26)

<a id="field-field-mq3-renderer-tr-public-refexport-shutdown-shutdown-src-mq3-renderer-tr-public-ml-513138428"></a>
### Shutdown

```ml
Shutdown
```

Renderer API callback used to shut down the renderer and optionally destroy its graphics window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L11)

<a id="field-field-mq3-renderer-tr-public-refexport-uploadcinematic-uploadcinematic-src-mq3-renderer-tr-public-ml-590974588"></a>
### UploadCinematic

```ml
UploadCinematic
```

Renderer API callback used to upload decoded cinematic pixels into a scratch image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_public.ml#L50)
