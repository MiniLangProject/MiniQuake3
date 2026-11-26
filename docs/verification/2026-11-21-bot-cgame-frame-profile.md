# Retail Cgame, bot and portal frame profile

The tests use the RTX 5080 hardware OpenGL renderer at 1280×720 on a Ryzen 9
9900X, with Retail q3dm0, the original QVMs and Crash in single-player.
The fixed-step comparison uses 2,200 frames at 20 ms of simulated time per
frame. A separate 6,000-frame replay uses real-time simulation steps.

## CPU attribution at 9193252

The native diagnostic now records VM entry points and trap wall time per
slow frame and reads out the full replay totals once at the end. The optional
thread-cycle probe covers phases outside the VMs. Native QVM time excludes
host callbacks. Host time includes the managed VM bridge and any nested
invocation, so nested entry times can overlap. Both probes are opt-in.

`CG_DRAW_ACTIVE_FRAME` used 17.82 s in host calls and 1.19 s in native QVM
execution across 2,200 frames. The three largest Cgame traps were transformed
box traces (7.60 s), world box traces (4.00 s) and impact mark fragments
(1.27 s). `GAME_CLIENT_THINK` used 4.77 s of host time. Qagame's world trace
trap accounted for 5.53 s across all Qagame entry points.

`BOTAI_START_FRAME` on frame 613 took 82.65 ms of host time and 0.60 ms of
native dispatch. The same frame took 107 ms overall. Total host time for
`BotFindMatch` was 40.11 ms, `BotChooseLTGItem` used 28.95 ms, the nearby
item picker used 4.84 ms and `BotMoveToGoal` used 4.13 ms. The early item
placement update was a separate 30.88 ms trap on frame 18. On frame 2178,
`AAS_PredictRoute` used 48.66 ms of the 83 ms frame.

A fresh real-time run with phase profiling on the baseline observed a series
of slow frames near frame 4,125. Portal preparation used 17–48 ms on seven
consecutive frames with unchanged scene textures. The longest baseline
frame in that run was 141 ms. The earlier 51.9 FPS run followed a different
simulation trajectory, as can happen with real-time steps.

## Changes

- Load `match.c` during `BotLibSetup` as in the original `BotSetupChatAI`.
  The match-template parser uses a growable list and preserves template order.
- Use the weighted route time directly for same-cluster item scoring. Portal
  routes keep their existing results. A single source search supplies cold
  item candidates for the long-term and nearby item selectors. Prediction
  reuses weighted destination
  costs and sends ties to the same forward search as before. The route leg
  distance is computed in one strictly rounded binary32 call.
- Reuse collision-visit stamps for brushes and patch surfaces. The generation
  resets the marks at wraparound and temporary box/capsule traces bypass them.
- Cache the parsed AAS nodes and planes visited during point queries. Item
  placement skips duplicate zero-spread candidate points. The first item
  update on q3dm0 took 25.2 ms before and 5.2 ms after in the focused probe.
  Its 37 item-placement results matched across q3dm0 and q3dm1.
- Use contiguous growth for clipped portal triangle lists. Reuse the static
  world batch for the same ordered BSP face/LOD selection and clip plane.
  The per-frame view, shader clock and dynamic lights still reach drawing.
- Decode the images of player skins registered by Cgame during match
  initialization, following original skin registration, while leaving
  texture slots and binding order under the scene renderer. The Retail
  cache probe checks both Crash images and their environment map.

## Fixed-step profiling results

| Measurement | `9193252` | Updated |
| --- | ---: | ---: |
| FPS with both probes enabled | 46.63 | 78.38 |
| Frame work p50 / p95 / p99 | 19 / 43 / 53 ms | 11 / 24 / 33 ms |
| Longest frame | 107 ms | 40 ms |
| Frame 613 work | 107 ms | 25 ms |
| Frame 613 bot entry host time | 82.65 ms | 12.05 ms |
| Frame 613 long-term item selection | 28.95 ms | 2.41 ms |
| Cgame draw entry host time over the run | 17.82 s | 6.77 s |
| Qagame client-think entry host time over the run | 4.77 s | 1.89 s |

