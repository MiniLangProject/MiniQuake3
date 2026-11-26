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
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-baseq3-match-display-appendglyphcode-function-appendglyphcode-media-code-x-y-charwidth-charheight-scalex-scaley-red-green-blue-src-mq3-client-baseq3-match-display-ml-1357636912"></a>
### appendGlyphCode

```ml
function appendGlyphCode(media, code, x, y, charWidth, charHeight, scaleX, scaleY, red, green, blue)
```

Calls `mq3.client.baseq3_match_display.reserveGlyphBatch`, `mq3.platform.playable_window.writeScreenRect`, `mq3.client.baseq3_match_display.glyphChannel` from base Quake III match display `appendGlyphCode`. The final path returns `written`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Record read through `media.slot`. |
| `code` | `dynamic` | — | Value used by `code=code&255`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `appendGlyphCode`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `appendGlyphCode`. |
| `charWidth` | `dynamic` | — | Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`. |
| `charHeight` | `dynamic` | — | Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`. |
| `scaleX` | `dynamic` | — | Value used by `written=window.writeScreenRect(batch,at,media.slot,x,y,charWidth,charHeight,u0,v0,u0+0.0625,v0+0.0625,scaleX,scaleY,[glyphChannel(red),glyphCh...`. |
| `scaleY` | `dynamic` | — | Value used by `written=window.writeScreenRect(batch,at,media.slot,x,y,charWidth,charHeight,u0,v0,u0+0.0625,v0+0.0625,scaleX,scaleY,[glyphChannel(red),glyphCh...`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L265)

<a id="function-function-mq3-client-baseq3-match-display-appendstring-function-appendstring-media-text-x-y-charwidth-charheight-scalex-scaley-red-green-blue-shadow-src-mq3-client-baseq3-match-display-ml-862085028"></a>
### appendString

```ml
function appendString(media, text, x, y, charWidth, charHeight, scaleX, scaleY, red, green, blue, shadow)
```

Calls `mq3.client.baseq3_match_display.isColorEscape`, `mq3.client.baseq3_match_display.appendGlyphCode`, `mq3.client.baseq3_match_display.colorFor` from base Quake III match display `appendString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `if media==void then return fail("media is required") end if`. |
| `text` | `dynamic` | — | Sequence read at `text[index]`, `text[index+1]`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `appendString`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `appendString`. |
| `charWidth` | `dynamic` | — | Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`. |
| `charHeight` | `dynamic` | — | Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`. |
| `scaleX` | `dynamic` | — | Value used by `else written=appendGlyphCode(media,bytes(text[index])[0],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0)`. |
| `scaleY` | `dynamic` | — | Value used by `else written=appendGlyphCode(media,bytes(text[index])[0],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0)`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |
| `shadow` | `dynamic` | — | Value used by `if shadow then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L286)

<a id="constant-constant-mq3-client-baseq3-match-display-atlas-columns-const-atlas-columns-16-src-mq3-client-baseq3-match-display-ml-1885458646"></a>
### ATLAS_COLUMNS

```ml
const ATLAS_COLUMNS = 16
```

Number of glyph columns in the character-image atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L24)

<a id="constant-constant-mq3-client-baseq3-match-display-atlas-rows-const-atlas-rows-16-src-mq3-client-baseq3-match-display-ml-1125046546"></a>
### ATLAS_ROWS

```ml
const ATLAS_ROWS = 16
```

Number of glyph rows in the character-image atlas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L26)

<a id="function-function-mq3-client-baseq3-match-display-beginglyphbatch-function-beginglyphbatch-media-src-mq3-client-baseq3-match-display-ml-2022237590"></a>
### beginGlyphBatch

```ml
function beginGlyphBatch(media)
```

The original charset shader is SRC_ALPHA/ONE_MINUS_SRC_ALPHA, rgbGen vertex. Retain one stream for the complete console instead of setting GL state and submitting two individual draw calls for every visible character.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Mutable base Quake III match display record/storage; this routine assigns `media.glyphBatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L234)

<a id="constant-constant-mq3-client-baseq3-match-display-bigchar-height-const-bigchar-height-16-src-mq3-client-baseq3-match-display-ml-2041359132"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```

Bigchar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L20)

