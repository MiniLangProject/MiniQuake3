# Retail arena, bot and collision audit — 21 November 2026

## Test material and scope

The locally owned Retail archive was `build/baseq3/pak0.pk3` (SHA-256
`7ce8b3910620cd50a09e4f1100f426e8c6180f68895d589f80e6bd95af54bcae`).
`D:/Quake3/baseq3/pak0.pk3` was unavailable during this run. The packaged
Windows build used published MiniLang 1.3.9 and the original Quake III 1.32b
`ui`, `cgame` and `qagame` QVMs from `build/reference/qvms`. Hardware rendering
was OpenGL on the NVIDIA GeForce RTX 5080 at 1280×720. The final packaged
`MiniQuake3.exe` had SHA-256
`09a642ed863a3015395d9ead51e1c30bc0469c2a41b2b708b670ababa50b20a8f`.

`python scripts/test_all_retail_levels.py --data-root build` enumerated the
30 names in the Retail `scripts/arenas.txt`, loaded each corresponding BSP,
started the original QVM game path and completed 30 rendered frames. **30/30
passed**, with nonzero triangles and textures. Median startup wall time was
3,328 ms (range 2,287–5,629 ms); median average frame work was 15.25 ms
(range 6.23–32.1 ms). q3ctf4, q3tourney6 and q3dm19 were the slowest by
average frame work (32.1, 27.23 and 24.73 ms). The full machine-readable
output is `build/reports/all_retail_levels.json` (ignored build artifact).
These are short startup and render checks. They do not exercise every match
rule, pickup, mover or network event on every map.

`python scripts/test_all_retail_bots.py --data-root build` enumerated all 32
named entries in the Retail `scripts/bots.txt`, checked their character files,
spawned each through the original qagame and Botlib on q3dm1, and ran 120
simulation frames. **32/32 passed**; each submitted 74–97 active weapon/move
commands (median 88). The machine-readable report is
`build/reports/all_retail_bots.json` (ignored build artifact). This verifies
profile loading, spawn and active commands on one map; it does not assert that
every bot wins, hits or completes an entire match. The existing Crash combat
and single-player tests cover a separate attack/damage scenario.

## Findings and fixes

The `--play-qvm`, `--play-qvm-smoke` and `--qvm-match` entry points passed
`q3dm1` as the server map name even when another BSP was loaded. They now
derive the name from the supplied BSP path, matching the desktop menu path.
The local QVM boot also skipped the original `SV_SpawnServer` warmup. Original
`code/server/sv_init.c` calls `GAME_RUN_FRAME` three times at 100 ms intervals
before client admission; item spawn completion needs this 200 ms progression.
Without it, q3ctf4, q3dm10, q3tourney3 and q3tourney5 could fail with
`BG_CanItemBeGrabbed: index out of range`. The MiniLang host now performs the
same warmup. The q3ctf1 initialization exceeded the old 10-million-step QVM
budget; a 50-million-step budget accommodates it, and native failure output
now includes steps and limit for diagnosis.

The code audit found repeatedly copied arrays in collision BSP DFS and
leaf/brush queries. A stack and result `std.ds.list` now provide amortized
linear growth. Submodel brush/surface vectors and patch control points use
preallocated arrays. Point contents evaluates each selected brush directly,
without building a temporary array. The differential collision suite is
required because these operations feed item placement and bot routing.

The MD3 shadow policy pass had an O(surface-count²) search during scene
preparation. It now uses a hash map keyed by entity and surface; a regression
contract checks that an opaque entity and a fogged entity sharing a surface
number receive different shadow decisions. On q3dm4, the 180-frame benchmark
was effectively unchanged (41.275 before, 41.068 FPS after); this structural
fix does not explain that map's current rendering cost.

## Performance observation

In a 120-frame real-time q3dm15 hardware/QVM run before the collision
storage change, frame work averaged 27.85 ms and loop rate was 35.90 FPS;
work P95 and maximum were 58 and 98 ms. A run after the stack/list change
averaged 18.48 ms and 54.08 FPS; P95 and maximum were 33 and 36 ms. Qagame
trap 30 (`trap_LinkEntity`) averaged 2,099 microseconds per host call before
and 109 microseconds after. The two runs had different simulation tick and
trap-call counts because their frame steps followed wall time; these figures
show observed improvement, not a cycle-identical differential benchmark.

The final packaged EXE, including direct point-content evaluation, completed
a fresh unprofiled q3dm15 120-frame run at 54.30 FPS, 18.41 ms average work,
32 ms P95 and 38 ms maximum. Its profiled run recorded 52.98 FPS and
18.87 ms average work; `trap_LinkEntity` took 110 microseconds per host call
(352 calls). Render and scene expansion remained material CPU
costs (6.14 and 3.75 ms per frame respectively), so 1:1 performance parity is
still open.

## Verification and limits

The 31-BSP visibility/PVS differential against original C passed after the
stack/list change. q3dm15 collision differential passed 1,448 original-map
trace/content cases after the direct point-content change; q3dm15 spatial and
transformed-hull tests also passed. q3ctf4 passed 304 original-map
trace/content cases, and the Retail QVM match passed its eight-frame
game/client/UI integration smoke. The no-argument Windows EXE reached the
original menu in 0.31 seconds. The 21 shadow-batch contracts, 12 hot-path
structure contracts, 115 rejection cases and 26,934 native-VM contracts
passed. The final single-player Retail probe passed q3dm0 and q3dm1 bot,
human, score reply and score drawing contracts; it observed 14–31 bot attack
frames per tested scenario. Final targeted verification results are recorded in the test output;
the entire long `scripts/verify.py` suite was not run for this package.
Long interactive matches on every map, all bot versus bot combinations,
network interoperability, mods, audio and renderer fidelity still require
separate acceptance.
