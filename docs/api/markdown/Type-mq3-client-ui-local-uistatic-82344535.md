# `mq3.client.ui_local.UIStatic`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-uistatic-struct-uistatic-src-mq3-client-ui-local-ml-2040329267"></a>
## UIStatic

```ml
struct UIStatic
```

Stores UI local ui static record, including `frametime`, `realtime`, `cursorx`, `cursory`, `menusp`, `activemenu` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L405)

## Members

<a id="field-field-mq3-client-ui-local-uistatic-activemenu-activemenu-src-mq3-client-ui-local-ml-796754685"></a>
### activemenu

```ml
activemenu
```

Compatibility member corresponding to native `uiStatic_t.activemenu`; the original declaration is `menuframework_s* activemenu`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L419)

<a id="field-field-mq3-client-ui-local-uistatic-bias-bias-src-mq3-client-ui-local-ml-1958813581"></a>
### bias

```ml
bias
```

Horizontal adjustment used when centering the virtual UI on a wider display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L452)

<a id="field-field-mq3-client-ui-local-uistatic-charset-charset-src-mq3-client-ui-local-ml-1476406107"></a>
### charset

```ml
charset
```

Renderer resource handle used for charset; mirrors native `uiStatic_t.charset`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L435)

<a id="field-field-mq3-client-ui-local-uistatic-charsetprop-charsetprop-src-mq3-client-ui-local-ml-1153035939"></a>
### charsetProp

```ml
charsetProp
```

Renderer resource handle used for charset prop; mirrors native `uiStatic_t.charsetProp`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L437)

<a id="field-field-mq3-client-ui-local-uistatic-charsetpropb-charsetpropb-src-mq3-client-ui-local-ml-547232037"></a>
### charsetPropB

```ml
charsetPropB
```

Renderer resource handle used for charset prop b; mirrors native `uiStatic_t.charsetPropB`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L441)

<a id="field-field-mq3-client-ui-local-uistatic-charsetpropglow-charsetpropglow-src-mq3-client-ui-local-ml-1578784839"></a>
### charsetPropGlow

```ml
charsetPropGlow
```

Renderer resource handle used for charset prop glow; mirrors native `uiStatic_t.charsetPropGlow`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L439)

<a id="field-field-mq3-client-ui-local-uistatic-cursor-cursor-src-mq3-client-ui-local-ml-741681671"></a>
### cursor

```ml
cursor
```

Renderer resource handle used for cursor; mirrors native `uiStatic_t.cursor`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L443)

<a id="field-field-mq3-client-ui-local-uistatic-cursorx-cursorx-src-mq3-client-ui-local-ml-927601543"></a>
### cursorx

```ml
cursorx
```

Horizontal position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L411)

<a id="field-field-mq3-client-ui-local-uistatic-cursory-cursory-src-mq3-client-ui-local-ml-2071858603"></a>
### cursory

```ml
cursory
```

Vertical position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L413)

<a id="field-field-mq3-client-ui-local-uistatic-debug-debug-src-mq3-client-ui-local-ml-35025827"></a>
### debug

```ml
debug
```

Compatibility member corresponding to native `uiStatic_t.debug`; the original declaration is `qboolean debug`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L427)

<a id="field-field-mq3-client-ui-local-uistatic-demoversion-demoversion-src-mq3-client-ui-local-ml-614669403"></a>
### demoversion

```ml
demoversion
```

Compatibility member corresponding to native `uiStatic_t.demoversion`; the original declaration is `qboolean demoversion`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L455)

<a id="field-field-mq3-client-ui-local-uistatic-firstdraw-firstdraw-src-mq3-client-ui-local-ml-22222395"></a>
### firstdraw

```ml
firstdraw
```

Compatibility member corresponding to native `uiStatic_t.firstdraw`; the original declaration is `qboolean firstdraw`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L458)

<a id="field-field-mq3-client-ui-local-uistatic-frametime-frametime-src-mq3-client-ui-local-ml-554511711"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L407)

<a id="field-field-mq3-client-ui-local-uistatic-glconfig-glconfig-src-mq3-client-ui-local-ml-781822141"></a>
### glconfig

```ml
glconfig
```

Renderer configuration reported by the engine for the current display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L424)

<a id="field-field-mq3-client-ui-local-uistatic-menubacknologoshader-menubacknologoshader-src-mq3-client-ui-local-ml-448866933"></a>
### menuBackNoLogoShader

```ml
menuBackNoLogoShader
```

Shader resource selected for menu back no logo rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L433)

<a id="field-field-mq3-client-ui-local-uistatic-menubackshader-menubackshader-src-mq3-client-ui-local-ml-581595233"></a>
### menuBackShader

```ml
menuBackShader
```

Shader resource selected for menu back rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L431)

<a id="field-field-mq3-client-ui-local-uistatic-menusp-menusp-src-mq3-client-ui-local-ml-492527815"></a>
### menusp

```ml
menusp
```

Compatibility member corresponding to native `uiStatic_t.menusp`; the original declaration is `int menusp`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L416)

<a id="field-field-mq3-client-ui-local-uistatic-rb-off-rb-off-src-mq3-client-ui-local-ml-650055147"></a>
### rb_off

```ml
rb_off
```

Renderer resource handle used for rb off; mirrors native `uiStatic_t.rb_off`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L447)

<a id="field-field-mq3-client-ui-local-uistatic-rb-on-rb-on-src-mq3-client-ui-local-ml-1082609539"></a>
### rb_on

```ml
rb_on
```

Renderer resource handle used for rb on; mirrors native `uiStatic_t.rb_on`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L445)

<a id="field-field-mq3-client-ui-local-uistatic-realtime-realtime-src-mq3-client-ui-local-ml-1702348281"></a>
### realtime

```ml
realtime
```

Most recent UI refresh timestamp in milliseconds retained in the shared UI state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L409)

<a id="field-field-mq3-client-ui-local-uistatic-scale-scale-src-mq3-client-ui-local-ml-1306799199"></a>
### scale

```ml
scale
```

Compatibility member corresponding to native `uiStatic_t.scale`; the original declaration is `float scale`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L450)

<a id="field-field-mq3-client-ui-local-uistatic-stack-stack-src-mq3-client-ui-local-ml-415449763"></a>
### stack

```ml
stack
```

Compatibility member corresponding to native `uiStatic_t.stack`; the original declaration is `menuframework_s* stack[MAX_MENUDEPTH]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L422)

<a id="field-field-mq3-client-ui-local-uistatic-whiteshader-whiteshader-src-mq3-client-ui-local-ml-415495515"></a>
### whiteShader

```ml
whiteShader
```

Shader resource selected for white rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L429)
