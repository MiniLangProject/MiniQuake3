# Quake III Arena ↔ MiniQuake3: Bedien- und Funktionsabgleich

Stand: 31. Oktober 2026. Referenz ist der eingecheckte GPL-Quellstand unter
`Quake-III-Arena-original-source/code` zusammen mit den legalen Baseq3-Daten
unter `D:/Quake3/baseq3`. Dieser Bericht bewertet **beobachtbares Verhalten**;
der getrennte [Symbolbericht](ORIGINAL_PARITY_REPORT.md) bewertet native
MiniLang-Quellzuordnung.

## Ergebnis

MiniQuake3 ist noch **nicht 1:1 abgenommen**. Der lokal spielbare Pfad führt
die unveränderten Baseq3-Module `qagame.qvm`, `cgame.qvm` und `ui.qvm` im
MiniLang-Interpreter aus. Dadurch stammen Spielregeln, Vorhersage, HUD und
Menülogik in diesem Pfad aus demselben Bytecode wie im Original. Abweichungen
liegen vor allem in den Engine-Traps und Hostsystemen: Startfluss, Renderer,
vollständiges Netzwerk, Audio-Ausgabe, Botlib-Langzeitverhalten, Demos sowie
visuelle und zeitliche Abnahme.

Die EXE selbst und der Doppelklick-Starter verwenden jetzt diesen Original-QVM-Pfad. Der frühere
eigene `--play`-Vertical-Slice mit festem WASD-Menü bleibt nur ein Diagnosepfad
und ist kein Paritätsnachweis.

Statusdefinition:

- **QVM-original**: Die maßgebliche Originalfunktion läuft unverändert als QVM.
- **Teilweise**: Der produktive Pfad existiert, aber mindestens ein sichtbarer,
  zeitlicher oder externer Vertrag ist noch nicht 1:1 nachgewiesen.
- **Offen**: Der Originalablauf ist im produktiven Spielpfad nicht vollständig
  vorhanden oder nicht end-to-end abgenommen.

## Vollständige Bedien- und Funktionsmatrix

