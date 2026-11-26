# `src/mq3/client/ui_local.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_local`](Package-mq3-client-ui-local-36724031.md)

Reachable from entry: **no**

## Imports

- `mq3/client/keycodes.ml` as `q3keys` → [src/mq3/client/keycodes.ml](File-src-mq3-client-keycodes-ml-1532276368.md)

## Declarations

<a id="constant-constant-mq3-client-ui-local-award-accuracy-const-award-accuracy-0-src-mq3-client-ui-local-ml-630191389"></a>
### AWARD_ACCURACY

```ml
const AWARD_ACCURACY = 0
```

Postgame award identifier selecting the accuracy award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L98)

<a id="constant-constant-mq3-client-ui-local-award-excellent-const-award-excellent-2-src-mq3-client-ui-local-ml-564245667"></a>
### AWARD_EXCELLENT

```ml
const AWARD_EXCELLENT = 2
```

Postgame award identifier selecting the excellent award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L102)

<a id="constant-constant-mq3-client-ui-local-award-frags-const-award-frags-4-src-mq3-client-ui-local-ml-380075933"></a>
### AWARD_FRAGS

```ml
const AWARD_FRAGS = 4
```

Postgame award identifier selecting the frags award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L106)

<a id="constant-constant-mq3-client-ui-local-award-gauntlet-const-award-gauntlet-3-src-mq3-client-ui-local-ml-327058828"></a>
### AWARD_GAUNTLET

```ml
const AWARD_GAUNTLET = 3
```

Postgame award identifier selecting the gauntlet award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L104)

<a id="constant-constant-mq3-client-ui-local-award-impressive-const-award-impressive-1-src-mq3-client-ui-local-ml-1583342888"></a>
### AWARD_IMPRESSIVE

```ml
const AWARD_IMPRESSIVE = 1
```

Postgame award identifier selecting the impressive award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L100)

<a id="constant-constant-mq3-client-ui-local-award-perfect-const-award-perfect-5-src-mq3-client-ui-local-ml-1025808460"></a>
### AWARD_PERFECT

```ml
const AWARD_PERFECT = 5
```

Postgame award identifier selecting the perfect award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L108)

<a id="function-function-mq3-client-ui-local-declaredfunctions-function-declaredfunctions-src-mq3-client-ui-local-ml-1006666492"></a>
### declaredFunctions

```ml
function declaredFunctions()
```

Lists the 226 UI local declared functions strings in their declared order, beginning with `"Menu_Cache"`, `"Menu_Focus"`, `"Menu_AddItem"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L470)

<a id="function-function-mq3-client-ui-local-declaredglobals-function-declaredglobals-src-mq3-client-ui-local-ml-1877285082"></a>
### declaredGlobals

```ml
function declaredGlobals()
```

Lists the 79 UI local declared globals strings in their declared order, beginning with `"ui_ffa_fraglimit"`, `"ui_ffa_timelimit"`, `"ui_tourney_fraglimit"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L472)

<a id="constant-constant-mq3-client-ui-local-lcolumn-offset-const-lcolumn-offset-16-src-mq3-client-ui-local-ml-846763027"></a>
### LCOLUMN_OFFSET

```ml
const LCOLUMN_OFFSET = -16
```

Horizontal offset used to position the left-hand menu text column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L14)

