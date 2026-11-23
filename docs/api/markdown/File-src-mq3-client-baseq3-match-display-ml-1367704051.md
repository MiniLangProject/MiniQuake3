# `src/mq3/client/baseq3_match_display.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.baseq3_match_display`](Package-mq3-client-baseq3-match-display-1239213587.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cgame_scoreboard.ml` as `oldScoreboard` → [src/mq3/client/cgame_scoreboard.ml](File-src-mq3-client-cgame-scoreboard-ml-1090285247.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/playable_multitexture.ml` as `raster` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-baseq3-match-display-appendglyphcode-function-appendglyphcode-media-code-x-y-charwidth-charheight-scalex-scaley-red-green-blue-src-mq3-client-baseq3-match-display-ml-1357636912"></a>
### appendGlyphCode

```ml
function appendGlyphCode(media, code, x, y, charWidth, charHeight, scaleX, scaleY, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `charWidth` | `dynamic` | — |  |
| `charHeight` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L132)

<a id="function-function-mq3-client-baseq3-match-display-appendstring-function-appendstring-media-text-x-y-charwidth-charheight-scalex-scaley-red-green-blue-shadow-src-mq3-client-baseq3-match-display-ml-862085028"></a>
### appendString

```ml
function appendString(media, text, x, y, charWidth, charHeight, scaleX, scaleY, red, green, blue, shadow)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `charWidth` | `dynamic` | — |  |
| `charHeight` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `shadow` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L140)

<a id="constant-constant-mq3-client-baseq3-match-display-atlas-columns-const-atlas-columns-16-src-mq3-client-baseq3-match-display-ml-1885458646"></a>
### ATLAS_COLUMNS

```ml
const ATLAS_COLUMNS = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L18)

<a id="constant-constant-mq3-client-baseq3-match-display-atlas-rows-const-atlas-rows-16-src-mq3-client-baseq3-match-display-ml-1125046546"></a>
### ATLAS_ROWS

```ml
const ATLAS_ROWS = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L19)

<a id="function-function-mq3-client-baseq3-match-display-beginglyphbatch-function-beginglyphbatch-media-src-mq3-client-baseq3-match-display-ml-2022237590"></a>
### beginGlyphBatch

```ml
function beginGlyphBatch(media)
```

The original charset shader is SRC_ALPHA/ONE_MINUS_SRC_ALPHA, rgbGen vertex. Retain one stream for the complete console instead of setting GL state and submitting two individual draw calls for every visible character.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L117)

<a id="constant-constant-mq3-client-baseq3-match-display-bigchar-height-const-bigchar-height-16-src-mq3-client-baseq3-match-display-ml-2041359132"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L16)

<a id="constant-constant-mq3-client-baseq3-match-display-bigchar-width-const-bigchar-width-16-src-mq3-client-baseq3-match-display-ml-1042797670"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L15)

<a id="constant-constant-mq3-client-baseq3-match-display-center-default-duration-const-center-default-duration-3000-src-mq3-client-baseq3-match-display-ml-2129083506"></a>
### CENTER_DEFAULT_DURATION

```ml
const CENTER_DEFAULT_DURATION = 3000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L21)

<a id="constant-constant-mq3-client-baseq3-match-display-center-default-y-const-center-default-y-144-src-mq3-client-baseq3-match-display-ml-2054595632"></a>
### CENTER_DEFAULT_Y

```ml
const CENTER_DEFAULT_Y = 144
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L20)

<a id="function-function-mq3-client-baseq3-match-display-centeralpha-function-centeralpha-center-now-src-mq3-client-baseq3-match-display-ml-1018352969"></a>
### centerAlpha

```ml
function centerAlpha(center, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L192)

<a id="function-function-mq3-client-baseq3-match-display-centerprint-function-centerprint-text-startedat-y-charwidth-duration-src-mq3-client-baseq3-match-display-ml-464248312"></a>
### centerPrint

```ml
function centerPrint(text, startedAt, y, charWidth, duration)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `startedAt` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `charWidth` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L184)

