# First playable preview

The first interactive MiniQuake3 vertical slice is available on Windows. It
loads `maps/q3dm1.bsp` and `sound/feedback/fight.wav` from the retail
`pak0.pk3`, chooses a deathmatch spawn and opens a native 640x480 desktop window
with Baseq3's default 90-degree horizontal field of view.

Run `Play-MiniQuake3.cmd` from the project root. It expects the archive at
`D:\Quake3\baseq3\pak0.pk3`. A different map can be started with:

```powershell
.\build\MiniQuake3.exe --play D:/Quake3/baseq3/pak0.pk3 maps/q3dm7.bsp
```

Controls:

- Enter leaves the menu and plays the start sound.
- WASD moves horizontally; the mouse changes yaw and pitch.
- Space jumps. Gravity brings the player back to walkable ground.
- Left mouse fires the currently held weapon.
- Q/E cycles backward/forward through owned weapons that have ammunition.
- 1-9 directly selects an owned Baseq3 weapon; 1 selects the Gauntlet.
- Escape returns to the menu; Escape in the menu quits.

The preview extracts bounded planar, triangle-soup and curved patch geometry from BSP46 and
draws it through a native CPU rasterizer. It currently supports a depth buffer,
screen clipping, perspective-correct UV and light interpolation, alpha, vertex
colour and up to 64 uploaded 128x128 BSP lightmaps and 128 base-texture slots. A bounded material resolver
reads all `scripts/*.shader` files, follows `map`, `clampMap` and up to eight
`animMap` frames, decodes TGA/JPEG images, applies scroll/rotate `tcMod`
operations and executes opaque, alpha and additive stages over the BSP
lightmap. Quadratic Bezier patch grids are adaptively tessellated with their
base UVs, lightmap UVs and vertex colours. Movement uses 800-unit gravity,
Quake friction and ground/air acceleration, collision sliding, an 18-unit step
and Space jumping against the ported brush and patch collision world.
The gameplay view draws the original Baseq3 crosshair, large number shaders,
Sarge portrait, weapon-specific ammo icons, armor/weapon icons, pickup notification and frag medal.
It reads health, armor, ammo and weapon entities from the BSP entity lump,
loads their original MD3 models and resolved TGA/JPEG skins, and draws active
pickups with Baseq3-style rotation, bobbing and respawn times. The inventory
tracks ownership and separate stock ammo pools; pickups, respawn, Q/E and the
number keys keep
player, weapon and HUD state synchronized. The weapon state uses stock fire
intervals, trigger behavior and damage. Empty attacks invoke Baseq3's
highest-usable-weapon fallback. The Gauntlet only swings when its 32-unit trace
can reach a target and uses its stock 50 damage and 400 ms repeat interval. Machinegun,
Lightning and Rail use collision-world hitscan traces. The Shotgun emits the
stock deterministic 11-pellet pattern with Spread 700 and 10 damage per pellet.
Rocket, Plasma,
Grenade and BFG shots are moving predicted projectiles with their stock speed,
lifetime, direct damage, splash damage and radius; grenades also use stock
gravity, half-bounce reflection, 0.65 damping, floor settling and a 2.5-second
fuse. Every shot begins at Baseq3's snapped muzzle point 14 units in front of
the eye. Projectile paths collide with BSP geometry before targets and produce
original textured Rocket, Grenade and BFG MD3s plus the original camera-facing
Plasma sprite. Rocket and grenade flights emit Baseq3-sized smoke at the stock
50 ms cadence; Plasma emits short-lived particles. Rocket flight and
rocket/grenade impacts add source-anchored light overlays. Impacts and bounded
fallbacks use weapon-colored glows and crosses. Start, jump, pickup, pain, death,
weapon fire and weapon impact actions use original WAV assets from `pak0.pk3`.
The WinMM boundary mixes up to 16 concurrent voices, so fast shots and impacts
no longer cut each other off. Looped-on `target_speaker` entities are extracted
from the BSP. q3dm1's eight fire speakers share one phase-continuous retail WAV
source, but retain individual origins for Baseq3 distance attenuation and
listener-relative stereo panning through a triple-buffered WinMM stream.
The q3dm1 `tim_hell` sky is camera-anchored and renders both original scrolling
retail layers. Every selectable weapon loads its stock `_flash.md3`; impulse
weapons show it for the source-anchored 20 ms interval, while Gauntlet and
Lightning keep it visible during continuous fire.

