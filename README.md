# MiniQuake3

Projekt für einen möglichst originalgetreuen Port von Quake III Arena nach MiniLang.
Status: Implementierung läuft. Ein nativer MiniLang-Build mit Zahlenkompatibilität,
Cvars, Parser, PK3/DEFLATE, BSP-Leser, QVM-Interpreter, BSP-/Kurvenkollision,
transformierten Modellen, temporären Boxen, PVS-/Areaportal-Verwaltung,
dynamischer Entity-Kollision, Bewegungsbahnen, Sprungpad-Reaktionen und
dem vollständigen baseq3-Pmove-Befehlszyklus, serverseitigen Item-Pickups,
CTF-Flaggenabläufen, Tournament-/Warmup-Steuerung, Vote-Aufrufen/Stimmabgabe/Auflösung, Teamoverlay,
Passwortstatus, Engine-/Spielmodul-Cvar-Aktualisierung, Namen/Userinfo/Teamwahl,
`ClientConnect` und Sitzungsdaten, Team-/Zuschauerwechsel, Follow-Befehlen, Duell-Warteschlange, `ClientDisconnect`, `ClientBegin`, `ClientSpawn`,
`ClientThink`, `ClientEndFrame`, Intermission-/Levelende-Steuerung und vollständiger
Baseq3-Client-Befehlsverteilung mit Chat/Voice/Cheats/Spielkommandos sowie
serverseitigem Abfeuern aller zehn Baseq3-Waffen, Serverkonsole, IP-Sperren,
Spielarena, Item-/Teaminitialisierung, `G_InitGame`/`G_ShutdownGame` und
Logformatierung sowie allen 48 Kartenklassen einschließlich Türen, Plattformen,
Buttons, Zügen und periodischen Movern ist vorhanden. **Ein spielbarer Preview-Vertical-Slice ist verfügbar; der vollständige Port ist noch in Arbeit.** Maßgeblich sind der
[Portplan in zehn Schritten](docs/PORTPLAN.md) und der
[geprüfte Stand mit offenen Abnahmen](docs/PARITY_AUDIT.md).

## Bauen und prüfen

Python 3 und die Visual-Studio-C++-Toolchain müssen installiert sein. Beim ersten
Aufbau den benachbarten MiniLang-Compiler einfrieren, anschließend bauen:

```powershell
python scripts/inventory.py
.\build.ps1
.\build\MiniQuake3.exe --inspect-map D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp
python scripts/build_qvms.py
.\build\MiniQuake3.exe --qvm-match D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp 20 build/reference/qvms
.\build\MiniQuake3.exe --play-qvm D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp build/reference/qvms
python scripts/verify.py --data-root D:/Quake3
python scripts/verify.py --data-root D:/Quake3 --extended
```

## First playable preview

Double-click `Play-MiniQuake3.cmd`, or run:

```powershell
.\build\MiniQuake3.exe --play D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp
```

