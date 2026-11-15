# MiniQuake3

Die generierte [MiniDoc-API-Referenz](docs/api/markdown/README.md) dokumentiert
die Module aus `src/`; die Konfiguration steht in [minidoc.toml](minidoc.toml).

Projekt für einen möglichst originalgetreuen Port von Quake III Arena nach MiniLang.
Status: Implementierung läuft. Ein nativer MiniLang-Build mit Zahlenkompatibilität,
Cvars, Parser, PK3/DEFLATE, BSP-Leser, QVM-Interpreter, BSP-/Kurvenkollision,
transformierten Modellen, temporären Boxen, PVS-/Areaportal-Verwaltung,
dynamischem Retail-AAS-Reader, gewichteten AAS-Routen und einem opt-in
Botlib-QVM-Lifecycle,
dynamischer Entity-Kollision, Bewegungsbahnen, Sprungpad-Reaktionen und
dem vollständigen baseq3-Pmove-Befehlszyklus, serverseitigen Item-Pickups,
CTF-Flaggenabläufen, Tournament-/Warmup-Steuerung, Vote-Aufrufen/Stimmabgabe/Auflösung, Teamoverlay,
Passwortstatus, Engine-/Spielmodul-Cvar-Aktualisierung, Namen/Userinfo/Teamwahl,
originalgetreuer `q3config.cfg`-Persistenz samt `writeconfig` im produktiven
Engine-Frame und einem zustandsbehafteten UI-Serverbrowser mit
Connectionless-Info-/Status-/Masterlisten-Ingress, exakter
`servercache.dat`-Persistenz und ausgehendem Query-Zustandsautomaten mit
produktiver Windows-DNS-/UDP-Anbindung,
`ClientConnect` und Sitzungsdaten, Team-/Zuschauerwechsel, Follow-Befehlen, Duell-Warteschlange, `ClientDisconnect`, `ClientBegin`, `ClientSpawn`,
`ClientThink`, `ClientEndFrame`, Intermission-/Levelende-Steuerung und vollständiger
Baseq3-Client-Befehlsverteilung mit Chat/Voice/Cheats/Spielkommandos sowie
serverseitigem Abfeuern aller zehn Baseq3-Waffen, Serverkonsole, IP-Sperren,
Spielarena, Item-/Teaminitialisierung, `G_InitGame`/`G_ShutdownGame` und
Logformatierung sowie allen 48 Kartenklassen einschließlich Türen, Plattformen,
Buttons, Zügen und periodischen Movern ist vorhanden. **Ein spielbarer Preview-Vertical-Slice ist verfügbar; der vollständige Port ist noch in Arbeit.** Maßgeblich sind der
[Portplan in zehn Schritten](docs/PORTPLAN.md) und der
[geprüfte Stand mit offenen Abnahmen](docs/PARITY_AUDIT.md). Der
[vollständige Original-/Port-Abgleich](docs/ORIGINAL_PARITY_REPORT.md) wird
direkt aus dem Ledger erzeugt und führt jede C-, Header- und ASM-Originaldatei
mit Quellportstatus und noch nicht zugeordneten Symbolen auf.

Seit dem 15. November 2026 verwendet der Windows-Spielpfad einen echten
OpenGL-Hardware-Renderer für Welt, Modelle, Lightmaps und Original-HUD.
Near-Clipping und konservative Frustumtests verhindern die zuvor verworfenen
Wandflächen. QVM-Instruktionen laufen in einem begrenzten nativen
Bytecodedispatcher mit MiniLang-Engine-Traps; der unabhängige verwaltete
Interpreter bleibt die Differentialreferenz. MD3-, Sichtbarkeits-, Himmel-
und Audiocaches vermeiden wiederholte Framearbeit. Ergebnisse, Nachweise und
verbleibende Grenzen stehen im aktuellen Abschnitt des
[Paritätsaudits](docs/PARITY_AUDIT.md). Ältere Build-Hashes und Messungen in
den nachfolgenden historischen Abschnitten bezeichnen frühere Zwischenstände.

Der aktuelle Retail-q3dm1-Test erreicht auf Ryzen 9 9900X / RTX 5080 bei
1280×720 **202 FPS über 5.000 Frames** mit vollständiger getesteter Szene
und einem echten Usercmd/ClientThink pro Clientframe. Der direkte Matchstart
benötigt **2,50 s**, das Hauptmenü beim normalen EXE-Start **0,30 s**.
Einzelne Frame-Spitzen bis 151 ms bleiben offen.
Messbedingungen, Binärhashes und die davon getrennte Rendererprobe stehen in
[den aktuellen Eingabe-/Leistungsnachweisen](docs/verification/2026-11-15-client-input.json)
und [der Renderer-Basis](docs/verification/2026-11-15-performance.json).
Zum Testen `build/MiniQuake3.exe` direkt starten; `baseq3/pak*.pk3` und der
beim Build erzeugte Ordner `qvms` liegen daneben. Der EXE-Start öffnet nur
das Spielfenster. Eine vollständige 1:1- und Langzeitabnahme ist weiterhin offen.

Der Standardstart von `build/MiniQuake3.exe` erwartet `baseq3` und `qvms`
direkt neben der EXE, öffnet zuerst das originale Quake-III-Hauptmenü und lädt
die gewählte Karte erst nach dessen `map`-/`spmap`-Befehl. Der aktuelle
Start-/Performanceblock übernimmt Menü-Cvars, Userinfo und Bindings in das
Spiel, lädt die komplette `pak*.pk3`-Prioritätskette, cached Shader, PVS,
Geometrie, Batches und Audiosamples und vermeidet die früheren quadratischen
Array-Konkatenationen in den produktiven Framepfaden. Der Audit vom
1. November 2026 ergänzt wiederverwendete UDP-Empfangspuffer, eine O(1)-FIFO
für fragmentierte Serverpakete, O(n log n)-Snapshot-Sortierung sowie
vorallozierte Snapshot- und Weltabfragepuffer. Transport- und
Paket-Callbackfehler werden nicht mehr verschluckt. Der geprüfte Build hat
SHA-256
`8bcb49ecd0731292c80d4bcccc14cc53e37238b5eebb5ac6db228bbe7093a7da`.

Der strenge Quellabgleich umfasst 335 Runtime-/Plattformdateien: **278 sind
symbolvollständig zugeordnet, 57 sind teilweise zugeordnet**. In diesen 57
Dateien bleiben **939 Originalsymbole** ohne belegte MiniLang-Zuordnung. Der
frühere reine Dateizähler meldete fälschlich 335/335 vollständig, obwohl das
Ledger für dieselben Dateien offene Symbole enthielt; Bericht und Gate werten
solche Dateien jetzt zwingend als `partial`. Der separate
[Bedien- und Funktionsabgleich](docs/BEHAVIOR_PARITY_AUDIT.md) hält fest, welche
Original-QVM-Pfade bereits produktiv laufen und welche beobachtbaren
1:1-Abnahmen noch fehlen.
Der jüngste Integrationsblock schließt die acht gezählten macOS-Header mit der
vollständigen 337-Namen-QGL-Oberfläche sowie Mouse-Delta-, privater Event-ABI-,
Controller-, Display-/Gamma-, GL-Kontext- und Timersemantik. 24 ausführbare
Verträge prüfen die portable Zustandsabbildung. Cocoa-, CoreGraphics- und
OmniTimer-Aufrufe bleiben Hostadaptergrenzen, da der produktive Zielhost
Windows ist; `macosx` steht nun bei 8/8 gezählten Dateien.

Der vorherige Integrationsblock schloss alle 13 gezählten Unix-
Plattformdateien mit 471 Symbolen. Die portable MiniLang-Fassade besitzt die
vollständigen Speicher-, X11/GL-, QGL-, Eingabe-, Signal-, DMA-, Konsolen-,
System-, UDP-, Shared- und x86-QVM-Oberflächen. Native POSIX-/X11-Aufrufe
bleiben klar abgegrenzte Hostadapter; 28 ausführbare Verträge prüfen die
beobachtbaren Zustände und Fehlergrenzen. `unix` steht bei 13/13 Dateien.