| Bereich | Originalreferenz | Produktiver MiniQuake3-Pfad / Nachweis | Status | Exakte verbleibende Differenz |
|---|---|---|---|---|
| Programmstart und Hauptmenü | `client/cl_main.c`, `client/cl_ui.c`, `q3_ui/ui_main.c` | Null-Argument-`MiniQuake3.exe`, `Play-MiniQuake3.cmd`, `client/qvm_menu_app.ml`, unverändertes `ui.qvm`; `test_default_launcher.py`, `test_default_exe_startup.py`, `test_ui_vm_lifecycle.py` | **Weitgehend** | Die EXE ermittelt ihren eigenen Ordner, mountet `baseq3/pak0.pk3` bis `pak8.pk3` mit Original-Priorität und öffnet zuerst das mitgelieferte unveränderte 1.32b-`ui.qvm` im Zustand `CA_DISCONNECTED`. Die CD-UI-API 3 sowie die späteren APIs 4/6 werden akzeptiert; für spielbare Matches werden wegen der alten CD-Game-Structs die drei ABI-passenden Original-1.32b-QVMs unter `qvms/` mitgebaut. `qagame`, `cgame`, volle Shaderindizierung und BSP-Aufbau beginnen erst nach einem `map`-/`spmap`-Befehl. Das reale Retail-CD-Hauptmenü erschien im Null-Argument-Gate nach 7,72 Sekunden; ein anschließender kompletter Game-/Cgame-Matchframe bestand. Noch offen sind pixelgleiche 3D-Menüszenen und die End-to-end-Abnahme aller Menüaktionen. |
| Haupt-, Setup-, Controls-, Player-, Mods-, Demos-, Credits- und CD-Key-Menüs | `q3_ui/ui_*.c` | unverändertes `ui.qvm`; UI-Traps in `vm/syscall_host.ml`; `test_ui_*.py`, `test_vm_syscall_ui*.py` | **QVM-original / teilweise** | Menüs werden aus Originalbytecode gezeichnet. Externe Dienste wie vollständige Serverabfrage, CD-Key-/Mod-Wechsel, Demo-Start und Prozessneustart benötigen noch End-to-end-Abnahme aus dem sichtbaren Menü. |
| In-game-Menü und Escape-Verhalten | `q3_ui/ui_ingame.c`, `client/cl_keys.c` | `original_ui_session.ml`, `local_qvm_ui.ml`; `test_original_ui_session.py`, `test_local_qvm_ui.py` | **QVM-original** | Escape öffnet `UIMENU_INGAME`, Key-Catcher und Pause gehen durch `ui.qvm`. Ein kompletter manueller Menü-Screenshotvergleich steht aus. |
| Tastatur, Maus, freie Bindings und Konsole | `client/cl_keys.c`, `client/cl_input.c`, `client/cl_console.c` | `key_binding_dispatch.ml`, `key_bindings_config.ml`, `console_input.ml`, `input_command.ml`; `test_key_binding_dispatch.py`, `test_cl_input_complete.py`, `test_console_input.py` | **Teilweise** | `bind`, `unbind`, `unbindall`, Key-Catcher, Quake-Keycodes und Usercmds sind vorhanden. Joystick, alle internationalen Tastaturlayouts, Alt-Tab/Fokus und langes Interaktivtesten sind nicht 1:1 abgenommen. |
| Cvars und `q3config.cfg` | `qcommon/cvar.c`, `qcommon/cmd.c`, `client/cl_main.c` | `qcommon/cvar.ml`, `config_persistence.ml`, Engine-Commandpuffer; `test_cvar_config.py`, `test_commands.py` | **Teilweise** | Archivierung und zentrale Befehle sind implementiert. Vollständige Roundtrip-Gleichheit einer realen Originalkonfiguration samt allen Plattform-Cvars ist noch nicht belegt. |
| Lokaler Match-Lifecycle | `server/sv_*.c`, `game/g_main.c`, `game/g_client.c` | `engine/local_qvm_match.ml` mit unverändertem `qagame.qvm`; `test_retail_qvm_match.py`, `test_game_vm_lifecycle.py` | **QVM-original / teilweise** | Init, Connect, Spawn, 20-Hz-Frames, Snapshots und Shutdown laufen. Mapwechsel, lange Matches und jede Intermission-/Restart-Kombination brauchen noch Langzeitabnahme. |
| Bewegung und Prediction | `game/bg_pmove.c`, `game/bg_slidemove.c`, `cgame/cg_predict.c` | unveränderte `qagame.qvm`/`cgame.qvm`, Engine-Traces; `test_pmove.py`, `test_cgame_predict.py`, Retail-Collision-Differenztests | **QVM-original** | Die Regeln laufen aus Original-QVMs. Noch offen ist ein aufgezeichneter Frame-für-Frame-Vergleich eines längeren menschlichen Laufs auf mehreren Karten. |
| Waffen, Treffer, Projektile und Schaden | `game/g_weapon.c`, `g_missile.c`, `g_combat.c`, `cgame/cg_weapons.c`, `cg_effects.c` | Original-QVMs plus Renderer-/Sound-Traps; `test_g_weapon_complete.py`, `test_cgame_weapons.py`, `test_weapons.py` | **QVM-original / teilweise** | Logik aller Baseq3-Waffen ist vorhanden. Visuelle Effekte, Decals, Licht und Sound müssen pro Waffe noch bild-/audiometrisch gegen das Original abgenommen werden. |
| Items, Powerups und Trigger | `game/g_items.c`, `g_trigger.c`, `bg_misc.c` | Original-QVMs, Game-/Collision-Traps; `test_g_items_complete.py`, `test_items.py`, `test_jump_pad_items_retail.py` | **QVM-original** | Funktionale Verträge sind vorhanden; ein kompletter 31-Karten-Pickup-/Respawn-Langzeittest fehlt. |
| Spieltypen FFA, Tournament, Team, CTF | `game/g_main.c`, `g_team.c`, `g_cmds.c` | unverändertes `qagame.qvm`; Game- und Teamtests | **QVM-original / teilweise** | Regeln und Commands stammen aus Originalbytecode. Mehrclient-End-to-end-Partien inklusive Scorelimit, Warmup, Vote, Teamwechsel und Overtime sind nicht als sichtbare vollständige Abnahme vorhanden. |
| Bots und AAS | `game/ai_*.c`, `botlib/be_*.c`, `botlib/aas_*.c` | QVM-Botcode plus native Botlib/AAS-Traps; `test_bot_deathmatch_full.py`, `test_botlib_retail_qagame.py`, 30 Retail-AAS-Dateien | **Teilweise** | Ein Bot erzeugt echte Bewegungs-Usercmds und Navigation ist breit getestet. Die zuvor als offen gezählten Symbole in `be_interface.c`, `l_crc.c`, `l_libvar.c` und `l_script.c` sind durch vollständige Differential- und Retailnachweise geschlossen. Mehrere Bots, alle Karten, alle Spieltypen und stundenlange Routing-/Combat-Stabilität sind weiterhin nicht 1:1 abgenommen. |
| Snapshots, Servercommands und Client-Prediction | `server/sv_snapshot.c`, `client/cl_parse.c`, `cgame/cg_snapshot.c` | `server/snapshot_*.ml`, `client/cgame_snapshot.ml`, QVM-Match; Snapshot- und Cgame-Tests | **Teilweise** | Lokale Snapshots und Deltawege funktionieren. Reale Paketverlust-, Fragment-, Rate-, TimeNudge- und Remote-Server-Szenarien fehlen als gemeinsamer Langzeittest. |
| LAN/Internet-Multiplayer | `qcommon/net_*.c`, `client/cl_main.c`, `server/sv_client.c`, `sv_net_chan.c` | UDP/DNS-Adapter, `network_match_loop.ml`, Serverbrowser; `test_network_match_multi.py`, `test_server_netchan.py`, `test_ui_lan_udp.py` | **Offen** | Kein vollständiger Originalclient↔Originalserver-/MiniQuake3-Internet-Kompatibilitätslauf mit Challenge, Downloads, Paketverlust, mehreren Clients und Matchende. Bedienung des Serverbrowsers ist daher nicht 1:1 freigegeben. |
| Cgame-Szene, Modelle, Animationen und Effekte | `cgame/cg_*.c`, `renderer/tr_*.c` | unverändertes `cgame.qvm`, `qvm_scene_*.ml`, MD3/MD4-, Portal-, Partikel- und Effektpfade | **Teilweise** | Cgame reicht Original-Szenebefehle ein. Engine-Renderer ist kein vollständiger `renderer/`-Port; 15 Rendererdateien besitzen offene Symbole. Bildvergleich für Spieleranimationen, Shaderstufen, Nebel, Portale, Marks, Flares und dynamisches Licht fehlt. |
| BSP-Welt, Shader, Texturen und Licht | `renderer/tr_bsp.c`, `tr_shader.c`, `tr_image.c`, `tr_light.c`, `tr_backend.c` | `playable_world_batch.ml`, `playable_materials.ml`, Lightgrid/Lightmaps/Fog/Sky; Retail-QVM-Preview | **Teilweise** | Echte Retailassets werden gerendert, keine Wireframe-Ersatzwelt. Backend-Sortierung, sämtliche Blend-/Depth-/TexGen-/Deform-Stufen, Gamma und Hardware-GL-Verhalten sind noch nicht pixelgleich. |
| HUD, Scoreboard, Crosshair und 2D | `cgame/cg_draw.c`, `cg_scoreboard.c`, `renderer/tr_font.c` | Original-`cgame.qvm`, `qvm_2d_batch.ml`; `test_qvm_2d_retail.py`, `test_cgame_draw.py`, `test_cgame_scoreboard.py` | **QVM-original / teilweise** | HUD-Kommandos kommen aus Originalbytecode. Schriftmetriken, Skalierung, Seitenverhältnis, Farb-/Blenddetails und jede Auflösung sind nicht screenshotgleich abgenommen. |
| Audio, Musik, räumliche Kanäle und Doppler | `client/snd_*.c` | `audio/qvm_playback.ml`, `channel_paint.ml`, `spatial_mixer.ml`, WAV/ADPCM/Wavelet; `test_qvm_audio.py`, Audio-Suiten | **Teilweise** | Originale 24.8-Mischlogik, Kanäle, Loops, Musik und Raw-Samples sind weitgehend nachgebildet. Gerätelatenz, Lautstärkeverlauf, alle Decoderdateien und hörbarer A/B-Vergleich sind nicht vollständig; frühere verzerrte Ausgabe bleibt ein explizites Regressionsthema. |
| Demos, RoQ-Cinematics und Connect-Screen | `client/cl_demo.c`, `cl_cin.c`, `cl_scrn.c` | `client/demo.ml`, `cinematic_runtime.ml`, QVM-Videotexturen; `test_demo.py`, `test_roq_cinematics.py`, `test_ui_connect.py` | **Teilweise** | Parser und Wiedergabebausteine sind vorhanden. Aufnahme/Wiedergabe kompletter Retaildemos, Zeitsteuerung, Seek sowie alle Menüaufrufe sind nicht end-to-end gleich. |
| Dateien, PK3, Mods und Downloads | `qcommon/files.c`, `client/cl_main.c`, `server/sv_client.c` | PK3/DEFLATE und virtuelle Dateisuche; Filesystem-/Downloadtests | **Teilweise** | Retail-`pak0.pk3` wird direkt genutzt. Reine/Referenz-Pak-Prüfung, Autodownload, Mod-Neustart und Suchpfadgleichheit mit vielfältigen Installationen sind nicht vollständig im sichtbaren Spielablauf abgenommen. |
| Missionpack/Team Arena | `ui/`, `game/`, `cgame/` unter `MISSIONPACK` | native Verträge und kompilierbare Zweige | **Offen für Retail-Abnahme** | Unter `D:/Quake3` liegen keine legalen Missionpack-Assets; deshalb kann Team Arena nicht als 1:1 spielbar behauptet werden. |
| Plattform, Fenster, Fokus, Video und Performance | `win32/win_glimp.c`, `win_input.c`, `win_snd.c` | `platform/playable_window.ml`, `client/qvm_menu_app.ml` und DLLs; Win32-Startup-/Inputtests | **Teilweise** | Das native Fenster erscheint sofort mit Ladefortschritt; das Original-Hauptmenü war auf dem Entwicklungsrechner in weniger als 12 Sekunden bedienbar. PK3-Namenszugriffe, Shaderindizierung und Weltflächencache wurden beschleunigt. Der anschließende interpretierte QVM-/Mapstart bleibt deutlich langsamer als das native Original; Vollbild, Moduswechsel, Fokus und Langzeitperformance sind noch nicht freigegeben. |