- [mq3.client.baseq3_match_display.CenterPrint](Type-mq3-client-baseq3-match-display-centerprint-1937530893.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-colorfor-function-colorfor-code-src-mq3-client-baseq3-match-display-ml-1588965267"></a>
### colorFor

```ml
function colorFor(code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L72)

<a id="function-function-mq3-client-baseq3-match-display-countdown-function-countdown-warmupend-now-src-mq3-client-baseq3-match-display-ml-308750623"></a>
### countdown

```ml
function countdown(warmupEnd, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `warmupEnd` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L174)

- [mq3.client.baseq3_match_display.Countdown](Type-mq3-client-baseq3-match-display-countdown-851695878.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-draw-function-draw-media-width-height-levelstarttime-now-showtimer-gametypename-warmupend-center-src-mq3-client-baseq3-match-display-ml-497197725"></a>
### draw

```ml
function draw(media, width, height, levelStartTime, now, showTimer, gametypeName, warmupEnd, center)
```

Integration entry point. The caller owns timing and can pass void for center.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `levelStartTime` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `showTimer` | `dynamic` | — |  |
| `gametypeName` | `dynamic` | — |  |
| `warmupEnd` | `dynamic` | — |  |
| `center` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L258)

<a id="function-function-mq3-client-baseq3-match-display-drawcenter-function-drawcenter-media-center-now-width-height-src-mq3-client-baseq3-match-display-ml-546543038"></a>
### drawCenter

```ml
function drawCenter(media, center, now, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `center` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L220)

<a id="function-function-mq3-client-baseq3-match-display-drawglyph-function-drawglyph-media-character-x-y-charwidth-charheight-scalex-scaley-red-green-blue-src-mq3-client-baseq3-match-display-ml-1283183750"></a>
### drawGlyph

```ml
function drawGlyph(media, character, x, y, charWidth, charHeight, scaleX, scaleY, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `character` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `charWidth` | `dynamic` | — |  |
| `charHeight` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L84)

<a id="function-function-mq3-client-baseq3-match-display-drawscoreboard-function-drawscoreboard-media-width-height-playerscore-enemyscore-playerdeaths-src-mq3-client-baseq3-match-display-ml-1946731072"></a>
### drawScoreboard

```ml
function drawScoreboard(media, width, height, playerScore, enemyScore, playerDeaths)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `playerScore` | `dynamic` | — |  |
| `enemyScore` | `dynamic` | — |  |
| `playerDeaths` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L241)

<a id="function-function-mq3-client-baseq3-match-display-drawstring-function-drawstring-media-text-x-y-charwidth-charheight-scalex-scaley-red-green-blue-shadow-src-mq3-client-baseq3-match-display-ml-1797250380"></a>
### drawString

```ml
function drawString(media, text, x, y, charWidth, charHeight, scaleX, scaleY, red, green, blue, shadow)
```

Matches CG_DrawStringExt: color escapes consume no cell and every glyph gets the two-pixel black shadow used by the original HUD.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `charWidth` | `dynamic` | — |  |
| `charHeight` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `shadow` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L96)

<a id="function-function-mq3-client-baseq3-match-display-drawtimer-function-drawtimer-media-levelstarttime-now-width-height-y-src-mq3-client-baseq3-match-display-ml-595394323"></a>
### drawTimer

```ml
function drawTimer(media, levelStartTime, now, width, height, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `levelStartTime` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L199)

<a id="function-function-mq3-client-baseq3-match-display-drawwarmup-function-drawwarmup-media-gametypename-warmupend-now-width-height-src-mq3-client-baseq3-match-display-ml-1307049247"></a>
### drawWarmup

```ml
function drawWarmup(media, gametypeName, warmupEnd, now, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `gametypeName` | `dynamic` | — |  |
| `warmupEnd` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L205)

<a id="constant-constant-mq3-client-baseq3-match-display-fade-time-const-fade-time-200-src-mq3-client-baseq3-match-display-ml-1493585843"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L22)

<a id="function-function-mq3-client-baseq3-match-display-fail-function-fail-message-src-mq3-client-baseq3-match-display-ml-588079187"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L30)

<a id="function-function-mq3-client-baseq3-match-display-flushglyphbatch-function-flushglyphbatch-media-src-mq3-client-baseq3-match-display-ml-1153633068"></a>
### flushGlyphBatch

```ml
function flushGlyphBatch(media)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L157)

