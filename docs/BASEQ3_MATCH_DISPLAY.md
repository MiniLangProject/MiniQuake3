# Baseq3 match display

`mq3.client.baseq3_match_display` is the rendering boundary for the retail
match text. It is independent of `playable_app.ml` and can be integrated by any
frame host that already owns the preview's texture slots and window renderer.

Load `gfx/2d/bigchars.tga` into one free slot and keep the returned `Media` for
the lifetime of the window:

```text
matchMedia = baseq3Match.load(archive, 216)
baseq3Match.upload(matchMedia)
```

The existing `mq3.client.baseq3_hud` catalog owns slots 217 through 255 and
contains the eleven retail number shaders. This leaves slot 216 for the
bigchars atlas without changing the status-HUD API or its slot budget.

During a frame, callers may use the individual entry points:

- `drawTimer(media, levelStartTime, now, width, height, y)` draws the Baseq3
  elapsed match clock, right-aligned to virtual x=635.
- `drawWarmup(media, gametypeName, warmupEnd, now, width, height)` draws the
  game type and the pulsing `Starts in: 3/2/1` sequence. Pass a negative
  `warmupEnd` for `Waiting for players`.
- `centerPrint(text, startedAt, y, charWidth, duration)` captures a persistent
  centerprint. `drawCenter(...)` centers every line and applies the retail
  200 ms end fade timing.
- `draw(...)` combines timer, warmup, and centerprint inputs when a host wants
  one call. The pure helpers `timerText`, `countdown`, `printLength`,
  `glyphCell`, and `centerAlpha` are available for state adaptation and tests.

Call `release(matchMedia)` before shutting down or replacing the native window.
The module deliberately has no dependency on `playable_match`; an integration
can translate that controller's `matchStart` to `levelStartTime`, its absolute
warmup end to `warmupEnd`, and its update message to a `CenterPrint` without
coupling either component.

Run the contracts and retail asset probe with:

```powershell
python scripts/test_baseq3_match_display.py --pak D:/Quake3/baseq3/pak0.pk3
```