<a id="constant-constant-mq3-client-baseq3-match-display-bigchar-width-const-bigchar-width-16-src-mq3-client-baseq3-match-display-ml-1042797670"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```

Bigchar font metric controlling width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L18)

<a id="constant-constant-mq3-client-baseq3-match-display-center-default-duration-const-center-default-duration-3000-src-mq3-client-baseq3-match-display-ml-2129083506"></a>
### CENTER_DEFAULT_DURATION

```ml
const CENTER_DEFAULT_DURATION = 3000
```

Default lifetime in milliseconds of a centered announcement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L30)

<a id="constant-constant-mq3-client-baseq3-match-display-center-default-y-const-center-default-y-144-src-mq3-client-baseq3-match-display-ml-2054595632"></a>
### CENTER_DEFAULT_Y

```ml
const CENTER_DEFAULT_Y = 144
```

Default virtual-screen Y coordinate for centered announcements.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L28)

<a id="function-function-mq3-client-baseq3-match-display-centeralpha-function-centeralpha-center-now-src-mq3-client-baseq3-match-display-ml-1018352969"></a>
### centerAlpha

```ml
function centerAlpha(center, now)
```

Calls `mq3.compat.numeric.trunc32` from base Quake III match display `centerAlpha`. The final path returns `255`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | `dynamic` | — | Record read through `center.startedAt`, `center.duration`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L357)

<a id="function-function-mq3-client-baseq3-match-display-centerprint-function-centerprint-text-startedat-y-charwidth-duration-src-mq3-client-baseq3-match-display-ml-464248312"></a>
### centerPrint

```ml
function centerPrint(text, startedAt, y, charWidth, duration)
```

Calls `mq3.client.baseq3_match_display.CenterPrint`, `mq3.client.baseq3_match_display.lineCount` from base Quake III match display `centerPrint`. The final path returns `CenterPrint(text,startedAt,y,charWidth,duration,lineCount(text))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `centerPrint` in the base Quake III match display path. |
| `startedAt` | `dynamic` | — | Value used by `if typeof(text)!="string" or startedAt<0 then return fail("text and non-negative start time required") end if`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `centerPrint`. |
| `charWidth` | `dynamic` | — | Value used by `if charWidth<=0 then charWidth=BIGCHAR_WIDTH end if`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L346)

- [mq3.client.baseq3_match_display.CenterPrint](Type-mq3-client-baseq3-match-display-centerprint-1937530893.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-colorfor-function-colorfor-code-src-mq3-client-baseq3-match-display-ml-1588965267"></a>
### colorFor

```ml
function colorFor(code)
```

Evaluates base Quake III match display `colorFor` and returns `[0,0,0]`, `[255,0,0]`, `[0,255,0]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Value used by `index=(bytes(code)[0]-48)&7`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L164)

<a id="function-function-mq3-client-baseq3-match-display-countdown-function-countdown-warmupend-now-src-mq3-client-baseq3-match-display-ml-308750623"></a>
### countdown

```ml
function countdown(warmupEnd, now)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.baseq3_match_display.Countdown` from base Quake III match display `countdown`. The final path returns `Countdown("Starts in: "+str(second+1),charWidth,numeric.trunc32(charWidth*1.5),second)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `warmupEnd` | `dynamic` | — | Value used by `if warmupEnd<=0 or now>warmupEnd then return void end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L328)

- [mq3.client.baseq3_match_display.Countdown](Type-mq3-client-baseq3-match-display-countdown-851695878.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-draw-function-draw-media-width-height-levelstarttime-now-showtimer-gametypename-warmupend-center-src-mq3-client-baseq3-match-display-ml-497197725"></a>
### draw

```ml
function draw(media, width, height, levelStartTime, now, showTimer, gametypeName, warmupEnd, center)
```

Integration entry point. The caller owns timing and can pass void for center.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `if media==void or width<320 or height<240 then return fail("media and a 320x240 surface are required") end if`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `draw`. |
| `levelStartTime` | `dynamic` | — | Value used by `if showTimer then drawTimer(media,levelStartTime,now,width,height,0) end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `showTimer` | `dynamic` | — | Value used by `if showTimer then drawTimer(media,levelStartTime,now,width,height,0) end if`. |
| `gametypeName` | `dynamic` | — | Value used by `if warmupEnd!=0 then drawWarmup(media,gametypeName,warmupEnd,now,width,height) end if`. |
| `warmupEnd` | `dynamic` | — | Value used by `if warmupEnd!=0 then drawWarmup(media,gametypeName,warmupEnd,now,width,height) end if`. |
| `center` | `dynamic` | — | Value used by `if center!=void then drawCenter(media,center,now,width,height) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L463)

<a id="function-function-mq3-client-baseq3-match-display-drawcenter-function-drawcenter-media-center-now-width-height-src-mq3-client-baseq3-match-display-ml-546543038"></a>
### drawCenter

```ml
function drawCenter(media, center, now, width, height)
```

Calls `mq3.client.baseq3_match_display.centerAlpha`, `std.string.split`, `slice` and additional helpers from base Quake III match display `drawCenter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `drawString(media,text,x,y,center.charWidth,numeric.trunc32(center.charWidth*1.5),scaleX,scaleY,alpha,alpha,alpha,true)`. |
| `center` | `dynamic` | — | Record read through `center.text`, `center.y`, `center.lines`, `center.charWidth`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawCenter`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawCenter`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L405)