- [mq3.client.ui_local.LerpFrame](Type-mq3-client-ui-local-lerpframe-1948172491.md) — struct
<a id="constant-constant-mq3-client-ui-local-max-edit-line-const-max-edit-line-256-src-mq3-client-ui-local-ml-1937246358"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = 256
```

Maximum length of a console or editable input line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L18)

<a id="constant-constant-mq3-client-ui-local-max-favoriteservers-const-max-favoriteservers-16-src-mq3-client-ui-local-ml-265766086"></a>
### MAX_FAVORITESERVERS

```ml
const MAX_FAVORITESERVERS = 16
```

Capacity limit for the favoriteservers collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L24)

<a id="constant-constant-mq3-client-ui-local-max-menudepth-const-max-menudepth-8-src-mq3-client-ui-local-ml-1175605061"></a>
### MAX_MENUDEPTH

```ml
const MAX_MENUDEPTH = 8
```

Capacity limit for the menudepth collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L20)

<a id="constant-constant-mq3-client-ui-local-max-menuitems-const-max-menuitems-64-src-mq3-client-ui-local-ml-1231706181"></a>
### MAX_MENUITEMS

```ml
const MAX_MENUITEMS = 64
```

Capacity limit for the menuitems collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L22)

<a id="function-function-mq3-client-ui-local-menuacceptsinput-function-menuacceptsinput-flags-src-mq3-client-ui-local-ml-529919855"></a>
### menuAcceptsInput

```ml
function menuAcceptsInput(flags)
```

Computes `(flags&(QMF_GRAYED|QMF_INACTIVE|QMF_HIDDEN))==0` for UI local `menuAcceptsInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Value used by `return (flags&(QMF_GRAYED\|QMF_INACTIVE\|QMF_HIDDEN))==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L465)

- [mq3.client.ui_local.MenuAction](Type-mq3-client-ui-local-menuaction-174075286.md) — struct
- [mq3.client.ui_local.MenuBitmap](Type-mq3-client-ui-local-menubitmap-1888158079.md) — struct
- [mq3.client.ui_local.MenuCommon](Type-mq3-client-ui-local-menucommon-1608348933.md) — struct
- [mq3.client.ui_local.MenuField](Type-mq3-client-ui-local-menufield-1872606376.md) — struct
- [mq3.client.ui_local.MenuFramework](Type-mq3-client-ui-local-menuframework-1691031628.md) — struct
- [mq3.client.ui_local.MenuList](Type-mq3-client-ui-local-menulist-1276661916.md) — struct
- [mq3.client.ui_local.MenuRadioButton](Type-mq3-client-ui-local-menuradiobutton-423389823.md) — struct
- [mq3.client.ui_local.MenuSlider](Type-mq3-client-ui-local-menuslider-395122673.md) — struct
- [mq3.client.ui_local.MenuText](Type-mq3-client-ui-local-menutext-1745879907.md) — struct
- [mq3.client.ui_local.MField](Type-mq3-client-ui-local-mfield-154790366.md) — struct
<a id="constant-constant-mq3-client-ui-local-mtype-action-const-mtype-action-2-src-mq3-client-ui-local-ml-1772363321"></a>
### MTYPE_ACTION

```ml
const MTYPE_ACTION = 2
```

Menu-widget kind selecting action behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L31)

<a id="constant-constant-mq3-client-ui-local-mtype-bitmap-const-mtype-bitmap-6-src-mq3-client-ui-local-ml-1164678291"></a>
### MTYPE_BITMAP

```ml
const MTYPE_BITMAP = 6
```

Menu-widget kind selecting bitmap behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L39)

<a id="constant-constant-mq3-client-ui-local-mtype-btext-const-mtype-btext-10-src-mq3-client-ui-local-ml-321354144"></a>
### MTYPE_BTEXT

```ml
const MTYPE_BTEXT = 10
```

Menu-widget kind selecting btext behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L47)

<a id="constant-constant-mq3-client-ui-local-mtype-field-const-mtype-field-4-src-mq3-client-ui-local-ml-556848217"></a>
### MTYPE_FIELD

```ml
const MTYPE_FIELD = 4
```

Menu-widget kind selecting field behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L35)

<a id="constant-constant-mq3-client-ui-local-mtype-null-const-mtype-null-0-src-mq3-client-ui-local-ml-92522593"></a>
### MTYPE_NULL

```ml
const MTYPE_NULL = 0
```

Menu-widget kind selecting null behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L27)

<a id="constant-constant-mq3-client-ui-local-mtype-ptext-const-mtype-ptext-9-src-mq3-client-ui-local-ml-674868828"></a>
### MTYPE_PTEXT

```ml
const MTYPE_PTEXT = 9
```

Menu-widget kind selecting ptext behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L45)

<a id="constant-constant-mq3-client-ui-local-mtype-radiobutton-const-mtype-radiobutton-5-src-mq3-client-ui-local-ml-799450956"></a>
### MTYPE_RADIOBUTTON

```ml
const MTYPE_RADIOBUTTON = 5
```

Menu-widget kind selecting radiobutton behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L37)

<a id="constant-constant-mq3-client-ui-local-mtype-scrolllist-const-mtype-scrolllist-8-src-mq3-client-ui-local-ml-174794633"></a>
### MTYPE_SCROLLLIST

```ml
const MTYPE_SCROLLLIST = 8
```

Menu-widget kind selecting scrolllist behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L43)

<a id="constant-constant-mq3-client-ui-local-mtype-slider-const-mtype-slider-1-src-mq3-client-ui-local-ml-1785423032"></a>
### MTYPE_SLIDER

```ml
const MTYPE_SLIDER = 1
```

Menu-widget kind selecting slider behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L29)

<a id="constant-constant-mq3-client-ui-local-mtype-spincontrol-const-mtype-spincontrol-3-src-mq3-client-ui-local-ml-1940512098"></a>
### MTYPE_SPINCONTROL

```ml
const MTYPE_SPINCONTROL = 3
```

Menu-widget kind selecting spincontrol behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L33)

<a id="constant-constant-mq3-client-ui-local-mtype-text-const-mtype-text-7-src-mq3-client-ui-local-ml-1522701158"></a>
### MTYPE_TEXT

```ml
const MTYPE_TEXT = 7
```

Menu-widget kind selecting text behavior and widget-specific data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L41)

<a id="function-function-mq3-client-ui-local-normalizecharacterevent-function-normalizecharacterevent-key-src-mq3-client-ui-local-ml-1206847335"></a>
### normalizeCharacterEvent

```ml
function normalizeCharacterEvent(key)
```

Calls `mq3.client.keycodes.isCharacterEvent`, `mq3.client.keycodes.characterCode` from UI local `normalizeCharacterEvent`. The final path returns `key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI local entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L468)