Die Quake-III-Retaildaten sind wieder unter `D:/Quake3/baseq3` verfügbar.
Der erneuerte Retail-Lauf hat unter anderem alle 31 BSP-Kollisionsvergleiche,
4.096 unveränderte C-Tracefälle, alle 30 AAS-Dateien, 32 Botdateien sowie die
Gameplay-, Client-, Waffen-, Vote-, QCommon-, Renderer-, Audio- und
Dateisystemproben bestanden. Zwei dabei aufgedeckte Randfälle sind behoben:
reservierte Box-/Capsule-Handles können keine BSP-Submodelle mehr überschatten
und ein Capsule-Handle ist erst nach `CM_TempBoxModel` gültig, ohne den
originalen reziproken Box-gegen-Capsule-Pfad zu verlieren. Der aktuelle native
Windows-Build hat SHA-256
`9673c22b577bab94c1d914bac6a47f20daaea5f0d1e4034d792b1b1389dd953d`.

Der vorherige Integrationsblock schloss alle sieben Headless-/Null-
Plattformdateien mit 64 Symbolen. Client, Eingabe, OpenGL, Audio und ausgehende
Pakete besitzen die originalen No-op-/Nullwerte; Netzwerkauflösung akzeptiert
nur Loopback. Der Systempfad ergänzt sichere Fehler- und Quit-Zustände sowie
eine begrenzte Headless-Frame-Schleife für dedizierte Tests. Zwanzig Verträge
sind grün; `null` steht bei 7/7 Dateien.

Der vorherige Integrationsblock schloss die acht öffentlichen
Spline-Header. Die native MiniLang-Fassade implementiert Vektoren, Winkel,
Quaternionen, 3x3-Matrizen, Bounds, generische Listen und Stringhelfer mit
allen 50 inventarisierten Symbolen. Zwanzig ausführbare Verträge prüfen
Geometrie, Normalisierung, Achsenkonvertierung, Bounds, Containerwachstum,
Sortierung und Strings; der Runtime-Bereich `splines` steht bei 8/8 Dateien.

Der vorherige Integrationsblock schloss die drei verbliebenen
QCommon-JIT-Dateien `vm_x86.c`, `vm_ppc.c` und `vm_ppc_new.c`. MiniLang
erzeugt aus der QVM einen vollständig validierten, vorab dekodierten Plan mit
Instruction-Pointer-Tabelle und führt ihn speichersicher ohne beschreibbaren
ausführbaren Speicher aus. Alle 47 inventarisierten Backend-Symbole, der
Compiled-Lifecycle und die architekturspezifischen Emitter-/Stackhelfer sind
abgebildet. Vierzehn neue Verträge sowie die bestehenden VM-Lifecycle- und
Vollständigkeitsgates sind grün; QCommon steht damit bei 27/27 Dateien.

Der vorherige Integrationsblock schloss die beiden verbliebenen
QVM-Assembly-Importtabellen `cg_syscalls.asm` und `g_syscalls.asm`.
Alle 102 CGame- und 194 QAGame-Symbole samt negativer q3asm-Ordinalen sind
exakt erfasst und an die produktiven nativen Wrapper sowie VM-Dispatcher
gebunden. Dabei bleibt auch die originale doppelte QAGame-Ordinale `-546`
erhalten. Das neue Gate und zehn ausführbare ABI-Verträge sind grün; CGame
steht damit bei 25/25 und Game bei 65/65 Dateien.

Der vorherige Integrationsblock schloss die sechs verbliebenen
Legacy-Missionpack-UI-Dateien `keycodes.h`, `ui_local.h`, `ui_public.h`,
`ui_shared.h`, `ui_syscalls.asm` und die absichtlich leere `ui_util.c`.
Die kanonische MiniLang-ABI erfasst 112 Tastencodes, 97 UI-Imports, 97
QVM-Assembly-Einstiege mit exakten negativen Ordinalen sowie sämtliche
Defines, Typen, Deklarationen und Globals der beiden großen UI-Header. Der
fehlende öffentliche Import `UI_CM_LOADMODEL=30` wurde ergänzt. Das neue Gate
und zwölf ausführbare ABI-Verträge sind grün; der Legacy-UI-Bereich steht
damit bei 12/12 Dateien.

Der vorherige Integrationsblock schloss die letzten vier offenen
Win32-Dateien `glw_win.h`, `win_local.h`, `resource.h` und `win_qgl.c`.
Originales 32-Bit-Datenlayout, Ressourcen- und Versionswerte, alle 336
GL-Logging-Wrapper, sechs Formathelfer sowie QGL-Laden, Logging und Shutdown
sind in MiniLang abgebildet. Der vollständige QGL-Loader ist in den bestehenden
GLimp-Start- und Abschaltpfad eingebunden; Win32 steht damit bei 13/13 Dateien.
Unveränderte MSVC-Orakel, 13 Lebenszyklusverträge, der bestehende 31-Verträge-
GLimp-Test und der native WGL-Build sind grün.

Der vorherige Integrationsblock schloss 40 Originalheader: sämtliche
31 öffentlichen und internen Botlib-Header, sechs QCommon-/Collision-/Minizip-
Header sowie `bg_lib.h`, `bg_local.h` und `g_rankings.h`. Die kanonischen
MiniLang-Fassaden erfassen 156 öffentliche Botlib-Konstanten, 119 interne
Makros und 110 auswertbare interne Konstanten, 50 Botlib-Typen, 340
Botlib-Deklarationen sowie 569 Recordfelder, die vollständige QCommon-
Headeroberfläche und alle 257 Ranking-Schlüssel. Produktive
AAS-, Bot-, Collision-, PK3-, Pmove- und Rankingpfade verwenden diese
Definitionen.

Die vier neuen Vollständigkeitsgates, alle betroffenen Fokusregressionen, der
Windows-Hauptbuild und das gekoppelte acht Frames lange Retail-QVM-Match sind
grün. Dabei wurden `TFL_DEFAULT`, die `INDENT_*`-Bitmasken, `MAX_EPAIRKEY` und
die öffentliche Capsule-Handle-Behandlung auf die Originalwerte und das
Originalverhalten korrigiert. Der Matchpfad liefert 2.345 vollständig
texturierte Dreiecke, 17 Renderpässe, 26 Sounds und null nicht unterstützte
Entities. Der frische `build/MiniQuake3.exe`-Stand hat SHA-256
`d327538fdd7d8a194e486cd0b3458028eea8e158fba18bcca121cf77944cf941`.
Die letzte vollständig am Stück ausgeführte Gesamtauswahl bleibt der
dokumentierte 449-Gate-Lauf; `scripts/verify.py` enthält inzwischen 498 normale
Gates.

Ein neuer Integrationsblock schließt `q_shared.h`, `win_main.c`, `win_net.c`,
`win_shared.c` und `win_wndproc.c`. Damit sind die gemeinsame Spiel-/Engine-ABI
samt Endian-, Vektor- und portablen PowerPC-Helfern sowie der vollständige
produktive Windows-Host für Lifecycle, Dateien/DLLs/Streams, Zwischenablage,
Eventqueue, Winsock/UDP/SOCKS, Zeit/CPU/Pfade und Fensterereignisse nativ
zugeordnet. Die fünf Vollständigkeitsgates prüfen 90 echte Funktionskandidaten,
18 ABI-Typen, 16 Protokollkonstanten, 31 unveränderte C-Datensätze, 96
MiniLang-Verträge und die nativen Grenzen unter `/W4 /WX`. Hauptbuild,
Input-, UDP-, Handshake-, Netzwerk- und spielbare Matchregressionen sowie der
acht Frames lange Retail-QVM-Match bestehen. Der geprüfte
`build/MiniQuake3.exe`-Stand hat SHA-256
`fe2130bfa759a1bd141c27cce7d596dbd55ecc204f0292adc874ceca45c4380a`.

Der jüngste Integrationsblock schließt `unzip.c`, `be_ea.c`,
`be_aas_bspq3.c` und `be_aas_move.c`. Damit sind die vollständige
Minizip-/DEFLATE-Oberfläche, alle Bot-Elementaraktionen, die BSP-/AAS-Brücke
und sämtliche AAS-Bewegungsprimitiven nativ zugeordnet und im Retail-Pfad
verdrahtet. Die vier Gates decken 120 Symbolkandidaten mit 33
unveränderten-C-Szenarien beziehungsweise Datensätzen, 67 neuen Verträgen,
84 Retail-Archivfällen sowie echten q3dm1- und Retail-`qagame.qvm`-Proben ab.
Der frische Hauptbuild und der gekoppelte acht Frames lange Retail-QVM-Match
bestehen; `build/MiniQuake3.exe` hat SHA-256
`93b20aad754c6f7e16cdcad74c1a98238534e549b5f7ed884bb367c334b6d49b`.