<a id="function-function-mq3-client-baseq3-match-display-drawglyph-function-drawglyph-media-character-x-y-charwidth-charheight-scalex-scaley-red-green-blue-src-mq3-client-baseq3-match-display-ml-1283183750"></a>
### drawGlyph

```ml
function drawGlyph(media, character, x, y, charWidth, charHeight, scaleX, scaleY, red, green, blue)
```

Calls `mq3.client.baseq3_match_display.glyphCell`, `mq3.client.baseq3_match_display.point`, `mq3.platform.playable_window.drawTriangle` from base Quake III match display `drawGlyph`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Record read through `media.slot`. |
| `character` | `dynamic` | — | Value used by `if character==" " then return void end if`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawGlyph`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawGlyph`. |
| `charWidth` | `dynamic` | — | Value used by `right=(x+charWidth)*scaleX`. |
| `charHeight` | `dynamic` | — | Value used by `bottom=(y+charHeight)*scaleY`. |
| `scaleX` | `dynamic` | — | Value used by `left=x*scaleX`. |
| `scaleY` | `dynamic` | — | Value used by `top=y*scaleY`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L188)

<a id="function-function-mq3-client-baseq3-match-display-drawscoreboard-function-drawscoreboard-media-width-height-playerscore-enemyscore-playerdeaths-src-mq3-client-baseq3-match-display-ml-1946731072"></a>
### drawScoreboard

```ml
function drawScoreboard(media, width, height, playerScore, enemyScore, playerDeaths)
```

Calls `mq3.client.baseq3_match_display.scoreRows`, `mq3.client.cgame_scoreboard.state`, `mq3.client.cgame_scoreboard.client` and additional helpers from base Quake III match display `drawScoreboard`. The final path returns `len(state.scores)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `if media==void or width<320 or height<240 then return fail("media and a 320x240 surface are required") end if`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawScoreboard`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawScoreboard`. |
| `playerScore` | `dynamic` | — | Value assigned to `state.playerScore`, `you.score`. |
| `enemyScore` | `dynamic` | — | Value assigned to `enemy.score`. |
| `playerDeaths` | `dynamic` | — | Value used by `rows=scoreRows(playerScore,enemyScore,playerDeaths)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L437)

<a id="function-function-mq3-client-baseq3-match-display-drawstring-function-drawstring-media-text-x-y-charwidth-charheight-scalex-scaley-red-green-blue-shadow-src-mq3-client-baseq3-match-display-ml-1797250380"></a>
### drawString

```ml
function drawString(media, text, x, y, charWidth, charHeight, scaleX, scaleY, red, green, blue, shadow)
```

Matches CG_DrawStringExt: color escapes consume no cell and every glyph gets the two-pixel black shadow used by the original HUD.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `if media==void then return fail("media is required") end if`. |
| `text` | `dynamic` | — | Sequence read at `text[index]`, `text[index+1]`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawString`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawString`. |
| `charWidth` | `dynamic` | — | Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`. |
| `charHeight` | `dynamic` | — | Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`. |
| `scaleX` | `dynamic` | — | Value used by `else drawGlyph(media,text[index],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0)`. |
| `scaleY` | `dynamic` | — | Value used by `else drawGlyph(media,text[index],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0)`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |
| `shadow` | `dynamic` | — | Value used by `if shadow then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L212)

<a id="function-function-mq3-client-baseq3-match-display-drawtimer-function-drawtimer-media-levelstarttime-now-width-height-y-src-mq3-client-baseq3-match-display-ml-595394323"></a>
### drawTimer

```ml
function drawTimer(media, levelStartTime, now, width, height, y)
```

Calls `mq3.client.baseq3_match_display.timerText`, `mq3.client.baseq3_match_display.printLength`, `mq3.client.baseq3_match_display.drawString` from base Quake III match display `drawTimer`. The final path returns `drawString(media,text,x,y+2,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,scaleX,scaleY,255,255,255,true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `return drawString(media,text,x,y+2,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,scaleX,scaleY,255,255,255,true)`. |
| `levelStartTime` | `dynamic` | — | Value used by `text=timerText(levelStartTime,now)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawTimer`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawTimer`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawTimer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L371)

<a id="function-function-mq3-client-baseq3-match-display-drawwarmup-function-drawwarmup-media-gametypename-warmupend-now-width-height-src-mq3-client-baseq3-match-display-ml-1307049247"></a>
### drawWarmup

```ml
function drawWarmup(media, gametypeName, warmupEnd, now, width, height)
```

Calls `mq3.client.baseq3_match_display.printLength`, `mq3.client.baseq3_match_display.drawString`, `mq3.client.baseq3_match_display.countdown` and additional helpers from base Quake III match display `drawWarmup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `return drawString(media,text,x,24,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,width/VIRTUAL_WIDTH,height/VIRTUAL_HEIGHT,255,255,255,true)`. |
| `gametypeName` | `dynamic` | — | Value used by `if gametypeName!="" then`. |
| `warmupEnd` | `dynamic` | — | Value used by `if warmupEnd<0 then`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawWarmup`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawWarmup`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L384)

