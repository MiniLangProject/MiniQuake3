# `mq3.renderer.portal_render_pass.Refdef`

[Home](README.md) · [Source file](File-src-mq3-renderer-portal-render-pass-ml-1378707998.md)

<a id="struct-struct-mq3-renderer-portal-render-pass-refdef-struct-refdef-src-mq3-renderer-portal-render-pass-ml-513353261"></a>
## Refdef

```ml
struct Refdef
```

Data record for `mq3.renderer.portal_render_pass.Refdef`; groups `x`, `y`, `width`, `height`, `fovX`, `fovY`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L14)

## Members

<a id="field-field-mq3-renderer-portal-render-pass-refdef-areamask-areamask-src-mq3-renderer-portal-render-pass-ml-1360763519"></a>
### areaMask

```ml
areaMask
```

Area-visibility mask; set bits suppress rendering of the associated areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L36)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-flags-flags-src-mq3-renderer-portal-render-pass-ml-210949201"></a>
### flags

```ml
flags
```

View-definition flags applied when rendering the portal camera.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L34)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-fovx-fovx-src-mq3-renderer-portal-render-pass-ml-652258267"></a>
### fovX

```ml
fovX
```

Horizontal camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L24)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-fovy-fovy-src-mq3-renderer-portal-render-pass-ml-1894904273"></a>
### fovY

```ml
fovY
```

Vertical camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L26)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-height-height-src-mq3-renderer-portal-render-pass-ml-1871109919"></a>
### height

```ml
height
```

Height in pixels of the viewport rendered through the secondary portal camera.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L22)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-time-time-src-mq3-renderer-portal-render-pass-ml-1764142523"></a>
### time

```ml
time
```

Scene time in milliseconds preserved when constructing the secondary portal view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L32)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-viewaxis-viewaxis-src-mq3-renderer-portal-render-pass-ml-145580145"></a>
### viewaxis

```ml
viewaxis
```

Camera orientation represented by three basis vectors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L30)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-vieworg-vieworg-src-mq3-renderer-portal-render-pass-ml-949567869"></a>
### vieworg

```ml
vieworg
```

Camera origin in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L28)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-width-width-src-mq3-renderer-portal-render-pass-ml-563425101"></a>
### width

```ml
width
```

Width in pixels of the viewport rendered through the secondary portal camera.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L20)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-x-x-src-mq3-renderer-portal-render-pass-ml-742942065"></a>
### x

```ml
x
```

Horizontal position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L16)

<a id="field-field-mq3-renderer-portal-render-pass-refdef-y-y-src-mq3-renderer-portal-render-pass-ml-650680477"></a>
### y

```ml
y
```

Vertical position of the view or drawing rectangle, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_render_pass.ml#L18)