Der neueste Integrationsblock schließt neun weitere Header- und Botlib-Dateien:
`qfiles.h`, `g_public.h`, `bg_public.h`, `aasfile.h`, `be_aas_file.c`,
`be_aas_entity.c`, `be_aas_main.c`, `be_ai_char.c` und `be_ai_weap.c`. Damit
sind die BSP-/QVM-Dateiformate, beide öffentlichen Spiel-ABIs, sämtliche
AAS-v5-Dateilayouts samt verlustfreiem Retail-Roundtrip, AAS-Entity- und
World-Lifecycle sowie Bot-Charakter- und Waffenkonfiguration vollständig
zugeordnet und in produktive Pfade eingebunden. Die neun neuen Gates, alle 31
Retail-BSPs, alle 30 Retail-AAS-Dateien, der komplette Spielübergangslauf und
der gekoppelte Retail-QVM-Match bestehen. Der frische Hauptbuild hat SHA-256
`fbdeed15fe92ec2fc5292ad20c2f9009974c9de52632b7b2caa625a4e53f133a`.

Der nächste Integrationsblock schließt zusätzlich `vm.c`, `cm_load.c`,
`win_input.c` und `keys.h`. Die VM besitzt nun ihren vollständigen Lifecycle,
Modus-/Fallback-, Symbol-, Profil- und Pointerpfad. Der BSP-Lader verarbeitet
alle Lumps, Checksummen, Modelle und Cachezustände produktiv; der Retail-Match
startet über `CM_LoadMap`. Windows-Eingabe umfasst Raw Input, Win32-Fallback,
Capture/Fokus, Tastatur, fünf Maustasten, Wheel, Joystick/POV/Trackball und MIDI.
Die öffentliche Tasten-/Binding-/Console-/Chat-ABI aus `keys.h` ist ebenfalls
vollständig zugeordnet. Hauptbuild und Fokusgates sowie der acht Frames lange
Retail-Match bestehen; `build/MiniQuake3.exe` hat SHA-256 `5c46402ee19d38d5cebdb76e0862e006984e6b020230c3cce5eca0546638035c`.

Ein weiterer Integrationsblock schließt `cm_patch.c`, `cm_trace.c`,
`vm_local.h` und `win_glimp.c`. Damit sind die vollständige Patchkonstruktion
und -kollision, Box-/Capsule-/Brush-/Tree-/Transform-Traces, die interne VM-ABI
mit allen 60 Opcode-Ordinalen sowie der produktive Windows-WGL-Lifecycle
abgedeckt. Die neuen Gates bestehen 12 exakte Patch-Kernel-Datensätze, 351
Retail-Patches auf drei Maps, 4.096 unveränderte C-Trace-Fälle mit 40.960
Feldern, drei VM-ABI-Datensätze, 64 VM-Verträge, fünf PFD-Datensätze und 31
WGL-Verträge. Hauptbuild, erweitertes CGame-Rendering, spielbarer Match und der
acht Frames lange Retail-QVM-Match sind auf dem zusammengeführten Stand grün.
`build/MiniQuake3.exe` hat SHA-256
`a12ebd354db1d62f006d80a70ef9d6c453eef44bc191d46a0d6ddcbddf183697`.

Der aktuelle Stand ist im [AAS-/Botlib-Bericht](docs/AAS_RUNTIME.md) und im
[vollständigen AI-Trap-Audit 500–577](docs/BOTLIB_AI_TRAP_AUDIT.md) dokumentiert.
Die Laufzeit lädt alle 30 Navigationsdateien aus `pak0.pk3`, beantwortet echte 300er AAS-Traps und
führt die Retail-`qagame.qvm` durch Setup, MapLoad und Botlib-Frames. Die
statischen und dynamischen Level-Items, Goal-Stacks, Avoid-Zustände,
LTG-/NBG-Itemwahl, Kartenorte, Waffenwahl, Fuzzy-Evolution, Retail-Synonyme und
vollständige Initial-/Reply-Chatdaten laufen bereits im Originalbot-Pfad. Sarge
durchläuft auf q3dm1 512 originale Bot-Frames ohne Trapfehler und reicht einen
echten Bewegungs-Usercmd an den Server weiter. Alle 15 im Release verwendeten
Baseq3-Travelhandler sind portiert. Zwei echte UDP-Clients absolvieren vor der gemeinsamen Match-Schleife den vollständigen Challenge-/Connect-Handshake. Reverse-Reachabilities, Area-Reisezeitmatrizen,
Portal-Maximalzeiten sowie die zielzentrierte Area- und Portal-Cachepropagation
sind vorhanden. Der produktive Botlib-Pfad lädt und speichert nun validierte `.rcd`-v2-
Routingcaches mit Originalidentität, Area-/Cluster-CRC und zeigerfreiem Nutzinhalt.
Offen bleibt die noch kompaktere interne Reachability-Ablage.