<a id="constant-constant-mq3-client-baseq3-match-display-fade-time-const-fade-time-200-src-mq3-client-baseq3-match-display-ml-1493585843"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```

Duration in milliseconds of the standard CGame presentation fade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L32)

<a id="function-function-mq3-client-baseq3-match-display-fail-function-fail-message-src-mq3-client-baseq3-match-display-ml-588079187"></a>
### fail

```ml
function fail(message)
```

Creates the base Quake III match display error `7583` with diagnostic text `"Baseq3 match display: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"Baseq3 match display: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L104)

<a id="function-function-mq3-client-baseq3-match-display-flushglyphbatch-function-flushglyphbatch-media-src-mq3-client-baseq3-match-display-ml-1153633068"></a>
### flushGlyphBatch

```ml
function flushGlyphBatch(media)
```

Calls `mq3.platform.playable_multitexture.setState`, `mq3.platform.playable_multitexture.setAlphaTest`, `mq3.platform.playable_multitexture.setTextureClamp` and additional helpers from base Quake III match display `flushGlyphBatch`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Record read through `media.glyphBatch`, `media.glyphBatch.count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L305)

<a id="constant-constant-mq3-client-baseq3-match-display-giant-width-const-giant-width-32-src-mq3-client-baseq3-match-display-ml-716873652"></a>
### GIANT_WIDTH

```ml
const GIANT_WIDTH = 32
```

Width of a giant-font character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L22)

<a id="function-function-mq3-client-baseq3-match-display-glyphcell-function-glyphcell-character-src-mq3-client-baseq3-match-display-ml-808247099"></a>
### glyphCell

```ml
function glyphCell(character)
```

Evaluates base Quake III match display `glyphCell` and returns `fail("glyph must be one character")`, `[code&15,code>>4]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | `dynamic` | — | Sequence whose length/content is inspected by `glyphCell`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L139)

<a id="function-function-mq3-client-baseq3-match-display-glyphchannel-function-glyphchannel-value-src-mq3-client-baseq3-match-display-ml-517384461"></a>
### glyphChannel

```ml
function glyphChannel(value)
```

Evaluates base Quake III match display `glyphChannel` and returns `0`, `255`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0`, `value>255` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L252)

<a id="function-function-mq3-client-baseq3-match-display-iscolorescape-function-iscolorescape-text-index-src-mq3-client-baseq3-match-display-ml-500789197"></a>
### isColorEscape

```ml
function isColorEscape(text, index)
```

Computes `index+1<len(text) and text[index]=="^" and text[index+1]!="^"` for base Quake III match display `isColorEscape`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Sequence read at `text[index]`, `text[index+1]`. |
| `index` | `dynamic` | — | Value used by `return index+1<len(text) and text[index]=="^" and text[index+1]!="^"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L148)

<a id="function-function-mq3-client-baseq3-match-display-linecount-function-linecount-text-src-mq3-client-baseq3-match-display-ml-1186399839"></a>
### lineCount

```ml
function lineCount(text)
```