The current preview opens a native Windows window and renders `q3dm1` with a
MiniLang-driven software rasterizer, depth buffering, BSP lightmaps and full
RGB vertex lighting. Lightmapped surfaces use their decoded retail lightmap once,
without the former extra grayscale vertex modulation. BSP PVS, frustum and backface selection now draw relevant surfaces
from the complete tessellated map instead of a fixed first-1,000 prefix. Press
Enter in the Baseq3 artwork menu, use WASD and the mouse to move/look,
and Space to jump. Quake-style gravity, friction, ground/air acceleration,
sliding and 18-unit stair steps use the real BSP brush and patch collision world.
The renderer tessellates curved BSP patches, resolves BSP shader names,
reads shader scripts, decodes TGA/JPEG assets and multiplies the base image with
the BSP lightmap. Enter also plays an original WAV loaded from `pak0.pk3`;
Escape returns to the menu and a second Escape quits. Map skies are selected
from `surfaceparm sky`; q3dm1, q3ctf1 and q3dm4 use their own original two-layer
cloud shaders, images and ordered texture transforms. The retained world renderer now
executes q3dm1's animated, scrolling, rotating, alpha and additive material
passes in Quake's explicit and inferred shader-sort order. BSP fog brushes add
their original colour, opaque depth and clipped density over attributed surfaces.
Each retained stage
also applies its parsed `depthWrite` and `depthFunc equal` state. Materials with
`polygonOffset` use Quake's slope-scaled decal depth bias. Retained effect
passes and lightmaps use bilinear texture filtering with Quake-style repeat or
clamped edge sampling. Mipmapped uploads build complete box-filtered chains,
and screen-space UV gradients select a level for minified triangles. Parsed
`nomipmaps` shaders plus the HUD, menu and match font stay on level 0. Retained
passes carry perspective-correct RGBA vertex colours
into the native rasterizer and evaluate `rgbGen vertex`, `exactVertex`,
`oneMinusVertex`, `const` and `wave` together with the corresponding `alphaGen`
modes. Wave generators use the original 1,024-entry phase lookup and byte
quantization. `deformVertexes wave`, `move` and `bulge` animate retained BSP
vertices using Quake's waveform, base-UV and normal rules. Ordered `tcMod transform`
matrices now preserve the scaled and translated water layers used by
the retail maps. Remaining shader generators/deforms and the complete QVM match
loop remain in work. The preview now loads
18 item entities from q3dm1, simulates pickup/respawn, updates a Baseq3-style
HUD from the original number, icon, portrait, crosshair and medal artwork, and fires
the currently held weapon with the left mouse button. Q/E cycles through owned
weapons with separate Baseq3 ammo pools; keys 1-9 directly select owned weapons,
including the Gauntlet on 1. Empty weapons automatically fall back to the highest
usable weapon. The HUD selects the matching original ammo icon. Every stock
weapon uses its original `_flash.md3` muzzle model; Gauntlet and Lightning
retain their continuous firing flash. Each visible flash also contributes the
original 300..331-unit weapon-coloured light to the BSP and nearby models.
Machinegun, Lightning and
Rail use hitscan; the Shotgun fires the original deterministic 11-pellet spread.
Rocket, Plasma, Grenade and BFG travel through the map with original speed,
direct and splash damage, while grenades bounce and settle until their fuse.
Their original retail MD3s and textures are rendered in flight; Plasma uses its
original camera-facing sprite. Source-anchored Rocket/Grenade smoke, Plasma
particles and projectile light overlays accompany them; these RGB lights
illuminate players, pickups, projectiles and the first-person weapon. The audio
boundary now mixes up to 16 effects while q3dm1's looped fire ambience streams with
source-relative attenuation and stereo panning.
Five local targets
come from the remaining q3dm1 deathmatch spawns; they trace BSP line of sight,
patrol, chase, strafe, attack, take damage, die and respawn. Their animated,
skinned model geometry is assembled from the real Sarge `lower.md3`, `upper.md3`
and `head.md3` through `tag_torso` and `tag_head`. Each visible Sarge now carries
the retail Machinegun and separate animated barrel on its interpolated
`tag_weapon`. During its attack event the attached retail `_flash.md3` appears
at the barrel and casts the original yellow 300..331-unit dynamic light.
Armor absorption, player death,
spawn cycling and protection, score/KD, a textured retail first-person
weapon model selected from the current pickup and attached through its original
tag-only `_hand.md3`, including interpolated attack and weapon-change frames,
near-plane-clipped textured geometry, Baseq3's 0..0.3 viewmodel depth range,
tagged spinning/coasting retail barrels and real rotating/bobbing pickup MD3s,
stock weapon fire timing and damage, recoil, hit/kill feedback and 21 decoded
retail weapon sounds make those actions visible and audible. Enemy models now switch between idle, walk, run,
attack, pain, death and respawn animation inputs. Near players use the complete
795-triangle Sarge model with skin-resolved RGB BSP light-grid vertex lighting
and the original height-faded `markShadow` blob; distance LODs
retain every surface. A quantized MD3 cache shares interpolated poses, and the
world/player material paths share one shader index. The Baseq3 HUD now shows the
owned-weapon strip for 1.4 seconds after a switch, enlarges the selected retail
icon and marks empty weapons red. The window title reports a
smoothed live FPS value. Starting Single Player now runs a three-second
countdown with the original `three`, `two`, `one` and `fight` announcements, a
five-minute/ten-frag match clock and a persistent win, loss or tie intermission
from the live score and death counts. Timer, countdown, centerprint and the
sorted intermission scoreboard use the original `bigchars` atlas with stock
shadows and sizing. Prepared camera projection and scanline-bounded
incremental rasterization and an inverse-depth early test reduce the measured
q3dm1 frame time from about 292 ms to roughly 53-65 ms on the development machine
in recent smokes with the two-layer sky and full muzzle asset catalog
(about 32-37 ms update plus 20-29 ms render). The world renderer retains a
base batch and submits the visible animated and blended material passes alongside
it; indexed MD3 surfaces transform each shared
vertex once while preserving per-frame pickup bobbing and rotation.
Enemy movement uses a player-sized BSP collision hull with wall slide, steps and ground
binding. Attacks now use the stock 100 ms Machinegun interval and instantaneous
7-damage hitscan. A final BSP trace shields the player behind walls and drives
the original Machinegun fire, ricochet, tracer and bullet-mark presentation.
Each trace starts at the animated Retail-Machinegun's `tag_flash`, shared with
its muzzle model and dynamic light, with the former chest-height point retained
only as an asset fallback. See
[`docs/PLAYABLE_PREVIEW.md`](docs/PLAYABLE_PREVIEW.md).