Five local combat targets are created from the remaining q3dm1 deathmatch
spawns. BSP point traces drive their line of sight. They patrol, chase, strafe
and attack for 7 damage with a 700 ms cooldown inside a 900-unit range. They
take 34 damage from the nearest unobstructed hitscan intersection, die after
three hits, award a frag and respawn after three seconds. The player now has
armor absorption, pain/death feedback, a death counter, spawn cycling, a short
spawn protection window and a 1.7-second respawn. Each visible target is now a
complete near-LOD Sarge assembled from the real `lower.md3`, `upper.md3`
and `head.md3` through `tag_torso` and `tag_head`. The `animation.cfg` locomotion
frames are interpolated and both default skin images are decoded from the PK3.
Per-target gameplay events select idle, walk, run, attack, pain, death and
respawn inputs. Near targets use all 795 triangles; medium and far LODs retain
398 and 200 triangles while preserving every model surface. Interpolated MD3
normals provide per-vertex lighting. A bounded pose cache reuses quantized MD3 interpolation results;
world and player materials also share the same 27-script shader index.
Enemy movement is resolved through a player-sized BSP hull with wall sliding,
18-unit steps and ground binding. Their attacks now launch 420-unit-per-second
plasma projectiles. Each flight is traced against the BSP and the player bounds;
walls win exact collision ties and therefore shield the player. Trails, glows,
fading impact crosses and original plasma fire/impact sounds expose the complete
path. The first-person view switches to the current original textured weapon MD3.
Its bob, landing motion and idle drift follow `CG_CalculateWeaponPosition`; the
visible model is attached through the complete animated `tag_weapon` transform
loaded from the retail tag-only `_hand.md3`. Viewmodel polygons crossing the
near plane are clipped and retriangulated with interpolated UV and light values
instead of being discarded as whole triangles. Until the software renderer gains
Quake 3's separate `RF_DEPTHHACK` projection, a contained parent-position
compensation keeps this attachment inside its valid near volume. Attack frames
1-6 run at the original 15 fps with interpolated tags. Weapon changes retain
the old model through the mapped drop frames, then hold the new hand at frame
zero during Baseq3's 250 ms raise interval;
the weapon state uses stock Baseq3 fire intervals and direct-hit damage with
recoil, hit marker and damage direction. The window caption samples and
smooths the live frame rate every 500 ms.
Single Player enters a three-second countdown and then a five-minute,
ten-frag match. The HUD shows the elapsed match clock and center messages;
fraglimit or timelimit produces a persistent win, loss or tied intermission.
Countdown and fight use the original announcer WAVs. Timer, warmup and
centerprint and the sorted FFA intermission scoreboard render from Baseq3's
256x256 `bigchars` atlas with color escapes, text shadows, countdown sizing and
centerprint fade timing.
The menu uses the original Baseq3 proportional font, glow font, banner font and
cursor artwork from `pak0.pk3`, with the stock entries and spacing. Up/down
moves the glowing selection with wrap-around; Enter starts Single Player or
activates Exit. Asset-free
runs retain a small bitmap fallback. All menu, camera, BSP, collision, PK3 and
WAV policy remains in MiniLang. The native boundaries provide window/input,
pixels and asynchronous WinMM PCM playback.

The world renderer caches all 12,203 tessellated q3dm1 triangles once, then uses
the camera leaf, BSP PVS, frustum, distance and planar backface tests to choose
whole visible surfaces. In the current 60-frame smoke this selects 1,698 triangles
from 321 surfaces across the full face-index range. The full-map q3dm1 material
probe finds one animated pass, eight UV-modified passes and twelve blended passes.
One of those retained passes uses `rgbGen wave`; each frame evaluates the original
1,024-entry waveform phase and quantizes its grayscale intensity to the vertex
color byte before rasterization. Other shader generators/deforms, exact lower/upper animation-state
blending and the complete cgame/qagame match loop remain in work.
This is a real local gameplay integration slice, rather than a complete Quake
III match.

