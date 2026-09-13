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
screen clipping, perspective-correct UV, light and per-vertex RGBA interpolation,
alpha and up to 64 uploaded 128x128 BSP lightmaps and 256 world-material texture slots within a 512-slot native registry. Unlightmapped BSP geometry preserves
its independent RGB vertex lighting; lightmapped geometry applies the retail
lightmap exactly once instead of multiplying it by an additional grayscale
vertex-light approximation. A bounded material resolver
reads all `scripts/*.shader` files, follows `map`, `clampMap` and up to eight
`animMap` frames, resolves Quake's TGA/JPEG extension fallback, decodes both image formats,
uses edge-clamped native sampling for `clampMap` while ordinary maps repeat,
applies scroll/scale/rotate/turb/stretch `tcMod` in shader order, evaluates camera-dependent
`tcGen environment` reflection coordinates, enforces `alphaFunc GT0`, `LT128` and `GE128`, and executes opaque,
alpha, additive and multiplicative `filter` stages. Scripted `$lightmap` stages retain their
own BSP slots and UVs, including `GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA` with preserved framebuffer alpha. Quadratic Bezier patch grids are adaptively tessellated with their
base UVs, lightmap UVs and vertex colours. Baseq3 `deformVertexes wave` moves retained
world vertices along their BSP normals with spatial phase and multiple deformations in script order;
q3dm1 uses this for the animated banner and lava surface. Movement uses 800-unit gravity,
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
rocket/grenade impacts add source-anchored projected lights. Impacts and bounded
fallbacks use weapon-colored glows and crosses. Start, jump, pickup, pain, death,
weapon fire and weapon impact actions use original WAV assets from `pak0.pk3`.
The WinMM boundary mixes up to 16 concurrent voices, so fast shots and impacts
no longer cut each other off. Looped-on `target_speaker` entities are extracted
from the BSP. q3dm1's eight fire speakers share one phase-continuous retail WAV
source, but retain individual origins for Baseq3 distance attenuation and
listener-relative stereo panning through a triple-buffered WinMM stream.
The camera-anchored sky follows each BSP's `surfaceparm sky` material. q3dm1
`tim_hell`, q3ctf1 `toxicskytim_blue` and q3dm4 `xtoxicsky_dm9` render their
original two scrolling retail layers with ordered scale/scroll transforms.
Every selectable weapon loads its stock `_flash.md3`; impulse
weapons show it for the source-anchored 20 ms interval, while Gauntlet and
Lightning keep it visible during continuous fire. Its animated `tag_flash`
origin now emits Baseq3's matching RGB dynamic light with the original randomized
300..331-unit radius. That light reaches the BSP, targets, pickups, projectiles
and view weapon through the shared scene-light list.

