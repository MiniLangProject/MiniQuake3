# `mq3.renderer.portal_view.View`

[Home](README.md) · [Source file](File-src-mq3-renderer-portal-view-ml-1859210863.md)

<a id="struct-struct-mq3-renderer-portal-view-view-struct-view-src-mq3-renderer-portal-view-ml-1131923583"></a>
## View

```ml
struct View
```

Data record for `mq3.renderer.portal_view.View`; groups `surface`, `camera`, `pvsOrigin`, `mirror`, `origin`, `axis`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L22)

## Members

<a id="field-field-mq3-renderer-portal-view-view-axis-axis-src-mq3-renderer-portal-view-ml-416772354"></a>
### axis

```ml
axis
```

Camera basis obtained by transforming the source view directions through the portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L34)

<a id="field-field-mq3-renderer-portal-view-view-camera-camera-src-mq3-renderer-portal-view-ml-1693109570"></a>
### camera

```ml
camera
```

Camera position and orientation used for the portal view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L26)

<a id="field-field-mq3-renderer-portal-view-view-entityindex-entityindex-src-mq3-renderer-portal-view-ml-1075226244"></a>
### entityIndex

```ml
entityIndex
```

Index of the scene entity that produced this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L40)

<a id="field-field-mq3-renderer-portal-view-view-mirror-mirror-src-mq3-renderer-portal-view-ml-706772778"></a>
### mirror

```ml
mirror
```

Whether the view reflects handedness across a portal or mirror plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L30)

<a id="field-field-mq3-renderer-portal-view-view-origin-origin-src-mq3-renderer-portal-view-ml-1502105236"></a>
### origin

```ml
origin
```

Virtual camera position obtained by mapping the source eye through the portal frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L32)

<a id="field-field-mq3-renderer-portal-view-view-planedist-planedist-src-mq3-renderer-portal-view-ml-1428383492"></a>
### planeDist

```ml
planeDist
```

Signed distance of the portal or clipping plane from the origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L38)

<a id="field-field-mq3-renderer-portal-view-view-planenormal-planenormal-src-mq3-renderer-portal-view-ml-437736832"></a>
### planeNormal

```ml
planeNormal
```

Normal of the portal or clipping plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L36)

<a id="field-field-mq3-renderer-portal-view-view-pvsorigin-pvsorigin-src-mq3-renderer-portal-view-ml-200916324"></a>
### pvsOrigin

```ml
pvsOrigin
```

Position used to choose the visibility cluster for this view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L28)

<a id="field-field-mq3-renderer-portal-view-view-surface-surface-src-mq3-renderer-portal-view-ml-1989114976"></a>
### surface

```ml
surface
```

Surface record, handle, or identifier associated with the drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_view.ml#L24)