## Quantitativer Quellabgleich

Der streng erzeugte Bericht zählt 335 Runtime-/Plattformdateien:

- 278 effektiv `ported`
- 57 effektiv `partial`
- 939 noch nicht zugeordnete Originalsymbole

Eine Ledger-Zeile mit Status `ported` wird automatisch auf `partial`
herabgestuft, sobald sie offene Symbole enthält. Damit kann die frühere
335/335-Dateimeldung nicht mehr als 1:1-Nachweis missverstanden werden.

## Verbindliche 1:1-Abnahme

Der Anspruch „1:1 gleich in der Bedienung“ darf erst als erfüllt gelten, wenn
alle folgenden Gates gemeinsam grün sind:

1. Start im Original-Hauptmenü ohne bereits laufenden Match und ohne minutenlang
   unsichtbaren Ladevorgang.
2. Tastatur-, Maus-, Binding-, Konsole-, Fokus- und Menüabläufe entsprechen
   aufgezeichneten Originalsequenzen.
3. FFA, Tournament, Team und CTF bestehen Mehrclient-Langzeitmatches auf allen
   Retailkarten einschließlich Mapwechsel und Intermission.
4. Originalserver und MiniQuake3 verbinden sich wechselseitig über LAN/Internet
   mit Paketverlust, Downloads und mehreren Clients.
5. Fest definierte Szenen, HUDs, Menüs, Waffen und Effekte bestehen tolerierte
   Pixelvergleiche in mehreren Auflösungen.
6. Musik, Sprache, Waffen, Loops und Raumklang bestehen hör- und messbare
   A/B-Vergleiche ohne Verzerrung.
7. Bots bestehen Navigation und Kampf auf allen Karten und Spieltypen über
   mehrstündige Läufe.
8. Demoaufnahme/-wiedergabe, Cinematics, Mods und Konfigurations-Roundtrips sind
   end-to-end kompatibel.
9. Alle 939 offenen Symbolzuordnungen sind implementiert oder mit einer
   konkreten, geprüften Hostadapterbegründung geschlossen.
10. Der vollständige Retail-Verifikationslauf und eine manuelle Windows-Abnahme
    laufen regressionsfrei und mit spielbarer Framerate.

Bis diese Liste vollständig erfüllt ist, bleibt der Status ehrlich
**spielbarer Original-QVM-Integrationsstand, nicht fertiger 1:1-Port**.