## Retail-QVM match path

`--qvm-match` now runs the unmodified, source-rebuilt 1.32b `qagame.qvm` through
`GAME_INIT`, local client connect/begin and fixed 20 Hz frames. The engine reads
the module-owned `playerState_t` and `entityShared_t` memory, links it into the
MiniLang BSP/entity collision world and builds area/PVS-filtered snapshots for
the corresponding `cgame.qvm`. A 64-command input ring drives unchanged
`GAME_CLIENT_THINK`; cgame consumes the same commands for local prediction and
uses real point, box, transformed and capsule world-query traps. Its asset
registrations, scene entities, dynamic lights, 2D drawing and sound submissions
enter the MiniLang renderer/sound queues. Asset handles are deduplicated by
registry type; `refdef_t`, `refEntity_t`, polygons, light-grid queries and
listener/position/loop/music sound commands now have concrete decoded records
for the native backends. Every `R_RenderScene` call is retained as its own view,
so HUD model views no longer overwrite or leak into the main world view. The
current retail frame contains three views and 19 MD3 entities. Their exact
frame/old-frame interpolation, entity axes, per-vertex colours, UVs and normals
expand to 3,381 triangles. Three QVM-registered player skins and Quake's
extension-stripping shader lookup resolve all of them to 16 shader materials and
21 decoded retail textures. The existing native multi-pass raster path then
builds 3,871 draw triangles in 16 retained passes, including environment maps,
blending and texture animation; the retail smoke rejects any untextured triangle.
The third runtime slot now boots the original `ui.qvm`,
reads the built-in arena/bot data, lists add-ons, configs and player assets from
the PK3, keeps its key catcher,
and submits the stock main menu into the same 2D queue. The retail integration
test also observes 58 cgame 2D commands, another 207 UI commands and 26 decoded
sound actions. This path uses only QVM-created gameplay entities;
the five deterministic opponents remain confined to the older graphical preview
until its window backend consumes the new scene queue directly.

`--play-qvm` now runs this path continuously at the original 20 Hz game tick.
WASD, mouse look, Space and the left mouse button become original `usercmd_t`
records for the unchanged qagame QVM; slow render frames catch up simulation
ticks instead of slowing the match clock. All three cgame `refdef_t` submissions
retain their own camera, FOV, viewport and scissor rectangle. The world view uses
BSP PVS/frustum selection, lightmaps, retail sky shaders, fog volumes and projected
dynamic lights, while MD3 entities use interpolated
frames, skin-resolved multi-pass materials, dynamic lights and BSP light-grid
vertex lighting. The cgame 2D stream draws the original textured HUD after 3D.
Its registered start, local, entity, listener, loop and music sound commands are
resolved to retail WAV files, spatially mixed into 16-bit stereo PCM and fed to
the queued WinMM output. Escape opens the interactive original ingame menu;
native key transitions, characters and mouse motion are delivered through
`KEYCATCH_UI`, and the UI's 2D commands share the cgame queue. Original
`R_MarkFragments` calls project impact decals against planar BSP surfaces and
patches. The native window matches the advertised 1280x720 glconfig and reports
smoothed FPS in its title. Original `RegisterFont` data and the UI/cgame `PC_*`
parser traps are implemented, including nested conditional preprocessing,
`defined`, `#undef`, C-precedence integer expressions and function macros with
recursive parameters, `#` stringification and `##` token pasting. RoQ cinematics decode
their VQ video and DPCM audio, render through per-handle RGBA textures behind the
stock 2D UI, and feed PCM into the queued audio output. Shader `videoMap` stages
use the same decoder as silent looping 256x256 scratch textures in world, model
and HUD materials. The retail `video/idlogo.RoQ` probe decodes all 210 512x256
frames to exact EOF. Shared MD3 vertices, persistent transforms, cached material
bindings and retained scene batches cut the measured QVM geometry stage from about 177 to 46.5 ms
per frame. Four scanline workers preserve byte-identical color/depth output while
reducing the median isolated 1280x720 raster benchmark from 82.15 to 37.76 ms per
frame across three final runs (2.16x);
the current 20-frame q3dm1 smoke measures 37.2 ms in rendering and about
103.5 ms for the profiled simulation, geometry, batch and render phases together. The retail smoke
validates three views, thousands of textured QVM triangles, stock HUD/menu quads,
world effects and more than 120 decoded sounds.