The software path now precomputes camera axes and focal length once per frame,
uses direct validated MD3 transforms, and rasterizes only each triangle's covered
scanline span with incremental barycentric coordinates. On the development
machine, recent retail smokes take roughly 53-65 ms per frame
(about 32-37 ms update plus 20-29 ms render), down from the original roughly 292 ms,
while keeping about 1,700 selected world triangles, textures, lightmaps, item
models, five animated targets, projectile effects, the two-layer retail sky and HUD.
The selected base world is retained as one native batch between PVS refreshes;
visible animated and blended material stages add their own passes. MD3 surfaces
transform shared indexed vertices once per frame, keeping pickup
bobbing and rotation at full frame cadence.
Native world batches of at least 256 triangles split into as many as four
disjoint scanline bands. An isolated parity benchmark measured 531.2 ms for
the scalar path and 148.4 ms for the parallel path (3.58x), with identical
framebuffer and depth output.

Validation:

- `python scripts/test_playable_viewer.py`: 56 camera/projection and attributed
  near-plane-polygon contracts.
- `python scripts/test_bsp_preview.py`: 34 BSP geometry contracts.
- `python scripts/test_bsp_render_data.py`: 55 triangle/lightmap/patch contracts.
- `python scripts/test_playable_materials.py`: 35 BSP/shader/image/generator contracts.
- `python scripts/test_playable_world_batch.py`: 20 retained-command, material-stage,
  sky-filtering and one-call submission contracts; the native lifecycle also
  compares framebuffer pixels and depth bit-for-bit with the scalar path.
- `python scripts/test_playable_movement.py`: 27 gravity/jump/slide/idle contracts.
- `python scripts/test_playable_items.py`: 47 entity/pickup/respawn and separate-ammo contracts.
- `python scripts/test_playable_weapon_inventory.py`: 46 ownership, stock pickup,
  per-weapon ammo, respawn and weapon-selection contracts.
- `python scripts/test_playable_weapon.py`: 37 weapon profile, muzzle, hitscan, ammo and
  cooldown contracts.
- `python scripts/test_playable_muzzle_flash.py --pak D:/Quake3/baseq3/pak0.pk3`:
  27 contracts plus nine retail flash models, 29 shared textures and 240 triangles.
- `python scripts/test_playable_shotgun.py`: 20 original-source-anchored spread,
  pellet trace, BSP shielding, damage and score contracts.
- `python scripts/test_playable_effects.py`: 31 item/tracer/impact contracts.
- `python scripts/test_playable_targets.py`: 29 target/damage/frag contracts.
- `python scripts/test_playable_player.py`: 24 armor/death/respawn contracts.
- `python scripts/test_playable_enemy_ai.py`: 17 AI contracts plus 40 q3dm1
  collision frames.
- `python scripts/test_md3_asset.py`: 38 MD3 contracts, including valid
  tag-only hand models, plus the retail Sarge
  `lower.md3` asset probe.
- `python scripts/test_player_animation.py`: 27 animation.cfg and sampling
  contracts plus a retail Sarge probe.
- `python scripts/test_player_model_assembly.py`: 32 tag hierarchy and transform
  contracts plus a three-part retail Sarge probe.
- `python scripts/test_player_skins.py`: 25 skin parser/resolver contracts plus
  decoding of both unique default Sarge textures.
- `python scripts/test_playable_enemy_events.py`: 22 per-target gameplay event
  and animation-input contracts.
- `python scripts/test_player_render_cache.py`: 26 pose-cache, LOD and budget
  contracts.
- `python scripts/test_player_render_quality.py`: 20 complete-model LOD, skin
  and vertex-lighting contracts plus a retail Sarge probe.
- `python scripts/test_playable_item_models.py`: 44 pickup-model, material,
  transform and budget contracts plus a retail q3dm1 probe.
- `python scripts/benchmark_playable_item_models.py`: indexed MD3 transform
  benchmark with an exact legacy/new geometry comparison.
- `python scripts/test_world_surface_selection.py`: 28 BSP PVS, frustum,
  backface, budget and cached-geometry contracts plus a retail q3dm1 probe.
- `python scripts/test_playable_enemy_animation.py`: 29 state-transition and
  one-shot animation contracts.
- `python scripts/test_playable_enemy_movement.py`: 22 collision/step/ground
  contracts plus a retail q3dm1 probe.
- `python scripts/test_playable_enemy_projectiles.py`: 25 spawn, flight, BSP,
  player-hit and lifetime contracts.
- `python scripts/test_playable_player_projectiles.py`: 32 Rocket, Plasma,
  Grenade and BFG flight, grenade bounce/settling, BSP/target, direct/splash
  damage and lifetime contracts.