Der vollständige Retail-Gesamtlauf vom 23. Oktober 2026 besteht alle **449 Gates**
von `python scripts/verify.py --data-root D:/Quake3`. Das zugehörige
`build/verification.json` hat SHA-256
`f098ae92d0f21caf9d6fe770bd0aa7dd9c585c7234b0a76622259ae41b765453`.
Nach der abschließenden produktiven Einbindung der neuen Server-Lifecycle-,
ABI- und Botimport-Module bestehen die betroffenen Fokusgates und das acht
Frames lange Retail-QVM-Match erneut. Der daraus frisch gebaute
`build/MiniQuake3.exe`-Vollstand hat SHA-256
`81273c46d6d5128e067388291469ad332c38fe1cd1cabf11bee91a5387798af4`.
Der neueste inkrementelle Quellenblock schließt zusätzlich vier bisher
unbegonnene Originaldateien: `code/ui/ui_players.c`, `code/game/ai_vcmd.c`,
`code/server/sv_ccmds.c` und `code/win32/win_snd.c`. Team-Arena-Spielermodelle,
Bot-Voicecommands, sämtliche Server-Operatorbefehle und der DirectSound-DMA-
Lifecycle sind damit vollständig nativ zugeordnet. Die vier Fokustests bestehen
mit 46 unveränderten C-Datensätzen, 91 nativen Verträgen und 23 Retail-Probes
beziehungsweise kompilierten Retail-IDs. Das Inventar zählt nun 94 portierte,
114 partielle und 127 noch nicht begonnene Runtime-/Plattformdateien. Die
vollständige Gesamtauswahl wurde seit der Erweiterung noch nicht erneut am Stück
ausgeführt. Der frisch gebaute Hauptstand mit SHA-256
`6203ea60375f534ec4172c8dca77926e8fb2ce4d6d5f5ee862f1e939f65cdf45`
und das Retail-QVM-Match über acht Frames bestehen separat.
Der folgende Agentenblock schließt fünf weitere vollständige Originaldateien.
Die beiden größten verbleibenden Team-Arena-UI-Dateien `ui_shared.c` und
`ui_main.c` liefern zusammen 419 native Symbole für Parser, Menü-/Item-
Lifecycle, Input, Scripts, OwnerDraw, Feeder, Serverbrowser, Arena-/Botdaten,
Cvars und den UI-VM-Dispatch. `ai_cmd.c` ergänzt alle 41 textgesteuerten
Bot-Teamaufträge, `be_aas_debug.c` die 19 Debuggeometrie-, Reachability- und
Cluster-Flood-Pfade und `win_syscon.c` die acht Windows-Konsolenpfade. 55
unveränderte C-Datensätze beziehungsweise -Funktionen und 139 native Verträge
bestehen; Retail-Probes prüfen 3.539 echte UI-Assets, 138 Chat-Templates und
alle 30 AAS-Dateien. Das Inventar steht nun bei 99 portierten, 114 partiellen
und 122 noch nicht begonnenen Runtime-/Plattformdateien.
Die fünf neuen Fokustests, der Hauptbuild mit SHA-256
`6203ea60375f534ec4172c8dca77926e8fb2ce4d6d5f5ee862f1e939f65cdf45`
und das acht Frames lange Retail-QVM-Match bestehen. Ein neuer vollständiger
Lauf aller Gates wurde für dieses Paket nicht nochmals als einzelne
Gesamtausführung gestartet.
Seit diesem Gesamtlauf bestehen zusätzlich die neuen `cg_event.c`-,
`cg_playerstate.c`- und `cg_predict.c`-Differentialgates mit 29 unveränderten
C-Datensätzen und 139 nativen Verträgen. Jetzt sind auch `cg_effects.c`,
`cg_localents.c`, `cg_ents.c` und `ui_sparena.c` vollständig nativ zugeordnet:
27 unveränderte C-Differenzdatensätze und 98 MiniLang-Verträge prüfen
Effekterzeugung, den 512er Local-Entity-Pool, sämtliche Snapshot-Entitytypen
und den Singleplayer-Arenastart. Der Retail-Match führt die neuen Cgame-Pfade
als nicht doppelt ausgebenden Observer produktiv mit. Das Retail-QVM-Gate bleibt mit
neun produktiven Prediction-Traces, 2.345 texturierten Dreiecken und 26 Sounds
grün; alle neuen Fokustests sind bereits in `scripts/verify.py` aufgenommen.
Der nächste native Block portiert zusätzlich `cg_weapons.c`, `cg_view.c`,
`cg_drawtools.c`, `tr_animation.c` und `ui_credits.c` vollständig. Waffenwahl,
Treffer, Trails, Hülsen und Shotgun-Muster werden aus den produktiv dekodierten
Cgame-Ereignissen gespiegelt; jeder Retail-Snapshot durchläuft außerdem die
vollständige native Kamera-/FOV-/Frame-Reihenfolge. Zeichen-, Bild- und
Farbhilfen, MD4-Bonematrix-Skinning und das Credits-Menü sind mit 35
unveränderten C-Differenzdatensätzen und 141 MiniLang-Verträgen belegt. Der
Quellabgleich weist damit 26 vollständige native Originaldateien aus.
Der aktuelle Folgeblock portiert `cg_draw.c`, `cg_particles.c`, `cg_servercmds.c`, `ui_display.c` und `ui_sound.c` vollständig. 36 unveränderte C-Datensätze und 135 native Verträge decken HUD, Scoreboard, Lagometer, Crosshair, Teamoverlay, Partikel-Lebenszyklen, Serverbefehle, Chat/Voice, Shader-Remaps sowie Display-/Soundoptionen ab. Die produktiven Retail-Snapshots und Servercommands speisen die nativen, unterdrückbaren Beobachter; der frische Build `bae4743ee1d0f48ec9dcd5feb3514f7c0183ad63d6330c7523a1b742a37bfb1f` besteht das Retail-QVM-Match weiterhin mit 2.345 texturierten Dreiecken und 26 Sounds. Der Quellabgleich steht damit bei 31 vollständig portierten Originaldateien.
Nun sind außerdem `cg_main.c`, `cg_marks.c`, `ui_qmenu.c`, `ui_network.c`
und `ui_options.c` vollständig nativ zugeordnet. Lifecycle und VM-Dispatch,
Asset-/Clientregistrierung, der 256er Mark-Pool samt Fragmentprojektion, das
gesamte QMenu-Framework sowie Netzwerk- und Systemoptionen werden durch 27
unveränderte C-Datensätze, 108 Verhaltensverträge und 44 zusätzliche
`cg_main`-Symbolverträge geprüft. Cgame-Hauptzustand und Marks laufen im
produktiven Retail-Match als unterdrückbare QVM-Begleiter. Der frische Build
`04be50c8ffd913b86a638e54237cbcdba8e4605afd04f81869cad3c19bbd8031`
besteht das acht Frames lange Retail-QVM-Gate weiterhin mit neun
Prediction-Traces, 2.345 texturierten Dreiecken, 301 Cgame-Assets und 26
Sounds. Das Inventar steht bei 36 portierten, 118 partiellen und 181 noch
nicht begonnenen Runtime-/Plattformdateien; die vollständige 283-Gate-Auswahl
bleibt der zuletzt dokumentierte Gesamtlauf.
Der nächste Block schließt `cg_players.c`, `cg_newdraw.c`, `ui_gameinfo.c`,
`tr_sky.c` und `tr_init.c`. Damit sind Spielerassembly und Animationen, das
Missionpack-OwnerDraw-HUD, Retail-Arena-/Bot- und SP-Fortschrittsdaten, die
originale Skybox-/Wolken-/Sonnengeometrie sowie der Renderer-Lifecycle nativ
abgedeckt. 115 unveränderte C-Werte und -Datensätze, 144 native Verträge und
sieben Retail-Verträge bestehen. Der produktive Retail-Match führt den neuen
Player-Pfad unterdrückbar mit und weist fünf beobachtete Aktionen ohne doppelte
Ausgabe nach. Der frische Build `76edc5435dc6d79555b72bd71b5dc0ddc553d7cb67a64fa7d314549230d7f322` besteht das Retail-QVM-Gate mit
2.345 texturierten Dreiecken, 301 Cgame-Assets und 26 Sounds. Das Inventar
steht bei 41 portierten, 117 partiellen und 177 noch nicht begonnenen
Runtime-/Plattformdateien.
Der aktuelle UI-Block schließt sechs weitere Originaldateien:
`ui_startserver.c`, `ui_splevel.c`, `ui_sppostgame.c`, `ui_spreset.c`,
`ui_spskill.c` und `ui_team.c`. Damit sind Map-/Gametype- und Serveroptionen,
Bot-Auswahl, die komplette Einzelspieler-Level-, Schwierigkeits-, Reset- und
Postgame-Folge sowie der Teamwechsel nativ abgebildet. 37 Datensätze aus
unverändert extrahiertem C und 127 native Verhaltensverträge bestehen; alle
87 Originalfunktionen sind im Ledger zugeordnet. Die produktive Retail-QVM
bleibt über acht Frames mit 2.345 texturierten Dreiecken, 301 Cgame-Assets und
26 Sounds grün. Die nativen UI-Module liefern typisierte, unterdrückbare Host-
Aktionen; deren vollständiger Dispatcher ist die nächste Integrationsgrenze.
Das Runtime-/Plattforminventar steht nun bei 47 portierten, 117 partiellen und
171 noch nicht begonnenen Originaldateien. Die sechs Fokustests sind in die
Gesamtprüfung aufgenommen; der vollständige Retail-Gesamtlauf mit jetzt 314
Gates besteht.
Der anschließende UI-Abgleich schließt acht weitere Originaldateien:
`ui_menu.c`, `ui_ingame.c`, `ui_confirm.c`, `ui_setup.c`, `ui_controls2.c`,
`ui_video.c`, `ui_players.c` und `ui_playermodel.c`. Damit liegen Haupt- und
Ingame-Menü, Dialoge, Setup, alle 34 Steuerungsbindungen, Grafikvorlagen und
Renderer-Cvars sowie die vollständige Player-/Modelvorschau nativ vor. 23
Datensätze aus unverändertem C, 161 MiniLang-Verträge und acht Retail-Verträge
bestehen; die Assetprobe findet 89 Retail-Spielermodelle und alle 31
Animationsslots. Alle 99 Originalsymbole sind im Ledger zugeordnet. Das
Inventar steht nun bei 55 portierten, 117 partiellen und 163 noch nicht
begonnenen Runtime-/Plattformdateien. Der frisch gebaute Hauptstand bleibt bei
SHA-256 `76edc5435dc6d79555b72bd71b5dc0ddc553d7cb67a64fa7d314549230d7f322`;
das Retail-QVM-Match bleibt mit 2.345 texturierten Dreiecken, 301 Cgame-Assets
und 26 Sounds grün. Die acht Fokustests sind in `scripts/verify.py` aufgenommen;
der jetzt 322 Gates umfassende Gesamtlauf ist für diesen Block noch nicht
vollständig erneut ausgeführt. Der produktive Dispatcher für die typisierten
nativen UI-Aktionen bleibt offen.
Der nächste UI-Block portiert `ui_servers2.c`, `ui_addbots.c`,
`ui_removebots.c`, `ui_teamorders.c`, `ui_serverinfo.c`, `ui_preferences.c`
und `ui_mods.c`. Damit liegen Serverbrowser und Favoriten, vollständige
Ping-/Refresh-/Filterabläufe, Bot hinzufügen/entfernen, Teamorders, Serverinfo,
Spieloptionen und Modauswahl nativ vor. 20 unveränderte C-Datensätze,
zusätzliche Browser-Entscheidungsoracles und 129 Verträge bestehen; Retail-
Proben bestätigen 32 Bots sowie 24 Menü-/Browserassets. Alle 74
Originalsymbole sind zugeordnet. Das Inventar steht jetzt bei 62 portierten,
117 partiellen und 156 noch nicht begonnenen Runtime-/Plattformdateien. Die
sieben Gates sind in die Gesamtprüfung aufgenommen, die damit 329 Gates
umfasst; der vollständige Lauf wurde nach diesem inkrementellen Block noch
nicht wiederholt. Der native Hostdispatcher bleibt die nächste UI-
Integrationsgrenze.
Der folgende Abgleich portiert vierzehn weitere UI-Dateien: vollständige
MField-Eingabe, Player-Settings, CD-Key, Cinematics, Demos, Config laden und
speichern, direkten Server-Connect sowie Login, Signup, Rankings, Rankstatus
und Leagueauswahl sowie den UI-VM-Einstieg mit allen 47 Original-Cvars und
Exportkommandos. 40 unveränderte C-Datensätze, zusätzliche C-
Entscheidungsoracles und 172 MiniLang-Verträge bestehen. Retail-Proben
bestätigen 32 Menüassets, elf RoQ-Videos und beide Originaldemos. Alle 78
Originalsymbole sind zugeordnet. Das Inventar steht bei 76 portierten, 117
partiellen und 142 noch nicht begonnenen Runtime-/Plattformdateien; `q3_ui`
steht bei 43 von 47 vollständig portierten Dateien. Die Gesamtprüfung umfasst
nun 343 Gates, wurde nach diesem inkrementellen Block aber noch nicht komplett
wiederholt.