Ein vorhandener eingefrorener Compiler liegt unter `artifacts/toolchain/`.
`inventory.py` nur ausführen, wenn dieser Stand bewusst neu festgelegt werden soll.
Die C-Referenz- und Replay-Builds sind im [Prüfbericht](docs/PARITY_AUDIT.md) beschrieben.
Die erweiterte Prüfung vergleicht zusätzlich alle 31 Karten einschließlich
Kurvenflächen und Bewegungsfolgen mit dem Originalcode. Einzelne Spielerbox-Traces
lassen sich direkt mit dem MiniLang-Build ausführen:

```powershell
.\build\MiniQuake3.exe --trace-map D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp 216 1328 128 216 1328 -1024
```

Die sechs Zahlen sind Start- und Zielposition. Verwendet werden die originale
Spielerbox `(-15,-15,-24)` bis `(15,15,32)` und `MASK_PLAYERSOLID`, mit aktiver
Kurvenkollision gegen das Weltmodell.

Bewegungsbefehle lassen sich ohne Grafik auf einer Karte abspielen:

```powershell
.\build\MiniQuake3.exe --pmove-map D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp 216 1328 24 examples/movement.tsv
```

Die TSV-Datei enthält pro Zeile neun ganze Zahlen: Zeit in Millisekunden,
Pitch, Yaw, Roll, Vorwärts, Rechts, Hoch, Buttons und Waffe. Winkel verwenden
Quakes Command-Einheiten (65.536 pro Vollkreis), Bewegungsachsen den Bereich
−128 bis 127. `#` beginnt eine Kommentarzeile. Die Ausgabe zeigt je Befehl Position,
Geschwindigkeit, Bodenkontakt, Wasserstand, Waffenzeit und Ereignisse.
Der Spieler startet mit 100 Gesundheit, Geschwindigkeit 320, Schwerkraft 800 und
Maschinengewehr. Dieser Entwicklungsaufruf verarbeitet statische Weltkollision.
Die dynamische Kollisionsschicht, geometrische Trigger-Abfrage, Sprungpads und
Teleport-Zustandswechsel haben eigene Replays gegen den Originalcode. Hinzu kommen
der vollständige `entityState_t`-Speicherdatensatz, Ereignis-Entities und deren Platzverwaltung.
Die vollständige Spielserverframe-Reihenfolge ist geprüft; eigenständiger Server,
Netzwerk und Grafik bleiben offen:

```powershell
python scripts/test_shared_game.py
python scripts/test_server_world.py D:/Quake3
python scripts/test_server_world.py D:/Quake3 --no-curves
python scripts/test_entitystate.py
python scripts/test_transitions.py D:/Quake3
python scripts/test_transitions.py D:/Quake3 --no-curves
python scripts/test_spawn_values.py
python scripts/test_game_memory.py
python scripts/test_initialization.py
python scripts/test_ip_filters.py
python scripts/test_server_commands.py
python scripts/test_targets.py
python scripts/test_map_objects.py
python scripts/test_mover_push.py
python scripts/test_retail_movers.py D:/Quake3
python scripts/test_arenas.py
python scripts/test_bots.py
python scripts/test_bot_clients.py
python scripts/test_bot_ai_clients.py
python scripts/test_bot_ai_frame.py
python scripts/test_bot_ai_commands.py
python scripts/test_bot_combat_ai.py
python scripts/test_bot_combat_targeting.py
python scripts/test_bot_combat_prediction.py
python scripts/test_bot_attack_move.py
python scripts/test_bot_fight_state.py
python scripts/test_bot_battle_states.py
python scripts/test_bot_seek_state.py
python scripts/test_bot_team_helpers.py
python scripts/test_bot_team_orders.py
python scripts/test_bot_team_strategy.py
python scripts/test_bot_team_leader.py
python scripts/test_bot_team_queries.py
python scripts/test_bot_ctf_both_away.py
python scripts/test_bot_ctf_own_away.py
python scripts/test_bot_ctf_enemy_away.py
python scripts/test_bot_ctf_both_at_base.py
python scripts/test_bot_input.py
python scripts/test_bot_inventory_ai.py
python scripts/test_bot_inventory_update.py
python scripts/test_bot_navigation.py
python scripts/test_bot_population.py
python scripts/test_bot_registry.py
python scripts/test_command_buffer.py
python scripts/test_command_registry.py
python scripts/test_startup_commands.py
python scripts/test_message_state_delta.py
python scripts/test_snapshot_build.py
python scripts/test_snapshot_runtime.py --data-root D:/Quake3
python scripts/test_snapshot_delta.py
python scripts/test_reliable_commands.py
python scripts/test_snapshot_send.py
python scripts/test_server_download.py
python scripts/test_server_pipeline.py
python scripts/test_snapshot_parse.py
python scripts/test_snapshot_command.py
python scripts/test_server_message.py
python scripts/test_gamestate.py
python scripts/test_system_info.py
python scripts/test_download.py
python scripts/test_protocol_runtime.py
python scripts/test_netchan.py
python scripts/test_server_netchan.py
python scripts/test_client_netchan.py
python scripts/test_udp_platform.py
python scripts/test_input_event_queue.py
python scripts/test_oob_connect.py
python scripts/test_connectionless.py
python scripts/test_client_connectionless.py
python scripts/test_packet_event.py
python scripts/test_net_transport.py
python scripts/test_network_pump.py
python scripts/test_server_packet_event.py
python scripts/test_localhost_handshake.py
python scripts/test_server_client_message.py
python scripts/test_client_command_dispatch.py
python scripts/test_server_client_command.py
python scripts/test_server_user_move.py
python scripts/test_server_client_input.py
python scripts/test_server_network_ingress.py
python scripts/test_client_network_ingress.py
python scripts/test_desktop_frame_host.py
python scripts/test_engine_loop.py
python scripts/test_server_client_pings.py
python scripts/test_server_timeouts.py
python scripts/test_server_pause.py
python scripts/test_snapshot_schedule.py
python scripts/test_server_frame.py
python scripts/test_demo.py
python scripts/test_shader_index.py
python scripts/test_shader_parser.py
python scripts/test_tga.py
python scripts/test_image_processing.py
python scripts/test_image_registry.py
python scripts/test_surface_polychain.py
python scripts/test_surface_mesh.py
python scripts/test_surface_md3.py
python scripts/test_model_tags.py
python scripts/test_renderer_view_math.py
python scripts/test_surface_entities.py
python scripts/test_surface_grid.py
python scripts/test_texture_state.py
python scripts/test_renderer_commands.py
python scripts/test_scene_queue.py
python scripts/test_draw_surfs.py
python scripts/test_audio_mixer_transfer.py
python scripts/test_audio_channel_paint.py
python scripts/test_playable_viewer.py
python scripts/test_bsp_preview.py
python scripts/playable_window_build_test.py
python scripts/test_vm_runtime.py
python scripts/test_vm_syscall_common.py
python scripts/test_vm_syscall_qagame.py
python scripts/test_vm_syscall_qagame_world.py
python scripts/test_game_vm_lifecycle.py
python scripts/test_cgame_vm_lifecycle.py
python scripts/test_cgame_time.py
python scripts/test_vm_syscall_cgame.py
python scripts/test_ui_vm_lifecycle.py
python scripts/test_vm_syscall_ui.py
python scripts/test_vm_syscall_ui_media.py
python scripts/test_pure_filesystem.py
python scripts/test_combat.py --data-root D:/Quake3
python scripts/test_missiles.py --data-root D:/Quake3
python scripts/test_weapons.py
python scripts/test_bodies.py --data-root D:/Quake3
python scripts/test_scores.py
python scripts/test_deaths.py
python scripts/test_items.py
python scripts/test_client_spawn.py
python scripts/test_client_begin.py
python scripts/test_client_info.py
python scripts/test_client_connect.py
python scripts/test_client_frame.py
python scripts/test_client_main_frame.py
python scripts/test_client_think.py
python scripts/test_tournament.py
python scripts/test_votes.py
python scripts/test_vote_commands.py
python scripts/test_team_status.py
python scripts/test_game_cvars.py
python scripts/test_full_frame.py
python scripts/test_spawn.py D:/Quake3
```

