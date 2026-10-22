# Vollständiger Original-/Port-Abgleich

Diese Datei wird mit `python scripts/parity_inventory.py` aus
`PORT_LEDGER.json` erzeugt. Sie zählt jede C-, Header- und ASM-Originaldatei
der Kategorien Runtime, Plattform und Missionpack genau einmal.

Die Spalte **Quellport** beschreibt native MiniLang-Abdeckung. Die unveränderten
Baseq3-Module `qagame.qvm`, `cgame.qvm` und `ui.qvm` laufen zusätzlich im
MiniLang-QVM-Interpreter. Dadurch können Spielfunktionen produktiv vorhanden sein,
obwohl die jeweilige C-Datei noch nicht als nativer MiniLang-Quellport gilt.

## Zusammenfassung

| Bereich | Dateien | Portiert | Teilweise | Nicht begonnen | Original behalten |
|---|---:|---:|---:|---:|---:|
| `botlib` | 53 | 21 | 10 | 22 | 0 |
| `cgame` | 25 | 21 | 0 | 4 | 0 |
| `client` | 19 | 8 | 7 | 4 | 0 |
| `game` | 65 | 35 | 4 | 26 | 0 |
| `macosx` | 8 | 0 | 0 | 8 | 0 |
| `null` | 7 | 0 | 0 | 7 | 0 |
| `q3_ui` | 47 | 45 | 0 | 2 | 0 |
| `qcommon` | 27 | 4 | 14 | 9 | 0 |
| `renderer` | 27 | 15 | 8 | 4 | 0 |
| `server` | 11 | 2 | 9 | 0 | 0 |
| `splines` | 8 | 0 | 0 | 8 | 0 |
| `ui` | 12 | 6 | 0 | 6 | 0 |
| `unix` | 13 | 0 | 0 | 13 | 0 |
| `win32` | 13 | 3 | 6 | 4 | 0 |
| **Gesamt** | **335** | **160** | **58** | **117** | **0** |

`partial` bedeutet, dass mindestens ein Originalpfad belegt ist, aber weiterhin
offene Symbole oder ausdrücklich dokumentierte Grenzen bestehen. `not_started`
ist eine echte Quellport-Lücke; Builddateien und Drittanbieterquellen sind nicht
Teil dieser Tabelle.

## Datei- und Symbolmatrix

