# Retail CPU profile and frame-time corrections

The capture ran on Windows with the Ryzen 9 9900X and the RTX 5080
hardware OpenGL path at 1280×720. It used the original Cgame and Qagame QVMs
and the user-supplied Retail PK3. The first comparison is a 2,200-frame
q3dm0 single-player run against Crash with a fixed 20 ms simulation step.
Frame time measures wall work. The instrumented main-thread samples are
hardware cycle counts, so the report does not convert them into a fixed
CPU frequency. The native hardware profile separately measures the wall
duration of OpenGL submission and SwapBuffers.

## Baseline diagnosis

The baseline was commit cbaea9b. Simulation accounted for about 62% of
measured game-thread cycles (19.0 million for game and 34.7 million for
Cgame per frame). Scene/world preparation took 16.1 million and submission
14.5 million. Presentation averaged 0.062 ms of wall time.

Frame 95 took 279 ms, including 241 ms preparing new scene materials.
Geometry used 1.122 of 1.213 billion game-thread cycles. Present rounded
to zero ms. A later cold material frame spent 52 ms adding four textures
without a GC cycle. The separate material probe identified the three
image stages of textures/base_door/shinymetaldoor_outside3a2 as the largest
individual load. This shader is listed in q3dm0's BSP and its images were
already decoded into the world catalog. There were also slower simulation
frames without new textures, including 90 ms of game work in frame 613.

The supplementary native QVM profiler on a 1,600-frame moving replay
recorded about 4.00 s for Cgame transformed box traces, 2.25 s for Cgame
world traces, 1.95 s for polygon submissions and 2.97 s for Qagame traces.
The native dispatch loop itself used about 1.11 s across Cgame and Qagame.
These opt-in counters include VM host wall work and have their own
instrumentation overhead.

## Changes

- Decode PK3 data with a short-code Huffman prefix table and bulk copies for
  stored blocks and backreferences. Bounds, trailing bytes and CRC checks
  remain in force.
- Convert checked Retail TGA pixels in one native call, including RLE, alpha
  and the original row orientation. Use the world catalog to seed the
  bounded archive-specific decoded-image cache. Scene shader stages keep
  their own output slots and sampler state.
- Write Cgame temporary-box results directly in the checked guest trace ABI.
  Other shapes and invalid input fall back through the regular validation.
  The general Qagame/Cgame trace writer also packs a full trace in one call.
- Avoid copying the whole polygon queue on append and reuse the vertices
  decoded at the QVM boundary. Reuse MD3 culling and LOD decisions within
  the frame. AAS searches and weapon inventory use bounded/growing storage
  without repeatedly copying initialized elements.
- Keep hardware texture unit bindings and raster state within a submission
  when their input is unchanged. A valid fully clipped viewport returns the
  accepted count on both backends without changing the framebuffer.

## Fixed-step result

| Measurement | cbaea9b | Updated |
| --- | ---: | ---: |
| Average FPS | 49.56 | 53.35 |
| Work p50 / p95 / p99 | 17 / 42 / 54 ms | 16 / 39 / 48 ms |
| Longest frame | 279 ms | 100 ms |
| Match initialization before first frame | 5,019 ms | 2,996 ms |
| Qagame / Cgame main-thread cycles per frame | 19.00 / 34.70 million | 17.41 / 33.29 million |
| Geometry / submit main-thread cycles per frame | 16.12 / 14.49 million | 14.41 / 13.29 million |
| Present wall time per frame | 0.062 ms | 0.055 ms |

Both runs submitted 2,200 frames and 880 server ticks. The replay recorded
533 position changes, 1,150 attacks and 100 ammo decreases in each. Frame 95
fell below the 50 ms detailed logging threshold. The Retail cache test
confirms that the three door images come from the seeded catalog with
identical pixel data. Frame 1788 fell from 95 to 54 ms, with material
preparation falling from 52 to 21 ms. The new longest frame spent 82 ms in
Qagame. A separate short diagnostic associated the worst simulation frame
with a bot AI update and found the bot chat matching and item update traps
among the most expensive individual calls. Collision and Cgame remain
substantial CPU costs during ordinary play.

Reproduce the fixed replay from the source tree with the installed Retail
PK3s in `build/baseq3`:

```powershell
python scripts/test_ingame_controls_render.py --data-root build --published-compiler --map q3dm0 --singleplayer --mode moving --frames 2200 --fixed-step-ms 20 --cpu-profile --label cpu_after
```

## Real-time result

The 6,000-frame replay used wall-clock simulation, the same Retail `pak0.pk3`
and the same input replay as the previous Desktop Streams and Collision
report. The simulation trajectory can vary with frame time in this run.

| Measurement | Previous | Updated |
| --- | ---: | ---: |
| Average FPS | 47.02 | 51.88 |
| Work p50 / p95 / p99 | 18 / 45 / 64 ms | 16 / 40 / 65 ms |
| Longest frame | 260 ms | 107 ms |

The updated run recorded 1,500 position changes, 3,000 attacks and 161
ammo decreases. A late 107 ms frame used 60 ms for geometry and 29 ms for
rendering. The work p99 is effectively unchanged in this real-time run.
Logs and the artifact, PK3 and QVM digests are produced under
`build/reference/controls_render_replay/retail_after/`:

```powershell
python scripts/test_ingame_controls_render.py --data-root build --published-compiler --map q3dm0 --singleplayer --mode moving --frames 6000 --max-work-ms 230 --label retail_after
```

The results cover one arena and one hardware configuration.

## Regression checks

The release-toolchain build and hardware and software renderer checks passed,
including 240 OpenGL blend comparisons against the original and matching
immediate and client-array output. The changed paths also passed 84 archive
comparisons, 115 input rejection checks, 22 TGA checks with five original C
output records, 12,288 collision cases against the original, 1,024 direct
VM trace ABI comparisons, 37 Qagame binary-world contracts, 56 scene geometry
contracts, 40 polygon queue contracts and seven Retail image-cache contracts.

The rebuilt Windows EXE also passed the Retail desktop smoke test for the
original menu, Alt+Enter, in-match resolution changes and clean close. It
joined the original Pure server, played a recorded original demo and ran a
local mod with a separate config. The 120-frame q3dm1 Controls replay passed
on hardware OpenGL.

The full frozen verify suite is still blocked by the compiler input hash.
The tests here use the published MiniLang 1.3.9 package. WPR CPU/GPU
collection was unavailable under the current Windows profile privilege.
