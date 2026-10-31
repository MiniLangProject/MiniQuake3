# Vollständiger Original-/Port-Abgleich

Diese Datei wird mit `python scripts/parity_inventory.py` aus
`PORT_LEDGER.json` erzeugt. Sie zählt jede C-, Header- und ASM-Originaldatei
der Kategorien Runtime, Plattform und Missionpack genau einmal.

Die Spalte **Quellport** beschreibt native MiniLang-Abdeckung. Die unveränderten
Baseq3-Module `qagame.qvm`, `cgame.qvm` und `ui.qvm` laufen zusätzlich im
MiniLang-QVM-Interpreter. Dadurch können Spielfunktionen produktiv vorhanden sein,
obwohl die jeweilige C-Datei noch nicht als nativer MiniLang-Quellport gilt.
Der effektive Status wird absichtlich strenger als das Ledger berechnet: Eine dort
als `ported` markierte Datei mit noch offenen Originalsymbolen zählt hier als
`partial`. So kann ein Dateihaken keine fehlende Funktion verdecken.

## Zusammenfassung

| Bereich | Dateien | Portiert | Teilweise | Nicht begonnen | Original behalten |
|---|---:|---:|---:|---:|---:|
| `botlib` | 53 | 49 | 4 | 0 | 0 |
| `cgame` | 25 | 24 | 1 | 0 | 0 |
| `client` | 19 | 19 | 0 | 0 | 0 |
| `game` | 65 | 49 | 16 | 0 | 0 |
| `macosx` | 8 | 8 | 0 | 0 | 0 |
| `null` | 7 | 0 | 7 | 0 | 0 |
| `q3_ui` | 47 | 47 | 0 | 0 | 0 |
| `qcommon` | 27 | 19 | 8 | 0 | 0 |
| `renderer` | 27 | 12 | 15 | 0 | 0 |
| `server` | 11 | 8 | 3 | 0 | 0 |
| `splines` | 8 | 2 | 6 | 0 | 0 |
| `ui` | 12 | 12 | 0 | 0 | 0 |
| `unix` | 13 | 13 | 0 | 0 | 0 |
| `win32` | 13 | 12 | 1 | 0 | 0 |
| **Gesamt** | **335** | **274** | **61** | **0** | **0** |

Offene Originalsymbole: **1011** in **61** gegenüber dem Ledger herabgestuften Dateien.

`partial` bedeutet, dass mindestens ein Originalpfad belegt ist, aber weiterhin
offene Symbole oder ausdrücklich dokumentierte Grenzen bestehen. `not_started`
ist eine echte Quellport-Lücke; Builddateien und Drittanbieterquellen sind nicht
Teil dieser Tabelle.

## Datei- und Symbolmatrix

