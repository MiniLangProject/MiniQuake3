# `mq3.client.ui_shared.Window`

[Home](README.md) · [Source file](File-src-mq3-client-ui-shared-ml-1094733975.md)

<a id="struct-struct-mq3-client-ui-shared-window-struct-window-src-mq3-client-ui-shared-ml-533569263"></a>
## Window

```ml
struct Window
```

Stores UI shared window record, including `name`, `group`, `rect`, `rectClient`, `rectEffects`, `rectEffects2` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L204)

## Members

<a id="field-field-mq3-client-ui-shared-window-alpha-alpha-src-mq3-client-ui-shared-ml-1905041421"></a>
### alpha

```ml
alpha
```

Opacity or alpha modulation applied while drawing or fading the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L242)

<a id="field-field-mq3-client-ui-shared-window-backcolor-backcolor-src-mq3-client-ui-shared-ml-559684629"></a>
### backColor

```ml
backColor
```

Background fill color used by the UI element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L228)

<a id="field-field-mq3-client-ui-shared-window-background-background-src-mq3-client-ui-shared-ml-2074783869"></a>
### background

```ml
background
```

Virtual shader or image asset used for the window background.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L234)

<a id="field-field-mq3-client-ui-shared-window-border-border-src-mq3-client-ui-shared-ml-888957281"></a>
### border

```ml
border
```

Border style selected for the menu window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L220)

<a id="field-field-mq3-client-ui-shared-window-bordercolor-bordercolor-src-mq3-client-ui-shared-ml-102474053"></a>
### borderColor

```ml
borderColor
```

Color used to draw the UI element's border.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L230)

<a id="field-field-mq3-client-ui-shared-window-bordersize-bordersize-src-mq3-client-ui-shared-ml-1652722803"></a>
### borderSize

```ml
borderSize
```

Thickness of the UI element's border in its layout coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L222)

<a id="field-field-mq3-client-ui-shared-window-cinematic-cinematic-src-mq3-client-ui-shared-ml-1097020985"></a>
### cinematic

```ml
cinematic
```

Handle of the cinematic playing inside the window, or a negative value when inactive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L236)

<a id="field-field-mq3-client-ui-shared-window-flags-flags-src-mq3-client-ui-shared-ml-2005855293"></a>
### flags

```ml
flags
```

Window flags controlling visibility, focus, mouseover, and animation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L224)

<a id="field-field-mq3-client-ui-shared-window-forecolor-forecolor-src-mq3-client-ui-shared-ml-922562301"></a>
### foreColor

```ml
foreColor
```

Foreground text or image color used by the UI element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L226)

<a id="field-field-mq3-client-ui-shared-window-group-group-src-mq3-client-ui-shared-ml-2040048397"></a>
### group

```ml
group
```

Optional group name used to address several menu windows together.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L208)

<a id="field-field-mq3-client-ui-shared-window-name-name-src-mq3-client-ui-shared-ml-1262497287"></a>
### name

```ml
name
```

Window name used by menu scripts and named-item lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L206)

<a id="field-field-mq3-client-ui-shared-window-nexttime-nexttime-src-mq3-client-ui-shared-ml-2139053525"></a>
### nextTime

```ml
nextTime
```

Next scheduled time at which a window animation or transition advances.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L240)

<a id="field-field-mq3-client-ui-shared-window-offsettime-offsettime-src-mq3-client-ui-shared-ml-1317722545"></a>
### offsetTime

```ml
offsetTime
```

Time offset used while updating a window animation or transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L238)

<a id="field-field-mq3-client-ui-shared-window-outlinecolor-outlinecolor-src-mq3-client-ui-shared-ml-1655047751"></a>
### outlineColor

```ml
outlineColor
```

Color used to draw the UI element's outline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L232)

<a id="field-field-mq3-client-ui-shared-window-rect-rect-src-mq3-client-ui-shared-ml-1885998465"></a>
### rect

```ml
rect
```

Primary rectangle used to position and size the UI element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L210)

<a id="field-field-mq3-client-ui-shared-window-rectclient-rectclient-src-mq3-client-ui-shared-ml-2066267955"></a>
### rectClient

```ml
rectClient
```

Secondary rectangle used when transforming the element between menu and screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L212)

<a id="field-field-mq3-client-ui-shared-window-recteffects-recteffects-src-mq3-client-ui-shared-ml-1255993461"></a>
### rectEffects

```ml
rectEffects
```

Rectangle holding the current transition or animation extent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L214)

<a id="field-field-mq3-client-ui-shared-window-recteffects2-recteffects2-src-mq3-client-ui-shared-ml-2134348725"></a>
### rectEffects2

```ml
rectEffects2
```

Additional rectangle used by menu transition and orbit effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L216)

<a id="field-field-mq3-client-ui-shared-window-style-style-src-mq3-client-ui-shared-ml-1226178753"></a>
### style

```ml
style
```

Window drawing style selecting the background presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_shared.ml#L218)
