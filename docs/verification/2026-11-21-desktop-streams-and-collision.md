# Windows Retail verification for server joins, demos, mods and collision

The Retail assets came from the local CD's `build/baseq3/pak0.pk3` and
`pak1.pk3`. The `D:/Quake3` path was unavailable. Tests used the published
MiniLang 1.3.9 toolchain and the pinned original Quake III source.

## Desktop and protocol

- `test_remote_play_retail.py --release --data-root build` runs a stock
  reference dedicated server on the local machine. It verifies a complete
  protocol-68 join, movement, a delta snapshot, a reliable score response and
  receipt of the client's disconnect. The Pure test also checks the matching
  PK3 set. Protocol-message readers and writers reuse their Huffman tables.
- `test_desktop_demo_retail.py --data-root build` records `q3dm1` in the
  original engine and runs the recording through the port. It checks 111
  records, original **Demos → GO**, movement, reliable chat, historical
  snapshots, clean EOF, PK3 playback and gamestate changes. It also verifies
  lookup of a loose Baseq3 demo while a mod is active.
- `test_mod_stack_retail.py --data-root build` exercises 19 checks including
  PK3 order, loose assets, execution of an override QVM, the original mod list,
  a Baseq3 match with an asset-only mod and separate bot cache directories.
- The packaged Windows EXE passed both server modes in
  `test_desktop_streams_retail.py`. The same test played the original
  demo to EOF and switched from a mod's 800×600 profile back to the Baseq3
  640×480 profile. Each transition retained the same HWND.
- Pure test packages contain the 1.32 QVMs built from the pinned original
  source. The original CD Cgame expects configstring 12 for the game version
  whereas 1.32 uses 20. The client returns the Cgame's compatibility error
  when the server approves only the earlier Cgame. Pure play continues to
  require the correct QVMs inside matching local PK3s.

## Collision

The trace kept the original near-first BSP order and stores only deferred far
branches. Temporary AABBs reuse the existing hull. Non-capsule sweeps against
temporary boxes and map brushes use native binary32 clipping, with the
MiniLang path available for capsules and unusual intermediate values. Dot
products cross the numerical ABI once while retaining the original arithmetic
order and rounding.

The x86 original-source oracle matched 19,972 world traces or point-contents
queries across `q3dm0`, `q3dm1` and `q3ctf1`, plus 12,288 transformed and
temporary-model cases on `q3dm0` and `q3dm1`. The math differential run
matched 53,248 results. In five alternating Windows runs of the same 19,972
world cases, the end-to-end median fell from 2,439 to 2,051 ms (16%).
This measurement includes process startup, map loading and validation.

## Frame timing

The 6,000-frame moving and firing replay ran at 1280×720 on the RTX 5080
using hardware OpenGL, the original QVMs, Retail q3dm0 and Crash. It
registered 3,000 attack commands and 198 ammo decreases.

| Workload | Mean FPS | Median frame | 95th percentile | 99th percentile | Maximum |
| --- | ---: | ---: | ---: | ---: | ---: |
| Previous build | 46.1 | 17 ms | 48 ms | 74 ms | 268 ms |
| Current build | 47.0 | 18 ms | 45 ms | 64 ms | 260 ms |

Replay input is injected by frame while the simulation uses wall time, so
combat trajectories differ across runs. The tail improved in this run, and
the overall FPS increase was small. A 260 ms frame still occurred when scene
geometry and materials expanded during combat. This is not a high-FPS or
stutter-free acceptance result. [Previous run](2026-11-21-intensive-audit-fixes.md)

The default full `verify.py --data-root build` still stops at the existing
frozen-compiler hash mismatch. These targeted checks use the separately
pinned published compiler. The standalone client-ingress contract also hit
MiniLang's jump-table link error. The live Retail tests executed the same
ingress using the packaged application and the reference server.