Five local combat targets are created from the remaining q3dm1 deathmatch
spawns. BSP point traces drive their line of sight. They patrol, chase, strafe
and attack for 7 damage with the stock 100 ms Machinegun interval inside a
900-unit engagement range. They
take 34 damage from the nearest unobstructed hitscan intersection, die after
three hits, award a frag and respawn after three seconds. The player now has
armor absorption, pain/death feedback, a death counter, spawn cycling, a short
spawn protection window and a 1.7-second respawn. Each visible target is now a
complete near-LOD Sarge assembled from the real `lower.md3`, `upper.md3`
and `head.md3` through `tag_torso` and `tag_head`. The `animation.cfg` locomotion
frames are interpolated and both default skin images are decoded from the PK3.
The upper-body pose also interpolates `tag_weapon`; the real 171-triangle
Machinegun and its separate 72-triangle barrel follow that transform and share
the player's RGB light-grid and dynamic-light sampling. The barrel keeps an
independent per-target spin/coast state driven by attack events. The first
20 ms of each enemy shot also render the attached 24-triangle retail
`flash.md3` and add its yellow 300..331-unit light to the shared scene-light
list.
Per-target gameplay events select idle, walk, run, attack, pain, death and
respawn inputs. Near targets use all 795 triangles; medium and far LODs retain
398 and 200 triangles while preserving every model surface. Interpolated MD3
normals now receive position-dependent light from the BSP light grid. The loader
honors `worldspawn`'s `gridsize`, reconstructs the grid from world bounds, applies
Baseq3 overbright scaling, ignores solid-wall samples and trilinearly blends all
eight neighboring ambient, directed and encoded-direction values. Targets,
pickups, projectiles and the first-person weapon share this lighting path. The
result remains separate RGB vertex color through perspective-correct native
rasterization instead of collapsing the map's colored light to grayscale. Each
entity samples once per pose, so the added fidelity does not multiply the work
by every MD3 vertex. Visible players also cast Baseq3's original `markShadow`
blob: a player-sized box trace searches 128 units downward, aligns the 24-unit
mark to the hit plane and fades it by height exactly as `CG_PlayerShadow`.
A bounded pose cache reuses quantized MD3 interpolation results;
world and player materials also share the same 27-script shader index.
Enemy movement is resolved through a player-sized BSP hull with wall sliding,
18-unit steps and ground binding. Their Machinegun attack is now an
instantaneous 7-damage hitscan with the stock 100 ms weapon interval. A final
post-movement BSP trace prevents damage through walls and supplies the endpoint
and normal for the tracer, bullet mark and original Machinegun ricochet sound.
A shot starts at the animated retail Machinegun's transformed `tag_flash`, the
same point used by its flash geometry and dynamic light; the chest-height origin
remains a fallback when retail model data is unavailable. The
first-person view switches to the current original textured weapon MD3.
Its bob, landing motion and idle drift follow `CG_CalculateWeaponPosition`; the
visible model is attached through the complete animated `tag_weapon` transform
loaded from the retail tag-only `_hand.md3`. Viewmodel polygons crossing the
near plane are clipped and retriangulated with interpolated UV and light values
instead of being discarded as whole triangles. The software depth buffer maps
viewmodel fragments into Quake 3's `RF_DEPTHHACK` 0..0.3 range while preserving
the original perspective depth for UV and light interpolation. A contained
parent-position compensation keeps the retail CD Machinegun inside the viewport.
Attack frames
1-6 run at the original 15 fps with interpolated tags. Weapon changes retain
the old model through the mapped drop frames, then hold the new hand at frame
zero during Baseq3's 250 ms raise interval;
Gauntlet, Machinegun and BFG load their retail `_barrel.md3`, attach it through
the weapon's `tag_barrel`, and follow `CG_MachinegunSpinAngle` at full speed
and through its one-second coast with 16-bit angle wrapping;
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
the camera leaf, BSP PVS, frustum, distance and shader-aware planar backface tests to choose
whole visible surfaces. Materials declared with `cull disable` remain selectable from either
side; q3dm1 contains seven such loaded materials. In the current smoke this selects 1,698 triangles
from 321 surfaces across the full face-index range. The full-map q3dm1 material
probe finds seven animated passes, 13 UV-modified passes, 38 blended passes and three
wave-deformed passes. `deformVertexes move` applies a shared waveform displacement;
`bulge` indexes Quake's sine table from base U and time before moving along the
normal. Sampling and deformation UVs stay separate for lightmap stages. Retail
checks exercise one bulge material on q3dm4 and 18 move deformations on q3dm16.
The complete six-value `tcMod transform` matrix composes in declaration order
with scale, scroll and the other UV operations. A q3dm2 retail probe exercises
both transformed `calm_poollight` layers instead of discarding their matrices.
The 55 retained q3dm1 passes are stably ordered by Quake's
explicit shader `sort` value or its opaque, decal, see-through and blended
fallback inference; q3dm1 contributes 84 opaque and three later-sorted materials.
Every retained stage now carries its own parsed depth-write flag and explicit
`depthFunc equal` state into the native rasterizer. q3dm1 contains 84
depth-writing stages and one explicit equal-depth stage; later passes use equal
depth only when the material's first stage actually wrote the surface depth.
Shader-level `polygonOffset` is retained as an isolated material pass and uses
Baseq3's default slope factor -1 and unit factor -2, converted for the native
inverse-depth buffer. This keeps coplanar decals in front without a fixed
world-space displacement.
Fog shaders may contain no ordinary image stage. Their `fogParms` colour and
opaque depth are retained, while BSP fog brushes provide bounds and the visible
clipping plane. A final depth-equal alpha pass applies Quake's quantized
square-root density through the original 256x32 lookup texture. View-dependent
fog coordinates are interpolated across each attributed triangle and sampled
per pixel with bilinear filtering and clamped edges. The q3ctf1 retail check
finds one depth-464 volume and 172 fog-attributed triangles in the full map.
Base textures, shader stages and lightmaps use bilinear sampling around OpenGL
texel centers. Repeating textures interpolate across their wrap boundary;
`clampMap` stages hold the nearest edge texel instead.
Texture uploads also build the full box-filtered mip chain down to 1x1. A
screen-space UV-footprint selects the closest mip level per triangle, reducing
distant shimmer and improving cache locality without changing magnified UI.
Shader-level `nomipmaps` is retained through material loading and disables that
chain for every image in the shader. HUD, menu and match-font uploads also use
the explicit non-mipmapped path, matching Baseq3's 2D image policy.
Retained stages evaluate `rgbGen vertex`, `exactVertex`,
`oneMinusVertex`, `const` and `wave`, plus the corresponding `alphaGen` modes.
The native batch transports an independent RGBA value for every triangle vertex
and interpolates it perspective-correctly before blending and alpha testing.
`alphaGen lightingSpecular` now follows Baseq3's fixed
`[-960, 1980, 96]` light origin, fast vector normalization, reflected view
direction and fourth-power highlight. Seven such material stages are active on
q3ctf1, restoring its view-dependent metal and trim highlights.
Rocket flight and rocket/grenade impacts now use Baseq3's generated 16x16
inverse-square dlight texture. The retained BSP pass projects world XYZ into
the light, rejects triangles with shared clip bits, applies the original Z
attenuation and blends at equal depth with `GL_DST_COLOR GL_ONE`. Sky,
translucent and `SURF_NODLIGHT` materials do not receive the extra pass.
The same scene lights now illuminate players, pickups, projectiles and the
first-person weapon. Their RGB contribution uses Baseq3's inverse-square
entity-light formula, 16-unit minimum distance and magnitude-weighted light
direction, combined with the static BSP light grid.
World impacts retain Baseq3's original bullet, burn, Lightning-hole and plasma
mark textures for ten seconds. Machinegun, Shotgun, Lightning, Rail, Rocket,
Grenade, Plasma and BFG use the stock radii and normal-aligned orientation.
Monochrome marks use the shader's `GL_ZERO GL_ONE_MINUS_SRC_COLOR` framebuffer
darkening; energy marks use alpha blending, the original three-second colour
decay and final one-second alpha fade. Native polygon offset keeps coplanar
marks visible without writing depth, and hits on player models do not leave
marks on the world.
Projectile impacts now also render their retail Baseq3 explosions. Rocket
sprites cross-fade eight `rlboom` frames at 8 Hz for one second; Grenade and
BFG sprites cross-fade their three source frames at 5 Hz for 600 ms. Their
camera-facing quads use `CG_AddSpriteExplosion`'s source time skew, rotation,
16-unit normal offset and 30-to-72-unit growth. Plasma retains the original
`ring02.md3` geometry with `plasmaboom`, normal-aligned orientation, shader
stretch, 999-degree-per-second UV rotation, inverse-sawtooth intensity and
additive blending. Matching impact snapshots remain alive for the source
600/1000 ms intervals, so explosion light and imagery share one clock.
Eleven q3dm1 passes use `rgbGen wave`; their original 1,024-entry waveform phase
is quantized to colour bytes before rasterization. Remaining shader generators
and deformation types, exact lower/upper animation-state
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
- `python scripts/test_bsp_render_data.py`: 56 triangle/lightmap/patch contracts.
- `python scripts/test_playable_materials.py`: 58 BSP/shader/image/generator,
  shader-sort and retained depth-state contracts.
