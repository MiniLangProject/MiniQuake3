# `mq3.renderer.portal_render_pass.ComposeServices`

[Home](README.md) · [Source file](File-src-mq3-renderer-portal-render-pass-ml-1378707998.md)

<a id="struct-struct-mq3-renderer-portal-render-pass-composeservices-struct-composeservices-src-mq3-renderer-portal-render-pass-ml-598123055"></a>
## ComposeServices

```ml
struct ComposeServices
```

Callback table for `mq3.renderer.portal_render_pass.ComposeServices`; exposes `drawPortalFn`, `clearDepthFn`, `drawMainFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L202)

## Members

<a id="field-field-mq3-renderer-portal-render-pass-composeservices-cleardepthfn-cleardepthfn-src-mq3-renderer-portal-render-pass-ml-292683777"></a>
### clearDepthFn

```ml
clearDepthFn
```

Host callback used to perform clear depth operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L206)

<a id="field-field-mq3-renderer-portal-render-pass-composeservices-context-context-src-mq3-renderer-portal-render-pass-ml-1023634569"></a>
### context

```ml
context
```

Drawing-host state shared by portal rendering, depth clearing, and main-view composition callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L211)

<a id="field-field-mq3-renderer-portal-render-pass-composeservices-drawmainfn-drawmainfn-src-mq3-renderer-portal-render-pass-ml-1825383867"></a>
### drawMainFn

```ml
drawMainFn
```

Host callback used to perform draw main operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L208)

<a id="field-field-mq3-renderer-portal-render-pass-composeservices-drawportalfn-drawportalfn-src-mq3-renderer-portal-render-pass-ml-415000685"></a>
### drawPortalFn

```ml
drawPortalFn
```

Host callback used to perform draw portal operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L204)