Die Schnittstellen und ihre Grenzen sind unter
[Server-Kollision](docs/SERVER_COLLISION.md) und
[Trigger-/Teleport-Übergänge](docs/GAME_TRANSITIONS.md) beschrieben.
Das [Spawn-Parsing](docs/SPAWNING.md) übernimmt inzwischen Worldspawn, Feld- und
Spielmodusregeln sowie alle 48 Objektklassen. Sprungpads, Teleporter und Mover werden aus dem
Kartentext angelegt und nach verzögerter Zielsuche mit echten Kontakten geprüft.
Hinzu kommen [Target-Ketten und Ereignisverarbeitung](docs/TARGETS_AND_EVENTS.md):
verzögerte Targets, Relays, Mehrfach-/Always-Trigger, Shader-Remaps und die
Entity-Schleife mit Ablauf und Freigabe temporärer Ereignisse.
[Give-/Powerup-/Score-/Print-Targets](docs/MAP_TARGETS.md) und
[Portalflächen und -kameras](docs/PORTALS.md) sind ebenfalls eingebunden.
Sound-Targets, gerichtete Push-Targets, schaltbare Timer und Ortsmarkierungen
führen inzwischen ebenfalls ihre ursprünglichen Serverregeln aus.
Die [Schadensberechnung](docs/COMBAT.md) ergänzt Rüstung, Rückstoß, Teamschutz,
Battlesuit, CTF-Trägerdaten, Sichtlinien und Radius-Schaden sowie `trigger_hurt`,
`target_kill` und `target_laser`; Telefrags sind
damit verbunden. Weitere Klassen und vollständige Engine-/Match-Replays
bleiben offen.
[Projektile und Shooter](docs/MISSILES.md) ergänzen Raketen, Granaten, Plasma,
BFG, Grappling-Hook und drei schießende Kartenobjekte mit echter Server-Kollision.
[Spawnpunkte und Leichen](docs/PLAYER_LIFECYCLE.md) ergänzen Deathmatch-/CTF-/
Zuschauer-Auswahl, Leichen-Warteschlange, Gibs und Leichenphysik.
[Spieler-Tod und Team-Boni](docs/DEATHS.md) verbinden Schaden, Scores, Hooks,
Flaggenentscheidungen, Todesanimationen und den Respawn-Wrapper. Der vollständige
[`ClientSpawn`-Ablauf](docs/CLIENT_SPAWN.md) initialisiert Spieler, Startinventar,
Spawnfilter, Targets und Snapshots. [`ClientEndFrame`](docs/CLIENT_FRAMES.md)
verarbeitet Powerups, Umwelt- und Schadensfeedback, Zuschauer-Follow und
vorhersagbare Ereignis-Entities. [`ClientThink`](docs/CLIENT_THINK.md) verbindet
Usercmd, Pmove, dynamische Kollision, Trigger, Ereignisse, Timer, Respawn und
Snapshots in der Originalreihenfolge. [Items und
Flaggen](docs/ITEMS.md) ergänzen Karten- und Drop-Entities, sämtliche Baseq3-
Pickups, Respawn, Physik sowie Flaggenaufnahme, Rückgabe und Capture.
[Punkte, Ranglisten und Scoreboards](docs/SCORES.md) sowie Sudden Death,
Matchlimits und Bereitschaftsregeln sind gegen C geprüft und in `player_die`
eingebunden. Netzwerkübertragung und tatsächliche Kartenwechsel bleiben offen.
[`ClientBegin`](docs/CLIENT_BEGIN.md) verbindet diese Bausteine zu einem
durchgängigen Eintritts-, Spawn-, Think-, Frame- und Ranglistenablauf.
[Namen, Userinfo und Teamwahl](docs/CLIENT_INFO.md) verarbeiten inzwischen
Spielerangaben, Handicap, Modelle und Player-Configstrings originalgetreu.
Teamleiterwechsel verwenden diese Verarbeitung standardmäßig.
[`ClientConnect` und Sitzungsdaten](docs/CLIENT_CONNECT.md) ergänzen die
Anmelderegeln, Client-Reset, Wiederverbindung und Speicherung über Levelwechsel.
[IP-Filter](docs/IP_FILTERS.md) liefern jetzt die Standardentscheidung. Der
Bot-Lifecycle-Kern für Setup, Map-Reset, Shutdown und Interbreed-Matchende ist
portiert, geprüft und als Standard in Lifecycle und Intermission eingebunden.
Bot-/Arena-Registry, Spawnqueue und Bot-Connect/-Disconnect sind ebenfalls portiert
und in Lifecycle, Anmeldung, Abmeldung und Frameablauf eingebunden.
Die [Bot-Navigation](docs/BOT_AI_FRAME.md) umfasst nun auch die zusammenhängende
Luft-, Nahziel-, Zielabschluss- und Item-Langzeitzielroute aus `ai_dmnet.c`.
[Team-/Zuschauerwechsel und `ClientDisconnect`](docs/TEAM_CHANGES.md) verbinden
den `team`-Befehl mit Tod, Leichenverwaltung, Item-/Flaggenabgabe, Teamleitern,
Userinfo, erneutem Spawn und Ranglisten. Die Zuschauerfreigabe beim Disconnect
und die Tournament-Siegregel sind gegen C geprüft.
[Follow-Befehle und die Duell-Warteschlange](docs/FOLLOW_TOURNAMENT.md) ergänzen
Zielsuche, Zuschauer-Angriffstaste, automatisches Nachrücken sowie Gewinner-/
Verliererwechsel mit tatsächlichen Team-, Spawn- und Rangabläufen.
[Intermission und Levelende](docs/INTERMISSION.md) verbinden diese Funktionen
mit Kameraplatzierung, Respawn, Scoreboards und Sitzungsspeicherung, bevor
Maprestart oder `nextmap` bei der Engine angefordert werden.
Die vollständige [Client-Befehlsverteilung](docs/CLIENT_COMMANDS.md) verbindet alle
Baseq3-Handler: Chat/Voice, Taunts, Cheats, Items, Suicide, Teamtask und Teleport
sowie die bestehenden Score-/Team-/Follow-/Vote-Abläufe.
Die [Serverkonsole](docs/SERVER_COMMANDS.md) ergänzt Administration und
Dedizierten-Serverchat. [Item- und Entity-Teaminitialisierung](docs/GAME_INITIALIZATION.md)
sowie die [Spielarena mit Spawn-Strings](docs/GAME_MEMORY.md) sind in den
[Spielmodul-Start und -Shutdown](docs/GAME_LIFECYCLE.md) eingebunden.
Die [Logausgabe](docs/GAME_LOGGING.md) ergänzt originale Zeitstempel sowie
die Reihenfolge von Dedicated-Konsole und Dateizustellung.
[`Tournament und Warmup`](docs/TOURNAMENT.md) steuert Spielerbereitschaft,
Countdown und Maprestart. [`G_RunFrame`](docs/FULL_FRAME.md) führt Entity- und
Clientframes, Tournament, Matchende und [globale/Team-Abstimmungen](docs/VOTES.md)
in Originalreihenfolge aus. Auch Teamleiterwechsel sowie
[Teamstandorte, Overlay-Nachrichten und Passwortstatus](docs/TEAM_STATUS.md)
sind portiert. Die [Engine-/Spielmodul-Cvar-Aktualisierung](docs/GAME_CVARS.md)
ist standardmäßig eingebunden. Engine-VM-Neuladen, Kartenwechsel, fehlende
Spielobjekte und Netzwerkzustellung bleiben offen.