- [mq3.client.ui_local.PlayerInfo](Type-mq3-client-ui-local-playerinfo-1500161226.md) — struct
<a id="constant-constant-mq3-client-ui-local-qm-activated-const-qm-activated-3-src-mq3-client-ui-local-ml-1242097852"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation event exported by the native UI compatibility declarations for consumers implementing menu-item callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L96)

<a id="constant-constant-mq3-client-ui-local-qm-gotfocus-const-qm-gotfocus-1-src-mq3-client-ui-local-ml-783738696"></a>
### QM_GOTFOCUS

```ml
const QM_GOTFOCUS = 1
```

Menu callback event reporting that the item was gotfocus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L91)

<a id="constant-constant-mq3-client-ui-local-qm-lostfocus-const-qm-lostfocus-2-src-mq3-client-ui-local-ml-1355199767"></a>
### QM_LOSTFOCUS

```ml
const QM_LOSTFOCUS = 2
```

Menu callback event reporting that the item was lostfocus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L93)

<a id="constant-constant-mq3-client-ui-local-qmf-blink-const-qmf-blink-1-src-mq3-client-ui-local-ml-933761416"></a>
### QMF_BLINK

```ml
const QMF_BLINK = 1
```

Menu-item flag used to blink the item while it is drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L49)

<a id="constant-constant-mq3-client-ui-local-qmf-center-justify-const-qmf-center-justify-8-src-mq3-client-ui-local-ml-480289733"></a>
### QMF_CENTER_JUSTIFY

```ml
const QMF_CENTER_JUSTIFY = 8
```