| Originaldatei | Bereich | Quellport | Symbole | Gemappt | Offen |
|---|---|---|---:|---:|---:|
| `code/botlib/aasfile.h` | `botlib` | `partial` | 0 | 0 | 0 |
| `code/botlib/be_aas_bsp.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_bspq3.c` | `botlib` | `partial` | 21 | 0 | 21 |
| `code/botlib/be_aas_cluster.c` | `botlib` | `ported` | 31 | 31 | 0 |
| `code/botlib/be_aas_cluster.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_debug.c` | `botlib` | `ported` | 19 | 19 | 0 |
| `code/botlib/be_aas_debug.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_def.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_entity.c` | `botlib` | `partial` | 15 | 0 | 15 |
| `code/botlib/be_aas_entity.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_file.c` | `botlib` | `partial` | 8 | 0 | 8 |
| `code/botlib/be_aas_file.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_funcs.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_main.c` | `botlib` | `partial` | 17 | 0 | 17 |
| `code/botlib/be_aas_main.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_move.c` | `botlib` | `partial` | 19 | 0 | 19 |
| `code/botlib/be_aas_move.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_optimize.c` | `botlib` | `ported` | 8 | 8 | 0 |
| `code/botlib/be_aas_optimize.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_reach.c` | `botlib` | `ported` | 53 | 53 | 0 |
| `code/botlib/be_aas_reach.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_route.c` | `botlib` | `ported` | 51 | 51 | 0 |
| `code/botlib/be_aas_route.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_routealt.c` | `botlib` | `ported` | 4 | 4 | 0 |
| `code/botlib/be_aas_routealt.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_aas_sample.c` | `botlib` | `ported` | 28 | 28 | 0 |
| `code/botlib/be_aas_sample.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_ai_char.c` | `botlib` | `partial` | 19 | 0 | 19 |
| `code/botlib/be_ai_chat.c` | `botlib` | `ported` | 60 | 60 | 0 |
| `code/botlib/be_ai_gen.c` | `botlib` | `ported` | 2 | 2 | 0 |
| `code/botlib/be_ai_goal.c` | `botlib` | `ported` | 43 | 43 | 0 |
| `code/botlib/be_ai_move.c` | `botlib` | `ported` | 67 | 67 | 0 |
| `code/botlib/be_ai_weap.c` | `botlib` | `partial` | 14 | 0 | 14 |
| `code/botlib/be_ai_weight.c` | `botlib` | `ported` | 24 | 24 | 0 |
| `code/botlib/be_ai_weight.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/be_ea.c` | `botlib` | `partial` | 32 | 0 | 32 |
| `code/botlib/be_interface.c` | `botlib` | `partial` | 16 | 0 | 16 |
| `code/botlib/be_interface.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/l_crc.c` | `botlib` | `ported` | 5 | 0 | 5 |
| `code/botlib/l_crc.h` | `botlib` | `ported` | 0 | 0 | 0 |
| `code/botlib/l_libvar.c` | `botlib` | `ported` | 13 | 0 | 13 |
| `code/botlib/l_libvar.h` | `botlib` | `ported` | 0 | 0 | 0 |
| `code/botlib/l_log.c` | `botlib` | `ported` | 7 | 7 | 0 |
| `code/botlib/l_log.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/l_memory.c` | `botlib` | `ported` | 9 | 9 | 0 |
| `code/botlib/l_memory.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/l_precomp.c` | `botlib` | `ported` | 82 | 82 | 0 |
| `code/botlib/l_precomp.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/l_script.c` | `botlib` | `ported` | 39 | 1 | 38 |
| `code/botlib/l_script.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/l_struct.c` | `botlib` | `ported` | 9 | 9 | 0 |
| `code/botlib/l_struct.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/botlib/l_utils.h` | `botlib` | `not_started` | 0 | 0 | 0 |
| `code/cgame/cg_consolecmds.c` | `cgame` | `ported` | 40 | 40 | 0 |
| `code/cgame/cg_draw.c` | `cgame` | `ported` | 49 | 49 | 0 |
| `code/cgame/cg_drawtools.c` | `cgame` | `ported` | 25 | 25 | 0 |
| `code/cgame/cg_effects.c` | `cgame` | `ported` | 16 | 16 | 0 |
| `code/cgame/cg_ents.c` | `cgame` | `ported` | 18 | 18 | 0 |
| `code/cgame/cg_event.c` | `cgame` | `ported` | 7 | 7 | 0 |
| `code/cgame/cg_info.c` | `cgame` | `ported` | 5 | 5 | 0 |
| `code/cgame/cg_local.h` | `cgame` | `not_started` | 0 | 0 | 0 |
| `code/cgame/cg_localents.c` | `cgame` | `ported` | 20 | 20 | 0 |
| `code/cgame/cg_main.c` | `cgame` | `ported` | 44 | 44 | 0 |
| `code/cgame/cg_marks.c` | `cgame` | `ported` | 28 | 28 | 0 |
| `code/cgame/cg_newdraw.c` | `cgame` | `ported` | 72 | 72 | 0 |
| `code/cgame/cg_particles.c` | `cgame` | `ported` | 23 | 23 | 0 |
| `code/cgame/cg_players.c` | `cgame` | `ported` | 36 | 36 | 0 |
| `code/cgame/cg_playerstate.c` | `cgame` | `ported` | 8 | 8 | 0 |
| `code/cgame/cg_predict.c` | `cgame` | `ported` | 8 | 8 | 0 |
| `code/cgame/cg_public.h` | `cgame` | `not_started` | 0 | 0 | 0 |
| `code/cgame/cg_scoreboard.c` | `cgame` | `ported` | 5 | 5 | 0 |
| `code/cgame/cg_servercmds.c` | `cgame` | `ported` | 23 | 23 | 0 |
| `code/cgame/cg_snapshot.c` | `cgame` | `ported` | 7 | 7 | 0 |
| `code/cgame/cg_syscalls.asm` | `cgame` | `not_started` | 0 | 0 | 0 |
| `code/cgame/cg_syscalls.c` | `cgame` | `ported` | 96 | 96 | 0 |
| `code/cgame/cg_view.c` | `cgame` | `ported` | 20 | 20 | 0 |
| `code/cgame/cg_weapons.c` | `cgame` | `ported` | 35 | 35 | 0 |
| `code/cgame/tr_types.h` | `cgame` | `not_started` | 0 | 0 | 0 |
| `code/client/cl_cgame.c` | `client` | `partial` | 22 | 7 | 15 |
| `code/client/cl_cin.c` | `client` | `ported` | 38 | 5 | 33 |
| `code/client/cl_console.c` | `client` | `partial` | 22 | 4 | 18 |
| `code/client/cl_input.c` | `client` | `ported` | 78 | 78 | 0 |
| `code/client/cl_keys.c` | `client` | `partial` | 26 | 20 | 6 |
| `code/client/cl_main.c` | `client` | `ported` | 78 | 78 | 0 |
| `code/client/cl_net_chan.c` | `client` | `ported` | 5 | 0 | 5 |
| `code/client/cl_parse.c` | `client` | `partial` | 9 | 8 | 1 |
| `code/client/cl_scrn.c` | `client` | `partial` | 18 | 1 | 17 |
| `code/client/cl_ui.c` | `client` | `partial` | 35 | 6 | 29 |
| `code/client/client.h` | `client` | `not_started` | 0 | 0 | 0 |
| `code/client/keys.h` | `client` | `not_started` | 0 | 0 | 0 |
| `code/client/snd_adpcm.c` | `client` | `ported` | 4 | 0 | 4 |
| `code/client/snd_dma.c` | `client` | `ported` | 42 | 42 | 0 |
| `code/client/snd_local.h` | `client` | `not_started` | 0 | 0 | 0 |
| `code/client/snd_mem.c` | `client` | `partial` | 12 | 2 | 10 |
| `code/client/snd_mix.c` | `client` | `ported` | 8 | 8 | 0 |
| `code/client/snd_public.h` | `client` | `not_started` | 0 | 0 | 0 |
| `code/client/snd_wavelet.c` | `client` | `ported` | 9 | 2 | 7 |
| `code/game/ai_chat.c` | `game` | `ported` | 24 | 24 | 0 |
| `code/game/ai_chat.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/ai_cmd.c` | `game` | `ported` | 41 | 41 | 0 |
| `code/game/ai_cmd.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/ai_dmnet.c` | `game` | `ported` | 35 | 35 | 0 |
| `code/game/ai_dmnet.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/ai_dmq3.c` | `game` | `ported` | 114 | 114 | 0 |
| `code/game/ai_dmq3.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/ai_main.c` | `game` | `ported` | 37 | 37 | 0 |
| `code/game/ai_main.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/ai_team.c` | `game` | `ported` | 28 | 28 | 0 |
| `code/game/ai_team.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/ai_vcmd.c` | `game` | `ported` | 16 | 16 | 0 |
| `code/game/ai_vcmd.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/be_aas.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/be_ai_char.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/be_ai_chat.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/be_ai_gen.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/be_ai_goal.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/be_ai_move.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/be_ai_weap.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/be_ea.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/bg_lib.c` | `game` | `ported` | 33 | 33 | 0 |
| `code/game/bg_lib.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/bg_local.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/bg_misc.c` | `game` | `ported` | 12 | 10 | 2 |
| `code/game/bg_pmove.c` | `game` | `ported` | 42 | 39 | 3 |
| `code/game/bg_public.h` | `game` | `partial` | 0 | 0 | 0 |
| `code/game/bg_slidemove.c` | `game` | `ported` | 2 | 2 | 0 |
| `code/game/botlib.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/chars.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/g_active.c` | `game` | `ported` | 17 | 16 | 1 |
| `code/game/g_arenas.c` | `game` | `ported` | 8 | 8 | 0 |
| `code/game/g_bot.c` | `game` | `ported` | 24 | 22 | 2 |
| `code/game/g_client.c` | `game` | `ported` | 25 | 23 | 2 |
| `code/game/g_cmds.c` | `game` | `ported` | 37 | 37 | 0 |
| `code/game/g_combat.c` | `game` | `ported` | 19 | 13 | 6 |
| `code/game/g_items.c` | `game` | `ported` | 22 | 21 | 1 |
| `code/game/g_local.h` | `game` | `partial` | 0 | 0 | 0 |
| `code/game/g_main.c` | `game` | `ported` | 36 | 31 | 5 |
| `code/game/g_mem.c` | `game` | `ported` | 3 | 3 | 0 |
| `code/game/g_misc.c` | `game` | `ported` | 20 | 14 | 6 |
| `code/game/g_missile.c` | `game` | `ported` | 17 | 9 | 8 |
| `code/game/g_mover.c` | `game` | `ported` | 37 | 3 | 34 |
| `code/game/g_public.h` | `game` | `partial` | 0 | 0 | 0 |
| `code/game/g_rankings.c` | `game` | `ported` | 17 | 17 | 0 |
| `code/game/g_rankings.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/g_session.c` | `game` | `ported` | 5 | 5 | 0 |
| `code/game/g_spawn.c` | `game` | `ported` | 13 | 13 | 0 |
| `code/game/g_svcmds.c` | `game` | `ported` | 11 | 11 | 0 |
| `code/game/g_syscalls.asm` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/g_syscalls.c` | `game` | `ported` | 185 | 185 | 0 |
| `code/game/g_target.c` | `game` | `ported` | 28 | 28 | 0 |
| `code/game/g_team.c` | `game` | `ported` | 45 | 32 | 13 |
| `code/game/g_team.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/g_trigger.c` | `game` | `ported` | 20 | 19 | 1 |
| `code/game/g_utils.c` | `game` | `ported` | 24 | 18 | 6 |
| `code/game/g_weapon.c` | `game` | `ported` | 27 | 21 | 6 |
| `code/game/inv.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/match.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/q_math.c` | `game` | `ported` | 57 | 57 | 0 |
| `code/game/q_shared.c` | `game` | `ported` | 59 | 59 | 0 |
| `code/game/q_shared.h` | `game` | `partial` | 19 | 1 | 18 |
| `code/game/surfaceflags.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/game/syn.h` | `game` | `not_started` | 0 | 0 | 0 |
| `code/macosx/CGMouseDeltaFix.h` | `macosx` | `not_started` | 0 | 0 | 0 |
| `code/macosx/CGPrivateAPI.h` | `macosx` | `not_started` | 0 | 0 | 0 |
| `code/macosx/Q3Controller.h` | `macosx` | `not_started` | 0 | 0 | 0 |
| `code/macosx/macosx_display.h` | `macosx` | `not_started` | 0 | 0 | 0 |
| `code/macosx/macosx_glimp.h` | `macosx` | `not_started` | 0 | 0 | 0 |
| `code/macosx/macosx_local.h` | `macosx` | `not_started` | 0 | 0 | 0 |
| `code/macosx/macosx_qgl.h` | `macosx` | `not_started` | 337 | 0 | 337 |
| `code/macosx/macosx_timers.h` | `macosx` | `not_started` | 0 | 0 | 0 |
| `code/null/mac_net.c` | `null` | `not_started` | 3 | 0 | 3 |
| `code/null/null_client.c` | `null` | `not_started` | 21 | 0 | 21 |
| `code/null/null_glimp.c` | `null` | `not_started` | 7 | 0 | 7 |
| `code/null/null_input.c` | `null` | `not_started` | 4 | 0 | 4 |
| `code/null/null_main.c` | `null` | `not_started` | 18 | 0 | 18 |
| `code/null/null_net.c` | `null` | `not_started` | 3 | 0 | 3 |
| `code/null/null_snddma.c` | `null` | `not_started` | 8 | 0 | 8 |
| `code/q3_ui/keycodes.h` | `q3_ui` | `not_started` | 0 | 0 | 0 |
| `code/q3_ui/ui_addbots.c` | `q3_ui` | `ported` | 12 | 12 | 0 |
| `code/q3_ui/ui_atoms.c` | `q3_ui` | `ported` | 40 | 40 | 0 |
| `code/q3_ui/ui_cdkey.c` | `q3_ui` | `ported` | 7 | 7 | 0 |
| `code/q3_ui/ui_cinematics.c` | `q3_ui` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_confirm.c` | `q3_ui` | `ported` | 8 | 8 | 0 |
| `code/q3_ui/ui_connect.c` | `q3_ui` | `ported` | 5 | 5 | 0 |
| `code/q3_ui/ui_controls2.c` | `q3_ui` | `ported` | 22 | 22 | 0 |
| `code/q3_ui/ui_credits.c` | `q3_ui` | `ported` | 3 | 3 | 0 |
| `code/q3_ui/ui_demo2.c` | `q3_ui` | `ported` | 5 | 5 | 0 |
| `code/q3_ui/ui_display.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_gameinfo.c` | `q3_ui` | `ported` | 28 | 28 | 0 |
| `code/q3_ui/ui_ingame.c` | `q3_ui` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_loadconfig.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_local.h` | `q3_ui` | `not_started` | 0 | 0 | 0 |
| `code/q3_ui/ui_login.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_main.c` | `q3_ui` | `ported` | 3 | 3 | 0 |
| `code/q3_ui/ui_menu.c` | `q3_ui` | `ported` | 7 | 7 | 0 |
| `code/q3_ui/ui_mfield.c` | `q3_ui` | `ported` | 8 | 8 | 0 |
| `code/q3_ui/ui_mods.c` | `q3_ui` | `ported` | 7 | 7 | 0 |
| `code/q3_ui/ui_network.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_options.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_playermodel.c` | `q3_ui` | `ported` | 12 | 12 | 0 |
| `code/q3_ui/ui_players.c` | `q3_ui` | `ported` | 23 | 23 | 0 |
| `code/q3_ui/ui_playersettings.c` | `q3_ui` | `ported` | 11 | 11 | 0 |
| `code/q3_ui/ui_preferences.c` | `q3_ui` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_qmenu.c` | `q3_ui` | `ported` | 32 | 32 | 0 |
| `code/q3_ui/ui_rankings.c` | `q3_ui` | `ported` | 7 | 7 | 0 |
| `code/q3_ui/ui_rankstatus.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_removebots.c` | `q3_ui` | `ported` | 10 | 10 | 0 |
| `code/q3_ui/ui_saveconfig.c` | `q3_ui` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_serverinfo.c` | `q3_ui` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_servers2.c` | `q3_ui` | `ported` | 23 | 23 | 0 |
| `code/q3_ui/ui_setup.c` | `q3_ui` | `ported` | 6 | 6 | 0 |
| `code/q3_ui/ui_signup.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_sound.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_sparena.c` | `q3_ui` | `ported` | 1 | 1 | 0 |
| `code/q3_ui/ui_specifyleague.c` | `q3_ui` | `ported` | 5 | 5 | 0 |
| `code/q3_ui/ui_specifyserver.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_splevel.c` | `q3_ui` | `ported` | 22 | 22 | 0 |
| `code/q3_ui/ui_sppostgame.c` | `q3_ui` | `ported` | 12 | 12 | 0 |
| `code/q3_ui/ui_spreset.c` | `q3_ui` | `ported` | 5 | 5 | 0 |
| `code/q3_ui/ui_spskill.c` | `q3_ui` | `ported` | 8 | 8 | 0 |
| `code/q3_ui/ui_startserver.c` | `q3_ui` | `ported` | 36 | 36 | 0 |
| `code/q3_ui/ui_team.c` | `q3_ui` | `ported` | 4 | 4 | 0 |
| `code/q3_ui/ui_teamorders.c` | `q3_ui` | `ported` | 10 | 10 | 0 |
| `code/q3_ui/ui_video.c` | `q3_ui` | `ported` | 15 | 15 | 0 |
| `code/qcommon/cm_load.c` | `qcommon` | `partial` | 28 | 18 | 10 |
| `code/qcommon/cm_local.h` | `qcommon` | `not_started` | 0 | 0 | 0 |
| `code/qcommon/cm_patch.c` | `qcommon` | `partial` | 27 | 15 | 12 |
| `code/qcommon/cm_patch.h` | `qcommon` | `not_started` | 0 | 0 | 0 |
| `code/qcommon/cm_polylib.c` | `qcommon` | `partial` | 17 | 5 | 12 |
| `code/qcommon/cm_polylib.h` | `qcommon` | `not_started` | 0 | 0 | 0 |
| `code/qcommon/cm_public.h` | `qcommon` | `not_started` | 0 | 0 | 0 |
| `code/qcommon/cm_test.c` | `qcommon` | `partial` | 15 | 15 | 0 |
| `code/qcommon/cm_trace.c` | `qcommon` | `partial` | 23 | 13 | 10 |
| `code/qcommon/cmd.c` | `qcommon` | `partial` | 22 | 22 | 0 |
| `code/qcommon/common.c` | `qcommon` | `ported` | 83 | 83 | 0 |
| `code/qcommon/cvar.c` | `qcommon` | `partial` | 31 | 18 | 13 |
| `code/qcommon/files.c` | `qcommon` | `ported` | 75 | 75 | 0 |
| `code/qcommon/huffman.c` | `qcommon` | `ported` | 18 | 18 | 0 |
| `code/qcommon/md4.c` | `qcommon` | `partial` | 8 | 6 | 2 |
| `code/qcommon/msg.c` | `qcommon` | `ported` | 48 | 48 | 0 |
| `code/qcommon/net_chan.c` | `qcommon` | `partial` | 17 | 7 | 10 |
| `code/qcommon/qcommon.h` | `qcommon` | `not_started` | 0 | 0 | 0 |
| `code/qcommon/qfiles.h` | `qcommon` | `partial` | 0 | 0 | 0 |
| `code/qcommon/unzip.c` | `qcommon` | `partial` | 48 | 0 | 48 |
| `code/qcommon/unzip.h` | `qcommon` | `not_started` | 0 | 0 | 0 |
| `code/qcommon/vm.c` | `qcommon` | `partial` | 23 | 1 | 22 |
| `code/qcommon/vm_interpreted.c` | `qcommon` | `partial` | 4 | 2 | 2 |
| `code/qcommon/vm_local.h` | `qcommon` | `partial` | 0 | 0 | 0 |
| `code/qcommon/vm_ppc.c` | `qcommon` | `not_started` | 14 | 0 | 14 |
| `code/qcommon/vm_ppc_new.c` | `qcommon` | `not_started` | 18 | 0 | 18 |
| `code/qcommon/vm_x86.c` | `qcommon` | `not_started` | 15 | 0 | 15 |
| `code/renderer/qgl.h` | `renderer` | `not_started` | 0 | 0 | 0 |
| `code/renderer/qgl_linked.h` | `renderer` | `not_started` | 0 | 0 | 0 |
| `code/renderer/tr_animation.c` | `renderer` | `ported` | 2 | 2 | 0 |
| `code/renderer/tr_backend.c` | `renderer` | `ported` | 21 | 6 | 15 |
| `code/renderer/tr_bsp.c` | `renderer` | `ported` | 30 | 3 | 27 |
| `code/renderer/tr_cmds.c` | `renderer` | `partial` | 11 | 3 | 8 |
| `code/renderer/tr_curve.c` | `renderer` | `partial` | 11 | 5 | 6 |
| `code/renderer/tr_flares.c` | `renderer` | `partial` | 6 | 5 | 1 |
| `code/renderer/tr_font.c` | `renderer` | `partial` | 9 | 1 | 8 |
| `code/renderer/tr_image.c` | `renderer` | `ported` | 38 | 8 | 30 |
| `code/renderer/tr_init.c` | `renderer` | `ported` | 21 | 21 | 0 |
| `code/renderer/tr_light.c` | `renderer` | `partial` | 6 | 4 | 2 |
| `code/renderer/tr_local.h` | `renderer` | `not_started` | 0 | 0 | 0 |
| `code/renderer/tr_main.c` | `renderer` | `ported` | 32 | 15 | 17 |
| `code/renderer/tr_marks.c` | `renderer` | `ported` | 4 | 4 | 0 |
| `code/renderer/tr_mesh.c` | `renderer` | `ported` | 5 | 5 | 0 |
| `code/renderer/tr_model.c` | `renderer` | `partial` | 11 | 0 | 11 |
| `code/renderer/tr_noise.c` | `renderer` | `ported` | 3 | 3 | 0 |
| `code/renderer/tr_public.h` | `renderer` | `not_started` | 0 | 0 | 0 |
| `code/renderer/tr_scene.c` | `renderer` | `partial` | 9 | 4 | 5 |
| `code/renderer/tr_shade.c` | `renderer` | `ported` | 17 | 3 | 14 |
| `code/renderer/tr_shade_calc.c` | `renderer` | `ported` | 32 | 9 | 23 |
| `code/renderer/tr_shader.c` | `renderer` | `ported` | 34 | 34 | 0 |
| `code/renderer/tr_shadows.c` | `renderer` | `ported` | 5 | 5 | 0 |
| `code/renderer/tr_sky.c` | `renderer` | `ported` | 13 | 13 | 0 |
| `code/renderer/tr_surface.c` | `renderer` | `ported` | 24 | 16 | 8 |
| `code/renderer/tr_world.c` | `renderer` | `partial` | 15 | 1 | 14 |
| `code/server/server.h` | `server` | `partial` | 0 | 0 | 0 |
| `code/server/sv_bot.c` | `server` | `partial` | 28 | 0 | 28 |
| `code/server/sv_ccmds.c` | `server` | `ported` | 16 | 16 | 0 |
| `code/server/sv_client.c` | `server` | `partial` | 22 | 13 | 9 |
| `code/server/sv_game.c` | `server` | `partial` | 24 | 8 | 16 |
| `code/server/sv_init.c` | `server` | `partial` | 14 | 1 | 13 |
| `code/server/sv_main.c` | `server` | `partial` | 16 | 6 | 10 |
| `code/server/sv_net_chan.c` | `server` | `partial` | 5 | 4 | 1 |
| `code/server/sv_rankings.c` | `server` | `ported` | 28 | 28 | 0 |
| `code/server/sv_snapshot.c` | `server` | `partial` | 11 | 10 | 1 |
| `code/server/sv_world.c` | `server` | `partial` | 12 | 11 | 1 |
| `code/splines/math_angles.h` | `splines` | `not_started` | 4 | 0 | 4 |
| `code/splines/math_matrix.h` | `splines` | `not_started` | 5 | 0 | 5 |
| `code/splines/math_quaternion.h` | `splines` | `not_started` | 5 | 0 | 5 |
| `code/splines/math_vector.h` | `splines` | `not_started` | 18 | 0 | 18 |
| `code/splines/q_shared.h` | `splines` | `not_started` | 0 | 0 | 0 |
| `code/splines/splines.h` | `splines` | `not_started` | 0 | 0 | 0 |
| `code/splines/util_list.h` | `splines` | `not_started` | 14 | 0 | 14 |
| `code/splines/util_str.h` | `splines` | `not_started` | 4 | 0 | 4 |
| `code/ui/keycodes.h` | `ui` | `not_started` | 0 | 0 | 0 |
| `code/ui/ui_atoms.c` | `ui` | `ported` | 26 | 26 | 0 |
| `code/ui/ui_gameinfo.c` | `ui` | `ported` | 9 | 9 | 0 |
| `code/ui/ui_local.h` | `ui` | `not_started` | 0 | 0 | 0 |
| `code/ui/ui_main.c` | `ui` | `ported` | 163 | 163 | 0 |
| `code/ui/ui_players.c` | `ui` | `ported` | 25 | 25 | 0 |
| `code/ui/ui_public.h` | `ui` | `not_started` | 0 | 0 | 0 |
| `code/ui/ui_shared.c` | `ui` | `ported` | 256 | 256 | 0 |
| `code/ui/ui_shared.h` | `ui` | `not_started` | 0 | 0 | 0 |
| `code/ui/ui_syscalls.asm` | `ui` | `not_started` | 0 | 0 | 0 |
| `code/ui/ui_syscalls.c` | `ui` | `ported` | 89 | 89 | 0 |
| `code/ui/ui_util.c` | `ui` | `not_started` | 0 | 0 | 0 |
| `code/unix/linux_common.c` | `unix` | `not_started` | 4 | 0 | 4 |
| `code/unix/linux_glimp.c` | `unix` | `not_started` | 35 | 0 | 35 |
| `code/unix/linux_joystick.c` | `unix` | `not_started` | 2 | 0 | 2 |
| `code/unix/linux_local.h` | `unix` | `not_started` | 0 | 0 | 0 |
| `code/unix/linux_qgl.c` | `unix` | `not_started` | 341 | 0 | 341 |
| `code/unix/linux_signals.c` | `unix` | `not_started` | 2 | 0 | 2 |
| `code/unix/linux_snd.c` | `unix` | `not_started` | 6 | 0 | 6 |
| `code/unix/qasm.h` | `unix` | `not_started` | 0 | 0 | 0 |
| `code/unix/unix_glw.h` | `unix` | `not_started` | 0 | 0 | 0 |
| `code/unix/unix_main.c` | `unix` | `not_started` | 43 | 0 | 43 |
| `code/unix/unix_net.c` | `unix` | `not_started` | 16 | 0 | 16 |
| `code/unix/unix_shared.c` | `unix` | `not_started` | 20 | 0 | 20 |
| `code/unix/vm_x86.c` | `unix` | `not_started` | 2 | 0 | 2 |
| `code/win32/glw_win.h` | `win32` | `not_started` | 0 | 0 | 0 |
| `code/win32/resource.h` | `win32` | `not_started` | 0 | 0 | 0 |
| `code/win32/win_gamma.c` | `win32` | `ported` | 4 | 4 | 0 |
| `code/win32/win_glimp.c` | `win32` | `partial` | 21 | 3 | 18 |
| `code/win32/win_input.c` | `win32` | `partial` | 31 | 2 | 29 |
| `code/win32/win_local.h` | `win32` | `not_started` | 0 | 0 | 0 |
| `code/win32/win_main.c` | `win32` | `partial` | 34 | 1 | 33 |
| `code/win32/win_net.c` | `win32` | `partial` | 21 | 5 | 16 |
| `code/win32/win_qgl.c` | `win32` | `not_started` | 346 | 0 | 346 |
| `code/win32/win_shared.c` | `win32` | `partial` | 12 | 1 | 11 |
| `code/win32/win_snd.c` | `win32` | `ported` | 8 | 8 | 0 |
| `code/win32/win_syscon.c` | `win32` | `ported` | 8 | 8 | 0 |
| `code/win32/win_wndproc.c` | `win32` | `partial` | 5 | 1 | 4 |