- `python scripts/test_playable_projectile_view.py`: 35 projected trail, glow,
  impact and fade contracts.
- `python scripts/test_playable_projectile_fx.py`: 31 smoke, particle and light
  contracts plus ten direct anchors in Baseq3 `cg_weapons.c`.
- `python scripts/test_playable_projectile_models.py --pak D:/Quake3/baseq3/pak0.pk3`:
  34 catalog/orientation/budget contracts plus four retail projectile assets,
  eight textures and a 140-triangle render probe.
- `python scripts/test_playable_weapon_sounds.py --pak D:/Quake3/baseq3/pak0.pk3`:
  41 selection contracts plus 21 decoded retail weapon WAV files, including the Gauntlet loop.
- `python scripts/test_playable_target_render.py`: 26 silhouette/health contracts.
- `python scripts/test_playable_combat_view.py`: 40 weapon/feedback contracts.
- `python scripts/test_playable_viewmodel.py --pak D:/Quake3/baseq3/pak0.pk3`: 26 Baseq3 weapon-position,
  `AnglesToAxis`, animated hand-tag attachment and software-depthhack boundary
  contracts plus all ten retail tag-only hand MD3s and an in-viewport retail
  Machinegun check after near-plane clipping.
- `python scripts/test_playable_fps_title.py`: 14 sampling, smoothing and native
  window-caption contracts.
- `python scripts/test_baseq3_hud.py --pak D:/Quake3/baseq3/pak0.pk3`: 50 HUD
  contracts plus all 39 retail artwork textures, eight weapon ammo icons and
  the timed owned-weapon selection strip.
- `python scripts/test_playable_menu.py --pak D:/Quake3/baseq3/pak0.pk3`: 24
  menu contracts plus four retail font/cursor artwork checks.
- `python scripts/test_wav.py`: 35 RIFF/WAVE PCM contracts.
- `python scripts/test_playable_ambient_sounds.py --pak D:/Quake3/baseq3/pak0.pk3`:
  13 speaker-policy contracts plus eight q3dm1 speakers sharing one decoded WAV.
- `python scripts/test_spatial_ambient.py --pak D:/Quake3/baseq3/pak0.pk3`:
  42 spatial mixing, resampling, limiting, phase and runtime contracts plus all
  eight audible q3dm1 fire sources.
- `python scripts/test_playable_sky.py --pak D:/Quake3/baseq3/pak0.pk3`: 16
  contracts plus both 256x256 q3dm1 retail sky layers.
- `python scripts/test_playable_match.py`: 25 countdown, announcer, clock, limit and
  intermission contracts.
- `python scripts/test_baseq3_match_display.py --pak D:/Quake3/baseq3/pak0.pk3`:
  38 display contracts plus the retail bigchars atlas and eleven number shaders.
- `python scripts/playable_window_build_test.py`: `/W4 /WX` renderer lifecycle.
- `python scripts/playable_audio_build_test.py`: `/W4 /WX` 16-voice/looping
  WinMM lifecycle and MiniLang FFI boundary.
- `python scripts/playable_ambient_build_test.py`: `/W4 /WX` triple-buffered
  streaming WinMM lifecycle and MiniLang FFI boundary.
- `python scripts/benchmark_playable_world_batch_native.py`: parallel/scalar
  native raster parity and timing benchmark.
- `MiniQuake3.exe --play-smoke-bsp <map.bsp> 3`: real three-frame window run.
- `MiniQuake3.exe --play-smoke <pak0.pk3> maps/q3dm1.bsp 60`: retail material,
  patch, movement, HUD, entity and effects sixty-frame run.

The retail inventory found 591 WAV files in `pak0.pk3`; all use the supported
PCM subset (mono/stereo, 8/16 bit). The direct asset smoke played
`sound/feedback/fight.wav` at 22,050 Hz through WinMM.
The q3dm1 material smoke resolves 78 materials and 89 texture slots through 27 shader scripts;
the expanded 128-slot world-material range covers the full q3dm1 shader table.
The BSP probe found 113 curved q3dm1 patches and 12,203 total tessellated
triangles. The cached visibility probe selects surfaces through face index
2,092, so that geometry is no longer chosen from a fixed first-N prefix.
The q3dm1 entity probe loads 18 gameplay pickups: five health, seven armor,
three ammo and three weapon entities.
The target probe creates five opponents from the six q3dm1 deathmatch spawns,
reserving spawn zero for the player.