The updated profile was collected before the temporary hull compatibility
fix described below. Both runs performed 880 server ticks and recorded 533 position changes,
1,150 attack commands and 100 ammo decreases. Cgame and Qagame averaged
15.36 and 10.06 million main-thread cycles per frame, down from 37.39 and
20.53 million respectively. The chat match trap on frame 613 fell below
0.25 ms, the slow-frame trap reporting threshold. The viewport at the end
of both runs contained 607 scene triangles. Correcting local serverinfo
also restored the single-player HUD and its registered sound set.

## Real-time result on the final build

| Measurement | Previous 6,000-frame run | Updated |
| --- | ---: | ---: |
| Average FPS | 51.88 | 83.57 |
| Work p50 / p95 / p99 | 16 / 40 / 65 ms | 10 / 24 / 33 ms |
| Longest frame | 107 ms | 54 ms |

The updated run completed all 6,000 frames using real-time steps, with
1,000 position changes, 3,000 attack commands and 149 ammo decreases.
Average simulation work was 5.52 ms per frame, including 3.63 ms for Cgame
and 1.88 ms for game and client input. The differing real-time trajectories
produce different work mixes. This run did not enter a portal view. The
separate clipping and cache tests cover that path.

## Console and scoreboard

The physical console key on scan code `0x29` dropped the match to the menu.
The retained Cgame loop exposed the precise error `Struct has no member
'uvMods'`. The console background now converts both original shader stages
to the same runtime representation as the material renderer. The physical
console key also skips Windows character translation so a German caret can
open the prompt without inserting itself or arming composition on the
following key.

On Tab the original Cgame drew the scoreboard headings and printed
`Bad score->client` for clients 0 and 1. The local host had left
`CS_SERVERINFO` empty. The match now serializes its server cvars before
Cgame initialization so `CG_ParseServerinfo` sees the actual client limit
and match rules. Network and demo gamestates enter through their own path.

The packaged GUI test opened and closed the console twice while q3dm0
continued, ran two console commands and checked the saved settings. The
scoreboard was checked on the RTX 5080 with an actual Tab press and release.
The headless Retail test checks the original server's scores and Cgame's
scoreboard draw and client validation on both q3dm0 and q3dm1.

The framebuffer capture after q3dm0's original bot-spawn delay showed both
Sarge and Crash with numeric scores. The rebuilt Windows package also
passed menu and in-match resolution changes, Alt+Enter, Pure server join,
original demo playback, and switching to a local mod and back. Controls
also passed the 120-frame Retail q3dm1 hardware replay.

## Temporary collision hull regression

Two attempts at the longer replay uncovered an engine abort after about
1,000 frames. The temporary model had an inverted bound. Original
`CM_TempBoxModel` stores both bounds and face distances exactly as passed.
The port now does the same and preserves the existing trace input checks.
Differential tests cover stationary and swept transformed traces with an
inverted temporary hull.

## Regression checks

The collision microbenchmark used 50,624 q3dm0 trace requests with the same
checksum before and after, and improved from 3,469 to 2,110 ms. The portal
clip probe generated the same 8,193 output triangles from 8,192 inputs
in 7 ms, compared with 47 ms for the original port implementation. These
are isolated timings without gameplay rendering. The patch also passed
3,072 Retail point-area comparisons, the original AAS goal and route
reference checks, native QVM profiling contracts and inventory validation.

The live data source was the user's Retail archive in `build/baseq3`.
`D:/Quake3/baseq3` was unavailable. The frozen `verify.py` build stops at
`Frozen compiler input changed: build/mlc_win64.exe`. Builds and relevant
checks used the published MiniLang 1.3.9 toolchain.

## Commands

```powershell
python scripts/test_ingame_controls_render.py --data-root build --published-compiler --map q3dm0 --singleplayer --mode moving --frames 2200 --fixed-step-ms 20 --cpu-profile --qvm-profile --profile-frame 613 --label bot_cgame_fixed_after
python scripts/test_ingame_controls_render.py --data-root build --published-compiler --map q3dm0 --singleplayer --mode moving --frames 6000 --label bot_retail_after
```

The replay writes the native entry/trap log and the per-frame CPU breakdown
next to the JSON result under `build/reference/controls_render_replay/`.
The archive, QVM and native DLL hashes are recorded in that result.