- `playable_triangle_batch_contracts.exe`: 15 record-layout, default-colour and
  independent per-vertex RGBA contracts.
- `python scripts/test_playable_world_batch.py`: 52 retained-command, material-stage,
  sky-filtering and one-call submission contracts; the native lifecycle also
  compares framebuffer pixels and depth bit-for-bit with the scalar path.
- `python scripts/test_playable_movement.py`: 27 gravity/jump/slide/idle contracts.
- `python scripts/test_playable_items.py`: 47 entity/pickup/respawn and separate-ammo contracts.
- `python scripts/test_playable_weapon_inventory.py`: 46 ownership, stock pickup,
  per-weapon ammo, respawn and weapon-selection contracts.
- `python scripts/test_playable_weapon.py`: 37 weapon profile, muzzle, hitscan, ammo and
  cooldown contracts.
- `python scripts/test_playable_muzzle_flash.py --pak D:/Quake3/baseq3/pak0.pk3`:
  30 timing, tag placement, colour and dlight-radius contracts plus nine retail
  flash models, 29 shared textures and 240 triangles.
- `python scripts/test_playable_weapon_barrel.py`: 13 retail barrel mapping,
  spin/coast transition, angle wrapping and rotated-tag contracts.
- `python scripts/test_playable_shotgun.py`: 20 original-source-anchored spread,
  pellet trace, BSP shielding, damage and score contracts.
