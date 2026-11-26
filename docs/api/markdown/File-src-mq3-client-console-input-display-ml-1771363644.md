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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `high` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input_display.ml#L13)

<a id="function-function-mq3-client-console-input-display-draw-function-draw-media-state-width-height-now-src-mq3-client-console-input-display-ml-2078644314"></a>
### draw

```ml
function draw(media, state, width, height, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input_display.ml#L31)

<a id="function-function-mq3-client-console-input-display-fieldtext-function-fieldtext-edit-prompt-now-src-mq3-client-console-input-display-ml-1626068566"></a>
### fieldText

```ml
function fieldText(edit, prompt, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — |  |
| `prompt` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input_display.ml#L14)

<a id="function-function-mq3-client-console-input-display-present-function-present-state-now-src-mq3-client-console-input-display-ml-1929212121"></a>
### present

```ml
function present(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input_display.ml#L22)

- [mq3.client.console_input_display.Presentation](Type-mq3-client-console-input-display-presentation-2062669794.md) — struct