Menu-item flag used to center the item around its horizontal anchor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L55)

<a id="constant-constant-mq3-client-ui-local-qmf-grayed-const-qmf-grayed-8192-src-mq3-client-ui-local-ml-281636659"></a>
### QMF_GRAYED

```ml
const QMF_GRAYED = 8192
```

Menu-item flag used to display the item as unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L75)

<a id="constant-constant-mq3-client-ui-local-qmf-hasmousefocus-const-qmf-hasmousefocus-512-src-mq3-client-ui-local-ml-316051613"></a>
### QMF_HASMOUSEFOCUS

```ml
const QMF_HASMOUSEFOCUS = 512
```

Menu-item flag used to record that the pointer currently focuses this item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L67)

<a id="constant-constant-mq3-client-ui-local-qmf-hidden-const-qmf-hidden-4096-src-mq3-client-ui-local-ml-1225204506"></a>
### QMF_HIDDEN

```ml
const QMF_HIDDEN = 4096
```

Menu-item flag used to omit the item from display and normal selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L73)

<a id="constant-constant-mq3-client-ui-local-qmf-highlight-const-qmf-highlight-64-src-mq3-client-ui-local-ml-1709353717"></a>
### QMF_HIGHLIGHT

```ml
const QMF_HIGHLIGHT = 64
```

Menu-item flag used to draw the item in its highlighted style.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L61)

<a id="constant-constant-mq3-client-ui-local-qmf-highlight-if-focus-const-qmf-highlight-if-focus-128-src-mq3-client-ui-local-ml-1440106728"></a>
### QMF_HIGHLIGHT_IF_FOCUS

```ml
const QMF_HIGHLIGHT_IF_FOCUS = 128
```

Menu-item flag used to highlight the item only while it has focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L63)

<a id="constant-constant-mq3-client-ui-local-qmf-inactive-const-qmf-inactive-16384-src-mq3-client-ui-local-ml-2064438323"></a>
### QMF_INACTIVE

```ml
const QMF_INACTIVE = 16384
```

Menu-item flag used to exclude the item from interactive activation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L77)

<a id="constant-constant-mq3-client-ui-local-qmf-left-justify-const-qmf-left-justify-4-src-mq3-client-ui-local-ml-1681889857"></a>
### QMF_LEFT_JUSTIFY

```ml
const QMF_LEFT_JUSTIFY = 4
```

Menu-item flag used to align the item to the left of its horizontal anchor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L53)

<a id="constant-constant-mq3-client-ui-local-qmf-lowercase-const-qmf-lowercase-262144-src-mq3-client-ui-local-ml-620393864"></a>
### QMF_LOWERCASE

```ml
const QMF_LOWERCASE = 262144
```

Menu-item flag used to convert entered characters to lowercase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L85)

<a id="constant-constant-mq3-client-ui-local-qmf-mouseonly-const-qmf-mouseonly-2048-src-mq3-client-ui-local-ml-803365353"></a>
### QMF_MOUSEONLY

```ml
const QMF_MOUSEONLY = 2048
```

Menu-item flag used to allow selection through the pointer but skip keyboard navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L71)

<a id="constant-constant-mq3-client-ui-local-qmf-nodefaultinit-const-qmf-nodefaultinit-32768-src-mq3-client-ui-local-ml-1005007385"></a>
### QMF_NODEFAULTINIT

```ml
const QMF_NODEFAULTINIT = 32768
```

Menu-item flag used to preserve the item's caller-supplied initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L79)

<a id="constant-constant-mq3-client-ui-local-qmf-noonofftext-const-qmf-noonofftext-1024-src-mq3-client-ui-local-ml-1318134046"></a>
### QMF_NOONOFFTEXT

```ml
const QMF_NOONOFFTEXT = 1024
```

Menu-item flag used to suppress the ordinary on/off text for a radio button.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L69)