Der nächste vollständige Datei-Abgleich schließt neun weitere Originalpfade:
`q3_ui/ui_atoms.c`, `q3_ui/ui_connect.c`, `cgame/cg_consolecmds.c`,
`botlib/be_aas_routealt.c`, `botlib/be_aas_optimize.c`, `botlib/l_log.c`,
`botlib/l_memory.c`, `botlib/l_struct.c` und Missionpacks `ui/ui_gameinfo.c`.
Damit sind 131 weitere Originalsymbole mit unveränderten C-Oracles und zusammen
198 nativen Verträgen belegt. Die produktive Retail-QVM-Abnahme bleibt über
acht Frames mit 2.345 texturierten Dreiecken, 19 Scene-Entities und 26 Sounds
grün; zusätzliche Retail-Proben erfassen 30 AAS-Dateien, 30 Arenen, 32 Bots
sowie die echten UI-Schriften, Cursor- und Verbindungsassets. Das vollständige
Runtime-/Plattforminventar steht nun bei 85 portierten, 114 partiellen und 136
nicht begonnenen Dateien; `q3_ui` erreicht 45 von 47, wobei die zwei offenen
Einträge Header ohne Funktionskörper sind. Die sieben neuen Gates erhöhen die
Gesamtprüfung auf 350.

Der anschließende ABI-Abgleich portiert die vollständigen Wrapperdateien
`cgame/cg_syscalls.c`, `game/g_syscalls.c` und Missionpacks
`ui/ui_syscalls.c`, außerdem Missionpacks `ui/ui_atoms.c` und Win32s
`win_gamma.c`. Alle 400 Ledger-Symbole sind jetzt nativ vorhanden; 357
zugehörige Trap-Wrapper bewahren Opcode, Argumentreihenfolge, 32-Bit-Pointer
und Float-Bitmuster. Unveränderte x86-C-Oracles sowie 196 MiniLang-Verträge
bestehen. Retail-Proben führen echte Cgame-, qagame- und UI-QVM-Aufrufe durch
die vorhandenen Hostdispatcher und prüfen zusätzlich Originalassets. Das
Inventar steht damit bei 90 portierten, 114 partiellen und 131 nicht
begonnenen Runtime-/Plattformdateien. Die fünf neuen Gates erhöhen die
Gesamtprüfung auf 355.

Details und verbleibende Paritätslücken stehen im
[Prüfaudit](docs/PARITY_AUDIT.md).

Der lokale Original-QVM-Pfad teilt inzwischen den 256-Tasten-Zustand, Catcher,
Bindings, Overstrike-Zustand sowie Baseq3s vollständige Tastennamen und deren
Rückübersetzung zwischen `ui.qvm` und `cgame.qvm`. Das originale
Steuerungsmenü zeigt damit echte Tastenbezeichnungen. Die nativen Win32-
Ereignisse erreichen den Zustand über einen zeitgestempelten, threadsicheren
256-Eintragsring und werden im passenden Simulationstick angewendet.
`CG_SETUSERCMDVALUE` steuert im produktiven QVM-Spielpfad außerdem das
Usercmd-Waffenbyte und die Cgame-Mausempfindlichkeit. MD3-Entityframes werden
vor der Interpolation wie in Baseq3 gewrappt oder repariert. Registrierte
Mono-Soundeffekte verwenden Baseq3s exakten 22050-Hz-Resampler.
Der produktive Client erzeugt und überträgt nun außerdem Baseq3-kompatible
`CL_SendCmd`-Pakete. Sieben echte Localhost-UDP-Clientframes führen diese
Pakete inzwischen durch `SV_UserMove`, Reliable Commands und Full-/Delta-Snapshots
bis zur clientseitigen Snapshot-Promotion. Der Pfad erholt sich dabei von
verlorenen und duplizierten Client- und Serverpaketen über `packetdup`, ältere
Delta-Basen und `cl_nodelta`. Zwei gleichzeitige Clients teilen anschließend
einen echten Server-Ingress, bewahren unabhängige Sequenzen und Acks und sehen
die jeweils andere, clientseitig geparste Spielerentity. Ein 384-Frame-Lauf
liefert 768 Usercmds trotz gezieltem Paketverlust genau einmal aus, rekonstruiert
Delta-Snapshots über erhaltene Basen und führt die Reliable-Ringe mehrfach über
ihre Grenze; `CL_Frame`- und `SV_Frame`-Timeoutentscheidungen bleiben dabei mit
den UDP-Zuständen synchron. Snapshot-Sequenzen
erreichen nun außerdem den
produktiven `CG_GETSERVERCOMMAND`-Pfad der Retail-Cgame einschließlich großer
Configstrings. Der QVM-Vorschaupfad führt jeden Frame über die originale
Snapshot-/Drift-/`cl_timeNudge`-Zeitlogik. QVM-Rail-Cores, Rail-Ringe,
Lightning und `RT_BEAM` verwenden echte Originalsemantik; Portalflächen rendern
Spiegel- oder Remotekamera-Welt samt Cgame-Entities, Ziel-Clipplane und
Portal-vor-Hauptansicht-Komposition. One-shots, gruppierte Loops, Musik und RoQ-Rohsamples
laufen gemeinsam durch Baseq3s 24.8-Integer-Paintbuffer, räumliche
Links-/Rechts-Abmischung, 96-Kanal-Auswahl, geschwindigkeitsabhängigen Loop-Doppler und signed-16-Sättigung. Der Videoton ersetzt dabei nicht länger ganze Mixerblöcke,
sondern wird über den originalen 16.384-Frame-`S_RawSamples`-Ring zusammen mit
Musik und Spieleffekten ausgegeben.
Neben
`cvar_restart` sind `toggle`, `set`, `sets`, `setu`, `seta`, `reset`, `cvarlist`
und direkte Cvar-Abfragen/-Zuweisungen an den Engine-Commandpuffer gebunden.

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

## Spielbarer Original-QVM-Pfad

Doppelklick auf `MiniQuake3.exe` benötigt keine Kommandozeilenargumente und
öffnet als Windows-GUI-Anwendung ausschließlich das Spielfenster, ohne eine
zusätzliche Konsole. Die EXE sucht relativ zu ihrem eigenen Speicherort nach
`baseq3/pak0.pk3` und startet
daraus das originale Quake-III-Menü sowie später `qagame.qvm` und `cgame.qvm`.
Das Arbeitsverzeichnis einer Verknüpfung spielt dabei keine Rolle. Für einen
portablen Testordner müssen `MiniQuake3.exe`, seine mitgebauten DLLs und der
Retail-Ordner so nebeneinander liegen:

```text
MiniQuake3.exe
playable_window.dll
playable_audio.dll
playable_ambient.dll
qvms/
  ui.qvm
  qagame.qvm
  cgame.qvm
baseq3/
  pak0.pk3
  pak1.pk3
```

`pak0.pk3` enthält bei der Retail-CD die Karten, Assets und unveränderten
Baseq3-QVMs. Vorhandene Standardarchive `pak1.pk3` bis `pak8.pk3` werden in
Quake-III-Patchreihenfolge darübergelegt; bei gleichen Dateinamen gewinnt das
höchste Pak. Der VM-Host akzeptiert dabei neben den späteren UI-APIs 4 und 6
auch die auf der ursprünglichen Retail-CD enthaltene UI-API 3.

Der Build legt zusätzlich die drei unveränderten, aus dem enthaltenen
Quake-III-1.32b-Quellstand gebauten QVMs unter `qvms/` ab. Das ist notwendig,
weil die ungepatchte CD zwar dieselben Assets, aber ältere Game-/Cgame-VM-
Strukturen enthält. Menü, Regeln, Prediction und HUD bleiben Originalbytecode;
die Standard-PK3s liefern weiterhin Karten, Modelle, Texturen und Audio.

Doppelklick auf `Play-MiniQuake3.cmd` baut bei Bedarf die drei unveränderten
Baseq3-QVMs und startet den produktiven Original-QVM-Pfad anschließend
abgekoppelt, sodass das Hilfsfenster sofort schließt. Manuell entspricht
das diesem Aufruf:

```powershell
python scripts/build.py
# pak0.pk3 sowie vorhandene pak1.pk3 ... pak8.pk3 nach build/baseq3 kopieren
.\build\MiniQuake3.exe
```

Der Nullargument-Start ermittelt den Ordner der EXE selbst, lädt
`build/baseq3/pak*.pk3` in Original-Priorität und verwendet die mitgebauten
QVMs unter `build/qvms`. Er lädt ausdrücklich noch keine Karte; erst ein
`map`-/`spmap`-Befehl des Originalmenüs startet qagame und cgame.

Damit stammen Menü, HUD, Client- und Spielregeln aus `ui.qvm`, `cgame.qvm`
und `qagame.qvm`; Bindings und Key-Catcher folgen dem Quake-III-Pfad. Der
ältere vereinfachte Vertical-Slice bleibt nur als Diagnose mit `--play`
erreichbar und ist nicht länger der Benutzer-Standard. Der Standardstart bootet
jetzt wie Quake III zuerst ausschließlich die unveränderte `ui.qvm` im Zustand
`CA_DISCONNECTED`. `qagame.qvm`, `cgame.qvm`, der vollständige Shaderkatalog
und die gewählte BSP werden erst geladen, wenn das Originalmenü selbst einen
`map`-Befehl ausgibt. Auf dem Entwicklungsrechner war das sichtbare Hauptmenü
damit in weniger als zwölf Sekunden stabil und bedienbar, statt vor dem Menü
mehrere Minuten lang bereits `q3dm1` aufzubauen.

The normal startup uses the native backend's built-in 24-bit colour, 24-bit
depth and 8-bit stencil defaults. It intentionally does not send the same
defaults through the extended nine-argument configuration entry point first;
that call exposed an integer-only Win64 FFI stack-argument defect in the frozen
MiniLang compiler and caused error 7481 before a window was created. A dedicated
startup gate now opens the real Win32/WGL window through MiniLang and shuts it
down again. It also reads the synchronized presented surface and rejects a
blank loading frame, so a successful process start without visible pixels no
longer passes the gate. Custom modes use three ABI-safe configuration calls for
driver, pixel format and display settings.

The current preview opens a native Windows window and renders `q3dm1` with a
MiniLang-driven software rasterizer, depth buffering, BSP lightmaps and full
RGB vertex lighting. Lightmaps and BSP light-grid samples pass through Baseq3's
`R_ColorShiftLightingBytes` overbright conversion. Because the software renderer
has no hardware gamma ramp, the default map shift is two bits; bright pixels use
the original chromatic normalization instead of clipping to white. Lightmapped
surfaces use their decoded retail lightmap once, without the former extra
grayscale vertex modulation. BSP `MST_FLARE` lights now use the retail
`flareShader` image, real depth-buffer visibility, original normal attenuation,
screen-size formula and linear fade in portal and main views. Baseq3's archived
`r_flares` default remains disabled, and no substitute image is drawn when the
retail flare asset is unavailable. BSP PVS, frustum and backface selection now draw relevant surfaces
from the complete tessellated map instead of a fixed first-1,000 prefix. The
native window is created before the PK3 and BSP are parsed, shows named 2--100
percent loading phases, and runs its Windows message loop on a dedicated UI
thread. It therefore appears immediately and remains movable, repaintable and
closable while MiniLang decodes the retail assets. A separate presented surface
keeps asynchronous paint messages from racing the software rasterizer. Press
Enter in the Baseq3 artwork menu, use WASD and the mouse to move/look,
and Space to jump. Quake-style gravity, friction, ground/air acceleration,
sliding and 18-unit stair steps use the real BSP brush and patch collision world.
The renderer tessellates curved BSP patches with Baseq3's perpendicular-error
test, repeated de Casteljau subdivision, 65-point axis limit, collinear-grid
reduction and Baseq3's wrapped/degenerate-neighbour normal reconstruction; the
visibility budget uses the same resulting triangle count. It resolves BSP shader names,
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
`oneMinusVertex`, `entity`, `oneMinusEntity`, `const` and `wave` together with the corresponding `alphaGen`
modes. Their final RGB-to-alpha evaluation now follows Baseq3's complete
`ComputeColors` ordering, including identity-light scaling and the special
vertex-alpha preservation rule. Blended-only shaders now also apply Baseq3's
per-vertex fog adjustment before the final fog pass: additive and impact-mark
stages fade RGB, strict alpha stages fade alpha, and premultiplied-alpha stages
fade RGBA. Wave generators use the original 1,024-entry phase lookup and byte
quantization. `deformVertexes wave`, `move` and `bulge` animate retained BSP
vertices using Quake's waveform, base-UV and normal rules. Ordered `tcMod transform`
matrices preserve the scaled and translated water layers used by
the retail maps. Each QVM entity's `shaderTime` now shifts one shared retained
renderer clock through geometry refresh and portal clipping. Animated image
selection, RGB/alpha waves, vertex and normal deformations, ordinary time-based
`tcMod` operations and `entityTranslate` therefore start at the entity's Baseq3
phase; the latter also consumes `shaderTexCoord`. Runtime shader remaps now carry
their `timeOffset` into already registered QVM materials, and parsed `clampTime`
freezes animated images, waves, deformations, normals and UV transforms at the
same boundary as `RB_BeginSurface`; changing only the offset of a stable shader
handle also updates an already retained scene pass without rebuilding its
geometry. The original QVM HUD/UI `DrawStretchPic`
path uses that clock as well, including runtime remap replacement textures,
animated frames, colour waves and UV transforms. Remaining shader generators/deforms and the complete QVM match
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
source-relative attenuation and stereo panning. QVM background music preserves
stereo channels, plays the requested intro once and then repeats the separate
loop track as `S_StartBackgroundTrack` does. RoQ audio now enters the exact
Baseq3 raw-sample conversion and resampling ring before the shared integer
paint pass, so cinematics no longer mute queued game sounds for an output block.
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
The original-QVM renderer now carries `refEntity_t.renderfx` through MD3,
sprite, beam, rail and lightning expansion. `RF_DEPTHHACK` geometry is retained
in its own native material batch and submitted with Baseq3's compressed 0..0.3
depth range, so the cgame QVM's first-person weapon uses the same protected
depth interval as the original renderer. QVM models carrying
`RF_SHADOW_PLANE` now also follow `RB_ProjectionShadowDeform`: their animated
vertices project along the sampled entity-light direction onto the submitted
`shadowPlane`, including Baseq3's shallow-light clamp, and draw as a
polygon-offset translucent decal.
Registered `*N` BSP models are no longer discarded by the QVM renderer.
Doors, platforms and other brush entities retain their exact submodel surface
range, entity origin/axis transform, shader name, vertex colour, base UV and
lightmap UV/index through the native retained batch. The preserved q3dm12 map
currently exercises 63 inline models with 200 surfaces and 425 lightmapped
triangles. Their BSP fog indexes now also feed the same final fog overlay and
per-stage fog colour adjustment as static world geometry, including refreshed
moving brush positions and portal views. Main and portal views construct
Baseq3's four FOV side planes and reject transformed inline-model bounds that
are completely outside them before any surface expansion or batching. Opaque
brush surfaces without `SURF_NODLIGHT` or `SURF_SKY` now also enter the retained
projected dynamic-light pass. Moving and rotated brush models preserve their
entity origin and axes, so each world-space light is projected in the same local
coordinate system as Baseq3's `R_DlightBmodel`. Its radius-expanded local model
bounds reject unrelated lights before triangle projection; ordinary MD3 entity
triangles remain on their separate light-grid path.
For `RDF_NOWORLDMODEL` scenes, including menu/player-model views, QVM entities
now receive Baseq3's 150-unit ambient and directed fallback, the unconditional
32-unit minimum-light add, the normalized default sun direction and any active
dynamic lights instead of appearing unlit or fullbright.
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
and submits the stock main menu into the same 2D queue. Its host now supplies the exact 3,084-byte `uiClientState_t` and follows Baseq3 screen transitions for connect, challenge, loading, active and cinematic states. The retail integration
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
resolved to retail WAV files, spatialized with Baseq3's original listener-axis,
full-volume and distance-falloff rules, mixed into 16-bit stereo PCM and fed to
the queued WinMM output. Escape opens the interactive original ingame menu;
native key transitions, characters and mouse motion are delivered through
`KEYCATCH_UI`, and the UI's 2D commands share the cgame queue. All Baseq3
active-menu states (main, ingame, CD errors, team and postgame) and both
connection-screen overlay modes are forwarded to the unchanged UI VM. Original
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
frames to exact EOF. Shared MD3 vertices, persistent transforms, cached
material bindings and retained scene batches reduced the original QVM geometry
cost substantially. The production path now also omits differential-only
Game/Cgame observers, mixes audio through a byte-exact native paint block,
accumulates render commands with `std.ds.list`, packs an entire HUD quad in one
native call, updates unchanged QVM-2D topology in place and retains static
world-stage results. The current real 20-frame q3dm1 profile measures 30.3 ms
simulation, 18.05 ms geometry, 35.15 ms batch maintenance, 25.55 ms rendering
and 1.95 ms audio, or 111 ms per frame in total (about 9 FPS). This is roughly
14 percent faster than the immediately preceding stable 129.45 ms profile, but
it is not yet close to the desired hundreds of FPS.

