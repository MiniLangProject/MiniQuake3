# Performance and code audit — 21 November 2026

Scope: productive Windows QVM preview, retained BSP world build, renderer draw path, and botlib profile evidence. The original Quake III source under `Quake-III-Arena-original-source` and the existing MiniLang contracts were used as behavioral references. This audit does not establish full game parity.

## Follow-up on patch grids and impact marks

The productive BSP renderer lost valid grid points after removing a collinear
point. Its removal loop left the error markers in place, causing one marker
to remove the point that shifted into the same index. The original
`R_SubdividePatchToGrid` shifts the markers with the grid and advances the
index. Both MiniLang entry points now share a single compaction pass that
keeps the corresponding LOD errors. The original C routine and the productive
MiniLang path emit identical positions, first base UV components and first color bytes for
the two new test grids. The flat fixture grows from 2×2 to the original 3×3
and the mixed straight and curved fixture from 2×2 to the original 6×6.

Patch transposition and row expansion now write to arrays of known size.
The impact-mark trap uses fixed arrays for clip-plane calculations, a
standard hash set for visited faces and growable lists for fragments and
points. Its geometry extraction shares read-only BSP vertices within each
face, and the classifier reads the face type once per run of triangles.
The tests cover clipping against unchanged C, duplicate face references,
output capacity and the cgame trap ABI.

Local Windows probes ran both versions against the same synthetic inputs
after warmup. The baseline is commit `fd0266e`.

| Work per trial | Baseline | With fixes |
| --- | ---: | ---: |
| 12 subdivisions of one 15×15 patch with alternating control heights, 29×29 result | 101–142 ms | 56–62 ms |
| 40 impact-mark projections on one planar face with 512 triangles | 45–47 ms | 14 ms |
| 500 impact-mark projections on one planar face with two triangles | 8 ms | 7–8 ms |

The patch probe checked output dimensions, positions, UVs, normals and colors
against the baseline on the timed fixture. The mark probes compared points,
fragment counts and tested triangle counts. These timings cover only the
renderer routines in the table. Retail loading and game FPS remain
unmeasured with the current changes.

The Windows tests passed 64 BSP render contracts and matched 7 lighting,
75 patch-normal and 47 patch-grid reference records. World selection passed
45 contracts and retained rendering passed 51. The impact-mark gate matched
5 original C records and passed 18 contracts, including calls through cgame
trap 27. The separate `tr_curve` gate passed its 5 native comparison
records and 26 contracts before the missing Retail `q3dm1` map blocked it.
The full `python scripts/verify.py --data-root D:/Quake3` run built
`MiniQuake3.exe` and reached `test_message_state_delta.py`, where the local
MiniLang compiler again reported
`unknown data patch target: switch_case_body_22681_0`.

## Findings from the preceding package

1. `world_surface_selection.buildCache` subdivided every patch twice: first through `faceTriangleCount`, then through `extractRetainedWithPatchError`. It now takes the count from the extracted geometry. The renderer's 65×65 grid limit bounds the temporary patch budget to 8,192 triangles. The new patch contract compares the cache count, output length, vertex and triangle order with a direct extractor result.
2. `faceBounds` decoded every face vertex twice to compute centroid and radius. It now retains the positions from the centroid pass for the radius pass. A regression checks the cached center and radius.
3. `pvsContains` indexed visibility bytes without first checking whether the header, row and complete row table fit inside the BSP lump. Malformed tables now return no visibility rather than reading beyond the lump; valid no-vis maps retain their fallback. Three new contracts cover absent, truncated and oversized visibility data.
4. The extractor accepted patch control widths/heights up to 129, while the original `tr_local.h` limits source patches to `MAX_PATCH_SIZE == 32` and both subdivision error tables have 65 slots. Inputs over 32 are now rejected before subdivision in both the cached and uncached paths. A new contract covers a 33×3 patch with otherwise consistent vertex counts.

## Isolated timing

A Windows MiniLang A/B probe compiled the previous `world_surface_selection.ml` from `7f975ee` as a separate package alongside the changed implementation. Both received the same synthetic BSP with 200 identical curved 3×3 patch faces, 32 triangles per face. After warmup, each built the complete cache three times. Three sequential runs returned **203 ms** for the previous implementation and **109–110 ms** for the changed patch-count path, each producing **19,200 triangles**. This measurement preceded the additional vertex-decode and PVS fixes, so it does not attribute a speedup to those changes. It is a synthetic map-load measurement, not a Retail map load or frame-rate result.

The previous package `7f975ee` separately measured the multi-face BSP extractor at 219–235 ms versus 46–62 ms for 5,000 planar faces × three runs. On the per-face retained-cache pattern, 15,000 calls measured 62–63 ms versus 47–63 ms. These results are kept separate because they exercise different work.

## Remaining performance risks

- The last graphical bot baseline is 37.73 FPS on q3dm0 and 87.81 FPS on q3dm1. These are different arenas, so they are not a controlled comparison. No Retail PK3 is currently available under `D:/Quake3/baseq3`; real map-start and FPS gains from this package remain unverified.
- The earlier native renderer profile attributed about 1.76 ms per sampled frame to `hardwareDrawBatch`, 0.04 ms to `SwapBuffers`, and about 9.74 ms to work outside those calls in the MiniLang render path and other native routines. Per-pass attribution and visual acceptance remain necessary before changing shader or fog work.
- The 200-frame bot QVM profile recorded 205,824 entity-update traps and expensive goal-selection calls. These host timings identify candidates; they do not establish a safe shortcut through the original QVM protocol.
- The full `verify.py --data-root D:/Quake3` gate previously stopped at the compiler error `unknown data patch target: switch_case_body_22681_0` in the unchanged `test_message_state_delta.py`, before Retail tests. The bot suite separately hit the same compiler-error type in `bot_ai_frame`. This package does not modify the MiniLang compiler.

## Checks

Before final commit: `test_world_surface_selection.py` passed 45 contracts; `test_bsp_render_data.py` passed 64 contracts plus 7 lighting and 75 patch-normal reference records; `test_retained_world_batch.py` passed 51 contracts. `python scripts/build.py` built `MiniQuake3.exe`. A targeted rerun of `python scripts/verify.py --data-root D:/Quake3 --start-at test_message_state_delta.py` reproduced the unchanged compiler error `unknown data patch target: switch_case_body_22681_0`; therefore the full gate is not green. `D:/Quake3/baseq3/pak0.pk3` was absent, so no Retail game load or visual/FPS acceptance was possible.