| Originaldatei | Bereich | Effektiv | Ledger | Symbole | Gemappt | Offen |
|---|---|---|---|---:|---:|---:|
| `code/botlib/aasfile.h` | `botlib` | `ported` | `ported` | 0 | 0 | 0 |
| `code/botlib/be_aas_bsp.h` | `botlib` | `ported` | `ported` | 19 | 19 | 0 |
| `code/botlib/be_aas_bspq3.c` | `botlib` | `ported` | `ported` | 21 | 21 | 0 |
| `code/botlib/be_aas_cluster.c` | `botlib` | `ported` | `ported` | 31 | 31 | 0 |
| `code/botlib/be_aas_cluster.h` | `botlib` | `ported` | `ported` | 2 | 2 | 0 |
| `code/botlib/be_aas_debug.c` | `botlib` | `ported` | `ported` | 19 | 19 | 0 |
| `code/botlib/be_aas_debug.h` | `botlib` | `ported` | `ported` | 15 | 15 | 0 |
| `code/botlib/be_aas_def.h` | `botlib` | `ported` | `ported` | 28 | 28 | 0 |
| `code/botlib/be_aas_entity.c` | `botlib` | `ported` | `ported` | 15 | 15 | 0 |
| `code/botlib/be_aas_entity.h` | `botlib` | `ported` | `ported` | 14 | 14 | 0 |
| `code/botlib/be_aas_file.c` | `botlib` | `ported` | `ported` | 8 | 8 | 0 |
| `code/botlib/be_aas_file.h` | `botlib` | `ported` | `ported` | 4 | 4 | 0 |
| `code/botlib/be_aas_funcs.h` | `botlib` | `ported` | `ported` | 0 | 0 | 0 |
| `code/botlib/be_aas_main.c` | `botlib` | `ported` | `ported` | 17 | 17 | 0 |
| `code/botlib/be_aas_main.h` | `botlib` | `ported` | `ported` | 13 | 13 | 0 |
| `code/botlib/be_aas_move.c` | `botlib` | `ported` | `ported` | 19 | 19 | 0 |
| `code/botlib/be_aas_move.h` | `botlib` | `ported` | `ported` | 13 | 13 | 0 |
| `code/botlib/be_aas_optimize.c` | `botlib` | `ported` | `ported` | 8 | 8 | 0 |
| `code/botlib/be_aas_optimize.h` | `botlib` | `ported` | `ported` | 1 | 1 | 0 |
| `code/botlib/be_aas_reach.c` | `botlib` | `ported` | `ported` | 53 | 53 | 0 |
| `code/botlib/be_aas_reach.h` | `botlib` | `ported` | `ported` | 17 | 17 | 0 |
| `code/botlib/be_aas_route.c` | `botlib` | `ported` | `ported` | 51 | 51 | 0 |
| `code/botlib/be_aas_route.h` | `botlib` | `ported` | `ported` | 14 | 14 | 0 |
| `code/botlib/be_aas_routealt.c` | `botlib` | `ported` | `ported` | 4 | 4 | 0 |
| `code/botlib/be_aas_routealt.h` | `botlib` | `ported` | `ported` | 3 | 3 | 0 |
| `code/botlib/be_aas_sample.c` | `botlib` | `ported` | `ported` | 28 | 28 | 0 |
| `code/botlib/be_aas_sample.h` | `botlib` | `ported` | `ported` | 23 | 23 | 0 |
| `code/botlib/be_ai_char.c` | `botlib` | `ported` | `ported` | 19 | 19 | 0 |
| `code/botlib/be_ai_chat.c` | `botlib` | `ported` | `ported` | 60 | 60 | 0 |
| `code/botlib/be_ai_gen.c` | `botlib` | `ported` | `ported` | 2 | 2 | 0 |
| `code/botlib/be_ai_goal.c` | `botlib` | `ported` | `ported` | 43 | 43 | 0 |
| `code/botlib/be_ai_move.c` | `botlib` | `ported` | `ported` | 67 | 67 | 0 |
| `code/botlib/be_ai_weap.c` | `botlib` | `ported` | `ported` | 14 | 14 | 0 |
| `code/botlib/be_ai_weight.c` | `botlib` | `ported` | `ported` | 24 | 24 | 0 |
| `code/botlib/be_ai_weight.h` | `botlib` | `ported` | `ported` | 16 | 16 | 0 |
| `code/botlib/be_ea.c` | `botlib` | `ported` | `ported` | 32 | 32 | 0 |
| `code/botlib/be_interface.c` | `botlib` | `partial` | `ported` | 16 | 0 | 16 |
| `code/botlib/be_interface.h` | `botlib` | `ported` | `ported` | 6 | 6 | 0 |
| `code/botlib/l_crc.c` | `botlib` | `partial` | `ported` | 5 | 0 | 5 |
| `code/botlib/l_crc.h` | `botlib` | `ported` | `ported` | 0 | 0 | 0 |
| `code/botlib/l_libvar.c` | `botlib` | `partial` | `ported` | 13 | 0 | 13 |
| `code/botlib/l_libvar.h` | `botlib` | `ported` | `ported` | 0 | 0 | 0 |
| `code/botlib/l_log.c` | `botlib` | `ported` | `ported` | 7 | 7 | 0 |
| `code/botlib/l_log.h` | `botlib` | `ported` | `ported` | 7 | 7 | 0 |
| `code/botlib/l_memory.c` | `botlib` | `ported` | `ported` | 9 | 9 | 0 |
| `code/botlib/l_memory.h` | `botlib` | `ported` | `ported` | 14 | 14 | 0 |
| `code/botlib/l_precomp.c` | `botlib` | `ported` | `ported` | 82 | 82 | 0 |
| `code/botlib/l_precomp.h` | `botlib` | `ported` | `ported` | 49 | 49 | 0 |
| `code/botlib/l_script.c` | `botlib` | `partial` | `ported` | 39 | 1 | 38 |
| `code/botlib/l_script.h` | `botlib` | `ported` | `ported` | 106 | 106 | 0 |
| `code/botlib/l_struct.c` | `botlib` | `ported` | `ported` | 9 | 9 | 0 |
| `code/botlib/l_struct.h` | `botlib` | `ported` | `ported` | 16 | 16 | 0 |
| `code/botlib/l_utils.h` | `botlib` | `ported` | `ported` | 4 | 4 | 0 |
| `code/cgame/cg_consolecmds.c` | `cgame` | `ported` | `ported` | 40 | 40 | 0 |
| `code/cgame/cg_draw.c` | `cgame` | `ported` | `ported` | 49 | 49 | 0 |
| `code/cgame/cg_drawtools.c` | `cgame` | `ported` | `ported` | 25 | 25 | 0 |
| `code/cgame/cg_effects.c` | `cgame` | `ported` | `ported` | 16 | 16 | 0 |
| `code/cgame/cg_ents.c` | `cgame` | `ported` | `ported` | 18 | 18 | 0 |
| `code/cgame/cg_event.c` | `cgame` | `ported` | `ported` | 7 | 7 | 0 |
| `code/cgame/cg_info.c` | `cgame` | `ported` | `ported` | 5 | 5 | 0 |
| `code/cgame/cg_local.h` | `cgame` | `ported` | `ported` | 0 | 0 | 0 |
| `code/cgame/cg_localents.c` | `cgame` | `ported` | `ported` | 20 | 20 | 0 |
| `code/cgame/cg_main.c` | `cgame` | `ported` | `ported` | 44 | 44 | 0 |
| `code/cgame/cg_marks.c` | `cgame` | `ported` | `ported` | 28 | 28 | 0 |
| `code/cgame/cg_newdraw.c` | `cgame` | `ported` | `ported` | 72 | 72 | 0 |
| `code/cgame/cg_particles.c` | `cgame` | `ported` | `ported` | 23 | 23 | 0 |
| `code/cgame/cg_players.c` | `cgame` | `ported` | `ported` | 36 | 36 | 0 |
| `code/cgame/cg_playerstate.c` | `cgame` | `ported` | `ported` | 8 | 8 | 0 |
| `code/cgame/cg_predict.c` | `cgame` | `ported` | `ported` | 8 | 8 | 0 |
| `code/cgame/cg_public.h` | `cgame` | `ported` | `ported` | 0 | 0 | 0 |
| `code/cgame/cg_scoreboard.c` | `cgame` | `ported` | `ported` | 5 | 5 | 0 |
| `code/cgame/cg_servercmds.c` | `cgame` | `ported` | `ported` | 23 | 23 | 0 |
| `code/cgame/cg_snapshot.c` | `cgame` | `ported` | `ported` | 7 | 7 | 0 |
| `code/cgame/cg_syscalls.asm` | `cgame` | `partial` | `ported` | 102 | 0 | 102 |
| `code/cgame/cg_syscalls.c` | `cgame` | `ported` | `ported` | 96 | 96 | 0 |
| `code/cgame/cg_view.c` | `cgame` | `ported` | `ported` | 20 | 20 | 0 |
| `code/cgame/cg_weapons.c` | `cgame` | `ported` | `ported` | 35 | 35 | 0 |
| `code/cgame/tr_types.h` | `cgame` | `ported` | `ported` | 0 | 0 | 0 |
| `code/client/cl_cgame.c` | `client` | `ported` | `ported` | 22 | 22 | 0 |
| `code/client/cl_cin.c` | `client` | `ported` | `ported` | 38 | 38 | 0 |
| `code/client/cl_console.c` | `client` | `ported` | `ported` | 22 | 22 | 0 |
| `code/client/cl_input.c` | `client` | `ported` | `ported` | 78 | 78 | 0 |
| `code/client/cl_keys.c` | `client` | `ported` | `ported` | 26 | 26 | 0 |
| `code/client/cl_main.c` | `client` | `ported` | `ported` | 78 | 78 | 0 |
| `code/client/cl_net_chan.c` | `client` | `ported` | `ported` | 5 | 5 | 0 |
| `code/client/cl_parse.c` | `client` | `ported` | `ported` | 9 | 9 | 0 |
| `code/client/cl_scrn.c` | `client` | `ported` | `ported` | 18 | 18 | 0 |
| `code/client/cl_ui.c` | `client` | `ported` | `ported` | 35 | 35 | 0 |
| `code/client/client.h` | `client` | `ported` | `ported` | 0 | 0 | 0 |
| `code/client/keys.h` | `client` | `ported` | `ported` | 0 | 0 | 0 |
| `code/client/snd_adpcm.c` | `client` | `ported` | `ported` | 4 | 4 | 0 |
| `code/client/snd_dma.c` | `client` | `ported` | `ported` | 42 | 42 | 0 |
| `code/client/snd_local.h` | `client` | `ported` | `ported` | 0 | 0 | 0 |
| `code/client/snd_mem.c` | `client` | `ported` | `ported` | 12 | 12 | 0 |
| `code/client/snd_mix.c` | `client` | `ported` | `ported` | 8 | 8 | 0 |
| `code/client/snd_public.h` | `client` | `ported` | `ported` | 0 | 0 | 0 |
| `code/client/snd_wavelet.c` | `client` | `ported` | `ported` | 9 | 9 | 0 |
| `code/game/ai_chat.c` | `game` | `ported` | `ported` | 24 | 24 | 0 |
| `code/game/ai_chat.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/ai_cmd.c` | `game` | `ported` | `ported` | 41 | 41 | 0 |
| `code/game/ai_cmd.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/ai_dmnet.c` | `game` | `ported` | `ported` | 35 | 35 | 0 |
| `code/game/ai_dmnet.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/ai_dmq3.c` | `game` | `ported` | `ported` | 114 | 114 | 0 |
| `code/game/ai_dmq3.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/ai_main.c` | `game` | `ported` | `ported` | 37 | 37 | 0 |
| `code/game/ai_main.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/ai_team.c` | `game` | `ported` | `ported` | 28 | 28 | 0 |
| `code/game/ai_team.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/ai_vcmd.c` | `game` | `ported` | `ported` | 16 | 16 | 0 |
| `code/game/ai_vcmd.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/be_aas.h` | `game` | `ported` | `ported` | 59 | 59 | 0 |
| `code/game/be_ai_char.h` | `game` | `ported` | `ported` | 8 | 8 | 0 |
| `code/game/be_ai_chat.h` | `game` | `ported` | `ported` | 34 | 34 | 0 |
| `code/game/be_ai_gen.h` | `game` | `ported` | `ported` | 1 | 1 | 0 |
| `code/game/be_ai_goal.h` | `game` | `ported` | `ported` | 38 | 38 | 0 |
| `code/game/be_ai_move.h` | `game` | `ported` | `ported` | 52 | 52 | 0 |
| `code/game/be_ai_weap.h` | `game` | `ported` | `ported` | 16 | 16 | 0 |
| `code/game/be_ea.h` | `game` | `ported` | `ported` | 27 | 27 | 0 |
| `code/game/bg_lib.c` | `game` | `ported` | `ported` | 33 | 33 | 0 |
| `code/game/bg_lib.h` | `game` | `ported` | `ported` | 51 | 51 | 0 |
| `code/game/bg_local.h` | `game` | `ported` | `ported` | 37 | 37 | 0 |
| `code/game/bg_misc.c` | `game` | `partial` | `ported` | 12 | 10 | 2 |
| `code/game/bg_pmove.c` | `game` | `partial` | `ported` | 42 | 39 | 3 |
| `code/game/bg_public.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/bg_slidemove.c` | `game` | `ported` | `ported` | 2 | 2 | 0 |
| `code/game/botlib.h` | `game` | `ported` | `ported` | 59 | 59 | 0 |
| `code/game/chars.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/g_active.c` | `game` | `partial` | `ported` | 17 | 16 | 1 |
| `code/game/g_arenas.c` | `game` | `ported` | `ported` | 8 | 8 | 0 |
| `code/game/g_bot.c` | `game` | `partial` | `ported` | 24 | 22 | 2 |
| `code/game/g_client.c` | `game` | `partial` | `ported` | 25 | 23 | 2 |
| `code/game/g_cmds.c` | `game` | `ported` | `ported` | 37 | 37 | 0 |
| `code/game/g_combat.c` | `game` | `partial` | `ported` | 19 | 13 | 6 |
| `code/game/g_items.c` | `game` | `partial` | `ported` | 22 | 21 | 1 |
| `code/game/g_local.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/g_main.c` | `game` | `partial` | `ported` | 36 | 31 | 5 |
| `code/game/g_mem.c` | `game` | `ported` | `ported` | 3 | 3 | 0 |
| `code/game/g_misc.c` | `game` | `partial` | `ported` | 20 | 14 | 6 |
| `code/game/g_missile.c` | `game` | `partial` | `ported` | 17 | 9 | 8 |
| `code/game/g_mover.c` | `game` | `partial` | `ported` | 37 | 3 | 34 |
| `code/game/g_public.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/g_rankings.c` | `game` | `ported` | `ported` | 17 | 17 | 0 |
| `code/game/g_rankings.h` | `game` | `ported` | `ported` | 257 | 257 | 0 |
| `code/game/g_session.c` | `game` | `ported` | `ported` | 5 | 5 | 0 |
| `code/game/g_spawn.c` | `game` | `ported` | `ported` | 13 | 13 | 0 |
| `code/game/g_svcmds.c` | `game` | `ported` | `ported` | 11 | 11 | 0 |
| `code/game/g_syscalls.asm` | `game` | `partial` | `ported` | 194 | 0 | 194 |
| `code/game/g_syscalls.c` | `game` | `ported` | `ported` | 185 | 185 | 0 |
| `code/game/g_target.c` | `game` | `ported` | `ported` | 28 | 28 | 0 |
| `code/game/g_team.c` | `game` | `partial` | `ported` | 45 | 32 | 13 |
| `code/game/g_team.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/g_trigger.c` | `game` | `partial` | `ported` | 20 | 19 | 1 |
| `code/game/g_utils.c` | `game` | `partial` | `ported` | 24 | 18 | 6 |
| `code/game/g_weapon.c` | `game` | `partial` | `ported` | 27 | 21 | 6 |
| `code/game/inv.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/match.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/q_math.c` | `game` | `ported` | `ported` | 57 | 57 | 0 |
| `code/game/q_shared.c` | `game` | `ported` | `ported` | 59 | 59 | 0 |
| `code/game/q_shared.h` | `game` | `ported` | `ported` | 19 | 19 | 0 |
| `code/game/surfaceflags.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/game/syn.h` | `game` | `ported` | `ported` | 0 | 0 | 0 |
| `code/macosx/CGMouseDeltaFix.h` | `macosx` | `ported` | `ported` | 0 | 0 | 0 |
| `code/macosx/CGPrivateAPI.h` | `macosx` | `ported` | `ported` | 0 | 0 | 0 |
| `code/macosx/Q3Controller.h` | `macosx` | `ported` | `ported` | 0 | 0 | 0 |
| `code/macosx/macosx_display.h` | `macosx` | `ported` | `ported` | 0 | 0 | 0 |
| `code/macosx/macosx_glimp.h` | `macosx` | `ported` | `ported` | 0 | 0 | 0 |
| `code/macosx/macosx_local.h` | `macosx` | `ported` | `ported` | 0 | 0 | 0 |
| `code/macosx/macosx_qgl.h` | `macosx` | `ported` | `ported` | 337 | 337 | 0 |
| `code/macosx/macosx_timers.h` | `macosx` | `ported` | `ported` | 0 | 0 | 0 |
| `code/null/mac_net.c` | `null` | `partial` | `ported` | 3 | 0 | 3 |
| `code/null/null_client.c` | `null` | `partial` | `ported` | 21 | 0 | 21 |
| `code/null/null_glimp.c` | `null` | `partial` | `ported` | 7 | 0 | 7 |
| `code/null/null_input.c` | `null` | `partial` | `ported` | 4 | 0 | 4 |
| `code/null/null_main.c` | `null` | `partial` | `ported` | 18 | 1 | 17 |
| `code/null/null_net.c` | `null` | `partial` | `ported` | 3 | 0 | 3 |
| `code/null/null_snddma.c` | `null` | `partial` | `ported` | 8 | 0 | 8 |
| `code/q3_ui/keycodes.h` | `q3_ui` | `ported` | `ported` | 0 | 0 | 0 |
| `code/q3_ui/ui_addbots.c` | `q3_ui` | `ported` | `ported` | 12 | 12 | 0 |
| `code/q3_ui/ui_atoms.c` | `q3_ui` | `ported` | `ported` | 40 | 40 | 0 |
| `code/q3_ui/ui_cdkey.c` | `q3_ui` | `ported` | `ported` | 7 | 7 | 0 |
| `code/q3_ui/ui_cinematics.c` | `q3_ui` | `ported` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_confirm.c` | `q3_ui` | `ported` | `ported` | 8 | 8 | 0 |
| `code/q3_ui/ui_connect.c` | `q3_ui` | `ported` | `ported` | 5 | 5 | 0 |
| `code/q3_ui/ui_controls2.c` | `q3_ui` | `ported` | `ported` | 22 | 22 | 0 |
| `code/q3_ui/ui_credits.c` | `q3_ui` | `ported` | `ported` | 3 | 3 | 0 |
| `code/q3_ui/ui_demo2.c` | `q3_ui` | `ported` | `ported` | 5 | 5 | 0 |
| `code/q3_ui/ui_display.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_gameinfo.c` | `q3_ui` | `ported` | `ported` | 28 | 28 | 0 |
| `code/q3_ui/ui_ingame.c` | `q3_ui` | `ported` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_loadconfig.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_local.h` | `q3_ui` | `ported` | `ported` | 0 | 0 | 0 |
| `code/q3_ui/ui_login.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_main.c` | `q3_ui` | `ported` | `ported` | 3 | 3 | 0 |
| `code/q3_ui/ui_menu.c` | `q3_ui` | `ported` | `ported` | 7 | 7 | 0 |
| `code/q3_ui/ui_mfield.c` | `q3_ui` | `ported` | `ported` | 8 | 8 | 0 |
| `code/q3_ui/ui_mods.c` | `q3_ui` | `ported` | `ported` | 7 | 7 | 0 |
| `code/q3_ui/ui_network.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_options.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_playermodel.c` | `q3_ui` | `ported` | `ported` | 12 | 12 | 0 |
| `code/q3_ui/ui_players.c` | `q3_ui` | `ported` | `ported` | 23 | 23 | 0 |
| `code/q3_ui/ui_playersettings.c` | `q3_ui` | `ported` | `ported` | 11 | 11 | 0 |
| `code/q3_ui/ui_preferences.c` | `q3_ui` | `ported` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_qmenu.c` | `q3_ui` | `ported` | `ported` | 32 | 32 | 0 |
| `code/q3_ui/ui_rankings.c` | `q3_ui` | `ported` | `ported` | 7 | 7 | 0 |
| `code/q3_ui/ui_rankstatus.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_removebots.c` | `q3_ui` | `ported` | `ported` | 10 | 10 | 0 |
| `code/q3_ui/ui_saveconfig.c` | `q3_ui` | `ported` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_serverinfo.c` | `q3_ui` | `ported` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_servers2.c` | `q3_ui` | `ported` | `ported` | 23 | 23 | 0 |
| `code/q3_ui/ui_setup.c` | `q3_ui` | `ported` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_signup.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_sound.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_sparena.c` | `q3_ui` | `ported` | `ported` | 1 | 1 | 0 |
| `code/q3_ui/ui_specifyleague.c` | `q3_ui` | `ported` | `ported` | 5 | 5 | 0 |
| `code/q3_ui/ui_specifyserver.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_splevel.c` | `q3_ui` | `ported` | `ported` | 22 | 22 | 0 |
| `code/q3_ui/ui_sppostgame.c` | `q3_ui` | `ported` | `ported` | 12 | 12 | 0 |
| `code/q3_ui/ui_spreset.c` | `q3_ui` | `ported` | `ported` | 5 | 5 | 0 |
| `code/q3_ui/ui_spskill.c` | `q3_ui` | `ported` | `ported` | 8 | 8 | 0 |
| `code/q3_ui/ui_startserver.c` | `q3_ui` | `ported` | `ported` | 36 | 36 | 0 |
| `code/q3_ui/ui_team.c` | `q3_ui` | `ported` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_teamorders.c` | `q3_ui` | `ported` | `ported` | 10 | 10 | 0 |
| `code/q3_ui/ui_video.c` | `q3_ui` | `ported` | `ported` | 15 | 15 | 0 |
| `code/qcommon/cm_load.c` | `qcommon` | `partial` | `ported` | 28 | 0 | 28 |
| `code/qcommon/cm_local.h` | `qcommon` | `ported` | `ported` | 0 | 0 | 0 |
| `code/qcommon/cm_patch.c` | `qcommon` | `ported` | `ported` | 27 | 27 | 0 |
| `code/qcommon/cm_patch.h` | `qcommon` | `ported` | `ported` | 0 | 0 | 0 |
| `code/qcommon/cm_polylib.c` | `qcommon` | `partial` | `ported` | 17 | 0 | 17 |
| `code/qcommon/cm_polylib.h` | `qcommon` | `ported` | `ported` | 0 | 0 | 0 |
| `code/qcommon/cm_public.h` | `qcommon` | `ported` | `ported` | 0 | 0 | 0 |
| `code/qcommon/cm_test.c` | `qcommon` | `ported` | `ported` | 15 | 15 | 0 |
| `code/qcommon/cm_trace.c` | `qcommon` | `ported` | `ported` | 22 | 22 | 0 |
| `code/qcommon/cmd.c` | `qcommon` | `ported` | `ported` | 23 | 23 | 0 |
| `code/qcommon/common.c` | `qcommon` | `ported` | `ported` | 83 | 83 | 0 |
| `code/qcommon/cvar.c` | `qcommon` | `partial` | `ported` | 31 | 0 | 31 |
| `code/qcommon/files.c` | `qcommon` | `ported` | `ported` | 75 | 75 | 0 |
| `code/qcommon/huffman.c` | `qcommon` | `ported` | `ported` | 18 | 18 | 0 |
| `code/qcommon/md4.c` | `qcommon` | `ported` | `ported` | 8 | 8 | 0 |
| `code/qcommon/msg.c` | `qcommon` | `ported` | `ported` | 48 | 48 | 0 |
| `code/qcommon/net_chan.c` | `qcommon` | `partial` | `ported` | 17 | 1 | 16 |
| `code/qcommon/qcommon.h` | `qcommon` | `ported` | `ported` | 0 | 0 | 0 |
| `code/qcommon/qfiles.h` | `qcommon` | `ported` | `ported` | 0 | 0 | 0 |
| `code/qcommon/unzip.c` | `qcommon` | `ported` | `ported` | 48 | 48 | 0 |
| `code/qcommon/unzip.h` | `qcommon` | `ported` | `ported` | 0 | 0 | 0 |
| `code/qcommon/vm.c` | `qcommon` | `partial` | `ported` | 23 | 0 | 23 |
| `code/qcommon/vm_interpreted.c` | `qcommon` | `ported` | `ported` | 4 | 4 | 0 |
| `code/qcommon/vm_local.h` | `qcommon` | `ported` | `ported` | 0 | 0 | 0 |
| `code/qcommon/vm_ppc.c` | `qcommon` | `partial` | `ported` | 14 | 0 | 14 |
| `code/qcommon/vm_ppc_new.c` | `qcommon` | `partial` | `ported` | 18 | 0 | 18 |
| `code/qcommon/vm_x86.c` | `qcommon` | `partial` | `ported` | 15 | 0 | 15 |
| `code/renderer/qgl.h` | `renderer` | `ported` | `ported` | 0 | 0 | 0 |
| `code/renderer/qgl_linked.h` | `renderer` | `ported` | `ported` | 0 | 0 | 0 |
| `code/renderer/tr_animation.c` | `renderer` | `ported` | `ported` | 2 | 2 | 0 |
| `code/renderer/tr_backend.c` | `renderer` | `partial` | `ported` | 21 | 6 | 15 |
| `code/renderer/tr_bsp.c` | `renderer` | `partial` | `ported` | 30 | 3 | 27 |
| `code/renderer/tr_cmds.c` | `renderer` | `partial` | `ported` | 11 | 3 | 8 |
| `code/renderer/tr_curve.c` | `renderer` | `partial` | `ported` | 11 | 5 | 6 |
| `code/renderer/tr_flares.c` | `renderer` | `partial` | `ported` | 6 | 5 | 1 |
| `code/renderer/tr_font.c` | `renderer` | `partial` | `ported` | 9 | 1 | 8 |
| `code/renderer/tr_image.c` | `renderer` | `partial` | `ported` | 38 | 8 | 30 |
| `code/renderer/tr_init.c` | `renderer` | `ported` | `ported` | 21 | 21 | 0 |
| `code/renderer/tr_light.c` | `renderer` | `partial` | `ported` | 6 | 4 | 2 |
| `code/renderer/tr_local.h` | `renderer` | `ported` | `ported` | 0 | 0 | 0 |
| `code/renderer/tr_main.c` | `renderer` | `partial` | `ported` | 32 | 15 | 17 |
| `code/renderer/tr_marks.c` | `renderer` | `ported` | `ported` | 4 | 4 | 0 |
| `code/renderer/tr_mesh.c` | `renderer` | `ported` | `ported` | 5 | 5 | 0 |
| `code/renderer/tr_model.c` | `renderer` | `partial` | `ported` | 11 | 0 | 11 |
| `code/renderer/tr_noise.c` | `renderer` | `ported` | `ported` | 3 | 3 | 0 |
| `code/renderer/tr_public.h` | `renderer` | `ported` | `ported` | 0 | 0 | 0 |
| `code/renderer/tr_scene.c` | `renderer` | `partial` | `ported` | 9 | 4 | 5 |
| `code/renderer/tr_shade.c` | `renderer` | `partial` | `ported` | 17 | 3 | 14 |
| `code/renderer/tr_shade_calc.c` | `renderer` | `partial` | `ported` | 32 | 9 | 23 |
| `code/renderer/tr_shader.c` | `renderer` | `ported` | `ported` | 34 | 34 | 0 |
| `code/renderer/tr_shadows.c` | `renderer` | `ported` | `ported` | 5 | 5 | 0 |
| `code/renderer/tr_sky.c` | `renderer` | `ported` | `ported` | 13 | 13 | 0 |
| `code/renderer/tr_surface.c` | `renderer` | `partial` | `ported` | 24 | 16 | 8 |
| `code/renderer/tr_world.c` | `renderer` | `partial` | `ported` | 15 | 1 | 14 |
| `code/server/server.h` | `server` | `partial` | `ported` | 11 | 0 | 11 |
| `code/server/sv_bot.c` | `server` | `partial` | `ported` | 28 | 0 | 28 |
| `code/server/sv_ccmds.c` | `server` | `ported` | `ported` | 16 | 16 | 0 |
| `code/server/sv_client.c` | `server` | `ported` | `ported` | 22 | 22 | 0 |
| `code/server/sv_game.c` | `server` | `ported` | `ported` | 24 | 24 | 0 |
| `code/server/sv_init.c` | `server` | `partial` | `ported` | 14 | 1 | 13 |
| `code/server/sv_main.c` | `server` | `ported` | `ported` | 16 | 16 | 0 |
| `code/server/sv_net_chan.c` | `server` | `ported` | `ported` | 5 | 5 | 0 |
| `code/server/sv_rankings.c` | `server` | `ported` | `ported` | 28 | 28 | 0 |
| `code/server/sv_snapshot.c` | `server` | `ported` | `ported` | 11 | 11 | 0 |
| `code/server/sv_world.c` | `server` | `ported` | `ported` | 12 | 12 | 0 |
| `code/splines/math_angles.h` | `splines` | `partial` | `ported` | 4 | 0 | 4 |
| `code/splines/math_matrix.h` | `splines` | `partial` | `ported` | 5 | 0 | 5 |
| `code/splines/math_quaternion.h` | `splines` | `partial` | `ported` | 5 | 0 | 5 |
| `code/splines/math_vector.h` | `splines` | `partial` | `ported` | 18 | 0 | 18 |
| `code/splines/q_shared.h` | `splines` | `ported` | `ported` | 0 | 0 | 0 |
| `code/splines/splines.h` | `splines` | `ported` | `ported` | 0 | 0 | 0 |
| `code/splines/util_list.h` | `splines` | `partial` | `ported` | 14 | 0 | 14 |
| `code/splines/util_str.h` | `splines` | `partial` | `ported` | 4 | 0 | 4 |
| `code/ui/keycodes.h` | `ui` | `ported` | `ported` | 112 | 112 | 0 |
| `code/ui/ui_atoms.c` | `ui` | `ported` | `ported` | 26 | 26 | 0 |
| `code/ui/ui_gameinfo.c` | `ui` | `ported` | `ported` | 9 | 9 | 0 |
| `code/ui/ui_local.h` | `ui` | `ported` | `ported` | 477 | 477 | 0 |
| `code/ui/ui_main.c` | `ui` | `ported` | `ported` | 163 | 163 | 0 |
| `code/ui/ui_players.c` | `ui` | `ported` | `ported` | 25 | 25 | 0 |
| `code/ui/ui_public.h` | `ui` | `ported` | `ported` | 127 | 127 | 0 |
| `code/ui/ui_shared.c` | `ui` | `ported` | `ported` | 256 | 256 | 0 |
| `code/ui/ui_shared.h` | `ui` | `ported` | `ported` | 141 | 141 | 0 |
| `code/ui/ui_syscalls.asm` | `ui` | `ported` | `ported` | 97 | 97 | 0 |
| `code/ui/ui_syscalls.c` | `ui` | `ported` | `ported` | 89 | 89 | 0 |
| `code/ui/ui_util.c` | `ui` | `ported` | `ported` | 0 | 0 | 0 |
| `code/unix/linux_common.c` | `unix` | `ported` | `ported` | 4 | 4 | 0 |
| `code/unix/linux_glimp.c` | `unix` | `ported` | `ported` | 35 | 35 | 0 |
| `code/unix/linux_joystick.c` | `unix` | `ported` | `ported` | 2 | 2 | 0 |
| `code/unix/linux_local.h` | `unix` | `ported` | `ported` | 0 | 0 | 0 |
| `code/unix/linux_qgl.c` | `unix` | `ported` | `ported` | 341 | 341 | 0 |
| `code/unix/linux_signals.c` | `unix` | `ported` | `ported` | 2 | 2 | 0 |
| `code/unix/linux_snd.c` | `unix` | `ported` | `ported` | 6 | 6 | 0 |
| `code/unix/qasm.h` | `unix` | `ported` | `ported` | 0 | 0 | 0 |
| `code/unix/unix_glw.h` | `unix` | `ported` | `ported` | 0 | 0 | 0 |
| `code/unix/unix_main.c` | `unix` | `ported` | `ported` | 43 | 43 | 0 |
| `code/unix/unix_net.c` | `unix` | `ported` | `ported` | 16 | 16 | 0 |
| `code/unix/unix_shared.c` | `unix` | `ported` | `ported` | 20 | 20 | 0 |
| `code/unix/vm_x86.c` | `unix` | `ported` | `ported` | 2 | 2 | 0 |
| `code/win32/glw_win.h` | `win32` | `ported` | `ported` | 13 | 13 | 0 |
| `code/win32/resource.h` | `win32` | `ported` | `ported` | 12 | 12 | 0 |
| `code/win32/win_gamma.c` | `win32` | `ported` | `ported` | 4 | 4 | 0 |
| `code/win32/win_glimp.c` | `win32` | `ported` | `ported` | 21 | 21 | 0 |
| `code/win32/win_input.c` | `win32` | `partial` | `ported` | 31 | 0 | 31 |
| `code/win32/win_local.h` | `win32` | `ported` | `ported` | 21 | 21 | 0 |
| `code/win32/win_main.c` | `win32` | `ported` | `ported` | 33 | 33 | 0 |
| `code/win32/win_net.c` | `win32` | `ported` | `ported` | 21 | 21 | 0 |
| `code/win32/win_qgl.c` | `win32` | `ported` | `ported` | 346 | 346 | 0 |
| `code/win32/win_shared.c` | `win32` | `ported` | `ported` | 12 | 12 | 0 |
| `code/win32/win_snd.c` | `win32` | `ported` | `ported` | 8 | 8 | 0 |
| `code/win32/win_syscon.c` | `win32` | `ported` | `ported` | 8 | 8 | 0 |
| `code/win32/win_wndproc.c` | `win32` | `ported` | `ported` | 5 | 5 | 0 |

## Offene Originalsymbole

Die folgende vollständige Liste dient als Arbeitswarteschlange. Leere
Symbolinventare müssen beim nächsten Audit direkt aus der Originaldatei ergänzt
werden; sie sind kein Nachweis vollständiger Parität.

- `code/botlib/be_interface.c` (partial): `BotExportTest`, `BotLibSetup`, `Export_BotLibLoadMap`, `Export_BotLibSetup`, `Export_BotLibShutdown`, `Export_BotLibStartFrame`, `Export_BotLibUpdateEntity`, `Export_BotLibVarGet`, `Export_BotLibVarSet`, `GetBotLibAPI`, `Init_AAS_Export`, `Init_AI_Export`, `Init_EA_Export`, `Sys_MilliSeconds`, `ValidClientNumber`, `ValidEntityNumber`
- `code/botlib/l_crc.c` (partial): `CRC_ContinueProcessString`, `CRC_Init`, `CRC_ProcessByte`, `CRC_ProcessString`, `CRC_Value`
- `code/botlib/l_libvar.c` (partial): `LibVar`, `LibVarAlloc`, `LibVarChanged`, `LibVarDeAlloc`, `LibVarDeAllocAll`, `LibVarGet`, `LibVarGetString`, `LibVarGetValue`, `LibVarSet`, `LibVarSetNotModified`, `LibVarString`, `LibVarStringValue`, `LibVarValue`
- `code/botlib/l_script.c` (partial): `EndOfScript`, `FileLength`, `FreeScript`, `GetScriptFlags`, `LoadScriptFile`, `LoadScriptMemory`, `NumLinesCrossed`, `NumberValue`, `PS_CheckTokenString`, `PS_CheckTokenType`, `PS_CreatePunctuationTable`, `PS_ExpectAnyToken`, `PS_ExpectTokenString`, `PS_ExpectTokenType`, `PS_NextWhiteSpaceChar`, `PS_ReadEscapeCharacter`, `PS_ReadLiteral`, `PS_ReadName`, `PS_ReadNumber`, `PS_ReadPrimitive`, `PS_ReadPunctuation`, `PS_ReadString`, `PS_ReadWhiteSpace`, `PS_SetBaseFolder`, `PS_SkipUntilString`, `PS_UnreadLastToken`, `PS_UnreadToken`, `PunctuationFromNum`, `ReadSignedFloat`, `ReadSignedInt`, `ResetScript`, `ScriptError`, `ScriptSkipTo`, `ScriptWarning`, `SetScriptFlags`, `SetScriptPunctuations`, `StripDoubleQuotes`, `StripSingleQuotes`
- `code/cgame/cg_syscalls.asm` (partial): `trap_Print`, `trap_Error`, `trap_Milliseconds`, `trap_Cvar_Register`, `trap_Cvar_Update`, `trap_Cvar_Set`, `trap_Cvar_VariableStringBuffer`, `trap_Argc`, `trap_Argv`, `trap_Args`, `trap_FS_FOpenFile`, `trap_FS_Read`, `trap_FS_Write`, `trap_FS_FCloseFile`, `trap_SendConsoleCommand`, `trap_AddCommand`, `trap_SendClientCommand`, `trap_UpdateScreen`, `trap_CM_LoadMap`, `trap_CM_NumInlineModels`, `trap_CM_InlineModel`, `trap_CM_LoadModel`, `trap_CM_TempBoxModel`, `trap_CM_PointContents`, `trap_CM_TransformedPointContents`, `trap_CM_BoxTrace`, `trap_CM_TransformedBoxTrace`, `trap_CM_MarkFragments`, `trap_S_StartSound`, `trap_S_StartLocalSound`, `trap_S_ClearLoopingSounds`, `trap_S_AddLoopingSound`, `trap_S_UpdateEntityPosition`, `trap_S_Respatialize`, `trap_S_RegisterSound`, `trap_S_StartBackgroundTrack`, `trap_R_LoadWorldMap`, `trap_R_RegisterModel`, `trap_R_RegisterSkin`, `trap_R_RegisterShader`, `trap_R_ClearScene`, `trap_R_AddRefEntityToScene`, `trap_R_AddPolyToScene`, `trap_R_AddLightToScene`, `trap_R_RenderScene`, `trap_R_SetColor`, `trap_R_DrawStretchPic`, `trap_R_ModelBounds`, `trap_R_LerpTag`, `trap_GetGlconfig`, `trap_GetGameState`, `trap_GetCurrentSnapshotNumber`, `trap_GetSnapshot`, `trap_GetServerCommand`, `trap_GetCurrentCmdNumber`, `trap_GetUserCmd`, `trap_SetUserCmdValue`, `trap_R_RegisterShaderNoMip`, `trap_MemoryRemaining`, `trap_R_RegisterFont`, `trap_Key_IsDown`, `trap_Key_GetCatcher`, `trap_Key_SetCatcher`, `trap_Key_GetKey`, `trap_PC_AddGlobalDefine`, `trap_PC_LoadSource`, `trap_PC_FreeSource`, `trap_PC_ReadToken`, `trap_PC_SourceFileAndLine`, `trap_S_StopBackgroundTrack`, `trap_RealTime`, `trap_SnapVector`, `trap_RemoveCommand`, `trap_R_LightForPoint`, `trap_CIN_PlayCinematic`, `trap_CIN_StopCinematic`, `trap_CIN_RunCinematic`, `trap_CIN_DrawCinematic`, `trap_CIN_SetExtents`, `trap_R_RemapShader`, `trap_S_AddRealLoopingSound`, `trap_S_StopLoopingSound`, `trap_CM_TempCapsuleModel`, `trap_CM_CapsuleTrace`, `trap_CM_TransformedCapsuleTrace`, `trap_R_AddAdditiveLightToScene`, `trap_GetEntityToken`, `trap_R_AddPolysToScene`, `trap_R_inPVS`, `trap_FS_Seek`, `memset`, `memcpy`, `strncpy`, `sin`, `cos`, `atan2`, `sqrt`, `floor`, `ceil`, `testPrintInt`, `testPrintFloat`, `acos`
- `code/game/bg_misc.c` (partial): `BG_FindItemForHoldable`, `BG_FindItemForPowerup`
- `code/game/bg_pmove.c` (partial): `PM_CheckStuck`, `PM_InvulnerabilityMove`, `sqrt`
- `code/game/g_active.c` (partial): `StuckInOtherClient`
- `code/game/g_bot.c` (partial): `PlayerIntroSound`, `trap_Cvar_VariableValue`
- `code/game/g_client.c` (partial): `skin`, `trap_DropClient`
- `code/game/g_combat.c` (partial): `G_InvulnerabilityEffect`, `Kamikaze_DeathActivate`, `Kamikaze_DeathTimer`, `RaySphereIntersections`, `TossClientCubes`, `TossClientPersistantPowerups`
- `code/game/g_items.c` (partial): `Pickup_PersistantPowerup`
- `code/game/g_main.c` (partial): `Com_Error`, `Com_Printf`, `G_Error`, `G_Printf`, `vmMain`
- `code/game/g_misc.c` (partial): `DropPortalDestination`, `DropPortalSource`, `PortalDie`, `PortalEnable`, `PortalTouch`, `utilities`
- `code/game/g_missile.c` (partial): `ProximityMine_Activate`, `ProximityMine_Die`, `ProximityMine_Explode`, `ProximityMine_ExplodeOnPlayer`, `ProximityMine_Player`, `ProximityMine_Trigger`, `fire_nail`, `fire_prox`
- `code/game/g_mover.c` (partial): `Blocked_Door`, `G_CheckProxMinePosition`, `G_CreateRotationMatrix`, `G_MoverPush`, `G_MoverTeam`, `G_RotatePoint`, `G_TestEntityPosition`, `G_TransposeMatrix`, `G_TryPushingEntity`, `G_TryPushingProxMine`, `InitMover`, `MatchTeam`, `Reached_BinaryMover`, `Reached_Train`, `ReturnToPos1`, `SP_func_bobbing`, `SP_func_button`, `SP_func_pendulum`, `SP_func_plat`, `SP_func_rotating`, `SP_func_static`, `SP_func_train`, `SpawnPlatTrigger`, `Think_BeginMoving`, `Think_MatchTeam`, `Think_SetupTrainTargets`, `Think_SpawnNewDoorTrigger`, `Touch_Button`, `Touch_DoorTrigger`, `Touch_DoorTriggerSpectator`, `Touch_Plat`, `Touch_PlatCenterTrigger`, `Use_BinaryMover`, `triggered`
- `code/game/g_syscalls.asm` (partial): `trap_Printf`, `trap_Error`, `trap_Milliseconds`, `trap_Cvar_Register`, `trap_Cvar_Update`, `trap_Cvar_Set`, `trap_Cvar_VariableIntegerValue`, `trap_Cvar_VariableStringBuffer`, `trap_Argc`, `trap_Argv`, `trap_FS_FOpenFile`, `trap_FS_Read`, `trap_FS_Write`, `trap_FS_FCloseFile`, `trap_SendConsoleCommand`, `trap_LocateGameData`, `trap_DropClient`, `trap_SendServerCommand`, `trap_SetConfigstring`, `trap_GetConfigstring`, `trap_GetUserinfo`, `trap_SetUserinfo`, `trap_GetServerinfo`, `trap_SetBrushModel`, `trap_Trace`, `trap_PointContents`, `trap_InPVS`, `trap_InPVSIgnorePortals`, `trap_AdjustAreaPortalState`, `trap_AreasConnected`, `trap_LinkEntity`, `trap_UnlinkEntity`, `trap_EntitiesInBox`, `trap_EntityContact`, `trap_BotAllocateClient`, `trap_BotFreeClient`, `trap_GetUsercmd`, `trap_GetEntityToken`, `trap_FS_GetFileList`, `trap_DebugPolygonCreate`, `trap_DebugPolygonDelete`, `trap_RealTime`, `trap_SnapVector`, `trap_TraceCapsule`, `trap_EntityContactCapsule`, `trap_FS_Seek`, `memset`, `memcpy`, `strncpy`, `sin`, `cos`, `atan2`, `sqrt`, `floor`, `ceil`, `testPrintInt`, `testPrintFloat`, `trap_BotLibSetup`, `trap_BotLibShutdown`, `trap_BotLibVarSet`, `trap_BotLibVarGet`, `trap_BotLibDefine`, `trap_BotLibStartFrame`, `trap_BotLibLoadMap`, `trap_BotLibUpdateEntity`, `trap_BotLibTest`, `trap_BotGetSnapshotEntity`, `trap_BotGetServerCommand`, `trap_BotUserCommand`, `trap_AAS_EnableRoutingArea`, `trap_AAS_BBoxAreas`, `trap_AAS_AreaInfo`, `trap_AAS_EntityInfo`, `trap_AAS_Initialized`, `trap_AAS_PresenceTypeBoundingBox`, `trap_AAS_Time`, `trap_AAS_PointAreaNum`, `trap_AAS_TraceAreas`, `trap_AAS_PointContents`, `trap_AAS_NextBSPEntity`, `trap_AAS_ValueForBSPEpairKey`, `trap_AAS_VectorForBSPEpairKey`, `trap_AAS_FloatForBSPEpairKey`, `trap_AAS_IntForBSPEpairKey`, `trap_AAS_AreaReachability`, `trap_AAS_AreaTravelTimeToGoalArea`, `trap_AAS_Swimming`, `trap_AAS_PredictClientMovement`, `trap_EA_Say`, `trap_EA_SayTeam`, `trap_EA_Command`, `trap_EA_Action`, `trap_EA_Gesture`, `trap_EA_Talk`, `trap_EA_Attack`, `trap_EA_Use`, `trap_EA_Respawn`, `trap_EA_Crouch`, `trap_EA_MoveUp`, `trap_EA_MoveDown`, `trap_EA_MoveForward`, `trap_EA_MoveBack`, `trap_EA_MoveLeft`, `trap_EA_MoveRight`, `trap_EA_SelectWeapon`, `trap_EA_Jump`, `trap_EA_DelayedJump`, `trap_EA_Move`, `trap_EA_View`, `trap_EA_EndRegular`, `trap_EA_GetInput`, `trap_EA_ResetInput`, `trap_BotLoadCharacter`, `trap_BotFreeCharacter`, `trap_Characteristic_Float`, `trap_Characteristic_BFloat`, `trap_Characteristic_Integer`, `trap_Characteristic_BInteger`, `trap_Characteristic_String`, `trap_BotAllocChatState`, `trap_BotFreeChatState`, `trap_BotQueueConsoleMessage`, `trap_BotRemoveConsoleMessage`, `trap_BotNextConsoleMessage`, `trap_BotNumConsoleMessages`, `trap_BotInitialChat`, `trap_BotReplyChat`, `trap_BotChatLength`, `trap_BotEnterChat`, `trap_StringContains`, `trap_BotFindMatch`, `trap_BotMatchVariable`, `trap_UnifyWhiteSpaces`, `trap_BotReplaceSynonyms`, `trap_BotLoadChatFile`, `trap_BotSetChatGender`, `trap_BotSetChatName`, `trap_BotResetGoalState`, `trap_BotResetAvoidGoals`, `trap_BotPushGoal`, `trap_BotPopGoal`, `trap_BotEmptyGoalStack`, `trap_BotDumpAvoidGoals`, `trap_BotDumpGoalStack`, `trap_BotGoalName`, `trap_BotGetTopGoal`, `trap_BotGetSecondGoal`, `trap_BotChooseLTGItem`, `trap_BotChooseNBGItem`, `trap_BotTouchingGoal`, `trap_BotItemGoalInVisButNotVisible`, `trap_BotGetLevelItemGoal`, `trap_BotAvoidGoalTime`, `trap_BotInitLevelItems`, `trap_BotUpdateEntityItems`, `trap_BotLoadItemWeights`, `trap_BotFreeItemWeights`, `trap_BotSaveGoalFuzzyLogic`, `trap_BotAllocGoalState`, `trap_BotFreeGoalState`, `trap_BotResetMoveState`, `trap_BotMoveToGoal`, `trap_BotMoveInDirection`, `trap_BotResetAvoidReach`, `trap_BotResetLastAvoidReach`, `trap_BotReachabilityArea`, `trap_BotMovementViewTarget`, `trap_BotAllocMoveState`, `trap_BotFreeMoveState`, `trap_BotInitMoveState`, `trap_BotChooseBestFightWeapon`, `trap_BotGetWeaponInfo`, `trap_BotLoadWeaponWeights`, `trap_BotAllocWeaponState`, `trap_BotFreeWeaponState`, `trap_BotResetWeaponState`, `trap_GeneticParentsAndChildSelection`, `trap_BotInterbreedGoalFuzzyLogic`, `trap_BotMutateGoalFuzzyLogic`, `trap_BotGetNextCampSpotGoal`, `trap_BotGetMapLocationGoal`, `trap_BotNumInitialChats`, `trap_BotGetChatMessage`, `trap_BotRemoveFromAvoidGoals`, `trap_BotPredictVisiblePosition`, `trap_BotSetAvoidGoalTime`, `trap_BotAddAvoidSpot`, `trap_AAS_AlternativeRouteGoals`, `trap_AAS_PredictRoute`, `trap_AAS_PointReachabilityAreaIndex`, `trap_BotLibLoadSource`, `trap_BotLibFreeSource`, `trap_BotLibReadToken`, `trap_BotLibSourceFileAndLine`
- `code/game/g_team.c` (partial): `CheckObeliskAttack`, `ObeliskDie`, `ObeliskPain`, `ObeliskRegen`, `ObeliskRespawn`, `ObeliskTouch`, `OtherTeamName`, `PrintMsg`, `SP_team_blueobelisk`, `SP_team_neutralobelisk`, `SP_team_redobelisk`, `SpawnObelisk`, `TeamColorString`
- `code/game/g_trigger.c` (partial): `between`
- `code/game/g_utils.c` (partial): `DebugLine`, `angles`, `fieldofs`, `for`, `surface`, `tv`
- `code/game/g_weapon.c` (partial): `G_StartKamikaze`, `KamikazeDamage`, `KamikazeRadiusDamage`, `KamikazeShockWave`, `Weapon_Nailgun_Fire`, `weapon_proxlauncher_fire`
- `code/null/mac_net.c` (partial): `NET_StringToAdr`, `Sys_GetPacket`, `Sys_SendPacket`
- `code/null/null_client.c` (partial): `CL_CDDialog`, `CL_CDKeyValidate`, `CL_CharEvent`, `CL_ConsolePrint`, `CL_Disconnect`, `CL_FlushMemory`, `CL_ForwardCommandToServer`, `CL_Frame`, `CL_GameCommand`, `CL_Init`, `CL_InitKeyCommands`, `CL_JoystickEvent`, `CL_KeyEvent`, `CL_MapLoading`, `CL_MouseEvent`, `CL_PacketEvent`, `CL_Shutdown`, `CL_ShutdownAll`, `CL_StartHunkUsers`, `Key_WriteBindings`, `UI_GameCommand`
- `code/null/null_glimp.c` (partial): `GLimp_EnableLogging`, `GLimp_EndFrame`, `GLimp_Init`, `GLimp_LogComment`, `GLimp_Shutdown`, `QGL_Init`, `QGL_Shutdown`
- `code/null/null_input.c` (partial): `IN_Frame`, `IN_Init`, `IN_Shutdown`, `Sys_SendKeyEvents`
- `code/null/null_main.c` (partial): `Sys_BeginStreamedFile`, `Sys_EarlyOutput`, `Sys_EndStreamedFile`, `Sys_Error`, `Sys_FindClose`, `Sys_FindFirst`, `Sys_FindNext`, `Sys_GetClipboardData`, `Sys_GetGameAPI`, `Sys_Init`, `Sys_Milliseconds`, `Sys_Mkdir`, `Sys_Quit`, `Sys_StreamSeek`, `Sys_StreamedRead`, `Sys_UnloadGame`, `Sys_mkdir`
- `code/null/null_net.c` (partial): `NET_StringToAdr`, `Sys_GetPacket`, `Sys_SendPacket`
- `code/null/null_snddma.c` (partial): `SNDDMA_BeginPainting`, `SNDDMA_GetDMAPos`, `SNDDMA_Init`, `SNDDMA_Shutdown`, `SNDDMA_Submit`, `S_ClearSoundBuffer`, `S_RegisterSound`, `S_StartLocalSound`
- `code/qcommon/cm_load.c` (partial): `CM_BoundBrush`, `CM_Checksum`, `CM_ClearMap`, `CM_ClipHandleToModel`, `CM_EntityString`, `CM_InitBoxHull`, `CM_InlineModel`, `CM_LeafArea`, `CM_LeafCluster`, `CM_LoadMap`, `CM_LumpChecksum`, `CM_ModelBounds`, `CM_NumClusters`, `CM_NumInlineModels`, `CM_TempBoxModel`, `CMod_LoadBrushSides`, `CMod_LoadBrushes`, `CMod_LoadEntityString`, `CMod_LoadLeafBrushes`, `CMod_LoadLeafSurfaces`, `CMod_LoadLeafs`, `CMod_LoadNodes`, `CMod_LoadPatches`, `CMod_LoadPlanes`, `CMod_LoadShaders`, `CMod_LoadSubmodels`, `CMod_LoadVisibility`, `SetPlaneSignbits`
- `code/qcommon/cm_polylib.c` (partial): `AddWindingToConvexHull`, `AllocWinding`, `BaseWindingForPlane`, `CheckWinding`, `ChopWinding`, `ChopWindingInPlace`, `ClipWindingEpsilon`, `CopyWinding`, `FreeWinding`, `RemoveColinearPoints`, `ReverseWinding`, `WindingArea`, `WindingBounds`, `WindingCenter`, `WindingOnPlaneSide`, `WindingPlane`, `pw`
- `code/qcommon/cvar.c` (partial): `Cvar_Command`, `Cvar_CommandCompletion`, `Cvar_FindVar`, `Cvar_Get`, `Cvar_InfoString`, `Cvar_InfoStringBuffer`, `Cvar_InfoString_Big`, `Cvar_Init`, `Cvar_List_f`, `Cvar_Register`, `Cvar_Reset`, `Cvar_Reset_f`, `Cvar_Restart_f`, `Cvar_Set`, `Cvar_Set2`, `Cvar_SetA_f`, `Cvar_SetCheatState`, `Cvar_SetLatched`, `Cvar_SetS_f`, `Cvar_SetU_f`, `Cvar_SetValue`, `Cvar_Set_f`, `Cvar_Toggle_f`, `Cvar_Update`, `Cvar_ValidateString`, `Cvar_VariableIntegerValue`, `Cvar_VariableString`, `Cvar_VariableStringBuffer`, `Cvar_VariableValue`, `Cvar_WriteVariables`, `generateHashValue`
- `code/qcommon/net_chan.c` (partial): `NET_AdrToString`, `NET_CompareAdr`, `NET_CompareBaseAdr`, `NET_GetLoopPacket`, `NET_IsLocalAddress`, `NET_OutOfBandPrint`, `NET_SendLoopPacket`, `NET_SendPacket`, `NET_StringToAdr`, `Netchan_Init`, `Netchan_Process`, `Netchan_ScramblePacket`, `Netchan_Setup`, `Netchan_Transmit`, `Netchan_TransmitNextFragment`, `Netchan_UnScramblePacket`
- `code/qcommon/vm.c` (partial): `ParseHex`, `VM_ArgPtr`, `VM_Call`, `VM_CallCompiled`, `VM_Clear`, `VM_Compile`, `VM_Create`, `VM_Debug`, `VM_DllSyscall`, `VM_ExplicitArgPtr`, `VM_Free`, `VM_Init`, `VM_LoadSymbols`, `VM_LogSyscalls`, `VM_ProfileSort`, `VM_Restart`, `VM_SymbolForCompiledPointer`, `VM_SymbolToValue`, `VM_VM2C`, `VM_ValueToFunctionSymbol`, `VM_ValueToSymbol`, `VM_VmInfo_f`, `VM_VmProfile_f`
- `code/qcommon/vm_ppc.c` (partial): `AsmCall`, `Constant1`, `Constant4`, `Emit4`, `Inst`, `Inst4`, `InstImm`, `InstImmU`, `VM_CallCompiled`, `VM_Compile`, `fltop`, `fltopandsecond`, `ltop`, `ltopandsecond`
- `code/qcommon/vm_ppc_new.c` (partial): `AsmCall`, `Constant1`, `Constant4`, `Emit4`, `Inst`, `Inst4`, `InstImm`, `InstImmU`, `VM_CallCompiled`, `VM_Compile`, `fltop`, `fltopandsecond`, `loadOpStack`, `ltop`, `ltopandsecond`, `makeFloat`, `makeInteger`, `spillOpStack`
- `code/qcommon/vm_x86.c` (partial): `AsmCall`, `Constant1`, `Constant4`, `Emit1`, `Emit2`, `Emit4`, `EmitAddEDI4`, `EmitCommand`, `EmitMovEAXEDI`, `EmitMovEBXEDI`, `EmitString`, `Hex`, `VM_CallCompiled`, `VM_Compile`, `callAsmCall`
- `code/renderer/tr_backend.c` (partial): `GL_Cull`, `GL_State`, `GL_TexEnv`, `RB_BeginDrawingView`, `RB_DrawBuffer`, `RB_DrawSurfs`, `RB_ExecuteRenderCommands`, `RB_Hyperspace`, `RB_RenderThread`, `RB_SetColor`, `RB_SetGL2D`, `RB_ShowImages`, `RB_SwapBuffers`, `RE_StretchRaw`, `SetViewportAndScissor`
- `code/renderer/tr_bsp.c` (partial): `HSVtoRGB`, `ParseFace`, `ParseMesh`, `ParseTriSurf`, `RE_LoadWorldMap`, `RE_SetWorldVisData`, `R_FixSharedVertexLodError`, `R_FixSharedVertexLodError_r`, `R_GetEntityToken`, `R_LoadEntities`, `R_LoadFogs`, `R_LoadLightGrid`, `R_LoadLightmaps`, `R_LoadMarksurfaces`, `R_LoadNodesAndLeafs`, `R_LoadPlanes`, `R_LoadShaders`, `R_LoadSurfaces`, `R_LoadVisibility`, `R_MergedHeightPoints`, `R_MergedWidthPoints`, `R_MovePatchSurfacesToHunk`, `R_SetParent`, `R_StitchAllPatches`, `R_StitchPatches`, `ShaderForShaderNum`, `patch`
- `code/renderer/tr_cmds.c` (partial): `RE_BeginFrame`, `RE_EndFrame`, `R_AddDrawSurfCmd`, `R_InitCommandBuffers`, `R_IssueRenderCommands`, `R_PerformanceCounters`, `R_ShutdownCommandBuffers`, `R_SyncRenderThread`
- `code/renderer/tr_curve.c` (partial): `InvertCtrl`, `InvertErrorTable`, `R_CreateSurfaceGridMesh`, `R_FreeSurfaceGridMesh`, `R_GridInsertColumn`, `R_GridInsertRow`
- `code/renderer/tr_flares.c` (partial): `R_ClearFlares`
- `code/renderer/tr_font.c` (partial): `RE_ConstructGlyphInfo`, `R_DoneFreeType`, `R_GetGlyphInfo`, `R_InitFreeType`, `R_RenderGlyph`, `WriteTGA`, `readFloat`, `readInt`
- `code/renderer/tr_image.c` (partial): `CommaParse`, `GL_TextureMode`, `LoadBMP`, `LoadJPG`, `LoadPCX`, `LoadPCX32`, `RE_RegisterSkin`, `R_BlendOverTexture`, `R_CreateBuiltinImages`, `R_CreateDefaultImage`, `R_CreateDlightImage`, `R_CreateFogImage`, `R_DeleteTextures`, `R_FogFactor`, `R_GammaCorrect`, `R_GetSkinByHandle`, `R_ImageList_f`, `R_InitFogTable`, `R_InitImages`, `R_InitSkins`, `R_LoadImage`, `R_SetColorMappings`, `R_SkinList_f`, `R_SumOfUsedImages`, `SaveJPG`, `Upload32`, `empty_output_buffer`, `init_destination`, `jpegDest`, `term_destination`
- `code/renderer/tr_light.c` (partial): `LogLight`, `R_TransformDlights`
- `code/renderer/tr_main.c` (partial): `IsMirror`, `R_AddEntitySurfaces`, `R_DebugGraphics`, `R_DebugPolygon`, `R_GenerateDrawSurfs`, `R_MirrorViewBySurface`, `R_PlaneForSurface`, `R_RenderView`, `R_RotateForEntity`, `R_RotateForViewer`, `R_SetupProjection`, `R_SpriteFogNum`, `SetFarClip`, `SurfIsOffscreen`, `myGlMultMatrix`, `qsortFast`, `shortsort`
- `code/renderer/tr_model.c` (partial): `RE_BeginRegistration`, `RE_RegisterModel`, `R_AllocModel`, `R_GetModelByHandle`, `R_GetTag`, `R_LerpTag`, `R_LoadMD3`, `R_LoadMD4`, `R_ModelBounds`, `R_ModelInit`, `R_Modellist_f`
- `code/renderer/tr_scene.c` (partial): `RE_AddAdditiveLightToScene`, `RE_AddLightToScene`, `RE_RenderScene`, `R_AddPolygonSurfaces`, `R_ToggleSmpFrame`
- `code/renderer/tr_shade.c` (partial): `ComputeTexCoords`, `DrawMultitextured`, `DrawNormals`, `DrawTris`, `ProjectDlightTexture`, `RB_EndSurface`, `RB_FogPass`, `RB_IterateStagesGeneric`, `RB_StageIteratorGeneric`, `RB_StageIteratorLightmappedMultitexture`, `RB_StageIteratorVertexLitTexture`, `R_ArrayElementDiscrete`, `R_DrawElements`, `R_DrawStripElements`
- `code/renderer/tr_shade_calc.c` (partial): `Autosprite2Deform`, `AutospriteDeform`, `DeformText`, `EvalWaveForm`, `EvalWaveFormClamped`, `GlobalVectorToLocal`, `RB_CalcBulgeVertexes`, `RB_CalcDeformNormals`, `RB_CalcDeformVertexes`, `RB_CalcDiffuseColor`, `RB_CalcEnvironmentTexCoords`, `RB_CalcFogTexCoords`, `RB_CalcMoveVertexes`, `RB_CalcRotateTexCoords`, `RB_CalcScaleTexCoords`, `RB_CalcStretchTexCoords`, `RB_CalcTransformTexCoords`, `RB_CalcTurbulentTexCoords`, `RB_CalcWaveAlpha`, `RB_CalcWaveColor`, `RB_DeformTessGeometry`, `TableForFunc`, `myftol`
- `code/renderer/tr_surface.c` (partial): `LodErrorForVolume`, `RB_CheckOverflow`, `RB_SurfaceAxis`, `RB_SurfaceBad`, `RB_SurfaceDisplayList`, `RB_SurfaceEntity`, `RB_SurfaceFlare`, `RB_SurfaceSkip`
- `code/renderer/tr_world.c` (partial): `R_AddWorldSurface`, `R_AddWorldSurfaces`, `R_ClusterPVS`, `R_CullGrid`, `R_CullSurface`, `R_CullTriSurf`, `R_DlightFace`, `R_DlightGrid`, `R_DlightSurface`, `R_DlightTrisurf`, `R_MarkLeaves`, `R_PointInLeaf`, `R_RecursiveWorldNode`, `R_inPVS`
- `code/server/server.h` (partial): `svEntity_t`, `server_t`, `clientSnapshot_t`, `netchan_buffer_t`, `client_t`, `challenge_t`, `serverStatic_t`, `serverState_t`, `clientState_t`, `25 sv_* cvar declarations`, `60 server/bot prototypes`
- `code/server/sv_bot.c` (partial): `BotClientCommand`, `BotDrawDebugPolygons`, `BotImport_BSPEntityData`, `BotImport_BSPModelMinsMaxsOrigin`, `BotImport_DebugLineCreate`, `BotImport_DebugLineDelete`, `BotImport_DebugLineShow`, `BotImport_DebugPolygonCreate`, `BotImport_DebugPolygonDelete`, `BotImport_DebugPolygonShow`, `BotImport_EntityTrace`, `BotImport_FreeMemory`, `BotImport_GetMemory`, `BotImport_HunkAlloc`, `BotImport_PointContents`, `BotImport_Print`, `BotImport_Trace`, `BotImport_inPVS`, `EntityInPVS`, `SV_BotAllocateClient`, `SV_BotFrame`, `SV_BotFreeClient`, `SV_BotGetConsoleMessage`, `SV_BotGetSnapshotEntity`, `SV_BotInitBotLib`, `SV_BotInitCvars`, `SV_BotLibSetup`, `SV_BotLibShutdown`
- `code/server/sv_init.c` (partial): `SV_BoundMaxClients`, `SV_ChangeMaxClients`, `SV_ClearServer`, `SV_CreateBaseline`, `SV_FinalMessage`, `SV_GetConfigstring`, `SV_GetUserinfo`, `SV_SetConfigstring`, `SV_SetUserinfo`, `SV_Shutdown`, `SV_SpawnServer`, `SV_Startup`, `SV_TouchCGame`
- `code/splines/math_angles.h` (partial): `Zero`, `angles_t`, `set`, `vec3_p`
- `code/splines/math_matrix.h` (partial): `Identity`, `InverseMultiply`, `OrthoNormalize`, `SkewSymmetric`, `mat3_t`
- `code/splines/math_quaternion.h` (partial): `Length`, `Normalize`, `quat_t`, `set`, `vec4`
- `code/splines/math_vector.h` (partial): `AddBounds`, `AddPoint`, `Bounds`, `Center`, `Clear`, `ContainsPoint`, `Cross`, `IntersectsBounds`, `IsCleared`, `Normalize`, `Radius`, `Snap`, `SnapTowards`, `Zero`, `idSqrt`, `idVec3_t`, `set`, `vec4_t`
- `code/splines/util_list.h` (partial): `AddUnique`, `Append`, `Clear`, `Condense`, `Find`, `Num`, `Remove`, `RemoveIndex`, `Resize`, `SetGranularity`, `SetNum`, `Size`, `Sort`, `idList`
- `code/splines/util_str.h` (partial): `append`, `idStr`, `tolower`, `toupper`
- `code/win32/win_input.c` (partial): `IN_Activate`, `IN_ActivateDIMouse`, `IN_ActivateMouse`, `IN_ActivateWin32Mouse`, `IN_ClearStates`, `IN_DIMouse`, `IN_DeactivateDIMouse`, `IN_DeactivateMouse`, `IN_DeactivateWin32Mouse`, `IN_Frame`, `IN_Init`, `IN_InitDIMouse`, `IN_InitWin32Mouse`, `IN_JoyMove`, `IN_MouseEvent`, `IN_MouseMove`, `IN_Shutdown`, `IN_ShutdownDIMouse`, `IN_ShutdownMIDI`, `IN_ShutdownWin32Mouse`, `IN_Startup`, `IN_StartupJoystick`, `IN_StartupMIDI`, `IN_StartupMouse`, `IN_Win32Mouse`, `JoyToF`, `JoyToI`, `MIDI_NoteOff`, `MIDI_NoteOn`, `MidiInProc`, `MidiInfo_f`