The remaining ceiling is architectural: the Win32 backend still rasterizes
world and model triangles on the CPU and uses OpenGL only to blit the finished
pixel buffer with `glDrawPixels`. Reaching original-Quake-III-class frame rates
requires the still-open hardware OpenGL batch path and visual A/B verification.
The direct q3dm1 match boot currently takes 25.47 seconds; the normal no-argument
launch reaches the original main menu first and delays that world work until a
match is selected. Shader sources and parsed entries use `std.string_builder`
and `std.ds.list`; native input uses `std.ds.queue`; world candidates use one
`std.sort` pass; audited MD3, snapshot, audio, scene and render-command paths
use reusable or exactly sized storage. `python scripts/test_minilang_hotpaths.py`
guards eleven critical paths against accidental quadratic-array regressions.

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
python scripts/test_playable_window_startup.py
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
Der originale Sarge-QVM-Pfad läuft 512 Frames bis zur echten Usercmd-Übergabe.
Seine Botlib-Seite enthält alle 15 Baseq3-Routen von Walk, Crouch und Jump über
Swim, Waterjump, Teleport, Elevator und Jumppad bis zu Rocket-/BFG-Jump,
Grapple und FuncBobbing,
Sichtpositionsvorhersage, Fuzzy-Evolution sowie Initial-/Reply-Chat aus den
Retail-Dateien `rnd.c`, `rchat.c`, `syn.c` und `match.c`.
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

## Vollständiger Bot-/AAS-Dateiblock vom 22. Oktober 2026

Der jüngste Originalabgleich schließt weitere 15 Runtime-Dateien vollständig:
`be_aas_cluster.c`, `ai_chat.c`, `sv_rankings.c`, `g_rankings.c`, `bg_lib.c`,
`ai_dmq3.c`, `ai_team.c`, `ai_main.c`, `be_ai_chat.c`, `be_ai_move.c`,
`be_aas_reach.c`, `be_ai_goal.c`, `be_aas_sample.c`, `be_aas_route.c` und
`be_ai_weight.c`. Damit sind Clustering, Reachability-Erzeugung, Routing,
Sampling, Bewegungs-, Ziel-, Chat- und Gewichtslaufzeit sowie die vollständigen
Baseq3-Botentscheidungen, Teamstrategie, Gameplay-Chat und Rankingzustände als
native MiniLang-Module vorhanden. Alle **638 Ledger-Symbole** plus `qsort`
werden durch **132 Beobachtungen aus unverändertem C** und **404 native
Verträge** abgedeckt. Retail-Probes prüfen unter anderem 30 AAS-Dateien,
96.758 Areas, 125.731 Reachabilities, 32 Chatdateien, 175 Synonymgruppen,
138 Matchvorlagen, 244 Zufallsgruppen und 456 Reply-Regeln.

Das erzeugte Runtime-/Plattforminventar zählt jetzt **114 portierte**, **104
partielle** und **117 noch nicht begonnene** Originaldateien. Der vollständige
Retail-Gesamtlauf besteht alle **378 Gates**. Bekannte Grenzen bleiben klar
abgegrenzt: der historische proprietäre GRank-Dienst steht nicht zur Verfügung;
Ranking wird daher als typisierte asynchrone Hostschnittstelle abgebildet.
Team-Arena-Optik benötigt weiterhin legale `missionpack`-Daten. Dynamische
Engine-Entity-Traces und Point-Contents bleiben typisierte Hostdienste, während
statische AAS-/BSP-Pfade nativ laufen. Release-AAS enthält vorberechnete
Reachabilities; der native Erzeugungspfad ist für erzwungene Neubauten vorhanden.
Routingcaches verwenden das deterministische, zeigerfreie RCD-v2-Format statt
historischer C-Pointer-Dumps.

## Vollständige Common-, Shader- und Bot-Zustandslaufzeit vom 22. Oktober 2026

Der aktuelle Abgleich schließt drei weitere zentrale Originaldateien vollständig:
`code/qcommon/common.c`, `code/renderer/tr_shader.c` und
`code/game/ai_dmnet.c`. Die neuen nativen MiniLang-Module umfassen alle **152
Ledger-Symbole**. Die Abnahme enthält **60 Beobachtungen aus unverändertem C**
und **102 native Verträge** sowie die bereits vorhandenen Shader-Parser-,
Material- und Bot-Navigationstests.

Der Common-Pfad deckt Redirect, Ausgabe und Fehler, Filter und Hashing,
Journaling und Events, Start, Initialisierung, Frame und Shutdown, Konfiguration,
CD-Key, Zone/Hunk und Byteoperationen ab. Betriebssystemzeit, Dateien,
Prozessende und Subsystem-Lebenszyklen bleiben explizite typisierte
Hostschnittstellen. Der Shader-Pfad enthält Parserfassaden, Sky-/Surface-/Sort-
Behandlung, `FinishShader`, Vertex-Light- und Multitexture-Kollaps,
Iteratorwahl, stabile Handles, sortierte Einfügung, Registrierung, Remap und
Liste. GPU-Upload, TMU-/Lightmap-Zugriff und Backend-Commandbuffer bleiben
typisierte Renderergrenzen.

Der vollständige `ai_dmnet.c`-Zustandsautomat bildet Baseq3 und die im
Originalquellcode vorhandenen Missionpack-Zweige ab: Node-Historie,
Aktivierungswaffen, Hindernisbeseitigung für Kamikaze und Prox-Minen,
Führungsdispatch sowie CTF-, One-Flag-, Obelisk- und Harvesterzustände. Die
vorhandenen Retail-Daten prüfen Baseq3 direkt; Team-Arena-Verhalten ist mangels
legaler `missionpack`-Assets durch Original-C- und native Verträge abgedeckt.