Auch die Sichtbarkeitsdaten eines Kartenpunkts und Traces gegen versetzte/gedrehte
Modelle sind direkt abfragbar:

```powershell
.\build\MiniQuake3.exe --inspect-visibility D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp 216 1328 24
.\build\MiniQuake3.exe --trace-model D:/Quake3/baseq3/pak0.pk3 maps/q3dm1.bsp 0 216 1328 128 216 1328 -1024 0 0 0 0 0 0
```

Nach dem Modellindex folgen Start, Ziel, Modellursprung und drei Winkel in Grad
(Pitch, Yaw, Roll). Modell 0 bezeichnet die Welt, höhere Indizes Inline-Modelle.
Die Sichtbarkeitsabfrage zeigt Blatt, Cluster und Bereich sowie die Zahl sichtbarer
Cluster und verbundener Bereiche. Areaportale sind nach dem Kartenladen geschlossen;
die Steuerung durch Türen folgt mit dem Spielserver.

## Quellcode und Projektstruktur

```text
MiniQuake3/
  Quake-III-Arena-original-source/  Lokaler Git-Fork des vollständigen id-Software-Repositories
  docs/PORTPLAN.md                 Zehn Schritte mit Abnahmekriterien
  docs/UPSTREAM.md                 Herkunft, Revision und Reproduktion
  docs/PARITY_AUDIT.md             Geprüfte Eigenschaften und offene Arbeit
  src/                            MiniLang-Implementierungen
  native/abi.c                    Drei Float-/Bit-Konvertierungen für die ABI
  tests/                          MiniLang-Tests und separate C-Referenztreiber
  scripts/                        Build- und Vergleichsautomation
  PORT_LEDGER.json                 Inventar und Zuordnung der Originaldateien
  README.md
```

