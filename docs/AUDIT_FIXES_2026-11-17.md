# Audit corrections — 17 November 2026

## Verified core correction set

Based on `master` at `e4cb867ffebd953c89e2e07bf29eeb409650feed`. The runtime, tests, scripts and inventory in this correction set are the same source bytes validated in Windows Actions run `44005485825` and committed as `aa1223e38aa74634483c4b788503f8a1272c81db` on the isolated test branch. Temporary patch-transfer files and source-writing CI workflows are deliberately not included in this production change set.

### Corrections

- Fail the original-source inventory gate when the submodule is missing, empty, dirty, incomplete, or at the wrong revision. Verify the initialized repository root and complete source set.
- Match complete, case-sensitive symbol identities instead of substrings or blanket coverage assertions. Enumerate the 296 existing game/cgame import-table names explicitly, classified as ABI coverage, not behavior acceptance.
- Include Objective-C, C++ and Unix assembly source units. Mark empty symbol inventories as unassessed. Keep mapping, runtime integration and behavioral acceptance separate.
- Use elapsed wall-clock time in the menu and sleep only for the remaining frame budget, including unsigned 32-bit clock wrap handling.
- Record exact frame-time millisecond buckets below 60 seconds; report the overflow bucket as a lower bound instead of fabricating an exact percentile. Five-second stalls are no longer reported as one second.
- Replace routing-cache eviction scans with bounded O(1) slot-index LRU bookkeeping and use reusable queue/work buffers. Preserve routing keys and calculations. Regression tests include slot zero and repeated eviction.
- Decode the common entity/snapshot input once per publication and reuse it for human and bot visibility selection. Per-client visibility remains separate.
- Allow the existing regression build entry point to explicitly select the checksum-pinned published toolchain through `MQ3_BUILD_TOOLCHAIN=release`; historical frozen-toolchain inputs are not overwritten.

### Executed validation

Windows Server 2022, published MiniLang 1.3.9, MSVC:

| Check | Result |
|---|---|
| Python inventory regressions | 13 tests passed |
| Original checkout validation | 501 code-tree source files, pinned clean checkout |
| Compiled MiniLang timing/LRU contracts | 16 passed |
| Routing cache contracts | 30 passed |
| Routing reference scenarios | 5 scenarios, 10 exact observations; scenario model, not unchanged original C |
| Full Windows game, native DLL and QVM build | Passed |

The original failed development runs remain available: one exposed a new-variable scope error and another exposed a slot-zero/missing-value confusion. Both were fixed before the successful run. No FPS gain, GPU rendering acceptance, or complete original-game parity is claimed by this patch.

### Revised inventory interpretation

The stricter generator reports 360 in-scope source units: 212 with mapped candidate identities, 69 partial, 25 not started, and 54 unassessed declared-ported units. It reports 1,630 unresolved identities and 71 empty candidate inventories across all statuses. These are mapping statistics, not 1,630 proven missing functions and not a completion percentage. The increased unresolved count reflects removal of overly permissive matching and inclusion of previously omitted languages.

## Desktop integration candidate is separate

A separate candidate implements user-file persistence, typed map/menu transitions, video restart and per-material culling. Its native Windows storage/configuration contracts, path/atomic-write checks, original-culling raster comparisons, existing key tests and material tests passed. The combined run stopped at the retained-world test's missing test-only include path. The local harness correction and complete original-QVM lifecycle/graphical acceptance still need a new Windows run. These candidate changes are deliberately not part of this verified core commit.

The audit also identified broader work: multiplayer/demo/mod end-to-end integration, remaining platform decisions, fully native game-module replacement and comprehensive behavioral parity. Those are not silently marked complete by the inventory changes.
