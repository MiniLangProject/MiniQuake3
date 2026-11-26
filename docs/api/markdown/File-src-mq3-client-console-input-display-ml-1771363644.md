# `src/mq3/client/console_input_display.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.console_input_display`](Package-mq3-client-console-input-display-416816460.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/baseq3_match_display.ml` as `font` → [src/mq3/client/baseq3_match_display.ml](File-src-mq3-client-baseq3-match-display-ml-1367704051.md)
- `mq3/client/console_input.ml` as `consoleState` → [src/mq3/client/console_input.ml](File-src-mq3-client-console-input-ml-896040399.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)

## Declarations

<a id="function-function-mq3-client-console-input-display-bounded-function-bounded-value-low-high-src-mq3-client-console-input-display-ml-1422794019"></a>
### bounded

```ml
function bounded(value, low, high)
```

Evaluates console input display `bounded` and returns `low`, `high`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<low`, `value>high` before the calculation continues. |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L33)

<a id="function-function-mq3-client-console-input-display-draw-function-draw-media-state-width-height-now-src-mq3-client-console-input-display-ml-2078644314"></a>
### draw

```ml
function draw(media, state, width, height, now)
```

Calls `mq3.client.console_input_display.present`, `mq3.compat.numeric.trunc32`, `mq3.platform.playable_window.drawLine` and additional helpers from console input display `draw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `drawn=font.drawString(media,view.text,view.x,view.y,8,16,scaleX,scaleY,255,255,255,true)`. |
| `state` | `dynamic` | — | Shared console input display state passed to the helper calls in `draw`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `draw`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L64)

<a id="function-function-mq3-client-console-input-display-fieldtext-function-fieldtext-edit-prompt-now-src-mq3-client-console-input-display-ml-1626068566"></a>
### fieldText

```ml
function fieldText(edit, prompt, now)
```

Calls `mq3.client.console_input_display.bounded`, `decode`, `slice` from console input display `fieldText`. The final path returns `prompt+visible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — | Record read through `edit.text`, `edit.scroll`, `edit.widthInChars`, `edit.cursor`. |
| `prompt` | `dynamic` | — | Value used by `return prompt+visible`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L38)

<a id="function-function-mq3-client-console-input-display-present-function-present-state-now-src-mq3-client-console-input-display-ml-1929212121"></a>
### present

```ml
function present(state, now)
```

Calls `mq3.client.console_input_display.Presentation`, `mq3.client.console_input_display.fieldText` from console input display `present`. The final path returns `Presentation(true,"message",fieldText(state.chat,prompt,now),8,448,438,472)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.catcher`, `state.console`, `state.chatPlayerNum`, `state.chatTeam` and additional values. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/console_input_display.ml#L49)

- [mq3.client.console_input_display.Presentation](Type-mq3-client-console-input-display-presentation-2062669794.md) — struct
