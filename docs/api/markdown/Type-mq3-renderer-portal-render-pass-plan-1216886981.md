# `mq3.renderer.portal_render_pass.Plan`

[Home](README.md) · [Source file](File-src-mq3-renderer-portal-render-pass-ml-1378707998.md)

<a id="struct-struct-mq3-renderer-portal-render-pass-plan-struct-plan-src-mq3-renderer-portal-render-pass-ml-363189161"></a>
## Plan

```ml
struct Plan
```

Data record for `mq3.renderer.portal_render_pass.Plan`; groups `surface`, `view`, `refdef`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L52)

## Members

<a id="field-field-mq3-renderer-portal-render-pass-plan-refdef-refdef-src-mq3-renderer-portal-render-pass-ml-1167545512"></a>
### refdef

```ml
refdef
```

Camera, viewport, timing, and rendering flags for the view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L58)

<a id="field-field-mq3-renderer-portal-render-pass-plan-surface-surface-src-mq3-renderer-portal-render-pass-ml-1565033828"></a>
### surface

```ml
surface
```

Surface record, handle, or identifier associated with the drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L54)

<a id="field-field-mq3-renderer-portal-render-pass-plan-view-view-src-mq3-renderer-portal-render-pass-ml-816271662"></a>
### view

```ml
view
```

Derived camera orientation and clipping state for a portal view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L56)