- `python scripts/test_playable_effects.py`: 32 item/tracer/impact contracts.
- `python scripts/test_playable_marks.py`: 13 Baseq3 weapon-profile, persistent
  lifetime, orientation, de-duplication and colour/alpha-fade contracts.
- `python scripts/test_playable_targets.py`: 29 target/damage/frag contracts.
- `python scripts/test_playable_player.py`: 24 armor/death/respawn contracts.
- `python scripts/test_playable_enemy_ai.py`: 17 AI contracts plus 40 q3dm1
  collision frames.
- `python scripts/test_md3_asset.py`: 38 MD3 contracts, including valid
  tag-only hand models, plus the retail Sarge
  `lower.md3` asset probe.
- `python scripts/test_player_animation.py`: 27 animation.cfg and sampling
  contracts plus a retail Sarge probe.
- `python scripts/test_player_model_assembly.py`: 34 tag hierarchy, transform
  and upper-weapon attachment contracts plus a retail Sarge probe that renders
  the attached 171-triangle Machinegun, 72-triangle barrel and 24-triangle
  muzzle flash, including its dynamic light.
- `python scripts/test_player_skins.py`: 25 skin parser/resolver contracts plus
  decoding of both unique default Sarge textures.
- `python scripts/test_playable_enemy_events.py`: 22 per-target gameplay event
  and animation-input contracts.
- `python scripts/test_player_render_cache.py`: 26 pose-cache, LOD and budget
  contracts.
- `python scripts/test_player_render_quality.py`: 20 complete-model LOD, skin
  and vertex-lighting contracts plus a retail Sarge probe.
- `python scripts/test_playable_light_grid.py --pak D:/Quake3/baseq3/pak0.pk3`:
  18 grid-layout, overbright, trilinear interpolation, wall-sample, RGB diffuse,
  direction, minimum-light and dynamic entity-light contracts plus all 8,514
  q3dm1 grid points.
- `python scripts/test_playable_player_shadows.py --pak D:/Quake3/baseq3/pak0.pk3`:
  nine Baseq3 trace-bounds, distance, fade, orientation and plane contracts plus
  the retail 32x32 `markShadow` texture and ground hits for all five q3dm1 targets.
- `python scripts/test_playable_item_models.py`: 44 pickup-model, material,
  transform and budget contracts plus a retail q3dm1 probe.
- `python scripts/benchmark_playable_item_models.py`: indexed MD3 transform
  benchmark with an exact legacy/new geometry comparison.
- `python scripts/test_world_surface_selection.py`: 30 BSP PVS, frustum,
  shader-controlled two-sided backface, budget and cached-geometry contracts plus a retail q3dm1 probe.
- `python scripts/test_playable_enemy_animation.py`: 29 state-transition and
  one-shot animation contracts.
- `python scripts/test_playable_enemy_movement.py`: 22 collision/step/ground
  contracts plus a retail q3dm1 probe.
- `python scripts/test_playable_enemy_projectiles.py`: 27 spawn, retail-muzzle, flight, BSP,
  player-hit and lifetime contracts.
- `python scripts/test_playable_enemy_hitscan.py`: 12 retail-muzzle Machinegun,
  post-movement BSP shielding, damage-payload and fallback contracts.
- `python scripts/test_playable_player_projectiles.py`: 32 Rocket, Plasma,
  Grenade and BFG flight, grenade bounce/settling, BSP/target, direct/splash
  damage and lifetime contracts.
- `python scripts/test_playable_projectile_view.py`: 36 projected trail, glow,
  impact and fade contracts.
- `python scripts/test_playable_projectile_fx.py`: 34 smoke, particle and light
  contracts plus ten direct anchors in Baseq3 `cg_weapons.c`.
- `python scripts/test_playable_explosions.py --pak D:/Quake3/baseq3/pak0.pk3`:
  13 timing, animation, orientation, growth and shader-transform contracts plus
  15 retail explosion textures and the original one-surface plasma ring model.
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
- `python scripts/test_playable_sky.py --pak D:/Quake3/baseq3/pak0.pk3`: 18
  contracts plus six retail cloud layers across q3dm1, q3ctf1 and q3dm4.
- `python scripts/test_playable_fog.py --pak D:/Quake3/baseq3/pak0.pk3`: seven
  fog-density/overlay contracts plus the q3ctf1 retail fog volume and surfaces.
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