<a id="constant-constant-mq3-client-baseq3-match-display-giant-width-const-giant-width-32-src-mq3-client-baseq3-match-display-ml-716873652"></a>
### GIANT_WIDTH

```ml
const GIANT_WIDTH = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L17)

<a id="function-function-mq3-client-baseq3-match-display-glyphcell-function-glyphcell-character-src-mq3-client-baseq3-match-display-ml-808247099"></a>
### glyphCell

```ml
function glyphCell(character)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L54)

<a id="function-function-mq3-client-baseq3-match-display-glyphchannel-function-glyphchannel-value-src-mq3-client-baseq3-match-display-ml-517384461"></a>
### glyphChannel

```ml
function glyphChannel(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L131)

<a id="function-function-mq3-client-baseq3-match-display-iscolorescape-function-iscolorescape-text-index-src-mq3-client-baseq3-match-display-ml-500789197"></a>
### isColorEscape

```ml
function isColorEscape(text, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L60)

<a id="function-function-mq3-client-baseq3-match-display-linecount-function-linecount-text-src-mq3-client-baseq3-match-display-ml-1186399839"></a>
### lineCount

```ml
function lineCount(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L182)

<a id="function-function-mq3-client-baseq3-match-display-load-function-load-archive-textureslot-src-mq3-client-baseq3-match-display-ml-1639438747"></a>
### load

```ml
function load(archive, textureSlot)
```

cgs.media.charsetShader is registered from this exact retail shader name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L33)

- [mq3.client.baseq3_match_display.Media](Type-mq3-client-baseq3-match-display-media-285686009.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-point-function-point-x-y-src-mq3-client-baseq3-match-display-ml-1606425021"></a>
### point

```ml
function point(x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L52)

- [mq3.client.baseq3_match_display.Point](Type-mq3-client-baseq3-match-display-point-1995949791.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-printlength-function-printlength-text-src-mq3-client-baseq3-match-display-ml-1431851415"></a>
### printLength

```ml
function printLength(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L64)

<a id="function-function-mq3-client-baseq3-match-display-release-function-release-media-src-mq3-client-baseq3-match-display-ml-26205454"></a>
### release

```ml
function release(media)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L50)

<a id="function-function-mq3-client-baseq3-match-display-reserveglyphbatch-function-reserveglyphbatch-media-src-mq3-client-baseq3-match-display-ml-1550498600"></a>
### reserveGlyphBatch

```ml
function reserveGlyphBatch(media)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L122)

- [mq3.client.baseq3_match_display.ScoreRow](Type-mq3-client-baseq3-match-display-scorerow-843654465.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-scorerows-function-scorerows-playerscore-enemyscore-playerdeaths-src-mq3-client-baseq3-match-display-ml-1572668803"></a>
### scoreRows

```ml
function scoreRows(playerScore, enemyScore, playerDeaths)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playerScore` | `dynamic` | — |  |
| `enemyScore` | `dynamic` | — |  |
| `playerDeaths` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L233)

<a id="function-function-mq3-client-baseq3-match-display-timertext-function-timertext-levelstarttime-now-src-mq3-client-baseq3-match-display-ml-1535337089"></a>
### timerText

```ml
function timerText(levelStartTime, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `levelStartTime` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L167)

<a id="function-function-mq3-client-baseq3-match-display-upload-function-upload-media-src-mq3-client-baseq3-match-display-ml-1202689164"></a>
### upload

```ml
function upload(media)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L44)

<a id="constant-constant-mq3-client-baseq3-match-display-virtual-height-const-virtual-height-480-src-mq3-client-baseq3-match-display-ml-1669118961"></a>
### VIRTUAL_HEIGHT

```ml
const VIRTUAL_HEIGHT = 480.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L14)

<a id="constant-constant-mq3-client-baseq3-match-display-virtual-width-const-virtual-width-640-src-mq3-client-baseq3-match-display-ml-1097217783"></a>
### VIRTUAL_WIDTH

```ml
const VIRTUAL_WIDTH = 640.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L13)