Returns the element/byte count of `strings.split(text,"\n")` for base Quake III match display `lineCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 of `len`; passed as `strings.split(text,"\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L338)

<a id="function-function-mq3-client-baseq3-match-display-load-function-load-archive-textureslot-src-mq3-client-baseq3-match-display-ml-1639438747"></a>
### load

```ml
function load(archive, textureSlot)
```

cgs.media.charsetShader is registered from this exact retail shader name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `textureSlot` | `dynamic` | — | Value used by `if textureSlot<0 or textureSlot>=window.NATIVE_TEXTURE_SLOTS then return fail("texture slot outside native range") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L109)

- [mq3.client.baseq3_match_display.Media](Type-mq3-client-baseq3-match-display-media-285686009.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-point-function-point-x-y-src-mq3-client-baseq3-match-display-ml-1606425021"></a>
### point

```ml
function point(x, y)
```

Creates a `mq3.client.baseq3_match_display.Point` record. Assigns `x` from `x`, `y` from `y`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Value used to initialize `Point.x`. |
| `y` | `dynamic` | — | Value used to initialize `Point.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L135)

- [mq3.client.baseq3_match_display.Point](Type-mq3-client-baseq3-match-display-point-1995949791.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-printlength-function-printlength-text-src-mq3-client-baseq3-match-display-ml-1431851415"></a>
### printLength

```ml
function printLength(text)
```

Calls `mq3.client.baseq3_match_display.isColorEscape` from base Quake III match display `printLength`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text whose length/content is inspected by `printLength`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L154)

<a id="function-function-mq3-client-baseq3-match-display-release-function-release-media-src-mq3-client-baseq3-match-display-ml-26205454"></a>
### release

```ml
function release(media)
```

Calls `mq3.platform.playable_window.releaseTexture` from base Quake III match display `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Record read through `media.slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L130)

<a id="function-function-mq3-client-baseq3-match-display-reserveglyphbatch-function-reserveglyphbatch-media-src-mq3-client-baseq3-match-display-ml-1550498600"></a>
### reserveGlyphBatch

```ml
function reserveGlyphBatch(media)
```

Updates `media.glyphBatch` during base Quake III match display `reserveGlyphBatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Mutable base Quake III match display record/storage; this routine assigns `media.glyphBatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L241)

- [mq3.client.baseq3_match_display.ScoreRow](Type-mq3-client-baseq3-match-display-scorerow-843654465.md) — struct
<a id="function-function-mq3-client-baseq3-match-display-scorerows-function-scorerows-playerscore-enemyscore-playerdeaths-src-mq3-client-baseq3-match-display-ml-1572668803"></a>
### scoreRows

```ml
function scoreRows(playerScore, enemyScore, playerDeaths)
```

Calls `mq3.client.baseq3_match_display.ScoreRow` from base Quake III match display `scoreRows`. The final path returns `[player,enemies]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playerScore` | `dynamic` | — | Value used by `if playerScore<0 or enemyScore<0 or playerDeaths<0 then return fail("non-negative scoreboard values required") end if`. |
| `enemyScore` | `dynamic` | — | Value used by `if playerScore<0 or enemyScore<0 or playerDeaths<0 then return fail("non-negative scoreboard values required") end if`. |
| `playerDeaths` | `dynamic` | — | Value used by `if playerScore<0 or enemyScore<0 or playerDeaths<0 then return fail("non-negative scoreboard values required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L422)

<a id="function-function-mq3-client-baseq3-match-display-timertext-function-timertext-levelstarttime-now-src-mq3-client-baseq3-match-display-ml-1535337089"></a>
### timerText

```ml
function timerText(levelStartTime, now)
```

Calls `mq3.compat.numeric.trunc32` from base Quake III match display `timerText`. The final path returns `str(minutes)+":"+str(tens)+str(ones)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `levelStartTime` | `dynamic` | — | Value used by `elapsed=now-levelStartTime`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L318)

<a id="function-function-mq3-client-baseq3-match-display-upload-function-upload-media-src-mq3-client-baseq3-match-display-ml-1202689164"></a>
### upload

```ml
function upload(media)
```

Calls `mq3.platform.playable_window.uploadTextureNoMip` from base Quake III match display `upload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Record read through `media.slot`, `media.image.pixels`, `media.image.width`, `media.image.height` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L122)

<a id="constant-constant-mq3-client-baseq3-match-display-virtual-height-const-virtual-height-480-src-mq3-client-baseq3-match-display-ml-2022432549"></a>
### VIRTUAL_HEIGHT

```ml
const VIRTUAL_HEIGHT = 480
```

Height of the native UI's virtual coordinate space before scaling to the display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L16)

<a id="constant-constant-mq3-client-baseq3-match-display-virtual-width-const-virtual-width-640-src-mq3-client-baseq3-match-display-ml-1352128323"></a>
### VIRTUAL_WIDTH

```ml
const VIRTUAL_WIDTH = 640
```

Width of the native UI's virtual coordinate space before scaling to the display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/baseq3_match_display.ml#L14)