## Offene Originalsymbole

Die folgende vollständige Liste dient als Arbeitswarteschlange. Leere
Symbolinventare müssen beim nächsten Audit direkt aus der Originaldatei ergänzt
werden; sie sind kein Nachweis vollständiger Parität.

- `code/botlib/aasfile.h` (partial): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_bsp.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_bspq3.c` (partial): `AAS_BSPEntityInRange`, `AAS_BSPLinkEntity`, `AAS_BSPModelMinsMaxsOrigin`, `AAS_BSPTraceLight`, `AAS_BoxEntities`, `AAS_DumpBSPData`, `AAS_EntityCollision`, `AAS_FloatForBSPEpairKey`, `AAS_FreeBSPEntities`, `AAS_IntForBSPEpairKey`, `AAS_LoadBSPFile`, `AAS_NextBSPEntity`, `AAS_ParseBSPEntities`, `AAS_PointContents`, `AAS_Trace`, `AAS_UnlinkFromBSPLeaves`, `AAS_ValueForBSPEpairKey`, `AAS_VectorForBSPEpairKey`, `AAS_inPHS`, `AAS_inPVS`, `PrintContents`
- `code/botlib/be_aas_cluster.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_debug.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_def.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_entity.c` (partial): `AAS_BestReachableEntityArea`, `AAS_EntityBSPData`, `AAS_EntityInfo`, `AAS_EntityModelNum`, `AAS_EntityModelindex`, `AAS_EntityOrigin`, `AAS_EntitySize`, `AAS_EntityType`, `AAS_InvalidateEntities`, `AAS_NearestEntity`, `AAS_NextEntity`, `AAS_OriginOfMoverWithModelNum`, `AAS_ResetEntityLinks`, `AAS_UnlinkInvalidEntities`, `AAS_UpdateEntity`
- `code/botlib/be_aas_entity.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_file.c` (partial): `AAS_DData`, `AAS_DumpAASData`, `AAS_FileInfo`, `AAS_LoadAASFile`, `AAS_LoadAASLump`, `AAS_SwapAASData`, `AAS_WriteAASFile`, `AAS_WriteAASLump`
- `code/botlib/be_aas_file.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_funcs.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_main.c` (partial): `AAS_ContinueInit`, `AAS_Error`, `AAS_IndexFromModel`, `AAS_IndexFromString`, `AAS_Initialized`, `AAS_LoadFiles`, `AAS_LoadMap`, `AAS_Loaded`, `AAS_ModelFromIndex`, `AAS_ProjectPointOntoVector`, `AAS_SetInitialized`, `AAS_Setup`, `AAS_Shutdown`, `AAS_StartFrame`, `AAS_StringFromIndex`, `AAS_Time`, `AAS_UpdateStringIndexes`
- `code/botlib/be_aas_main.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_move.c` (partial): `AAS_Accelerate`, `AAS_AgainstLadder`, `AAS_AirControl`, `AAS_ApplyFriction`, `AAS_BFGJumpZVelocity`, `AAS_ClientMovementHitBBox`, `AAS_ClientMovementPrediction`, `AAS_ClipToBBox`, `AAS_DropToFloor`, `AAS_HorizontalVelocityForJump`, `AAS_InitSettings`, `AAS_JumpReachRunStart`, `AAS_OnGround`, `AAS_PredictClientMovement`, `AAS_RocketJumpZVelocity`, `AAS_SetMovedir`, `AAS_Swimming`, `AAS_TestMovementPrediction`, `AAS_WeaponJumpZVelocity`
- `code/botlib/be_aas_move.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_optimize.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_reach.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_route.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_routealt.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_aas_sample.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_ai_char.c` (partial): `BotCharacterFromHandle`, `BotDefaultCharacteristics`, `BotDumpCharacter`, `BotFindCachedCharacter`, `BotFreeCharacter`, `BotFreeCharacter2`, `BotFreeCharacterStrings`, `BotInterpolateCharacters`, `BotLoadCachedCharacter`, `BotLoadCharacter`, `BotLoadCharacterFromFile`, `BotLoadCharacterSkill`, `BotShutdownCharacters`, `Characteristic_BFloat`, `Characteristic_BInteger`, `Characteristic_Float`, `Characteristic_Integer`, `Characteristic_String`, `CheckCharacteristicIndex`
- `code/botlib/be_ai_weap.c` (partial): `BotAllocWeaponState`, `BotChooseBestFightWeapon`, `BotFreeWeaponState`, `BotFreeWeaponWeights`, `BotGetWeaponInfo`, `BotLoadWeaponWeights`, `BotResetWeaponState`, `BotSetupWeaponAI`, `BotShutdownWeaponAI`, `BotValidWeaponNumber`, `BotWeaponStateFromHandle`, `DumpWeaponConfig`, `LoadWeaponConfig`, `WeaponWeightIndex`
- `code/botlib/be_ai_weight.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/be_ea.c` (partial): `EA_Action`, `EA_Attack`, `EA_Command`, `EA_Crouch`, `EA_DelayedJump`, `EA_DropInv`, `EA_DropItem`, `EA_EndRegular`, `EA_Gesture`, `EA_GetInput`, `EA_Jump`, `EA_Move`, `EA_MoveBack`, `EA_MoveDown`, `EA_MoveForward`, `EA_MoveLeft`, `EA_MoveRight`, `EA_MoveUp`, `EA_ResetInput`, `EA_Respawn`, `EA_Say`, `EA_SayTeam`, `EA_SelectWeapon`, `EA_Setup`, `EA_Shutdown`, `EA_Talk`, `EA_Tell`, `EA_Use`, `EA_UseInv`, `EA_UseItem`, `EA_View`, `EA_Walk`
- `code/botlib/be_interface.c` (partial): `BotExportTest`, `BotLibSetup`, `Export_BotLibLoadMap`, `Export_BotLibSetup`, `Export_BotLibShutdown`, `Export_BotLibStartFrame`, `Export_BotLibUpdateEntity`, `Export_BotLibVarGet`, `Export_BotLibVarSet`, `GetBotLibAPI`, `Init_AAS_Export`, `Init_AI_Export`, `Init_EA_Export`, `Sys_MilliSeconds`, `ValidClientNumber`, `ValidEntityNumber`
- `code/botlib/be_interface.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/l_crc.c` (ported): `CRC_ContinueProcessString`, `CRC_Init`, `CRC_ProcessByte`, `CRC_ProcessString`, `CRC_Value`
- `code/botlib/l_libvar.c` (ported): `LibVar`, `LibVarAlloc`, `LibVarChanged`, `LibVarDeAlloc`, `LibVarDeAllocAll`, `LibVarGet`, `LibVarGetString`, `LibVarGetValue`, `LibVarSet`, `LibVarSetNotModified`, `LibVarString`, `LibVarStringValue`, `LibVarValue`
- `code/botlib/l_log.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/l_memory.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/l_precomp.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/l_script.c` (ported): `EndOfScript`, `FileLength`, `FreeScript`, `GetScriptFlags`, `LoadScriptFile`, `LoadScriptMemory`, `NumLinesCrossed`, `NumberValue`, `PS_CheckTokenString`, `PS_CheckTokenType`, `PS_CreatePunctuationTable`, `PS_ExpectAnyToken`, `PS_ExpectTokenString`, `PS_ExpectTokenType`, `PS_NextWhiteSpaceChar`, `PS_ReadEscapeCharacter`, `PS_ReadLiteral`, `PS_ReadName`, `PS_ReadNumber`, `PS_ReadPrimitive`, `PS_ReadPunctuation`, `PS_ReadString`, `PS_ReadWhiteSpace`, `PS_SetBaseFolder`, `PS_SkipUntilString`, `PS_UnreadLastToken`, `PS_UnreadToken`, `PunctuationFromNum`, `ReadSignedFloat`, `ReadSignedInt`, `ResetScript`, `ScriptError`, `ScriptSkipTo`, `ScriptWarning`, `SetScriptFlags`, `SetScriptPunctuations`, `StripDoubleQuotes`, `StripSingleQuotes`
- `code/botlib/l_script.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/l_struct.h` (not_started): *(Symbolinventar ergänzen)*
- `code/botlib/l_utils.h` (not_started): *(Symbolinventar ergänzen)*
- `code/cgame/cg_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/cgame/cg_public.h` (not_started): *(Symbolinventar ergänzen)*
- `code/cgame/cg_syscalls.asm` (not_started): *(Symbolinventar ergänzen)*
- `code/cgame/tr_types.h` (not_started): *(Symbolinventar ergänzen)*
- `code/client/cl_cgame.c` (partial): `CL_AddCgameCommand`, `CL_CGameRendering`, `CL_CM_LoadMap`, `CL_CgameError`, `CL_CgameSystemCalls`, `CL_GameCommand`, `CL_GetCurrentSnapshotNumber`, `CL_GetGameState`, `CL_GetGlconfig`, `CL_GetParseEntityState`, `CL_GetSnapshot`, `CL_InitCGame`, `CL_SetUserCmdValue`, `CL_ShutdownCGame`, `FloatAsInt`
- `code/client/cl_cin.c` (ported): `CIN_CloseAllVideos`, `CIN_HandleForVideo`, `CIN_SetLooping`, `CIN_UploadCinematic`, `CL_PlayCinematic_f`, `ROQ_GenYUVTables`, `RllDecodeMonoToMono`, `RllDecodeMonoToStereo`, `RllDecodeStereoToMono`, `RllDecodeStereoToStereo`, `RllSetupTable`, `RoQFetchInterlaced`, `RoQInterrupt`, `RoQPrepMcomp`, `RoQReset`, `RoQShutdown`, `RoQ_init`, `SCR_DrawCinematic`, `SCR_RunCinematic`, `SCR_StopCinematic`, `blit2_32`, `blit4_32`, `blit8_32`, `blitVQQuad32fs`, `decodeCodeBook`, `initRoQ`, `move4_32`, `move8_32`, `readQuadInfo`, `recurseQuad`, `setupQuad`, `yuv_to_rgb`, `yuv_to_rgb24`
- `code/client/cl_console.c` (partial): `CL_ConsolePrint`, `Con_Bottom`, `Con_CheckResize`, `Con_ClearNotify`, `Con_Clear_f`, `Con_Close`, `Con_DrawConsole`, `Con_DrawNotify`, `Con_DrawSolidConsole`, `Con_Dump_f`, `Con_Init`, `Con_Linefeed`, `Con_MessageMode3_f`, `Con_MessageMode4_f`, `Con_PageDown`, `Con_PageUp`, `Con_RunConsole`, `Con_Top`
- `code/client/cl_keys.c` (partial): `CL_CharEvent`, `CL_InitKeyCommands`, `Field_BigDraw`, `Field_Draw`, `Field_Paste`, `Field_VariableSizeDraw`
- `code/client/cl_net_chan.c` (ported): `CL_Netchan_Decode`, `CL_Netchan_Encode`, `CL_Netchan_Process`, `CL_Netchan_Transmit`, `CL_Netchan_TransmitNextFragment`
- `code/client/cl_parse.c` (partial): `SHOWNET`
- `code/client/cl_scrn.c` (partial): `SCR_AdjustFrom640`, `SCR_DebugGraph`, `SCR_DrawBigString`, `SCR_DrawBigStringColor`, `SCR_DrawChar`, `SCR_DrawDebugGraph`, `SCR_DrawDemoRecording`, `SCR_DrawNamedPic`, `SCR_DrawPic`, `SCR_DrawSmallChar`, `SCR_DrawSmallStringExt`, `SCR_DrawStringExt`, `SCR_FillRect`, `SCR_GetBigStringWidth`, `SCR_Init`, `SCR_Strlen`, `SCR_UpdateScreen`
- `code/client/cl_ui.c` (partial): `CLUI_GetCDKey`, `CLUI_SetCDKey`, `CL_GetGlconfig`, `FloatAsInt`, `GetClipboardData`, `GetConfigString`, `Key_GetBindingBuf`, `Key_GetCatcher`, `Key_KeynumToStringBuf`, `Key_SetCatcher`, `LAN_AddServer`, `LAN_ClearPing`, `LAN_CompareServers`, `LAN_GetPing`, `LAN_GetPingInfo`, `LAN_GetPingQueueCount`, `LAN_GetServerAddressString`, `LAN_GetServerCount`, `LAN_GetServerInfo`, `LAN_GetServerPing`, `LAN_GetServerPtr`, `LAN_GetServerStatus`, `LAN_LoadCachedServers`, `LAN_MarkServerVisible`, `LAN_RemoveServer`, `LAN_ResetPings`, `LAN_SaveServersToCache`, `LAN_ServerIsVisible`, `LAN_UpdateVisiblePings`
- `code/client/client.h` (not_started): *(Symbolinventar ergänzen)*
- `code/client/keys.h` (not_started): *(Symbolinventar ergänzen)*
- `code/client/snd_adpcm.c` (ported): `S_AdpcmEncode`, `S_AdpcmEncodeSound`, `S_AdpcmGetSamples`, `memory`
- `code/client/snd_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/client/snd_mem.c` (partial): `FindChunk`, `FindNextChunk`, `GetLittleLong`, `GetLittleShort`, `GetWavinfo`, `SND_free`, `SND_malloc`, `SND_setup`, `S_DisplayFreeMemory`, `S_LoadSound`
- `code/client/snd_public.h` (not_started): *(Symbolinventar ergänzen)*
- `code/client/snd_wavelet.c` (ported): `MuLawEncode`, `NXPutc`, `daub4`, `decodeMuLaw`, `encodeMuLaw`, `encodeWavelet`, `wt1`
- `code/game/ai_chat.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/ai_cmd.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/ai_dmnet.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/ai_dmq3.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/ai_main.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/ai_team.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/ai_vcmd.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/be_aas.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/be_ai_char.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/be_ai_chat.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/be_ai_gen.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/be_ai_goal.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/be_ai_move.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/be_ai_weap.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/be_ea.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/bg_lib.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/bg_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/bg_misc.c` (ported): `BG_FindItemForHoldable`, `BG_FindItemForPowerup`
- `code/game/bg_pmove.c` (ported): `PM_CheckStuck`, `PM_InvulnerabilityMove`, `sqrt`
- `code/game/bg_public.h` (partial): *(Symbolinventar ergänzen)*
- `code/game/botlib.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/chars.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/g_active.c` (ported): `StuckInOtherClient`
- `code/game/g_bot.c` (ported): `PlayerIntroSound`, `trap_Cvar_VariableValue`
- `code/game/g_client.c` (ported): `skin`, `trap_DropClient`
- `code/game/g_combat.c` (ported): `G_InvulnerabilityEffect`, `Kamikaze_DeathActivate`, `Kamikaze_DeathTimer`, `RaySphereIntersections`, `TossClientCubes`, `TossClientPersistantPowerups`
- `code/game/g_items.c` (ported): `Pickup_PersistantPowerup`
- `code/game/g_local.h` (partial): *(Symbolinventar ergänzen)*
- `code/game/g_main.c` (ported): `Com_Error`, `Com_Printf`, `G_Error`, `G_Printf`, `vmMain`
- `code/game/g_misc.c` (ported): `DropPortalDestination`, `DropPortalSource`, `PortalDie`, `PortalEnable`, `PortalTouch`, `utilities`
- `code/game/g_missile.c` (ported): `ProximityMine_Activate`, `ProximityMine_Die`, `ProximityMine_Explode`, `ProximityMine_ExplodeOnPlayer`, `ProximityMine_Player`, `ProximityMine_Trigger`, `fire_nail`, `fire_prox`
- `code/game/g_mover.c` (ported): `Blocked_Door`, `G_CheckProxMinePosition`, `G_CreateRotationMatrix`, `G_MoverPush`, `G_MoverTeam`, `G_RotatePoint`, `G_TestEntityPosition`, `G_TransposeMatrix`, `G_TryPushingEntity`, `G_TryPushingProxMine`, `InitMover`, `MatchTeam`, `Reached_BinaryMover`, `Reached_Train`, `ReturnToPos1`, `SP_func_bobbing`, `SP_func_button`, `SP_func_pendulum`, `SP_func_plat`, `SP_func_rotating`, `SP_func_static`, `SP_func_train`, `SpawnPlatTrigger`, `Think_BeginMoving`, `Think_MatchTeam`, `Think_SetupTrainTargets`, `Think_SpawnNewDoorTrigger`, `Touch_Button`, `Touch_DoorTrigger`, `Touch_DoorTriggerSpectator`, `Touch_Plat`, `Touch_PlatCenterTrigger`, `Use_BinaryMover`, `triggered`
- `code/game/g_public.h` (partial): *(Symbolinventar ergänzen)*
- `code/game/g_rankings.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/g_syscalls.asm` (not_started): *(Symbolinventar ergänzen)*
- `code/game/g_team.c` (ported): `CheckObeliskAttack`, `ObeliskDie`, `ObeliskPain`, `ObeliskRegen`, `ObeliskRespawn`, `ObeliskTouch`, `OtherTeamName`, `PrintMsg`, `SP_team_blueobelisk`, `SP_team_neutralobelisk`, `SP_team_redobelisk`, `SpawnObelisk`, `TeamColorString`
- `code/game/g_team.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/g_trigger.c` (ported): `between`
- `code/game/g_utils.c` (ported): `DebugLine`, `angles`, `fieldofs`, `for`, `surface`, `tv`
- `code/game/g_weapon.c` (ported): `G_StartKamikaze`, `KamikazeDamage`, `KamikazeRadiusDamage`, `KamikazeShockWave`, `Weapon_Nailgun_Fire`, `weapon_proxlauncher_fire`
- `code/game/inv.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/match.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/q_shared.h` (partial): `BigFloat`, `BigLong`, `BigShort`, `Distance`, `DistanceSquared`, `LittleFloat`, `LittleLong`, `LittleShort`, `Q_fabs`, `Q_rsqrt`, `VectorCompare`, `VectorInverse`, `VectorLength`, `VectorLengthSquared`, `VectorNormalizeFast`, `__fctiw`, `__lhbrx`, `__lwbrx`
- `code/game/surfaceflags.h` (not_started): *(Symbolinventar ergänzen)*
- `code/game/syn.h` (not_started): *(Symbolinventar ergänzen)*
- `code/macosx/CGMouseDeltaFix.h` (not_started): *(Symbolinventar ergänzen)*
- `code/macosx/CGPrivateAPI.h` (not_started): *(Symbolinventar ergänzen)*
- `code/macosx/Q3Controller.h` (not_started): *(Symbolinventar ergänzen)*
- `code/macosx/macosx_display.h` (not_started): *(Symbolinventar ergänzen)*
- `code/macosx/macosx_glimp.h` (not_started): *(Symbolinventar ergänzen)*
- `code/macosx/macosx_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/macosx/macosx_qgl.h` (not_started): `_glGetError`, `qglAccum`, `qglAlphaFunc`, `qglAreTexturesResident`, `qglArrayElement`, `qglBegin`, `qglBindTexture`, `qglBitmap`, `qglBlendFunc`, `qglCallList`, `qglCallLists`, `qglClear`, `qglClearAccum`, `qglClearColor`, `qglClearDepth`, `qglClearIndex`, `qglClearStencil`, `qglClipPlane`, `qglColor3b`, `qglColor3bv`, `qglColor3d`, `qglColor3dv`, `qglColor3f`, `qglColor3fv`, `qglColor3i`, `qglColor3iv`, `qglColor3s`, `qglColor3sv`, `qglColor3ub`, `qglColor3ubv`, `qglColor3ui`, `qglColor3uiv`, `qglColor3us`, `qglColor3usv`, `qglColor4b`, `qglColor4bv`, `qglColor4d`, `qglColor4dv`, `qglColor4f`, `qglColor4fv`, `qglColor4i`, `qglColor4iv`, `qglColor4s`, `qglColor4sv`, `qglColor4ub`, `qglColor4ubv`, `qglColor4ui`, `qglColor4uiv`, `qglColor4us`, `qglColor4usv`, `qglColorMask`, `qglColorMaterial`, `qglColorPointer`, `qglCopyPixels`, `qglCopyTexImage1D`, `qglCopyTexImage2D`, `qglCopyTexSubImage1D`, `qglCopyTexSubImage2D`, `qglCullFace`, `qglDeleteLists`, `qglDeleteTextures`, `qglDepthFunc`, `qglDepthMask`, `qglDepthRange`, `qglDisable`, `qglDisableClientState`, `qglDrawArrays`, `qglDrawBuffer`, `qglDrawElements`, `qglDrawPixels`, `qglEdgeFlag`, `qglEdgeFlagPointer`, `qglEdgeFlagv`, `qglEnable`, `qglEnableClientState`, `qglEnd`, `qglEndList`, `qglEvalCoord1d`, `qglEvalCoord1dv`, `qglEvalCoord1f`, `qglEvalCoord1fv`, `qglEvalCoord2d`, `qglEvalCoord2dv`, `qglEvalCoord2f`, `qglEvalCoord2fv`, `qglEvalMesh1`, `qglEvalMesh2`, `qglEvalPoint1`, `qglEvalPoint2`, `qglFeedbackBuffer`, `qglFinish`, `qglFlush`, `qglFogf`, `qglFogfv`, `qglFogi`, `qglFogiv`, `qglFrontFace`, `qglFrustum`, `qglGenLists`, `qglGenTextures`, `qglGetBooleanv`, `qglGetClipPlane`, `qglGetDoublev`, `qglGetError`, `qglGetFloatv`, `qglGetIntegerv`, `qglGetLightfv`, `qglGetLightiv`, `qglGetMapdv`, `qglGetMapfv`, `qglGetMapiv`, `qglGetMaterialfv`, `qglGetMaterialiv`, `qglGetPixelMapfv`, `qglGetPixelMapuiv`, `qglGetPixelMapusv`, `qglGetPointerv`, `qglGetPolygonStipple`, `qglGetString`, `qglGetTexEnvfv`, `qglGetTexEnviv`, `qglGetTexGendv`, `qglGetTexGenfv`, `qglGetTexGeniv`, `qglGetTexImage`, `qglGetTexLevelParameterfv`, `qglGetTexLevelParameteriv`, `qglGetTexParameterfv`, `qglGetTexParameteriv`, `qglHint`, `qglIndexMask`, `qglIndexPointer`, `qglIndexd`, `qglIndexdv`, `qglIndexf`, `qglIndexfv`, `qglIndexi`, `qglIndexiv`, `qglIndexs`, `qglIndexsv`, `qglIndexub`, `qglIndexubv`, `qglInitNames`, `qglInterleavedArrays`, `qglIsEnabled`, `qglIsList`, `qglIsTexture`, `qglLightModelf`, `qglLightModelfv`, `qglLightModeli`, `qglLightModeliv`, `qglLightf`, `qglLightfv`, `qglLighti`, `qglLightiv`, `qglLineStipple`, `qglLineWidth`, `qglListBase`, `qglLoadIdentity`, `qglLoadMatrixd`, `qglLoadMatrixf`, `qglLoadName`, `qglLogicOp`, `qglMap1d`, `qglMap1f`, `qglMap2d`, `qglMap2f`, `qglMapGrid1d`, `qglMapGrid1f`, `qglMapGrid2d`, `qglMapGrid2f`, `qglMaterialf`, `qglMaterialfv`, `qglMateriali`, `qglMaterialiv`, `qglMatrixMode`, `qglMultMatrixd`, `qglMultMatrixf`, `qglNewList`, `qglNormal3b`, `qglNormal3bv`, `qglNormal3d`, `qglNormal3dv`, `qglNormal3f`, `qglNormal3fv`, `qglNormal3i`, `qglNormal3iv`, `qglNormal3s`, `qglNormal3sv`, `qglNormalPointer`, `qglOrtho`, `qglPassThrough`, `qglPixelMapfv`, `qglPixelMapuiv`, `qglPixelMapusv`, `qglPixelStoref`, `qglPixelStorei`, `qglPixelTransferf`, `qglPixelTransferi`, `qglPixelZoom`, `qglPointSize`, `qglPolygonMode`, `qglPolygonOffset`, `qglPolygonStipple`, `qglPopAttrib`, `qglPopClientAttrib`, `qglPopMatrix`, `qglPopName`, `qglPrioritizeTextures`, `qglPushAttrib`, `qglPushClientAttrib`, `qglPushMatrix`, `qglPushName`, `qglRasterPos2d`, `qglRasterPos2dv`, `qglRasterPos2f`, `qglRasterPos2fv`, `qglRasterPos2i`, `qglRasterPos2iv`, `qglRasterPos2s`, `qglRasterPos2sv`, `qglRasterPos3d`, `qglRasterPos3dv`, `qglRasterPos3f`, `qglRasterPos3fv`, `qglRasterPos3i`, `qglRasterPos3iv`, `qglRasterPos3s`, `qglRasterPos3sv`, `qglRasterPos4d`, `qglRasterPos4dv`, `qglRasterPos4f`, `qglRasterPos4fv`, `qglRasterPos4i`, `qglRasterPos4iv`, `qglRasterPos4s`, `qglRasterPos4sv`, `qglReadBuffer`, `qglReadPixels`, `qglRectd`, `qglRectdv`, `qglRectf`, `qglRectfv`, `qglRecti`, `qglRectiv`, `qglRects`, `qglRectsv`, `qglRenderMode`, `qglRotated`, `qglRotatef`, `qglScaled`, `qglScalef`, `qglScissor`, `qglSelectBuffer`, `qglShadeModel`, `qglStencilFunc`, `qglStencilMask`, `qglStencilOp`, `qglTexCoord1d`, `qglTexCoord1dv`, `qglTexCoord1f`, `qglTexCoord1fv`, `qglTexCoord1i`, `qglTexCoord1iv`, `qglTexCoord1s`, `qglTexCoord1sv`, `qglTexCoord2d`, `qglTexCoord2dv`, `qglTexCoord2f`, `qglTexCoord2fv`, `qglTexCoord2i`, `qglTexCoord2iv`, `qglTexCoord2s`, `qglTexCoord2sv`, `qglTexCoord3d`, `qglTexCoord3dv`, `qglTexCoord3f`, `qglTexCoord3fv`, `qglTexCoord3i`, `qglTexCoord3iv`, `qglTexCoord3s`, `qglTexCoord3sv`, `qglTexCoord4d`, `qglTexCoord4dv`, `qglTexCoord4f`, `qglTexCoord4fv`, `qglTexCoord4i`, `qglTexCoord4iv`, `qglTexCoord4s`, `qglTexCoord4sv`, `qglTexCoordPointer`, `qglTexEnvf`, `qglTexEnvfv`, `qglTexEnvi`, `qglTexEnviv`, `qglTexGend`, `qglTexGendv`, `qglTexGenf`, `qglTexGenfv`, `qglTexGeni`, `qglTexGeniv`, `qglTexImage1D`, `qglTexImage2D`, `qglTexParameterf`, `qglTexParameterfv`, `qglTexParameteri`, `qglTexParameteriv`, `qglTexSubImage1D`, `qglTexSubImage2D`, `qglTranslated`, `qglTranslatef`, `qglVertex2d`, `qglVertex2dv`, `qglVertex2f`, `qglVertex2fv`, `qglVertex2i`, `qglVertex2iv`, `qglVertex2s`, `qglVertex2sv`, `qglVertex3d`, `qglVertex3dv`, `qglVertex3f`, `qglVertex3fv`, `qglVertex3i`, `qglVertex3iv`, `qglVertex3s`, `qglVertex3sv`, `qglVertex4d`, `qglVertex4dv`, `qglVertex4f`, `qglVertex4fv`, `qglVertex4i`, `qglVertex4iv`, `qglVertex4s`, `qglVertex4sv`, `qglVertexPointer`, `qglViewport`
- `code/macosx/macosx_timers.h` (not_started): *(Symbolinventar ergänzen)*
- `code/null/mac_net.c` (not_started): `NET_StringToAdr`, `Sys_GetPacket`, `Sys_SendPacket`
- `code/null/null_client.c` (not_started): `CL_CDDialog`, `CL_CDKeyValidate`, `CL_CharEvent`, `CL_ConsolePrint`, `CL_Disconnect`, `CL_FlushMemory`, `CL_ForwardCommandToServer`, `CL_Frame`, `CL_GameCommand`, `CL_Init`, `CL_InitKeyCommands`, `CL_JoystickEvent`, `CL_KeyEvent`, `CL_MapLoading`, `CL_MouseEvent`, `CL_PacketEvent`, `CL_Shutdown`, `CL_ShutdownAll`, `CL_StartHunkUsers`, `Key_WriteBindings`, `UI_GameCommand`
- `code/null/null_glimp.c` (not_started): `GLimp_EnableLogging`, `GLimp_EndFrame`, `GLimp_Init`, `GLimp_LogComment`, `GLimp_Shutdown`, `QGL_Init`, `QGL_Shutdown`
- `code/null/null_input.c` (not_started): `IN_Frame`, `IN_Init`, `IN_Shutdown`, `Sys_SendKeyEvents`
- `code/null/null_main.c` (not_started): `Sys_BeginStreamedFile`, `Sys_EarlyOutput`, `Sys_EndStreamedFile`, `Sys_Error`, `Sys_FindClose`, `Sys_FindFirst`, `Sys_FindNext`, `Sys_GetClipboardData`, `Sys_GetGameAPI`, `Sys_Init`, `Sys_Milliseconds`, `Sys_Mkdir`, `Sys_Quit`, `Sys_StreamSeek`, `Sys_StreamedRead`, `Sys_UnloadGame`, `Sys_mkdir`, `main`
- `code/null/null_net.c` (not_started): `NET_StringToAdr`, `Sys_GetPacket`, `Sys_SendPacket`
- `code/null/null_snddma.c` (not_started): `SNDDMA_BeginPainting`, `SNDDMA_GetDMAPos`, `SNDDMA_Init`, `SNDDMA_Shutdown`, `SNDDMA_Submit`, `S_ClearSoundBuffer`, `S_RegisterSound`, `S_StartLocalSound`
- `code/q3_ui/keycodes.h` (not_started): *(Symbolinventar ergänzen)*
- `code/q3_ui/ui_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/qcommon/cm_load.c` (partial): `CM_Checksum`, `CM_ClearMap`, `CM_EntityString`, `CM_LoadMap`, `CM_LumpChecksum`, `CMod_LoadEntityString`, `CMod_LoadLeafBrushes`, `CMod_LoadLeafSurfaces`, `CMod_LoadShaders`, `SetPlaneSignbits`
- `code/qcommon/cm_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/qcommon/cm_patch.c` (partial): `CM_ClearLevelPatches`, `CM_ComparePoints`, `CM_DrawDebugSurface`, `CM_EdgePlaneNum`, `CM_GridPlane`, `CM_NeedsSubdivision`, `CM_PlaneEqual`, `CM_PlaneFromPoints`, `CM_PointOnPlaneSide`, `CM_SetGridWrapWidth`, `CM_SignbitsForNormal`, `CM_SnapVector`
- `code/qcommon/cm_patch.h` (not_started): *(Symbolinventar ergänzen)*
- `code/qcommon/cm_polylib.c` (partial): `AddWindingToConvexHull`, `AllocWinding`, `CheckWinding`, `ClipWindingEpsilon`, `CopyWinding`, `FreeWinding`, `RemoveColinearPoints`, `ReverseWinding`, `WindingArea`, `WindingCenter`, `WindingOnPlaneSide`, `WindingPlane`
- `code/qcommon/cm_polylib.h` (not_started): *(Symbolinventar ergänzen)*
- `code/qcommon/cm_public.h` (not_started): *(Symbolinventar ergänzen)*
- `code/qcommon/cm_test.c` (partial): *(Symbolinventar ergänzen)*
- `code/qcommon/cm_trace.c` (partial): `CM_DistanceFromLineSquared`, `CM_ProjectPointOntoVector`, `CM_TestBoundingBoxInCapsule`, `CM_TestCapsuleInCapsule`, `CM_TraceBoundingBoxThroughCapsule`, `CM_TraceThroughSphere`, `CM_TraceThroughVerticalCylinder`, `CM_VectorDistanceSquared`, `SquareRootFloat`, `collision`
- `code/qcommon/cmd.c` (partial): *(Symbolinventar ergänzen)*
- `code/qcommon/cvar.c` (partial): `Cvar_CommandCompletion`, `Cvar_FindVar`, `Cvar_InfoString`, `Cvar_InfoStringBuffer`, `Cvar_InfoString_Big`, `Cvar_SetLatched`, `Cvar_SetValue`, `Cvar_ValidateString`, `Cvar_VariableIntegerValue`, `Cvar_VariableString`, `Cvar_VariableStringBuffer`, `Cvar_VariableValue`, `generateHashValue`
- `code/qcommon/md4.c` (partial): `Decode`, `Encode`
- `code/qcommon/net_chan.c` (partial): `NET_AdrToString`, `NET_CompareAdr`, `NET_CompareBaseAdr`, `NET_GetLoopPacket`, `NET_IsLocalAddress`, `NET_SendLoopPacket`, `NET_StringToAdr`, `Netchan_ScramblePacket`, `Netchan_UnScramblePacket`, `datagram`
- `code/qcommon/qcommon.h` (not_started): *(Symbolinventar ergänzen)*
- `code/qcommon/qfiles.h` (partial): *(Symbolinventar ergänzen)*
- `code/qcommon/unzip.c` (partial): `adler32`, `inflate`, `inflateEnd`, `inflateInit2_`, `inflateInit_`, `inflateReset`, `inflateSetDictionary`, `inflateSync`, `inflateSyncPoint`, `inflate_blocks`, `inflate_blocks_free`, `inflate_blocks_new`, `inflate_blocks_reset`, `inflate_blocks_sync_point`, `inflate_codes`, `inflate_codes_free`, `inflate_codes_new`, `inflate_fast`, `inflate_flush`, `inflate_set_dictionary`, `strcmpcasenosensitive_internal`, `unzClose`, `unzCloseCurrentFile`, `unzGetCurrentFileInfo`, `unzGetCurrentFileInfoPosition`, `unzGetGlobalComment`, `unzGetGlobalInfo`, `unzGetLocalExtrafield`, `unzGoToFirstFile`, `unzGoToNextFile`, `unzLocateFile`, `unzOpen`, `unzOpenCurrentFile`, `unzReOpen`, `unzReadCurrentFile`, `unzSetCurrentFileInfoPosition`, `unzStringFileNameCompare`, `unzeof`, `unzlocal_CheckCurrentFileCoherencyHeader`, `unzlocal_DosDateToTmuDate`, `unzlocal_GetCurrentFileInfoInternal`, `unzlocal_SearchCentralDir`, `unzlocal_getByte`, `unzlocal_getLong`, `unzlocal_getShort`, `unztell`, `zcalloc`, `zcfree`
- `code/qcommon/unzip.h` (not_started): *(Symbolinventar ergänzen)*
- `code/qcommon/vm.c` (partial): `ParseHex`, `VM_ArgPtr`, `VM_Call`, `VM_CallCompiled`, `VM_Clear`, `VM_Compile`, `VM_Debug`, `VM_DllSyscall`, `VM_ExplicitArgPtr`, `VM_Free`, `VM_Init`, `VM_LoadSymbols`, `VM_LogSyscalls`, `VM_ProfileSort`, `VM_Restart`, `VM_SymbolForCompiledPointer`, `VM_SymbolToValue`, `VM_VM2C`, `VM_ValueToFunctionSymbol`, `VM_ValueToSymbol`, `VM_VmInfo_f`, `VM_VmProfile_f`
- `code/qcommon/vm_interpreted.c` (partial): `VM_Indent`, `VM_StackTrace`
- `code/qcommon/vm_local.h` (partial): *(Symbolinventar ergänzen)*
- `code/qcommon/vm_ppc.c` (not_started): `AsmCall`, `Constant1`, `Constant4`, `Emit4`, `Inst`, `Inst4`, `InstImm`, `InstImmU`, `VM_CallCompiled`, `VM_Compile`, `fltop`, `fltopandsecond`, `ltop`, `ltopandsecond`
- `code/qcommon/vm_ppc_new.c` (not_started): `AsmCall`, `Constant1`, `Constant4`, `Emit4`, `Inst`, `Inst4`, `InstImm`, `InstImmU`, `VM_CallCompiled`, `VM_Compile`, `fltop`, `fltopandsecond`, `loadOpStack`, `ltop`, `ltopandsecond`, `makeFloat`, `makeInteger`, `spillOpStack`
- `code/qcommon/vm_x86.c` (not_started): `AsmCall`, `Constant1`, `Constant4`, `Emit1`, `Emit2`, `Emit4`, `EmitAddEDI4`, `EmitCommand`, `EmitMovEAXEDI`, `EmitMovEBXEDI`, `EmitString`, `Hex`, `VM_CallCompiled`, `VM_Compile`, `callAsmCall`
- `code/renderer/qgl.h` (not_started): *(Symbolinventar ergänzen)*
- `code/renderer/qgl_linked.h` (not_started): *(Symbolinventar ergänzen)*
- `code/renderer/tr_backend.c` (ported): `GL_Cull`, `GL_State`, `GL_TexEnv`, `RB_BeginDrawingView`, `RB_DrawBuffer`, `RB_DrawSurfs`, `RB_ExecuteRenderCommands`, `RB_Hyperspace`, `RB_RenderThread`, `RB_SetColor`, `RB_SetGL2D`, `RB_ShowImages`, `RB_SwapBuffers`, `RE_StretchRaw`, `SetViewportAndScissor`
- `code/renderer/tr_bsp.c` (ported): `HSVtoRGB`, `ParseFace`, `ParseMesh`, `ParseTriSurf`, `RE_LoadWorldMap`, `RE_SetWorldVisData`, `R_FixSharedVertexLodError`, `R_FixSharedVertexLodError_r`, `R_GetEntityToken`, `R_LoadEntities`, `R_LoadFogs`, `R_LoadLightGrid`, `R_LoadLightmaps`, `R_LoadMarksurfaces`, `R_LoadNodesAndLeafs`, `R_LoadPlanes`, `R_LoadShaders`, `R_LoadSurfaces`, `R_LoadVisibility`, `R_MergedHeightPoints`, `R_MergedWidthPoints`, `R_MovePatchSurfacesToHunk`, `R_SetParent`, `R_StitchAllPatches`, `R_StitchPatches`, `ShaderForShaderNum`, `patch`
- `code/renderer/tr_cmds.c` (partial): `RE_BeginFrame`, `RE_EndFrame`, `R_AddDrawSurfCmd`, `R_InitCommandBuffers`, `R_IssueRenderCommands`, `R_PerformanceCounters`, `R_ShutdownCommandBuffers`, `R_SyncRenderThread`
- `code/renderer/tr_curve.c` (partial): `InvertCtrl`, `InvertErrorTable`, `R_CreateSurfaceGridMesh`, `R_FreeSurfaceGridMesh`, `R_GridInsertColumn`, `R_GridInsertRow`
- `code/renderer/tr_flares.c` (partial): `R_ClearFlares`
- `code/renderer/tr_font.c` (partial): `RE_ConstructGlyphInfo`, `R_DoneFreeType`, `R_GetGlyphInfo`, `R_InitFreeType`, `R_RenderGlyph`, `WriteTGA`, `readFloat`, `readInt`
- `code/renderer/tr_image.c` (ported): `CommaParse`, `GL_TextureMode`, `LoadBMP`, `LoadJPG`, `LoadPCX`, `LoadPCX32`, `RE_RegisterSkin`, `R_BlendOverTexture`, `R_CreateBuiltinImages`, `R_CreateDefaultImage`, `R_CreateDlightImage`, `R_CreateFogImage`, `R_DeleteTextures`, `R_FogFactor`, `R_GammaCorrect`, `R_GetSkinByHandle`, `R_ImageList_f`, `R_InitFogTable`, `R_InitImages`, `R_InitSkins`, `R_LoadImage`, `R_SetColorMappings`, `R_SkinList_f`, `R_SumOfUsedImages`, `SaveJPG`, `Upload32`, `empty_output_buffer`, `init_destination`, `jpegDest`, `term_destination`
- `code/renderer/tr_light.c` (partial): `LogLight`, `end`
- `code/renderer/tr_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/renderer/tr_main.c` (ported): `IsMirror`, `R_AddEntitySurfaces`, `R_DebugGraphics`, `R_DebugPolygon`, `R_GenerateDrawSurfs`, `R_MirrorViewBySurface`, `R_PlaneForSurface`, `R_RenderView`, `R_RotateForEntity`, `R_RotateForViewer`, `R_SetupProjection`, `R_SpriteFogNum`, `SetFarClip`, `SurfIsOffscreen`, `myGlMultMatrix`, `qsortFast`, `shortsort`
- `code/renderer/tr_model.c` (partial): `RE_BeginRegistration`, `RE_RegisterModel`, `R_AllocModel`, `R_GetModelByHandle`, `R_GetTag`, `R_LerpTag`, `R_LoadMD3`, `R_LoadMD4`, `R_ModelBounds`, `R_ModelInit`, `R_Modellist_f`
- `code/renderer/tr_public.h` (not_started): *(Symbolinventar ergänzen)*
- `code/renderer/tr_scene.c` (partial): `RE_AddAdditiveLightToScene`, `RE_AddLightToScene`, `RE_RenderScene`, `R_AddPolygonSurfaces`, `R_ToggleSmpFrame`
- `code/renderer/tr_shade.c` (ported): `ComputeTexCoords`, `DrawMultitextured`, `DrawNormals`, `DrawTris`, `ProjectDlightTexture`, `RB_EndSurface`, `RB_FogPass`, `RB_IterateStagesGeneric`, `RB_StageIteratorGeneric`, `RB_StageIteratorLightmappedMultitexture`, `RB_StageIteratorVertexLitTexture`, `R_ArrayElementDiscrete`, `R_DrawElements`, `R_DrawStripElements`
- `code/renderer/tr_shade_calc.c` (ported): `Autosprite2Deform`, `AutospriteDeform`, `DeformText`, `EvalWaveForm`, `EvalWaveFormClamped`, `GlobalVectorToLocal`, `RB_CalcBulgeVertexes`, `RB_CalcDeformNormals`, `RB_CalcDeformVertexes`, `RB_CalcDiffuseColor`, `RB_CalcEnvironmentTexCoords`, `RB_CalcFogTexCoords`, `RB_CalcMoveVertexes`, `RB_CalcRotateTexCoords`, `RB_CalcScaleTexCoords`, `RB_CalcStretchTexCoords`, `RB_CalcTransformTexCoords`, `RB_CalcTurbulentTexCoords`, `RB_CalcWaveAlpha`, `RB_CalcWaveColor`, `RB_DeformTessGeometry`, `TableForFunc`, `myftol`
- `code/renderer/tr_surface.c` (ported): `LodErrorForVolume`, `RB_CheckOverflow`, `RB_SurfaceAxis`, `RB_SurfaceBad`, `RB_SurfaceDisplayList`, `RB_SurfaceEntity`, `RB_SurfaceFlare`, `RB_SurfaceSkip`
- `code/renderer/tr_world.c` (partial): `R_AddWorldSurface`, `R_AddWorldSurfaces`, `R_ClusterPVS`, `R_CullGrid`, `R_CullSurface`, `R_CullTriSurf`, `R_DlightFace`, `R_DlightGrid`, `R_DlightSurface`, `R_DlightTrisurf`, `R_MarkLeaves`, `R_PointInLeaf`, `R_RecursiveWorldNode`, `R_inPVS`
- `code/server/server.h` (partial): *(Symbolinventar ergänzen)*
- `code/server/sv_bot.c` (partial): `BotClientCommand`, `BotDrawDebugPolygons`, `BotImport_BSPEntityData`, `BotImport_BSPModelMinsMaxsOrigin`, `BotImport_DebugLineCreate`, `BotImport_DebugLineDelete`, `BotImport_DebugLineShow`, `BotImport_DebugPolygonCreate`, `BotImport_DebugPolygonDelete`, `BotImport_DebugPolygonShow`, `BotImport_EntityTrace`, `BotImport_FreeMemory`, `BotImport_GetMemory`, `BotImport_HunkAlloc`, `BotImport_PointContents`, `BotImport_Print`, `BotImport_Trace`, `BotImport_inPVS`, `EntityInPVS`, `SV_BotAllocateClient`, `SV_BotFrame`, `SV_BotFreeClient`, `SV_BotGetConsoleMessage`, `SV_BotGetSnapshotEntity`, `SV_BotInitBotLib`, `SV_BotInitCvars`, `SV_BotLibSetup`, `SV_BotLibShutdown`
- `code/server/sv_client.c` (partial): `SV_AuthorizeIpPacket`, `SV_ClientEnterWorld`, `SV_Disconnect_f`, `SV_FinalMessage`, `SV_ResetPureClient_f`, `SV_SendClientGameState`, `SV_UpdateUserinfo_f`, `SV_UserinfoChanged`, `SV_VerifyPaks_f`
- `code/server/sv_game.c` (partial): `FloatAsInt`, `SV_AdjustAreaPortalState`, `SV_GEntityForSvEntity`, `SV_GameClientNum`, `SV_GameCommand`, `SV_GameDropClient`, `SV_GameError`, `SV_GamePrint`, `SV_GameSendServerCommand`, `SV_GentityNum`, `SV_GetServerinfo`, `SV_GetUsercmd`, `SV_LocateGameData`, `SV_NumForGentity`, `SV_SvEntityForGentity`, `SV_inPVSIgnorePortals`
- `code/server/sv_init.c` (partial): `SV_BoundMaxClients`, `SV_ChangeMaxClients`, `SV_ClearServer`, `SV_CreateBaseline`, `SV_FinalMessage`, `SV_GetConfigstring`, `SV_GetUserinfo`, `SV_Init`, `SV_SetUserinfo`, `SV_Shutdown`, `SV_SpawnServer`, `SV_Startup`, `SV_TouchCGame`
- `code/server/sv_main.c` (partial): `SVC_Info`, `SVC_RemoteCommand`, `SVC_Status`, `SV_AddServerCommand`, `SV_ExpandNewlines`, `SV_FlushRedirect`, `SV_MasterHeartbeat`, `SV_MasterShutdown`, `SV_ReplacePendingServerCommands`, `SV_SendServerCommand`
- `code/server/sv_net_chan.c` (partial): `fragments`
- `code/server/sv_snapshot.c` (partial): `SV_SendClientMessages`
- `code/server/sv_world.c` (partial): `SV_SectorList_f`
- `code/splines/math_angles.h` (not_started): `Zero`, `angles_t`, `set`, `vec3_p`
- `code/splines/math_matrix.h` (not_started): `Identity`, `InverseMultiply`, `OrthoNormalize`, `SkewSymmetric`, `mat3_t`
- `code/splines/math_quaternion.h` (not_started): `Length`, `Normalize`, `quat_t`, `set`, `vec4`
- `code/splines/math_vector.h` (not_started): `AddBounds`, `AddPoint`, `Bounds`, `Center`, `Clear`, `ContainsPoint`, `Cross`, `IntersectsBounds`, `IsCleared`, `Normalize`, `Radius`, `Snap`, `SnapTowards`, `Zero`, `idSqrt`, `idVec3_t`, `set`, `vec4_t`
- `code/splines/q_shared.h` (not_started): *(Symbolinventar ergänzen)*
- `code/splines/splines.h` (not_started): *(Symbolinventar ergänzen)*
- `code/splines/util_list.h` (not_started): `AddUnique`, `Append`, `Clear`, `Condense`, `Find`, `Num`, `Remove`, `RemoveIndex`, `Resize`, `SetGranularity`, `SetNum`, `Size`, `Sort`, `idList`
- `code/splines/util_str.h` (not_started): `append`, `idStr`, `tolower`, `toupper`
- `code/ui/keycodes.h` (not_started): *(Symbolinventar ergänzen)*
- `code/ui/ui_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/ui/ui_public.h` (not_started): *(Symbolinventar ergänzen)*
- `code/ui/ui_shared.h` (not_started): *(Symbolinventar ergänzen)*
- `code/ui/ui_syscalls.asm` (not_started): *(Symbolinventar ergänzen)*
- `code/ui/ui_util.c` (not_started): *(Symbolinventar ergänzen)*
- `code/unix/linux_common.c` (not_started): `Com_Memcpy`, `Com_Memset`, `Com_Prefetch`, `_copyDWord`
- `code/unix/linux_glimp.c` (not_started): `CreateNullCursor`, `GLW_InitExtensions`, `GLW_InitGamma`, `GLW_LoadOpenGL`, `GLW_SetMode`, `GLW_StartDriverAndSetMode`, `GLimp_EndFrame`, `GLimp_FrontEndSleep`, `GLimp_Init`, `GLimp_LogComment`, `GLimp_RenderThreadWrapper`, `GLimp_RendererSleep`, `GLimp_SetGamma`, `GLimp_Shutdown`, `GLimp_SpawnRenderThread`, `GLimp_WakeRenderer`, `HandleEvents`, `IN_Activate`, `IN_ActivateMouse`, `IN_DeactivateMouse`, `IN_Frame`, `IN_Init`, `IN_JoyMove`, `IN_Shutdown`, `IN_StartupJoystick`, `KBD_Close`, `KBD_Init`, `Q_stristr`, `Sys_SendKeyEvents`, `X11_PendingInput`, `XLateKey`, `install_grabs`, `qXErrorHandler`, `repeated_press`, `uninstall_grabs`
- `code/unix/linux_joystick.c` (not_started): `IN_JoyMove`, `IN_StartupJoystick`
- `code/unix/linux_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/unix/linux_qgl.c` (not_started): `GLimp_LogNewFrame`, `QGL_EnableLogging`, `QGL_Init`, `QGL_Shutdown`, `logAccum`, `logAlphaFunc`, `logAreTexturesResident`, `logArrayElement`, `logBegin`, `logBindTexture`, `logBitmap`, `logBlendFunc`, `logCallList`, `logCallLists`, `logClear`, `logClearAccum`, `logClearColor`, `logClearDepth`, `logClearIndex`, `logClearStencil`, `logClipPlane`, `logColor3b`, `logColor3bv`, `logColor3d`, `logColor3dv`, `logColor3f`, `logColor3fv`, `logColor3i`, `logColor3iv`, `logColor3s`, `logColor3sv`, `logColor3ub`, `logColor3ubv`, `logColor3ui`, `logColor3uiv`, `logColor3us`, `logColor3usv`, `logColor4b`, `logColor4bv`, `logColor4d`, `logColor4dv`, `logColor4f`, `logColor4fv`, `logColor4i`, `logColor4iv`, `logColor4s`, `logColor4sv`, `logColor4ub`, `logColor4ubv`, `logColor4ui`, `logColor4uiv`, `logColor4us`, `logColor4usv`, `logColorMask`, `logColorMaterial`, `logColorPointer`, `logCopyPixels`, `logCopyTexImage1D`, `logCopyTexImage2D`, `logCopyTexSubImage1D`, `logCopyTexSubImage2D`, `logCullFace`, `logDeleteLists`, `logDeleteTextures`, `logDepthFunc`, `logDepthMask`, `logDepthRange`, `logDisable`, `logDisableClientState`, `logDrawArrays`, `logDrawBuffer`, `logDrawElements`, `logDrawPixels`, `logEdgeFlag`, `logEdgeFlagPointer`, `logEdgeFlagv`, `logEnable`, `logEnableClientState`, `logEnd`, `logEndList`, `logEvalCoord1d`, `logEvalCoord1dv`, `logEvalCoord1f`, `logEvalCoord1fv`, `logEvalCoord2d`, `logEvalCoord2dv`, `logEvalCoord2f`, `logEvalCoord2fv`, `logEvalMesh1`, `logEvalMesh2`, `logEvalPoint1`, `logEvalPoint2`, `logFeedbackBuffer`, `logFinish`, `logFlush`, `logFogf`, `logFogfv`, `logFogi`, `logFogiv`, `logFrontFace`, `logFrustum`, `logGenLists`, `logGenTextures`, `logGetBooleanv`, `logGetClipPlane`, `logGetDoublev`, `logGetError`, `logGetFloatv`, `logGetIntegerv`, `logGetLightfv`, `logGetLightiv`, `logGetMapdv`, `logGetMapfv`, `logGetMapiv`, `logGetMaterialfv`, `logGetMaterialiv`, `logGetPixelMapfv`, `logGetPixelMapuiv`, `logGetPixelMapusv`, `logGetPointerv`, `logGetPolygonStipple`, `logGetString`, `logGetTexEnvfv`, `logGetTexEnviv`, `logGetTexGendv`, `logGetTexGenfv`, `logGetTexGeniv`, `logGetTexImage`, `logGetTexLevelParameterfv`, `logGetTexLevelParameteriv`, `logGetTexParameterfv`, `logGetTexParameteriv`, `logHint`, `logIndexMask`, `logIndexPointer`, `logIndexd`, `logIndexdv`, `logIndexf`, `logIndexfv`, `logIndexi`, `logIndexiv`, `logIndexs`, `logIndexsv`, `logIndexub`, `logIndexubv`, `logInitNames`, `logInterleavedArrays`, `logIsEnabled`, `logIsList`, `logIsTexture`, `logLightModelf`, `logLightModelfv`, `logLightModeli`, `logLightModeliv`, `logLightf`, `logLightfv`, `logLighti`, `logLightiv`, `logLineStipple`, `logLineWidth`, `logListBase`, `logLoadIdentity`, `logLoadMatrixd`, `logLoadMatrixf`, `logLoadName`, `logLogicOp`, `logMap1d`, `logMap1f`, `logMap2d`, `logMap2f`, `logMapGrid1d`, `logMapGrid1f`, `logMapGrid2d`, `logMapGrid2f`, `logMaterialf`, `logMaterialfv`, `logMateriali`, `logMaterialiv`, `logMatrixMode`, `logMultMatrixd`, `logMultMatrixf`, `logNewList`, `logNormal3b`, `logNormal3bv`, `logNormal3d`, `logNormal3dv`, `logNormal3f`, `logNormal3fv`, `logNormal3i`, `logNormal3iv`, `logNormal3s`, `logNormal3sv`, `logNormalPointer`, `logOrtho`, `logPassThrough`, `logPixelMapfv`, `logPixelMapuiv`, `logPixelMapusv`, `logPixelStoref`, `logPixelStorei`, `logPixelTransferf`, `logPixelTransferi`, `logPixelZoom`, `logPointSize`, `logPolygonMode`, `logPolygonOffset`, `logPolygonStipple`, `logPopAttrib`, `logPopClientAttrib`, `logPopMatrix`, `logPopName`, `logPrioritizeTextures`, `logPushAttrib`, `logPushClientAttrib`, `logPushMatrix`, `logPushName`, `logRasterPos2d`, `logRasterPos2dv`, `logRasterPos2f`, `logRasterPos2fv`, `logRasterPos2i`, `logRasterPos2iv`, `logRasterPos2s`, `logRasterPos2sv`, `logRasterPos3d`, `logRasterPos3dv`, `logRasterPos3f`, `logRasterPos3fv`, `logRasterPos3i`, `logRasterPos3iv`, `logRasterPos3s`, `logRasterPos3sv`, `logRasterPos4d`, `logRasterPos4dv`, `logRasterPos4f`, `logRasterPos4fv`, `logRasterPos4i`, `logRasterPos4iv`, `logRasterPos4s`, `logRasterPos4sv`, `logReadBuffer`, `logReadPixels`, `logRectd`, `logRectdv`, `logRectf`, `logRectfv`, `logRecti`, `logRectiv`, `logRects`, `logRectsv`, `logRenderMode`, `logRotated`, `logRotatef`, `logScaled`, `logScalef`, `logScissor`, `logSelectBuffer`, `logShadeModel`, `logStencilFunc`, `logStencilMask`, `logStencilOp`, `logTexCoord1d`, `logTexCoord1dv`, `logTexCoord1f`, `logTexCoord1fv`, `logTexCoord1i`, `logTexCoord1iv`, `logTexCoord1s`, `logTexCoord1sv`, `logTexCoord2d`, `logTexCoord2dv`, `logTexCoord2f`, `logTexCoord2fv`, `logTexCoord2i`, `logTexCoord2iv`, `logTexCoord2s`, `logTexCoord2sv`, `logTexCoord3d`, `logTexCoord3dv`, `logTexCoord3f`, `logTexCoord3fv`, `logTexCoord3i`, `logTexCoord3iv`, `logTexCoord3s`, `logTexCoord3sv`, `logTexCoord4d`, `logTexCoord4dv`, `logTexCoord4f`, `logTexCoord4fv`, `logTexCoord4i`, `logTexCoord4iv`, `logTexCoord4s`, `logTexCoord4sv`, `logTexCoordPointer`, `logTexEnvf`, `logTexEnvfv`, `logTexEnvi`, `logTexEnviv`, `logTexGend`, `logTexGendv`, `logTexGenf`, `logTexGenfv`, `logTexGeni`, `logTexGeniv`, `logTexImage1D`, `logTexImage2D`, `logTexParameterf`, `logTexParameterfv`, `logTexParameteri`, `logTexParameteriv`, `logTexSubImage1D`, `logTexSubImage2D`, `logTranslated`, `logTranslatef`, `logVertex2d`, `logVertex2dv`, `logVertex2f`, `logVertex2fv`, `logVertex2i`, `logVertex2iv`, `logVertex2s`, `logVertex2sv`, `logVertex3d`, `logVertex3dv`, `logVertex3f`, `logVertex3fv`, `logVertex3i`, `logVertex3iv`, `logVertex3s`, `logVertex3sv`, `logVertex4d`, `logVertex4dv`, `logVertex4f`, `logVertex4fv`, `logVertex4i`, `logVertex4iv`, `logVertex4s`, `logVertex4sv`, `logVertexPointer`, `logViewport`, `qwglGetProcAddress`
- `code/unix/linux_signals.c` (not_started): `InitSig`, `signal_handler`
- `code/unix/linux_snd.c` (not_started): `SNDDMA_BeginPainting`, `SNDDMA_GetDMAPos`, `SNDDMA_Init`, `SNDDMA_Shutdown`, `SNDDMA_Submit`, `Snd_Memset`
- `code/unix/qasm.h` (not_started): *(Symbolinventar ergänzen)*
- `code/unix/unix_glw.h` (not_started): *(Symbolinventar ergänzen)*
- `code/unix/unix_main.c` (not_started): `Hist_Add`, `Hist_Next`, `Hist_Prev`, `Sys_AppActivate`, `Sys_BeginProfiling`, `Sys_BeginStreamedFile`, `Sys_CheckCD`, `Sys_ConfigureFPU`, `Sys_ConsoleInput`, `Sys_ConsoleInputInit`, `Sys_ConsoleInputShutdown`, `Sys_EndStreamedFile`, `Sys_Error`, `Sys_Exit`, `Sys_FileTime`, `Sys_FunctionCheckSum`, `Sys_FunctionCmp`, `Sys_GetClipboardData`, `Sys_GetEvent`, `Sys_In_Restart_f`, `Sys_Init`, `Sys_InitStreamThread`, `Sys_LoadDll`, `Sys_LowPhysicalMemory`, `Sys_MonkeyShouldBeSpanked`, `Sys_ParseArgs`, `Sys_Print`, `Sys_PrintBinVersion`, `Sys_Printf`, `Sys_QueEvent`, `Sys_Quit`, `Sys_ShutdownStreamThread`, `Sys_StreamSeek`, `Sys_StreamThread`, `Sys_StreamedRead`, `Sys_UnloadDll`, `Sys_Warn`, `floating_point_exception_handler`, `main`, `tty_Back`, `tty_FlushIn`, `tty_Hide`, `tty_Show`
- `code/unix/unix_net.c` (not_started): `NET_BaseAdrToString`, `NET_ErrorString`, `NET_GetLocalAddress`, `NET_IPSocket`, `NET_Init`, `NET_OpenIP`, `NET_Shutdown`, `NET_Sleep`, `NetadrToSockadr`, `SockadrToNetadr`, `Sys_GetPacket`, `Sys_IsLANAddress`, `Sys_SendPacket`, `Sys_ShowIP`, `Sys_StringToAdr`, `Sys_StringToSockaddr`
- `code/unix/unix_shared.c` (not_started): `Sys_Cwd`, `Sys_DefaultCDPath`, `Sys_DefaultHomePath`, `Sys_DefaultInstallPath`, `Sys_FreeFileList`, `Sys_GetCurrentUser`, `Sys_GetProcessorId`, `Sys_ListFiles`, `Sys_ListFilteredFiles`, `Sys_Milliseconds`, `Sys_Mkdir`, `Sys_ProcessorCount`, `Sys_SetDefaultCDPath`, `Sys_SetDefaultHomePath`, `Sys_SetDefaultInstallPath`, `Sys_ShowConsole`, `Sys_SnapVector`, `Sys_XTimeToSysTime`, `fastftol`, `strlwr`
- `code/unix/vm_x86.c` (not_started): `VM_CallCompiled`, `VM_Compile`
- `code/win32/glw_win.h` (not_started): *(Symbolinventar ergänzen)*
- `code/win32/resource.h` (not_started): *(Symbolinventar ergänzen)*
- `code/win32/win_glimp.c` (partial): `GLW_CheckOSVersion`, `GLW_ChoosePFD`, `GLW_CreatePFD`, `GLW_InitDriver`, `GLW_InitExtensions`, `GLW_LoadOpenGL`, `GLW_MakeContext`, `GLW_SetMode`, `GLW_StartDriverAndSetMode`, `GLW_StartOpenGL`, `GLimp_FrontEndSleep`, `GLimp_Init`, `GLimp_LogComment`, `GLimp_RenderThreadWrapper`, `GLimp_RendererSleep`, `GLimp_SpawnRenderThread`, `GLimp_WakeRenderer`, `PrintCDSError`
- `code/win32/win_input.c` (partial): `IN_Activate`, `IN_ActivateDIMouse`, `IN_ActivateMouse`, `IN_ActivateWin32Mouse`, `IN_ClearStates`, `IN_DIMouse`, `IN_DeactivateDIMouse`, `IN_DeactivateMouse`, `IN_DeactivateWin32Mouse`, `IN_Frame`, `IN_Init`, `IN_InitDIMouse`, `IN_InitWin32Mouse`, `IN_JoyMove`, `IN_Shutdown`, `IN_ShutdownDIMouse`, `IN_ShutdownMIDI`, `IN_ShutdownWin32Mouse`, `IN_Startup`, `IN_StartupJoystick`, `IN_StartupMIDI`, `IN_StartupMouse`, `IN_Win32Mouse`, `JoyToF`, `JoyToI`, `MIDI_NoteOff`, `MIDI_NoteOn`, `MidiInProc`, `MidiInfo_f`
- `code/win32/win_local.h` (not_started): *(Symbolinventar ergänzen)*
- `code/win32/win_main.c` (partial): `Spk_Close`, `Spk_Open`, `Spk_Printf`, `Sys_BeginProfiling`, `Sys_BeginStreamedFile`, `Sys_CheckCD`, `Sys_Cwd`, `Sys_DefaultBasePath`, `Sys_DefaultCDPath`, `Sys_EndStreamedFile`, `Sys_Error`, `Sys_FreeFileList`, `Sys_GetClipboardData`, `Sys_GetEvent`, `Sys_In_Restart_f`, `Sys_InitStreamThread`, `Sys_ListFiles`, `Sys_ListFilteredFiles`, `Sys_LoadDll`, `Sys_LowPhysicalMemory`, `Sys_Mkdir`, `Sys_Net_Restart_f`, `Sys_Print`, `Sys_Quit`, `Sys_ScanForCD`, `Sys_ShutdownStreamThread`, `Sys_StreamSeek`, `Sys_StreamThread`, `Sys_StreamedRead`, `Sys_UnloadDll`, `WinMain`, `strgtr`, `systems`
- `code/win32/win_net.c` (partial): `NET_Config`, `NET_ErrorString`, `NET_GetCvars`, `NET_GetLocalAddress`, `NET_IPXSocket`, `NET_OpenIP`, `NET_OpenIPX`, `NET_OpenSocks`, `NET_Restart`, `NET_Sleep`, `NetadrToSockadr`, `SockadrToNetadr`, `Sys_IsLANAddress`, `Sys_ShowIP`, `Sys_StringToAdr`, `Sys_StringToSockaddr`
- `code/win32/win_qgl.c` (not_started): `BlendToName`, `BooleanToString`, `CapToString`, `FuncToString`, `GlideIsValid`, `PrimToString`, `QGL_EnableLogging`, `QGL_Init`, `QGL_Shutdown`, `TypeToString`, `logAccum`, `logAlphaFunc`, `logAreTexturesResident`, `logArrayElement`, `logBegin`, `logBindTexture`, `logBitmap`, `logBlendFunc`, `logCallList`, `logCallLists`, `logClear`, `logClearAccum`, `logClearColor`, `logClearDepth`, `logClearIndex`, `logClearStencil`, `logClipPlane`, `logColor3b`, `logColor3bv`, `logColor3d`, `logColor3dv`, `logColor3f`, `logColor3fv`, `logColor3i`, `logColor3iv`, `logColor3s`, `logColor3sv`, `logColor3ub`, `logColor3ubv`, `logColor3ui`, `logColor3uiv`, `logColor3us`, `logColor3usv`, `logColor4b`, `logColor4bv`, `logColor4d`, `logColor4dv`, `logColor4f`, `logColor4fv`, `logColor4i`, `logColor4iv`, `logColor4s`, `logColor4sv`, `logColor4ub`, `logColor4ubv`, `logColor4ui`, `logColor4uiv`, `logColor4us`, `logColor4usv`, `logColorMask`, `logColorMaterial`, `logColorPointer`, `logCopyPixels`, `logCopyTexImage1D`, `logCopyTexImage2D`, `logCopyTexSubImage1D`, `logCopyTexSubImage2D`, `logCullFace`, `logDeleteLists`, `logDeleteTextures`, `logDepthFunc`, `logDepthMask`, `logDepthRange`, `logDisable`, `logDisableClientState`, `logDrawArrays`, `logDrawBuffer`, `logDrawElements`, `logDrawPixels`, `logEdgeFlag`, `logEdgeFlagPointer`, `logEdgeFlagv`, `logEnable`, `logEnableClientState`, `logEnd`, `logEndList`, `logEvalCoord1d`, `logEvalCoord1dv`, `logEvalCoord1f`, `logEvalCoord1fv`, `logEvalCoord2d`, `logEvalCoord2dv`, `logEvalCoord2f`, `logEvalCoord2fv`, `logEvalMesh1`, `logEvalMesh2`, `logEvalPoint1`, `logEvalPoint2`, `logFeedbackBuffer`, `logFinish`, `logFlush`, `logFogf`, `logFogfv`, `logFogi`, `logFogiv`, `logFrontFace`, `logFrustum`, `logGenLists`, `logGenTextures`, `logGetBooleanv`, `logGetClipPlane`, `logGetDoublev`, `logGetError`, `logGetFloatv`, `logGetIntegerv`, `logGetLightfv`, `logGetLightiv`, `logGetMapdv`, `logGetMapfv`, `logGetMapiv`, `logGetMaterialfv`, `logGetMaterialiv`, `logGetPixelMapfv`, `logGetPixelMapuiv`, `logGetPixelMapusv`, `logGetPointerv`, `logGetPolygonStipple`, `logGetString`, `logGetTexEnvfv`, `logGetTexEnviv`, `logGetTexGendv`, `logGetTexGenfv`, `logGetTexGeniv`, `logGetTexImage`, `logGetTexLevelParameterfv`, `logGetTexLevelParameteriv`, `logGetTexParameterfv`, `logGetTexParameteriv`, `logHint`, `logIndexMask`, `logIndexPointer`, `logIndexd`, `logIndexdv`, `logIndexf`, `logIndexfv`, `logIndexi`, `logIndexiv`, `logIndexs`, `logIndexsv`, `logIndexub`, `logIndexubv`, `logInitNames`, `logInterleavedArrays`, `logIsEnabled`, `logIsList`, `logIsTexture`, `logLightModelf`, `logLightModelfv`, `logLightModeli`, `logLightModeliv`, `logLightf`, `logLightfv`, `logLighti`, `logLightiv`, `logLineStipple`, `logLineWidth`, `logListBase`, `logLoadIdentity`, `logLoadMatrixd`, `logLoadMatrixf`, `logLoadName`, `logLogicOp`, `logMap1d`, `logMap1f`, `logMap2d`, `logMap2f`, `logMapGrid1d`, `logMapGrid1f`, `logMapGrid2d`, `logMapGrid2f`, `logMaterialf`, `logMaterialfv`, `logMateriali`, `logMaterialiv`, `logMatrixMode`, `logMultMatrixd`, `logMultMatrixf`, `logNewList`, `logNormal3b`, `logNormal3bv`, `logNormal3d`, `logNormal3dv`, `logNormal3f`, `logNormal3fv`, `logNormal3i`, `logNormal3iv`, `logNormal3s`, `logNormal3sv`, `logNormalPointer`, `logOrtho`, `logPassThrough`, `logPixelMapfv`, `logPixelMapuiv`, `logPixelMapusv`, `logPixelStoref`, `logPixelStorei`, `logPixelTransferf`, `logPixelTransferi`, `logPixelZoom`, `logPointSize`, `logPolygonMode`, `logPolygonOffset`, `logPolygonStipple`, `logPopAttrib`, `logPopClientAttrib`, `logPopMatrix`, `logPopName`, `logPrioritizeTextures`, `logPushAttrib`, `logPushClientAttrib`, `logPushMatrix`, `logPushName`, `logRasterPos2d`, `logRasterPos2dv`, `logRasterPos2f`, `logRasterPos2fv`, `logRasterPos2i`, `logRasterPos2iv`, `logRasterPos2s`, `logRasterPos2sv`, `logRasterPos3d`, `logRasterPos3dv`, `logRasterPos3f`, `logRasterPos3fv`, `logRasterPos3i`, `logRasterPos3iv`, `logRasterPos3s`, `logRasterPos3sv`, `logRasterPos4d`, `logRasterPos4dv`, `logRasterPos4f`, `logRasterPos4fv`, `logRasterPos4i`, `logRasterPos4iv`, `logRasterPos4s`, `logRasterPos4sv`, `logReadBuffer`, `logReadPixels`, `logRectd`, `logRectdv`, `logRectf`, `logRectfv`, `logRecti`, `logRectiv`, `logRects`, `logRectsv`, `logRenderMode`, `logRotated`, `logRotatef`, `logScaled`, `logScalef`, `logScissor`, `logSelectBuffer`, `logShadeModel`, `logStencilFunc`, `logStencilMask`, `logStencilOp`, `logTexCoord1d`, `logTexCoord1dv`, `logTexCoord1f`, `logTexCoord1fv`, `logTexCoord1i`, `logTexCoord1iv`, `logTexCoord1s`, `logTexCoord1sv`, `logTexCoord2d`, `logTexCoord2dv`, `logTexCoord2f`, `logTexCoord2fv`, `logTexCoord2i`, `logTexCoord2iv`, `logTexCoord2s`, `logTexCoord2sv`, `logTexCoord3d`, `logTexCoord3dv`, `logTexCoord3f`, `logTexCoord3fv`, `logTexCoord3i`, `logTexCoord3iv`, `logTexCoord3s`, `logTexCoord3sv`, `logTexCoord4d`, `logTexCoord4dv`, `logTexCoord4f`, `logTexCoord4fv`, `logTexCoord4i`, `logTexCoord4iv`, `logTexCoord4s`, `logTexCoord4sv`, `logTexCoordPointer`, `logTexEnvf`, `logTexEnvfv`, `logTexEnvi`, `logTexEnviv`, `logTexGend`, `logTexGendv`, `logTexGenf`, `logTexGenfv`, `logTexGeni`, `logTexGeniv`, `logTexImage1D`, `logTexImage2D`, `logTexParameterf`, `logTexParameterfv`, `logTexParameteri`, `logTexParameteriv`, `logTexSubImage1D`, `logTexSubImage2D`, `logTranslated`, `logTranslatef`, `logVertex2d`, `logVertex2dv`, `logVertex2f`, `logVertex2fv`, `logVertex2i`, `logVertex2iv`, `logVertex2s`, `logVertex2sv`, `logVertex3d`, `logVertex3dv`, `logVertex3f`, `logVertex3fv`, `logVertex3i`, `logVertex3iv`, `logVertex3s`, `logVertex3sv`, `logVertex4d`, `logVertex4dv`, `logVertex4f`, `logVertex4fv`, `logVertex4i`, `logVertex4iv`, `logVertex4s`, `logVertex4sv`, `logVertexPointer`, `logViewport`
- `code/win32/win_shared.c` (partial): `CPUID`, `Is3DNOW`, `IsKNI`, `IsMMX`, `IsPentium`, `Sys_DefaultHomePath`, `Sys_DefaultInstallPath`, `Sys_GetCurrentUser`, `Sys_GetProcessorId`, `Sys_Milliseconds`, `fastftol`
- `code/win32/win_wndproc.c` (partial): `MapKey`, `VID_AppActivate`, `WIN_DisableAltTab`, `WIN_EnableAltTab`
