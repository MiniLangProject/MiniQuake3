# Retail verification of the intensive audit fixes

The Windows build uses MiniLang 1.3.9 and the original QVMs. The Retail
archives are the local `build/baseq3/pak0.pk3` and `pak1.pk3` from the CD
image. The game resolves them beside the executable.

| Area | Verification |
| --- | --- |
| Local session and persistence | The `q3dm0` Retail probe exercised map, restart, disconnect and level selection through the desktop command handler. A placement written by the original UI, a quoted key binding and sensitivity survived a fresh session. `exec`, `vstr`, `writeconfig` and `vid_restart` were exercised. The 34 UI input contracts cover native characters, layout, repeated characters and keypad keys. |
| Bots | Twelve checks per map passed on `q3dm0` and `q3dm1`. A controlled encounter produced two weapon fire events for Crash and three for Ranger. Both issued grounded movement commands. The 512-tick Retail addbot run passed 18 checks. The route test compared 288 moving-origin queries with the forward router on `q3dm1`. |
| Routing cost | In the local `q3dm1` headless run, four 50-tick blocks took 844 ms after the routing and movement changes versus 1344 ms in the old probe. A separate 400-tick comparison on the new implementation measured 687 ms with 20 Hz bot calls and 735 ms with 100 Hz bot calls. Both cases emitted four weapon events. These durations omit rendering. |
| BSP and model rendering | Crash's 15 model surfaces over three LODs resolved real Retail textures. The renderer lifecycle ran 120 cgame and 240 UI model frames. Retained batches matched 432 comparisons across `q3dm0`, `q3dm1` and `q3ctf1`. The geometry scan passed all 31 Retail maps. Surface, viewport, material, portal and native raster contracts cover the repaired edge cases. |
| Audio | The 46 playback contracts, incremental Retail sound asset test and Retail QVM match playback passed. The latter decoded 122 clips and applied 25 commands, with zero unresolved events. At 22050 Hz, three 1024-frame buffers contain up to 139 ms of PCM. Perceived latency requires a listening test. |

## Windows and frame times

The packaged Retail build applied 800×600 in the main menu, changed to
1024×768 in `q3dm0` through the same `vid_restart` path as Graphics, used
Alt+Enter in both directions and returned to the main menu in the same HWND.
The 120-frame Controls replay verified that the local simulation stayed
paused and that the UI drew its original player preview.

The moving and firing replay with Crash on `q3dm0` reproduced the sustained
slowdown with the synchronous MiniLang collector. It was stopped at 1,823
frames after the title showed 4 FPS and the worst work time reached 7,790
ms. The heap frontier grew to 702 MB at frame 1,500. A trial with the
background collector reached 6,000 frames at 40.1 FPS on the RTX 5080,
with 79 ms at the 99th percentile and a 254 ms maximum. At frame 1,500 its
frontier was 294 MB. It ended at 358 MB with 177 MB live in the last reported
collection. The replay injects input by frame, so the two runs cover
different game-time trajectories.

The published Windows build uses this background collector configuration.
The game also avoids serializing unlinked entities, building intermediate
snapshot word arrays and copying each HUD quad several times. These changes
reduce allocation pressure while retaining the original QVM message layout.
The snapshot checks covered 27 contracts, five original C records and 16,384
codec roundtrips. The Retail lifecycle also checked the reused VM transfer
buffer against the complete 53,772-byte snapshot layout.

The final 6,000-frame replay with the new allocation paths and the production
build flags averaged **46.1 FPS**. Frame work took 17 ms at the median, 48 ms
at the 95th percentile, 74 ms at the 99th percentile and at most 268 ms.
It recorded player movement, 3,000 attack commands and 191 ammo decreases.
The retained world did 1,863 selections with zero full-batch fallbacks. The
heap frontier stayed at 351 MB from frame 4,000 through frame 6,000, with
175 MB live in the final reported collection. Short stalls under combat
still remain.

## Remaining scope

- The desktop host routes local commands. Remote connection, demo playback
  and loading a mod from the desktop menu still need a playable host
  integration. `map_restart` currently reloads the active map.
- Main-world portal surfaces use retained data. Recursive portal views
  still rebuild geometry for their clip plane. The patch cache uses the
  fine mesh when alternate batches exceed its capacity. Moving inline
  brush-model patches still use fixed tessellation. Hardware texture
  filtering implements the six original choices. Software filtering
  approximates the mip and filter selection.
- `python scripts/verify.py --data-root build` stops at its frozen compiler
  hash check. The published-compiler build and the targeted Retail gates
  use the separately pinned release package.