Das Runtime-/Plattforminventar zählt nun **117 portierte**, **101 partielle**
und **117 noch nicht begonnene** Originaldateien. Alle drei neuen Fokustests,
die vollständige **31-teilige Bot-Paritätssuite**, der Hauptbuild und das echte
Retail-QVM-Match über acht Frames bestehen. Der frische Hauptstand hat SHA-256
`cfcff12bbb36b766ad02e93d974e3a06df0e65f0e65490b4fb9c43a7725a3b3b`.
Der letzte vollständige Gesamtlauf bleibt der grüne 378-Gate-Nachweis; die drei
neuen Gates sind in `scripts/verify.py` aufgenommen und erhöhen den nächsten
Gesamtlauf auf 381 Gates.

## Vollständige Mathe-, Dateisystem- und Client-Hauptpfade vom 22. Oktober 2026

Vier weitere zentrale Originaldateien sind vollständig nativ portiert:
`code/game/q_math.c`, `code/qcommon/files.c`, `code/client/cl_input.c` und
`code/client/cl_main.c`. Die Module decken alle **288 Ledger-Symbole** ab.
Die neue Abnahme umfasst **71 gezielte Beobachtungen aus unverändertem C**,
**173 native Verträge** sowie die bereits vorhandenen 4.096 C-Mathematikfälle,
Pure-Filesystem-, ZIP-/DEFLATE-, Input-, Usercmd-, Netchan-, Demo-, LAN- und
Matchregressionen.

Die Mathelaufzeit enthält jetzt die vollständigen Vektor-, Winkel-, Ebenen-,
Bounds-, Farb-, Byte-Normalen-, Rotations-, Normalisierungs- und Zufallshelfer.
Der Dateisystempfad umfasst Suchpfade, PK3-Zugriff, Pure-/Referenzprüfung,
Pak-Reihenfolge, 64 Handles, Lesen, Schreiben, Seek, Listen und Mod-Overlay
sowie Startup, Restart und Shutdown. ZIP-Inhalte werden pro Handle vollständig
validiert und als Bytes materialisiert; Betriebssystemmutationen bleiben
produktive typisierte Hostgrenzen.

Der Client-Input-Pfad registriert die 59 Originalbefehle und portiert duales
Key-Timing, Maus-/Joystick-Routing, Command-Erzeugung und den Reliable-/Delta-/
Netchan-Sendepfad. Der Client-Hauptpfad ergänzt Lifecycle, Verbindungsaufbau,
OOB-/Packet-Verarbeitung, Demos und Downloads, Frame und Timeouts, LAN/Ping/
Status, Pure/PK3, MOTD, Rcon und lokale CD-Key-Prüfung. UDP/DNS, OS-Events,
Dateihandles, Renderer-/Sound-Neustart und Speicherallokation bleiben typisierte,
bei aktiver Retail-QVM unterdrückbare Hostaktionen.

Das Runtime-/Plattforminventar zählt nun **121 portierte**, **97 partielle**
und **117 noch nicht begonnene** Originaldateien. Die vier neuen Fokustests,
der Windows-Hauptbuild und das acht Frames lange Retail-QVM-Match sind grün.
Der frische Hauptstand hat SHA-256
`26b01d8d9c1191ef0ef045cf38c5e44e698a4bacde97d05b1df63e50491c395c`.
Die vier
Gates sind in `scripts/verify.py` aufgenommen; zusammen mit dem vorherigen
381-Gate-Stand umfasst der nächste Gesamtlauf 385 Gates.

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

## Vollständige Adapter für Präprozessor, Shared-Runtime, Nachrichten und DMA-Audio (22. Oktober 2026)

Der aktuelle Quellenabgleich schließt vier zuvor partielle Originaldateien vollständig: `code/botlib/l_precomp.c` (82/82 Symbole), `code/game/q_shared.c` (59/59), `code/qcommon/msg.c` (48/48) und `code/client/snd_dma.c` (42/42). Der Botlib-Präprozessor ist an die vorhandene PC-Registry und die produktiven CG_PC-QVM-Traps gebunden. Die Shared-Runtime deckt Endian-Konvertierung, Parser, Quake-Strings, Formatierung, Matrizen und Info-Strings ab. Der Message-Adapter vereinigt den vollständigen Protocol-68-Huffman-, Primitive-, Delta-, Usercmd-, Entity- und Playerstate-Pfad. Der DMA-Audioadapter besitzt Initialisierung, Registrierung, Kanal-/Loop-Steuerung, räumlichen Zustand, Roh-PCM, Musik, Clock und Shutdown und delegiert an die bereits gegen unveränderten C-Code geprüften Mixerkerne.

Die vier Fokustests bestehen mit 231/231 Adapter-Symbolen, 190 unveränderten C-Differenzdatensätzen, 136 neuen nativen Verträgen sowie Retail-Proben aus `pak0.pk3` und `cgame.qvm`. Die zugehörigen Parser-, Netzwerk-, Snapshot-, QVM-, Mixer- und Retail-Match-Regressionsprüfungen sind grün. Das generierte Runtime-/Plattforminventar zählt nun 125 vollständig portierte, 93 partielle und 117 noch nicht begonnene Originaldateien. Ein vollständiger Lauf aller Verify-Gates wurde für diesen inkrementellen Block nicht erneut ausgeführt.
Der anschließend frisch gebaute `build/MiniQuake3.exe`-Stand hat SHA-256 `109af343203c8eb540e2343c8fbcaf7700fc6e7f61666ba5da40c97e7cb34635`; der Retail-QVM-Match besteht über acht Frames mit 2.345 texturierten Dreiecken, 17 Renderpässen und 26 Soundbefehlen.

## Vollständiger Gameplay- und Medienblock vom 22. Oktober 2026

Der Abgleich mit den Originalquellen schließt die 19 im letzten Review offenen
Dateien vollständig: `bg_pmove.c`, `g_team.c`, `g_cmds.c`, `g_main.c`,
`g_mover.c`, `g_client.c`, `g_weapon.c`, `g_target.c`, `g_missile.c`,
`g_items.c`, `g_active.c`, `g_combat.c`, `g_utils.c`, `g_trigger.c`,
`g_misc.c`, `g_bot.c`, `l_script.c`, `tr_image.c` und `cl_cin.c`. Die nativen
MiniLang-Pfade umfassen damit die zugehörigen Gameplay-, Bot-, Skript-, Bild-
und RoQ-Laufzeiten samt Baseq3- und den vorhandenen Missionpack-Zweigen. Alle
19 neuen Dateigates sind Teil der normalen Verifikation.

Der komplette Retail-Lauf besteht **408 Gates**. Das acht Frames lange
Original-QVM-Match liefert 131 Entities, 13 Snapshot-Entities, neun
Prediction-Traces, 301 Cgame-Assets, 19 Scene-Entities, 2.345 texturierte
Dreiecke, 17 Renderpässe und 26 Sounds; nicht unterstützte Entities und
untexturierte Dreiecke stehen auf null. Der originale Bot läuft 512 Frames und
erzeugt einen echten Bewegungs-Usercmd. Alle 31 Retail-BSPs sowie Fenster-,
Renderer-, Audio-, UI-, Netzwerk-, QVM- und AAS-Gates sind grün.

Das erzeugte Runtime-/Plattforminventar zählt **144 portierte**, **74 partielle**
und **117 noch nicht begonnene** Originaldateien von insgesamt 335. Der
spielbare Baseq3-Retailpfad ist damit deutlich vollständiger, aber der Anspruch
einer vollständigen 1:1-Portierung ist noch nicht erreicht. Offen sind vor
allem weitere Renderer-Backend-, GL-, Plattform-, Client-/Server-/Netzwerk- und
Botlib-/AAS-Dateien sowie eine grafische Team-Arena-Abnahme. `D:/Quake3`
enthält keine legalen `missionpack`-Assets; Missionpack-Semantik wird deshalb
mit unverändertem C und nativen Verträgen geprüft, nicht als vollständiger
Team-Arena-Retaillauf.