Der erste Netzwerkprotokoll-Baustein lässt sich separat gegen die unveränderten
Baseq3-Funktionskörper prüfen:

```powershell
python scripts/test_message.py
python scripts/test_huffman_message.py
python scripts/test_message_delta.py
python scripts/test_snapshot_parse.py
python scripts/test_snapshot_command.py
python scripts/test_server_message.py
python scripts/test_gamestate.py
```

Der Client-Gegenpfad enthält `CL_DeltaEntity` und `CL_ParsePacketEntities` mit
15 Merge-Verträgen. `CL_ParseSnapshot` ist davon getrennt gegen drei unveränderte
Funktionen aus `client/cl_parse.c` geprüft: vier vollständige Zustandsübergänge
und zehn Verträge decken Voll- und Deltaframes, Ringablage, Validierung, Ping und
ungültige, aber vollständig konsumierte Frames ab. Details stehen in
[MESSAGE_IO.md](docs/MESSAGE_IO.md). Darüber liegt der portierte
`CL_ParseServerMessage`-Dispatcher: drei direkte C-Zustandsübergänge und zehn
Verträge prüfen Reliable-Acknowledgements, Befehlsring, Duplikate sowie
`nop`/`snapshot`/`EOF`. `CL_ParseGamestate` ist separat für Configstrings,
Baselines, `clientNum` und Checksum-Feed portiert. Ein direkter Original-C-
Übergang und zwölf Verträge prüfen außerdem BigString, Reset und
Abschlusscallbacks.

Der [offizielle Quellcode](https://github.com/id-Software/Quake-III-Arena)
ist als Git-Submodul eingebunden. Der lokale Entwicklungsbranch heißt `miniquake3`,
das Quellrepository ist als Remote `upstream` eingetragen. Es wurde kein Fork auf
GitHub veröffentlicht. Der Referenzstand ist unverändert und im übergeordneten
Repository durch den Submodul-Commit fixiert.

Nach einem späteren Clone dieses Projekts den Quellcode so laden:

```powershell
git submodule update --init --recursive
```

Ziel ist zunächst Windows x64 mit dem benachbarten `MiniLangCompilerML`.
Die Engine, Spielregeln, Clientlogik, Bots und der Renderer sollen in MiniLang
entstehen. Kleine native Brücken bleiben für Betriebssystem- und Grafikzugriffe
möglich; jede Ausnahme wird dokumentiert. Linux x64 folgt nach der Referenzabnahme.

Quake III Arena (`baseq3`) ist die erste vollständige Abnahme; die im Quellcode
vorhandenen Team-Arena-Pfade werden separat erfasst. Editor und Asset-Werkzeuge
bleiben als Originalquellen erhalten und sind kein Teil der ersten Laufzeit-Portierung.

## Originalquellen und Spieldaten

Die Original-Lizenz und Hinweise bleiben unter
[COPYING.txt](Quake-III-Arena-original-source/COPYING.txt) und
[README.txt](Quake-III-Arena-original-source/README.txt) erhalten, einschließlich
der dort genannten Drittanbieter-Komponenten. Abgeleitete Portdateien tragen
Herkunft und GPL-2.0-or-later-Hinweise; siehe [NOTICE.md](NOTICE.md).

Kommerzielle Spieldaten sind nicht enthalten. Für Originalkarten, Modelle,
Texturen, Audio und Referenztests wird eine eigene Quake-III-Installation benötigt.
Lokale Daten und erzeugte Prüfergebnisse gehören in die ignorierten Verzeichnisse
`data/` beziehungsweise `artifacts/`.