<a id="constant-constant-mq3-client-ui-local-qmf-numbersonly-const-qmf-numbersonly-32-src-mq3-client-ui-local-ml-1998408404"></a>
### QMF_NUMBERSONLY

```ml
const QMF_NUMBERSONLY = 32
```

Menu-item flag used to restrict editable text to numeric input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L59)

<a id="constant-constant-mq3-client-ui-local-qmf-ownerdraw-const-qmf-ownerdraw-65536-src-mq3-client-ui-local-ml-767128970"></a>
### QMF_OWNERDRAW

```ml
const QMF_OWNERDRAW = 65536
```

Menu-item flag used to delegate rendering to the item's owner-draw callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L81)

<a id="constant-constant-mq3-client-ui-local-qmf-pulse-const-qmf-pulse-131072-src-mq3-client-ui-local-ml-13930455"></a>
### QMF_PULSE

```ml
const QMF_PULSE = 131072
```

Menu-item flag used to animate the item's color or brightness with a pulse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L83)

<a id="constant-constant-mq3-client-ui-local-qmf-pulseiffocus-const-qmf-pulseiffocus-256-src-mq3-client-ui-local-ml-1229183858"></a>
### QMF_PULSEIFFOCUS

```ml
const QMF_PULSEIFFOCUS = 256
```

Menu-item flag used to pulse the item only while it has focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L65)

<a id="constant-constant-mq3-client-ui-local-qmf-right-justify-const-qmf-right-justify-16-src-mq3-client-ui-local-ml-67789290"></a>
### QMF_RIGHT_JUSTIFY

```ml
const QMF_RIGHT_JUSTIFY = 16
```

Menu-item flag used to align the item to the right of its horizontal anchor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L57)

<a id="constant-constant-mq3-client-ui-local-qmf-silent-const-qmf-silent-1048576-src-mq3-client-ui-local-ml-1684734032"></a>
### QMF_SILENT

```ml
const QMF_SILENT = 1048576
```

Menu-item flag used to suppress ordinary menu feedback sounds for this item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L89)

<a id="constant-constant-mq3-client-ui-local-qmf-smallfont-const-qmf-smallfont-2-src-mq3-client-ui-local-ml-961448639"></a>
### QMF_SMALLFONT

```ml
const QMF_SMALLFONT = 2
```

Menu-item flag used to draw the item's text with the small font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L51)

<a id="constant-constant-mq3-client-ui-local-qmf-uppercase-const-qmf-uppercase-524288-src-mq3-client-ui-local-ml-666445788"></a>
### QMF_UPPERCASE

```ml
const QMF_UPPERCASE = 524288
```

Menu-item flag used to convert entered characters to uppercase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L87)

<a id="constant-constant-mq3-client-ui-local-rcolumn-offset-const-rcolumn-offset-16-src-mq3-client-ui-local-ml-926378032"></a>
### RCOLUMN_OFFSET

```ml
const RCOLUMN_OFFSET = 16
```

Horizontal offset used to position the right-hand menu text column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L12)

<a id="constant-constant-mq3-client-ui-local-slider-range-const-slider-range-10-src-mq3-client-ui-local-ml-1942672456"></a>
### SLIDER_RANGE

```ml
const SLIDER_RANGE = 10
```

Logical step range used to map a menu slider between its minimum and maximum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L16)

<a id="function-function-mq3-client-ui-local-typenames-function-typenames-src-mq3-client-ui-local-ml-578436586"></a>
### typeNames

```ml
function typeNames()
```

Lists the type names catalog for UI local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L462)

<a id="constant-constant-mq3-client-ui-local-ui-api-version-const-ui-api-version-4-src-mq3-client-ui-local-ml-208582639"></a>
### UI_API_VERSION

```ml
const UI_API_VERSION = 4
```

UI virtual-machine interface version expected by the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L10)

- [mq3.client.ui_local.UIStatic](Type-mq3-client-ui-local-uistatic-82344535.md) — struct
