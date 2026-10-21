# MiniQuake3: überprüfter Stand

Stand: 2026-10-21. Der Port ist **in Arbeit; eine erste interaktive Vorschau ist spielbar**.
Ein erfolgreicher Referenzlauf ist ein Lauf der ursprünglichen C-Engine,
kein Nachweis einer schon vollständig portierten MiniLang-Engine.

Die zuletzt vollständig ausgeführte Retail-Prüfauswahl umfasste **270 Gates**
(`python scripts/verify.py --data-root D:/Quake3`) und bestand vollständig am
21. Oktober 2026 mit dem eingebundenen Retail-`pak0.pk3`. Der dabei frisch
gebaute `MiniQuake3.exe`-Build hat SHA-256
`94776ff4203c8c5b9e97033d27a142c1b368791b0d33ee5eb37dfd1a8afd202d`,
das zugehörige `build/verification.json` SHA-256
`7c87096b4ae47ada665ca2331a7a60ab4b6d459e89a9fefa19807138f957d96`.
Der Lauf enthält den zusammenhängenden Retail-qagame/cgame/ui-Boot mit neun
Prediction-Traces, 2.345 vollständig texturierten Szenendreiecken, 17
Renderpässen, 26 Soundbefehlen und interaktiver Original-UI sowie den
512-Frame-Bot-Spawn, alle 31 BSP-Karten und die produktiven Windows-Grenzen.

Dieser Vollstand enthält auch die produktive
`AAS_BestReachableFromJumpPadArea`-Platzierung: benannte Map-Boots laden die
passende Retail-AAS, `trigger_push`-Ballistik wird 30 Frames gegen die Item-BBox
simuliert und die größte überlappende Jumppad-Area über das originale
Flächenvolumen gewählt. Der gezielte `q3dm17`-Probe bestätigt alle acht
schwebenden Items mit erreichbaren Zielbereichen.

Der bestätigte Stand erzeugt sein ansprechbares
Win32-Fenster vor dem PK3-/BSP-Laden und zeigt Ladephasen. Außerdem sind der
vollständige serverseitige Reliable-Downloadbefehlspfad, Intro-zu-Loop-Musik mit
Stereoerhalt, zielzentrierte Area- und Portal-AAS-Cachepropagation, originale
Cvar-/`q3config.cfg`-Persistenz im produktiven Engine-Frame, vier weitere
qagame-Plattformtraps, vier zustandsbehaftete Cgame-Tastaturtraps, alle fünf
Cgame-PC-Parsertraps und ein UI-LAN-/Serverbrowser mit
Connectionless-Antwortverarbeitung, exakter `servercache.dat`-Persistenz und
einem vollständigen ausgehenden Query-Zustandsautomaten samt produktiver
Windows-DNS-/UDP-Anbindung ergänzt. Hinzugekommen sind der echte Zwei-Client-Challenge-/Connect-Aufbau, die vollständigen Cgame-LerpFrame-Zustände, komprimierte ADPCM-/MuLaw-/Wavelet-SFX-Paintpfade und persistente, CRC-geprüfte AAS-Routingcaches. Physische Tastenübergänge aktualisieren den
gemeinsamen Cgame-/UI-Zustand nun auch bei geschlossenem Menü. Alle sieben
`uiMenuCommand_t`-Zustände und beide Overlay-Modi von `UI_DRAW_CONNECT_SCREEN`
werden nun durch den produktiven Original-UI-Adapter weitergereicht. Das von Cgame
gesetzte Usercmd-Waffenbyte und dessen Mausempfindlichkeit erreichen den
produktiven QVM-Spielpfad. MD3-Frames werden wie im Original gewrappt oder
repariert; registrierte 8-/16-Bit-Mono-Sounds durchlaufen Baseq3s exakten
22050-Hz-Resampler. Zusätzlich laufen die vollständigen Cvar-Konsolenbefehle,
der `CL_SendCmd`-Ausgangspfad samt sieben verlust- und duplikatgetesteten
Client/Server-UDP-Frames, ein echter Zwei-Client-Serverpfad mit gegenseitig
geparsten Spielerentities, der vollständige Cgame-Reliable-Command-Verbrauch
und die originale Cgame-Framezeit, QVM-Rail-/Lightning-/Beam-Geometrie sowie
Portal-Welt-/Entity-Komposition jetzt durch die produktiven Pfade. Baseq3s
räumliche Links-/Rechts-Abmischung, 96-Kanal-Auswahl und gruppierte Loop-Kanäle
werden gemeinsam im originalen 24.8-Integer-Paintbuffer gemischt. RoQ-DPCM-Ton
durchläuft nun ebenfalls `S_RawSamples`: fünf unveränderte C-Differentialfälle
und zehn Verträge prüfen Formatkonvertierung, Resampling, den 16.384-Frame-Ring
und das gleichzeitige Mischen mit QVM-Musik und Spieleffekten.
Die abschließende Shaderfarbberechnung folgt nun auch der originalen
`ComputeColors`-Reihenfolge: 15 unveränderte C-Differentialfälle und zwölf
Verträge decken Identity-Light-Skalierung sowie Entity-, Konstant- und
Vertex-Alpha ab.
Additive, strikte Alpha-, inverse Quellfarben- und vormultiplizierte
Alpha-Stufen erhalten vor dem abschließenden Fog-Pass nun außerdem Baseq3s
positionsabhängige RGB-, Alpha- oder RGBA-Dämpfung. Drei unveränderte
C-Differentialdatensätze und 18 Verträge prüfen Modulation, vollständige
`FinishShader`-Blendklassifikation und den produktiven Retained-Batch.
`refEntity_t.shaderTime` transportiert nun gemeinsam mit `shaderTexCoord` den
vollständigen Entity-Zeitversatz durch QVM-Geometrie, Portal-Clipping und den
Retained-Batch. Animierte Bildstufen, Farb-Waves, Vertex-/Normal-Deformationen
und alle zeitabhängigen `tcMod`-Operationen verwenden damit wie Baseq3 dieselbe
pro Entity verschobene Uhr. Shader-Remaps reichen zusätzlich ihr `timeOffset`
bis in bereits registrierte QVM-Materialien durch; das geparste `clampTime`
friert Bildfolge, Waves, Deformationen, Normalen und UVs gemeinsam an Baseq3s
`RB_BeginSurface`-Grenze ein. Sechzehn Datensätze aus den unveränderten
`RB_CalcScrollTexCoords`-, `R_BindAnimatedImage`- und `RB_BeginSurface`-Funktionen
plus 104 Verträge prüfen Frameauswahl, Entity-/Remap-Zeitversatz, Clamp,
negatives Wrapping und die produktiven Bild-, Farb-, Geometrie- und UV-Ausgaben.
Zwei zusätzliche Regressionen belegen, dass ein Remap auf denselben Shader mit
geändertem `timeOffset` auch ohne Batch-Neuaufbau den bereits gehaltenen
QVM-Szenenpass und dessen gemeinsame Shaderuhr aktualisiert.
Der QVM-2D-Pfad übernimmt dasselbe Zeitmodell nun für HUD und Original-UI:
`DrawStretchPic`-Materialien werden bei einem laufenden Shader-Remap neu aus dem
PK3 dekodiert und hochgeladen; `timeOffset` und `clampTime` steuern ihre
animierten Bilder, Farb-Waves und `tcMod`-UVs. 32 Verträge einschließlich eines
synthetischen PK3-Wechsels prüfen diesen produktiven Pfad.

Der letzte archivierte Lauf mit den CD-Daten bestand aus **46 regulären Prüfbereichen**
(`verify.py --data-root D:/Quake3`), einschließlich Engine-/Spielmodul-Cvars, Teamstandorten/-overlay,
Passwortstatus, Userinfo/Namen/Teamwahl, ClientConnect/Sitzungsdaten,
Team-/Zuschauerwechsel, ClientDisconnect, Follow-Befehle, Duell-Warteschlange,
Intermission und Levelende-Steuerung, vollständiger Baseq3-Client-Befehlsverteilung,
Textchat/Voice, Cheats, Spielkommandos, allen Baseq3-Waffen,
Serverkonsole, IP-Sperren, Spielarena, Item-/Teaminitialisierung,
Modulstart/-shutdown, Logformatierung, Give-/Powerup-/Score-/Print-Targets und
Portalflächen/-kameras,
Vote-Aufrufen/Stimmabgabe und Vote-/Teamleiterregeln,
Spawnpunkten, Leichen, Punkten, Spieler-Tod, Items/Flaggen, vollständigen
Client-Abläufen ab `ClientBegin`, `CheckTournament`, `G_RunFrame` und CLI-Laufzeitvergleichen.
Alle 31 CD-Karten werden geladen; Schadens-, Projektil- und Leichenfälle laufen
ebenfalls auf den CD-Karten.

Die letzte erweiterte CD-Vollprüfung bestand mit **61/61 Gates**. Sie enthält
alle 46 regulären Prüfbereiche und die zusätzlichen Kollisions-, Bewegungs-,
Pmove-, Sichtbarkeits-, Serverwelt-, Trigger- und Spawnvergleiche auf den
31 CD-Karten, einschließlich der Profile mit und ohne Kurven.
Der Lauf ist in `build/verify-map-objects-extended.log` protokolliert.
Der finale MiniQuake3-Build hat SHA-256
`3a8c6f394b337404511f826e34404d0fd5f9c3011af6b7a4b2a96cc5321d99fb`.
Der Gesamtbericht und die Einzelbelege sind in `reference/evidence.json` archiviert.

Alle **251 Quellen** unter `src/`, `native/`, `scripts/` und `tests/` blieben
während und nach dieser Vollprüfung unverändert. Der Quellstand ist vor dem
Lauf in `build/map-objects-full-run-sources.json` festgehalten; dessen SHA-256 ist
`50248031b37942ed1e798de513f9d648ff1d47b65eede5e9cc9c01308b588220`.
Historische Zusatzbelege früherer 58- und 60-Gate-Läufe werden nicht als
aktuelle Nachweise übernommen. Für diesen Lauf war keine nachträgliche
Quellenänderung oder ergänzende Wiederholungsprüfung erforderlich.

Der abschließende Nachweisaudit `build/map-objects-release-audit.json` bestätigt
**64 archivierte Berichte**, **1.647 eingebettete Quell-/Artefakthashes**,
**1.783 Szenarioartefakte** und **zehn Programmhashes**. 3.161 bestehende
Szenarioausgaben sind bei unveränderten Eingaben identisch. Die 168 Spawn-Replays
verwenden ebenfalls dieselben Karten und Eingaben: 55 Ausgaben bleiben identisch,
113 ändern sich durch die sechs neuen Klassen und die nun beobachteten
Originaldiagnosen. Die verbleibenden Mover-Aufrufzahlen sind unverändert.
Der Original-Checkout ist sauber und auf derselben festgeschriebenen Revision.

Der spielbare Renderer transportiert inzwischen unabhängige RGBA-Farben je
Dreiecksvertex bis in den nativen Batch und interpoliert sie perspektivisch
korrekt. MiniLang wertet dafür `rgbGen vertex`, `exactVertex`,
`oneMinusVertex`, `entity`, `oneMinusEntity`, `const` und `wave` sowie die entsprechenden `alphaGen`-Modi
pro Frame aus. Die endgültige RGB-/Alpha-Reihenfolge entspricht dabei
`ComputeColors`, einschließlich Identity-Light-Skalierung und der besonderen
Alpha-Erhaltung für `rgbGen vertex`. Blended-only Materialien dämpfen ihre
RGB- oder Alpha-Beiträge außerdem pro Vertex anhand der Fog-Dichte, bevor der
abschließende Fog-Pass die Nebelfarbe aufträgt. Lightmapped BSP-Flächen werden nur noch mit der originalen
Lightmap moduliert; unlightmapped Flächen behalten ihre getrennten RGB-Vertexfarben.
Explizite und aus Blend-/Depth-Write-/PolygonOffset-Zuständen abgeleitete
Shader-Sortwerte ordnen die World-Passes stabil wie in Baseq3. Die Abnahme
Geparste `depthWrite`- und `depthFunc equal`-Zustände werden pro Stage bis an den
nativen Rasterzustand weitergegeben. `polygonOffset` nutzt zusätzlich Baseq3s
steigungsabhängigen Decal-Tiefenbias im inversen Tiefenpuffer. Die Abnahme umfasst
59 Material-, 15 Batch-Layout- und 44 World-Batch-Verträge sowie einen
nativen Pixelvergleich unter `/W4 /WX`. Textur- und Lightmap-Abtastung arbeitet
bilinear mit OpenGL-Texelzentren und getrenntem Repeat-/Clamp-Randverhalten.
Vollständige Boxfilter-Mipketten und eine UV-Gradienten-basierte Levelwahl
reduzieren zusätzlich das Distanzflimmern. Geparste `nomipmaps`-Shader sowie
HUD-, Menü- und Fontbilder bleiben wie in Baseq3 auf der Basisebene.
`deformVertexes move` und `bulge` laufen zusätzlich mit Original-Waveform bzw.
Basis-U-Sinusphase; q3dm4 und q3dm16 dienen als Retail-Abnahme.

| Schritt | Stand | Vorliegender Nachweis / noch fehlende Abnahme |
| --- | --- | --- |
| 1. Referenz | Grundabnahme bestanden | Originale x86-Engine, drei native Module, drei neu gebaute QVMs; MiniLang-Build; 1.409 Dateien inventarisiert; 120 Frames mit zwei Bots aufgezeichnet und zweimal bytegleich wiedergegeben |
| 2. Zahlen/Plattform | In Arbeit | 101.445 binäre Float-Ergebnisse, 53.248 bisherige q_math-Ergebnisse, 65.536 AngleVectors-/SnapVector-Fälle und 26 Snap-Grenzfälle stimmen; Windows-Dateizugriff, nichtblockierende UDP-Grenze, Desktop-Framehost und eine mit 2 C-Fällen plus 26 Verträgen geprüfte Eingabequeue sind vorhanden; Win32-DIB-Previewhost und WinMM-Audiogrenze bestehen ihre `/W4 /WX`-Lifecycle-Tests; ein eigener UI-Thread hält das früh erzeugte Ladefenster mit 2--100-Prozent-Phasen ansprechbar; produktives OpenGL bleibt offen |
| 3. Engine-Kern/VFS | In Arbeit | 513 Cvar-Operationen, Engine-/VM-Cvar-Registrierung/-Aktualisierung und Spielmodul-Tabelle, 3 bytegenaue `Cvar_WriteVariables`-Differentialdatensätze plus 17 Config-Persistenzverträge, 13 exakte `Cvar_Restart_f`-Datensätze plus 17 Verträge sowie 11 exakte Datensätze plus 15 Verträge für `toggle`, `set`, `sets`, `setu`, `seta`, `reset`, `cvarlist` und direkte Cvar-Befehle; 448 Parseraufrufe, Info-Schlüsselsuche/-Validierung, 28 bytegenaue `cmd.c`-Puffer-/Tokenizer-, 16 Registry-/Builtin- und 10 Startup-Differentialdatensätze plus 32 Verträge, 84 ZIP/DEFLATE-Vergleiche sowie 48 direkte C-Vergleiche der MD4-basierten Pak-Prüfsummen und 25 Suchpfad-/Pure-/Referenz-/Downloadvergleichsverträge bestanden; Config-Befehle und `writeconfig` laufen über den produktiven Command-Puffer, archivierte Cvars werden vor Events, Netzwerk und Simulation geschrieben; automatische Pak-Aushandlung, UTF-16-Dateinamen und die vollständige Engine-Schleife fehlen |
| 4. QVM | In Arbeit | 404 Interpretervergleiche und 17 Runtime-Verträge; vorberechnete Instruktionsbreiten/Stackanforderungen laufen durch dieselben Differentialfälle; gemeinsame Traps 4/44; qagame-Servertraps 4/47 plus binäre Welttraps 5/37 und Lifecycle 11/22, einschließlich Dateilisten, Debug-Polygonen, 36-Byte-`qtime_t`, `G_SNAPVECTOR` und produktivem `G_FS_SEEK`; cgame-Lifecycle 12/20 plus 19 Kerntraps 4/37, vier Tastaturtraps 4/25 mit gemeinsamem UI-/Cgame-Zustand sowie alle fünf `CG_PC_*`-Traps mit drei exakten ABI-Datensätzen und 29 Verträgen; `CG_SETUSERCMDVALUE` speist nun Waffenwahl und Mausempfindlichkeit in den produktiven QVM-Spielpfad, belegt durch fünf Originalanker und 12 Verträge; die produktive Vorschau bindet `CL_FirstSnapshot`/`CL_AdjustTimeDelta`/`CL_SetCGameTime` mit vier exakten Datensätzen, 26 Kern- und 19 Integrationsverträgen vor `CG_DRAW_ACTIVE_FRAME` ein; Snapshot-Sequenzen und `CG_GETSERVERCOMMAND` liefern Reliable Commands, zusammengesetzte große Configstrings, Configstring-Updates und Restart-/Disconnect-Policy in acht Originalankern plus 22 Verträgen an die Retail-Cgame; UI-Lifecycle 14/22 plus 39 Kerntraps 7/61 und 16 Medien-/Spezialtraps 5/42; PC-Parser einschließlich Bedingungen, Funktionsmakros, fortgesetzten Direktiven, Winkelklammer-Includes und den vier festen Baseq3-Makros 58 Verträge; Botlib-Lifecycle 200–211, AAS 300–318, Elementary Actions 400–423 und die zum Retail-Botsetup benötigten 500er AI-Traps sind angeschlossen; weitere AI-, Renderer-3D- und seltene Plattformtraps fehlen |
| 5. Kollision/Pmove | In Arbeit | BSP-/Kurvenkollision, räumliche Abfragen, dynamische Entities, Bewegungsbahnen, geometrische Trigger-Erkennung, Sprungpad-/Teleport-Replays, ClientBegin und G_RunFrame-Einbindung geprüft; der spielbare Pfad nutzt zusätzlich 800er Gravitation, Bodenprobe, Sprung, Quake-Reibung/-Beschleunigung, Collision-Slide und 18-Unit-Step in 26 Verträgen; Gegner verwenden ebenfalls Spielerhülle, Wall-Slide, Step und Bodenbindung, in 22 Verträgen plus q3dm1-Probe geprüft; komplette Match-Telefrag-Replays fehlen |
| 6. Spiel/Server | In Arbeit | Entity-Verwaltung, Spawn-Regeln, Worldspawn, alle 48 Spawn-Klassen und 35 Item-Spawns, Mover-Zustände/Trigger/Züge samt aktiven Retail-Türen/Buttons und vollständigen Retail-Rider-Frames, Target-Ketten, `G_RunFrame`, Schaden, Waffen, Client-/Match-/CTF-Abläufe, Einzelspieler-Postgame/Podium, Bot-Lifecycle, Bot-/Arena-Registry, Spawnqueue, Minimum-Player, Bot-Erzeugung/-Entfernung und BotConnect/SetupClient/ShutdownClient, Serverkonsole, IP-Filter, Spielarena sowie G_InitGame/G_ShutdownGame vorhanden; der spielbare Slice lädt 18 q3dm1-Pickups und fünf Ziele mit Hitscan-Schaden, Tod, Fragwertung und Respawn; BSP-Sichtprüfung steuert Patrouille, Verfolgung, Strafe und Angriffe; Gegner feuern ihre sichtbare Machinegun im originalen 100-ms-Takt mit 7 Schaden, beginnend am animierten Retail-`tag_flash` und durch einen abschließenden BSP-Trace abgeschirmt; der neue Pfad besteht 12 Verträge; Armor, Spieler-Tod, Spawnwechsel, Schutz und Respawn sind integriert; Engine-VM-Neuladen und Netzwerkzustellung fehlen |
| 7. Netzwerk/Client | In Arbeit | Message/OOB, Protokoll-68-Huffman, Deltas, Snapshots, Downloads, Demo-Framing, Netchan und Windows-UDP sind implementiert; der äußere `CL_Frame` stimmt in 13 C-Datensätzen überein und besteht 28 Verträge; `CL_SendCmd` ist daran produktiv gebunden und deckt Command-Erzeugung, Paketpacing, Reliable-Replay, `cl_packetdup`, `cl_maxpackets`, Move/NoDelta, Checksum-Key, Delta-Usercmds, OutPacket-Buchhaltung und Netchan-Übertragung in acht Originalankern plus 39 Verträgen ab. Der davorliegende produktive QVM-Eingabekern portiert Tasten-Teilframezeiten, Lauf-/Gehbewegung, Winkelsteuerung, Mausfilter/-beschleunigung, Cgame-Sensitivität, Joystick, Buttonbits und FinishMove; fünf unveränderte C-Datensätze und 31 Verträge bestehen. Sieben echte Localhost-Winsock-Clientframes führen Clientbefehle über Server-Ingress und `SV_UserMove` zu Reliable Commands und Full-/Delta-Snapshots; neun Quellanker plus 48 Live-Verträge belegen verlorene und duplizierte Clientpakete, `packetdup`-Recovery ohne doppelte Spieleingabe, verlorene und duplizierte Server-Snapshots, Delta-Promotion über eine ältere Basis und vollständige `cl_nodelta`-Recovery. Ein geteilter Server-Ingress führt zusätzlich zwei gleichzeitige Clients mit unabhängigen Sockets, QPorts, Sequenzen, Usercmds, Reliable-Ringen und Snapshot-Acks. Davor durchlaufen beide echten Sockets jetzt den vollständigen `getchallenge`-/`challengeResponse`-/komprimierten `connect`-/`connectResponse`-Austausch; Challenge, QPort, Quelladresse und zugeordneter Server-Slot werden geprüft, und der anschließende Netchan behält seine Sequenzen. Elf Originalanker plus 67 Live-Verträge prüfen diesen Aufbau, gegenseitig geparste Spielerentities sowie unabhängiges Voranschreiten. Ein zusätzlicher 384-Frame-Lauf führt 768 Usercmds genau einmal aus, kompensiert 22 verlorene Clientpakete sowie 20 verlorene Snapshots, verwirft 29 Duplikate und hält die Reliable-Ringe über ihren Umlauf hinweg synchron; die UDP-Zustände werden dabei mit den produktiven CL_Frame-/SV_Frame-Timeoutmodellen abgeglichen. Snapshot-/cgame-Zeit einschließlich Drift, Pause, Demo und Timedemo besteht 4 Headerwerte plus 26 Verträge; der vollständige Reliable-Downloadbefehlspfad für `download`/`nextdl`/`stopdl`/`donedl` ist live; Internet-Mehrclient-Abnahme der vollständigen Match-Schleife fehlt |
| 8. Renderer/Cgame | In Arbeit | Shader-Index 10/10, Shaderparser 36/36 und TGA 5/22; Bildverarbeitung 10/19 und Bildcache 8/29; Polychain 3/21, Triangle/Face 3/30, MD3-Mesh 3/31, MD3-Tags/Bounds 7/26, Sprite-Quads 6/31 und Grid 5/30; View-Transformation/Culling 11/36; Texturzustände 18/30; Commandqueue 7/29; Szene Polys/Entities/Lichter 6/24; interaktiver BSP-Vertical-Slice mit texturierten Bezier-Patches, originalem Baseq3-HUD, echten Pickup-Modellen, Projektilen und texturierten First-Person-Waffen; Retail-Shader mit `alphaFunc GT0`, `LT128` und `GE128` werden bis in den nativen Rasterizer übernommen, sodass etwa Banner und Gitter ihre ausgeschnittenen Konturen behalten; additive, Alpha- und multiplikative `filter`-Blends besitzen eigene Rasterpfade, explizite Lightmap-Stufen verwenden ihre BSP-Slots und UVs in Originalreihenfolge, einschließlich GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA und fortgeschriebenem Framebuffer-Alpha; `clampMap` schaltet die native Texturabtastung auf Rand-Clamping, während normale Maps weiterhin wiederholen; `deformVertexes wave` und `bulge` bewegen Geometrie entlang der BSP-Normalen, `move` verschiebt ganze Flächen per Waveform; mehrere Deformationen laufen in Originalreihenfolge; sieben geladene q3dm1-Materialien mit `cull disable` umgehen die planare Rückseitenverwerfung des Sichtbarkeitscaches; `tcMod scroll`, `scale`, `rotate`, `stretch`, `transform`, `entityTranslate` und die weltpositionsabhängige `turb`-Verzerrung laufen in Shader-Reihenfolge; QVM-Entities behalten dabei `shaderTexCoord` und `shaderTime` bis zu den produktiven Bildframes, Farb-Waves, Deformationen, Normalen und UVs. Das schließt die Lava- und Bluteffekte von q3dm1 sowie die zweifach transformierten Wasserlagen von q3dm2 ein; kameraabhängiges `tcGen environment` verwendet die originalgetreue Reflexion an den BSP-Vertexnormalen; Viewmodel-Dreiecke werden samt UV-/Lichtwerten an der Nah-Ebene geschnitten und über den originalen 0..0,3-Depthhack-Bereich gegen die Welt getestet; Retail-Hand-Tags animieren Angriff, Absenken und Anheben; Gauntlet, Machinegun und BFG besitzen angehängte, beschleunigende und auslaufende Retail-Läufe; der Retail-Sarge wird aus Lower/Upper/Head über Tags zusammengesetzt, interpoliert, mit zwei PK3-Skinbildern texturiert und im Nahbereich mit allen 795 Dreiecken gezeichnet; jeder sichtbare Gegner trägt zusätzlich die echte Machinegun samt separatem, zustandsbehaftetem Barrel am interpolierten `tag_weapon`; Idle/Walk/Run/Attack/Pain/Death/Respawn folgen Gameplay-Ereignissen; vorberechnete Projektion, direkte MD3-Transformation und paralleles scanline-begrenztes Rasterisieren liefern im aktuellen q3dm1-Smoke etwa 15–20 FPS; Baseq3s MD3-Projektionsradius/LOD-Wahl sowie `RF_WRAP_FRAMES`- und Invalid-Frame-Reparatur bestehen sechs exakte Datensätze plus 24 Verträge und laufen vor der produktiven QVM-Interpolation; `RT_RAIL_CORE`, `RT_RAIL_RINGS` und `RT_LIGHTNING` erzeugen Baseq3s sichtbare QVM-Geometrie samt Shader, UVs und Vertexfarben, belegt durch zwei exakte Datensätze plus 26 Verträge. `RT_BEAM` erzeugt zusätzlich den originalen geschlossenen Sechsseiten-Strip mit 14 Vertices und 12 Dreiecken über ein echtes additives Vertex-Color-Material; zwei exakte Datensätze plus 13 Verträge prüfen Geometrie, Farbe und Null-Längen-Auslassung. `RT_PORTALSURFACE`-Marker liefern Spiegel-/Remote-Kamera, PVS, Rotation, Clipplane und First-/Third-Person-Entityfilter in drei exakten Datensätzen plus 17 Verträgen. Der produktive Software-Renderer baut Portalwelt und portalabhängige Cgame-Entities aus dieser Kamera, clippt BSP-/QVM-Dreiecke an der Zielebene und komponiert Portal, Tiefenlöschung und Hauptansicht in Originalreihenfolge; 21 weitere Verträge prüfen den auf eine Ebene begrenzten Pass. MD3-Frame-0-Modellgrenzen sowie korrekte cgame-Traps für Cinematics, Shader-Remap, R_InPVS und FS_SEEK sind ergänzt; CG_SetLerpFrameAnimation, CG_RunLerpFrame und CG_ClearLerpFrame laufen mit Initial-Lerp, Togglewechsel, Loop, Reverse, Flipflop, Speedscale, Hitch-Clamp und bitgenauem backlerp in 16 C-Differentialfällen plus 10 Verträgen; der produktive Preview-Gegner verwendet persistente Lower-/Upper-Zustände. `rgbGen entity`/`oneMinusEntity` und `alphaGen entity`/`oneMinusEntity` bewahren `shaderRGBA` getrennt von Lightgrid-/Vertexfarben und stimmen in vier C-Datensätzen plus acht Verträgen. Die abschließende `ComputeColors`-Reihenfolge einschließlich Identity-Light-Skalierung, Entity-, Konstant- und Vertex-Alpha stimmt in 15 unveränderten C-Datensätzen plus zwölf Verträgen. Additive, strikte Alpha-, inverse Quellfarben- und vormultiplizierte Alpha-Stufen werden im Nebel jetzt vor dem Fog-Pass pro Vertex gedämpft; drei unveränderte C-Datensätze plus 18 Verträge prüfen diesen produktiven Pfad. Vollständige Shaderstufen und Cgame-Präsentation fehlen |
| 9. Bots/Audio/UI | In Arbeit | Alle 30 Retail-AAS-Dateien werden direkt gelesen; Punktsuche, Area-/Entity-Abfragen, Trace-Areas, Reachability-Iteration, gewichtete Routen, Routing-Sperren, Client-Movement-Prediction und Sichtpositionsvorhersage sind vorhanden. Movement-Prediction benutzt produktiv den originalen iterativen `AAS_TraceClientBBox`-Knotenpfad mit Presence-/Playerclip-Sperren, Plane-Epsilon und vollständigen Trefferfeldern sowie Entity-Kollision für nichtnegative Pass-Entities; acht Grenzverträge und der 512-Frame-Sarge-Lauf prüfen ihn. Botlib-Lifecycle, Serverbridge und Elementary Actions führen `addbot Sarge 3` durch das vollständige originale `BotAISetupClient`; Character-, Item-/Weapon-Weight- und Chatprofile werden aus pak0 geladen, alle vier AI-State-Handles sind gebunden und 512 Bot-Frames laufen bis zur regulären `BOTLIB_USER_COMMAND`-Übergabe. Alle 15 Travelhandler des Baseq3-Release-Switches sind echte MoveToGoal-Pfade; Fuzzy-Evolution, zwölf q3dm1-Kartenorte und Chat-Ausgabe 513–516 sind implementiert. Ein invalidierbarer LRU, Reverse-Reachabilities, Area-Reisezeitmatrizen und Portal-Maximalzeiten bilden die statische Original-Routingstruktur nach. Retail-Chat lädt 175 Synonymgruppen, 138 Match-Templates, 244 Zufallsgruppen und 456 Reply-Regeln; der Nachrichtenheap folgt dem live gelesenen `max_messages` mit Originalstandard 1024. UI-Lifecycle und 55 UI-Traps einschließlich Sound/Cinematics/LAN sind vorhanden; Original-UI-Menüs, RoQ-Video/DPCM-Audio, WinMM-WAV- und Umgebungsklang laufen. Alle sieben Baseq3-Menüzustände und beide Connect-Screen-Overlaymodi sind produktiv verdrahtet und in 27 Session-Verträgen geprüft. `UI_GETCLIENTSTATE` liefert das exakte 3.084-Byte-ABI mit realem Verbindungszustand; die originale Screen-Matrix für Connect, Challenge, Loading, Active, Cinematic, Fullscreen und Key-Catcher besteht einen ABI-Datensatz plus 20 Verträge. Die zielzentrierten `AAS_UpdateAreaRoutingCache`- und `AAS_UpdatePortalRoutingCache`-Pfade teilen Routen über Ursprünge und Cluster; der produktive Botlib-Pfad persistiert die Zielcaches nun mit dem originalen RCD-v2-Header, Area-/Cluster-CRC und einer deterministischen zeigerfreien Nutzlast; offen bleibt die noch kompaktere interne Reachability-Ablage. Der UI-LAN-Kern verwaltet Serverlisten, Sichtbarkeit, Pingqueue, Status und Originalsortierung; vier exakte Ingress-Datensätze plus 60 Verträge prüfen Protokoll-68-Info-/Status-/Masterlisten-Antworten, Pingabschluss und Deduplizierung. Die produktive UI liest und schreibt das exakte 661.520-Byte-Baseq3-x86-`servercache.dat`; 24 Verträge vergleichen den vollständigen Binärinhalt mit einer C-Referenz. Ein weiterer Zustandsautomat deckt in 23 Verträgen lokale Discovery, Master-Queries, manuelle und sichtbare Pings sowie Status-Resends ab. Windows-DNS, zwei nichtblockierende Sockets, IPv4-Broadcast und Antwort-Pump sind im produktiven UI-Lifecycle angeschlossen und bestehen 18 Live-Verträge. Hintergrundmusik bewahrt Stereo, spielt das Intro einmal und wechselt danach in den Retail-Loop. Registrierte Mono-Effekte laufen durch Baseq3s exakten 22050-Hz-Resampler mit acht C-Differentialdatensätzen und 19 Verträgen; `S_SpatializeOrigin` liefert über zwölf exakte Datensätze plus 19 Verträge die originale 80-Unit-Vollpegelzone, Distanzdämpfung und Links-/Rechts-Achssemantik. One-shots verwenden produktiv Baseq3s 96-Kanal-Free-list, 50-ms-Duplikatverhalten, identische-Sound-Limits, Entitäts-/Globalersetzung und Listener-/Announcer-Schutz; zehn exakte Datensätze plus 18 Verträge belegen den Pfad. Gleichartige Loops werden mit originalen Masterlautstärken, Doppler-Regeln, 255er-Klemme, 96-Kanal-Limit und gemeinsamer Painted-Time-Phase gruppiert; sechs exakte Datensätze plus 17 Verträge bestehen. Musik, One-shots und diese Loops laufen produktiv durch Baseq3s gemeinsamen 24.8-Paintbuffer, `S_PaintChannelFrom16`, `s_volume` 0,8 und exakte signed-16-Sättigung; drei exakte Pipeline-Datensätze plus 18 Verträge bestehen. Derselbe produktive Pfad decodiert jetzt außerdem IMA-ADPCM, MuLaw und Daubechies-Wavelets und malt sie mit den originalen 24.8-Routinen; fünf exakte C-Differentialfälle, 14 Kompressionsverträge und 40 QVM-Wiedergabeverträge bestehen. Geschwindigkeitsvektoren von QVM-Loops steuern über Baseq3s quadrierte Distanzformel den Doppler-Pitch; fünf weitere C-Differentialfälle und sechs Verträge belegen den Pfad. RoQ-Audio läuft nun über Baseq3s 16.384-Frame-S_RawSamples-Ring in denselben Paintbuffer; fünf C-Differentialdatensätze und zehn Verträge prüfen Formatkonvertierung, Resampling und gleichzeitige Spieleffekte. Die vollständige Audio- und UI-Parität bleibt offen. |
| 10. Gesamtparität | Offen | Hängt von allen vorangehenden Abnahmen ab |

115 zusätzliche Tests prüfen beschädigte Dateieingaben, VM-Limits, räumliche
Abfrageparameter, Portalzustände und die
Wiederherstellung des VM-Stacks nach einem fehlerhaften Syscall. Dies ist eine
gezielte Testsammlung, keine vollständige Fuzzing- oder Sicherheitsabnahme.

## Referenzprofile

- Upstream unverändert: `dbe4ddb10315479fc00086f08e25d968b4b43c49`.
- C-Referenz: MSVC x86, `/Od /fp:strict /arch:SSE2 /MT`, native Game-Module
  und QVM-Interpreter getrennt. Moderne Compiler ergeben kein ungeprüftes
  Versprechen identischer Retail-Binaries oder identischen x87-Verhaltens.
- QVM-Build: originale mitgelieferte `lcc`, `q3cpp`, `q3rcc`; `q3asm` aus
  Originalquellen neu gebaut. Alle Outputs entstehen unter `build/`.
- Replay: `q3dm1`, Sarge und Major auf Skill 3, `com_fixedtime=50`, `sv_fps=20`,
  `bot_thinktime=100`, QVM-Interpreter. Die originale Event-Journalfunktion
  zeichnet die Eingaben auf. Ein Beobachter nach `Com_Frame` serialisiert
  verknüpfte EntityStates und aktive PlayerStates mit dem Original-Protokollwriter.
  Es werden keine Pointer oder Paddingbytes verglichen. Private Bot-/Spielzustände
  sind in diesem Nachweis noch nicht vollständig enthalten.
- Der Beobachter wird ausschließlich in eine gesonderte C-Test-Executable
  eingebunden. Die Kopie von `win_main.c` erhält eine Deklaration und einen Aufruf
  nach `Com_Frame`; der Original-Checkout bleibt unverändert. Der Beobachter
  beendet den Prozess nach 120 Frames. Build und Hook sind in
  `scripts/build_reference.py --observer` und `tests/reference/frame_observer.c` lesbar.
- MiniLang: Binary und Standardbibliothek unter `artifacts/toolchain/` eingefroren;
  Hashes und Quellzustand in `reference/toolchain.json`. Die genaue Herkunft des
  bereits vorhandenen Compiler-Binaries ist damit nicht rückwirkend bewiesen.

## Festgestellte Unterschiede und Grenzen

- Die CD-QVMs sind älter als die neu gebauten 1.32b-QVMs. Zum Beispiel liefert
  der UI-Einstieg der CD Version 3, der neu gebaute baseq3-UI-Einstieg Version 4.
  Tests und spätere Modulverträge müssen diese Profile auseinanderhalten.
- Im eingefrorenen Compiler verfälscht `toFloat()` bestimmte bereits als Float
  vorliegende große ganzzahlige Werte, etwa `3.8889514618448773e18`.
  `tests/numeric_probe.ml` reproduziert den Effekt. Die Port-Arithmetik verwendet
  deshalb eine eigene MiniLang-Implementierung von binary32 mit expliziter
  Rundung; die native DLL enthält nur drei ABI-Konvertierungen. Engine-Rechnungen
  müssen diese Helfer verwenden, statt implizite MiniLang-Zahlenpromotion anzunehmen.
- Float-Tests decken endliche Werte, Subnormalzahlen, Rundung, Über-/Unterlauf,
  signed zero, Quadratwurzel und entstehende Unendlichkeiten/NaNs ab. Beliebige NaN-Payloads als
  Eingangswerte sind noch nicht vollständig gegen sämtliche Referenzpfade geprüft.
- Der Originalinterpreter schreibt bei `OP_BCOM` in `opStack[-1]`. MiniLang
  reproduziert dieses beobachtbare Verhalten im Interpreterprofil. Eine spätere
  Entscheidung zur Korrektur muss getrennt von Paritätsaussagen erfolgen.
- QVM-Lader und Speicherzugriffe weisen gefährliche oder ungültige Eingaben
  kontrolliert zurück. Der Originalparser kann bei überlangen quoted tokens
  seinen C-Puffer überschreiten; MiniLang weist diese Eingabe zurück.
- ZIP64, verschlüsselte und mehrteilige ZIPs sowie Nicht-ASCII-Dateinamen sind
  noch kein zugesicherter Kompatibilitätsumfang. PK3-Pfadpriorität, Dateilisten
  und Pure-Server-MD4-Prüfsummen sind für explizit vom Host aufgelistete Paks
  umgesetzt; automatische Verzeichnissuche, Downloads, Restrict-Modus und
  referenzierte-Pak-Verhandlung fehlen. Details stehen in [FILESYSTEM.md](FILESYSTEM.md).
- BSP-Lesen, Welt-/Inline-Modellkollision, Kurvenflächen, Transformationen,
  temporäre Boxen, Sichtbarkeitsdaten und Areaportale haben eigene Vergleichstests.
  Bewegte Entities sind mit Pmove verbunden; Türsteuerung und lineares
  Mover-Pushing, Drehmitnahme, Client-Yaw und Areaportal-Umschaltung sind implementiert.
  Differentialreplays für komplexe Blockaden sowie Rendering sind noch offen.
- Die x86-Referenz verwendet in `BoxOnPlaneSide` die originale x87-Assemblerfassung.
  Der Port vergleicht die Summen hier ohne Zwischenrundung auf binary32. Die
  getesteten CD-Koordinaten stimmen; das ist keine pauschale Zusage für beliebige
  extreme oder speziell konstruierte Koordinaten anderer Karten.
- Patch-Traces überschreiben im Original nur Normale und Distanz, während
  Plane-Typ und Signbits aus dem vorherigen Treffer erhalten bleiben können.
  Dieses Verhalten sowie der besondere stationäre Punkt-Test werden bewahrt.
  Für nicht definierte Originalzugriffe bei vollständig degenerierten Patch-Zellen
  liefert der Port deterministisch keine Kante. Übergroße Grids, nicht endliche
  Koordinaten, zyklische BSP-Bäume und ungültige Trace-Parameter werden abgewiesen.

## Kollision und Bewegung

`test_patches.py` lässt den unveränderten ursprünglichen Kartenlader alle
Kurvennetze erzeugen. Danach erzeugt MiniLang diese Netze eigenständig aus den
BSP-Kontrollpunkten. 6.091 Netze aus allen 31 CD-Karten stimmen in 1.352.159 Feldern
überein: Ebenen, Facets, Bevels, Begrenzungen und aktive Border-Flags. Das C-Ergebnis
wird ausschließlich als Testvergleich gelesen, nicht als Laufzeitgeometrie benutzt.

`test_collision.py` ruft die vollständigen ursprünglichen `CM_BoxTrace`-,
`CM_PointLeafnum`- und `CM_PointContents`-Funktionen auf. Neben Zufallspositionen
werden die Mittelpunkte quadratischer Kontrollzellen gezielt durchquert. Pro
Kurvenprofil entstehen 56.108 Traces mit 897.728 verglichenen Feldern. Darin
enthalten sind asymmetrische Boxen, Punkte, Kapseln, stehende Abfragen, Start-in-Solid,
Inhaltsmasken und Inline-Modelle. Diese Abnahme gilt für statische BSP-Modelle.
Bei identischen Eingaben ändern aktive Kurven 4.991 Trace-Ergebnisse gegenüber
dem Profil ohne Kurven; diese Kontakte werden im Vergleich tatsächlich ausgeübt.

`test_movement.py` bindet die ursprünglichen Dateien `bg_pmove.c`, `bg_slidemove.c`
und `bg_misc.c` in die C-Testreferenz ein. Geprüft werden `PM_ClipVelocity`,
`PM_Friction`, `PM_Accelerate`, `PM_CmdScale`, `PM_SlideMove`, `PM_StepSlideMove`,
Touch-Listen und der Ereignisring. Vier Karten, unabhängige Eingaben und verkettete
64-Frame-Folgen prüfen Position, Geschwindigkeit, Aufprallstärke, Kontakte und
Ereignisse. Je 16.384 Operationen mit/ohne Kurven ergeben insgesamt 1.540.096
identische Felder. Mit aktiven Kurven entstehen dabei 162 echte Stufenereignisse
aus der Bewegung, zusätzlich zu den separaten Tests des Ereignisrings.
Die Testreferenz kollidiert mit C, der Port mit seiner MiniLang-Kollision.
Diese bisherigen Kerntests werden durch die vollständigen Befehlsvergleiche ergänzt.

`test_pmove.py` ruft nun den unveränderten `Pmove`-/`PmoveSingle`-Code auf und
vergleicht ihn mit `src/mq3/game/pmove.ml`. Enthalten sind Ground-Checks,
Start-in-Solid-Korrektur, Sprünge, Ducken, Luft-/Wasser-/Flug-/Noclip-Bewegung,
Grapple-Pull, Landungen, Timer, Waffenwechsel, Munition, Holdables, Gesten und
Animations-/Ereigniszähler. Verglichen werden alle 468 Bytes des PlayerState
sowie die veränderten Usercmd- und relevanten Pmove-Ausgaben: 166 Wörter pro Befehl.
Die C-Referenz prüft außerdem Größe und Offset aller 45 PlayerState-Felder unabhängig
mit `sizeof` und `offsetof`. Der generierte MiniLang-Codec ist kein Netzwerkprotokoll.

Vier CD-Karten liefern je 4.096 unabhängige oder verkettete Befehle; eine assetfreie
BSP-Testkarte ergänzt 4.864 gezielte Befehle. Ihre Fälle decken Wassersprung,
alle vier Wasserstände, Schleim/Lava, Stufen, niedrige Decke, blockiertes Aufstehen,
Start-in-Solid, Materialflags, Landungen sowie alle zehn Waffen mit Haste,
unendlicher Munition und Munitionsende ab. Die Profile mit und ohne Kurven ergeben
zusammen 42.496 Befehle und 7.054.336 identische Wörter. Die Prüfung erfolgt nach
jedem äußeren Befehl; zusätzliche direkte `PmoveSingle`-Fälle prüfen Einzelaufrufe.
Sie ist noch kein Replay eines vollständigen MiniLang-Servers oder Clients.

`AngleVectors` und `SnapVector` liefern in 65.536 Fällen 786.432 identische Werte.
26 zusätzliche Snap-Proben enthalten Halbwerte, signed zero, Integergrenzen,
Unendlichkeiten und NaNs. Die Referenz kompiliert den unveränderten
`Sys_SnapVector`-Funktionskörper aus `win32/win_shared.c`: x87 `FISTP`, nächste
Ganzzahl, bei Gleichstand gerade. MiniLang führt diese Rundung selbst aus.
`sin`, `cos` und die doppelt genaue Wurzel in der Landungsformel werden dagegen
direkt aus `ucrtbase.dll` aufgerufen. Diese ausdrücklich abgegrenzten C-Laufzeit-
Mathematikfunktionen ersetzen keine Bewegungslogik. Die native Projekt-DLL bleibt
auf die bisherigen drei Float-/Bit-Konvertierungen beschränkt.

Alle 36 ursprünglichen baseq3-Item-Tags werden aus der Quelltabelle übertragen
und gegen C geprüft. `MISSIONPACK` ist nicht Bestandteil dieses Pmove-Profils;
die auch in baseq3 kompilierten Invulnerability-Zweige sind enthalten. Zwölf
Vertragstests weisen fehlerhafte Befehle, Feldgrößen und Indizes zurück; zwei weitere
prüfen alte bzw. unveränderte Command-Zeitstempel. Feste Intervalle außerhalb
1–200 ms werden im Port abgewiesen, insbesondere statt einer Endlosschleife bei 0.

`--pmove-map` verarbeitet TSV-Befehle direkt mit PK3-Lader, MiniLang-Kollision und
Pmove. Der zugehörige Ende-zu-Ende-Test vergleicht 268 Befehle in 4.020 ausgegebenen
Feldern mit C. Dieser Aufruf enthält weder dynamische Entities noch Server-Spielregeln.

## Transformierte Modelle, temporäre Boxen und Sichtbarkeit

`test_spatial.py` vergleicht `CM_TransformedBoxTrace`,
`CM_TransformedPointContents`, temporäre Boxen und Modellgrenzen auf allen 31 Karten.
Pro Kurvenprofil werden 63.488 Fälle geprüft, zusammen 126.976 Fälle mit 3.047.424
identischen Wörtern. Die Fälle enthalten Drehungen auf allen drei Achsen,
Translationen, asymmetrische Boxen, Punkte, bewegte Kapseln, stehende Abfragen,
Inhaltsmasken und den wiederverwendeten temporären Modellplatz.

Die Originalbesonderheiten bleiben erhalten: Bei Boxen wird die Abfragelinie
gedreht, die Box selbst bleibt entlang der Achsen ausgerichtet. Bewegte Kapseln
erhalten den ursprünglichen gedrehten Kugelversatz. Bei einem Treffer wird die
Normale zurückgedreht; Distanz, Typ und Signbits bleiben in der ursprünglichen
Darstellung. Negative Ebenen temporärer Boxen verwenden die Typen 3, 4 und 5.
Eine temporäre Kapselanforderung aktualisiert die Modellgrenzen, lässt aber die
bisherigen Boxebenen bestehen. Die Tests prüfen auch diesen Zustand.

**Originalfehler beim Kapselmodell:** `CM_TempBoxModel(..., true)` liefert Handle
254. `CM_ClipHandleToModel` erkennt im festgehaltenen Original jedoch nur die
temporäre Box 255. Ein separater unveränderter C-Lauf bricht auf jeder CD-Karte
beim Trace mit Handle 254 ab. Der Port liefert dafür einen kontrollierten Fehler;
die unerreichbaren Kapsel-gegen-Kapsel-Routinen werden nicht als portiert behauptet.
Dies betrifft das temporäre Zielmodell, nicht die bereits geprüften bewegten
Kapseln gegen BSP/Brushes. Für eine spätere Erweiterung ist ein eigenes, sichtbar
vom Original abweichendes Referenzprofil erforderlich. Karten mit mehr als 254
Modellen weist der Port zurück, damit Inline-Indizes nicht mit den reservierten
Handles 254/255 kollidieren; das Original lässt diese problematische Überlappung zu.

`test_visibility.py` prüft alle PVS-Zeilen einschließlich ungültiger Clusterindizes,
Modellgrenzen und Blatt-/Bereichszuordnungen. Auf 31 CD-Karten und zwei assetfreien
Testkarten stimmen 2.821.274 Wörter und 12.414.636 PVS-/Bereichsbytes überein.
16.896 Boxabfragen vergleichen Blatt- und Brush-Listen samt Reihenfolge,
Kapazitätsüberschreitung und `lastLeaf`. 17.296 Portaloperationen prüfen den
vollständigen Referenzzählergraphen, Flutnummern, Zusammenhang und die Vereinigung
von Bereichsbits mit bereits belegten Ausgabepuffern. Enthalten sind Selbstkanten,
mehrfaches Öffnen/Schließen, `cm_noAreas`, negative Bereichsparameter und fehlende PVS.

Ohne PVS rundet der ursprüngliche Lader die Clusterzahl auf ein Vielfaches von
32 **Bytes**, ohne vorher durch acht zu teilen. Ungültige Cluster liefern bei
vorhandener PVS die erste Zeile. Beides wird bewahrt. Beschädigte Cluster-/Bereichs-
Zuordnungen und zu kurze Sichtbarkeitszeilen werden kontrolliert abgewiesen.
Ein fehlerhaftes Schließen eines Portals verändert im Port den Graphen nicht;
das C-Original würde nach dem Fehler die Karte abbrechen.

Die neuen CLI-Aufrufe `--trace-model` und `--inspect-visibility` sind über
PK3-Lader und MiniLang-Laufzeit zusätzlich in 141 Feldern gegen C geprüft.
Sie sind räumliche Entwicklungsabfragen, keine vollständige Server-/Render-Abnahme.

## Dynamische Entities und gemeinsame Spielreaktionen

`server/world.ml` überträgt die Sektoraufteilung und Entity-Verlinkung aus
`sv_world.c`, einschließlich Solid-Größenkodierung, gedrehter Modellgrenzen,
PVS-/Area-Zuordnung und der Grenzen von 128 Blättern bzw. 16 Clustern. Die
Sektorlisten behalten Einfügereihenfolge und Besuchsreihenfolge. Trace-Gleichstände,
Besitzerfilter, `startsolid`-Vereinigung und frühe Welt-Treffer bleiben unverändert.

`test_server_world.py` bindet den ursprünglichen Server-Kollisionscode direkt ein.
Es vergleicht Ein-/Um-/Ausverlinkungen, Area-Abfragen, Entity-/Welt-Traces,
Point-Contents und komplette Pmove-Zustände. Geprüft werden alle 31 CD-Karten
und eine assetfreie Testkarte, jeweils mit und ohne Kurven. Drei vollständige
Adressierungshelfer aus `sv_game.c` werden unverändert extrahiert; die übrigen
VM-/Server-Funktionen dieser Datei werden nicht als abgenommen gezählt.

Beide Profile zusammen ergeben 357.696 Operationen und 9.585.476 identische
32-Bit-Wörter. Darin enthalten sind 32.768 vollständige Pmove-Befehle sowie 1.536
aufgezeichnete Sprungpad-Aufrufe. Die Folgen erzeugen 2.914 dynamische
Entity-Kontakte in Pmove. Beide Profile verwenden dasselbe MiniLang-Testbinary
(`bde87bd5915be6a99aa38ad3d4c9da9ec24eb57c8d057d956a47cb6b028c6860`).

Der Testhost bewegt Entities mit aufgezeichneten Änderungen und ruft Sprungpads
an festgelegten Befehlsgrenzen auf. Die tatsächlichen Traces, Pmove-Schritte und
Sprungpad-Zustandswechsel führt jeweils C bzw. MiniLang aus. Das ist noch keine
Trigger-Erkennung oder Mover-Push-Simulation eines vollständigen Game-Servers.
Diese älteren Aufruf-Replays bleiben separat erhalten. Die nachfolgend beschriebenen
Game-Übergangstests prüfen inzwischen auch geometrische Trigger-Erkennung und das
Zurücksetzen der Sprungpad-Merker beim Verlassen.

`test_shared_game.py` prüft zusätzlich 16.384 Fälle und 2.113.536 Wörter für
`BG_EvaluateTrajectory`, `BG_EvaluateTrajectoryDelta`, `BG_PlayerTouchesItem`,
`BG_TouchJumpPad`, `vectoangles` und beide Winkel-Normalisierungen. Alle sechs
Bewegungsbahnen, Stop-Zeitgrenzen, die asymmetrische Item-Box, beide Sprungpad-
Effekte, wiederholte Kontakte, Zuschauer und Flight sind enthalten. Die originale
Sinus-Geschwindigkeitsformel mit Faktor 0,5 wird bewahrt. Sechs Fehlerproben weisen
unbekannte Trajektorientypen und Sinusdauer 0 zurück; weitere sechs prüfen die
Entity-Schnittstelle. Dies erweitert die getrennte Sammlung von 115 Fehlerproben.

`atan2` kommt wie `sin` und `cos` aus der C-Laufzeit. Winkelrechnung und
Zustandswechsel bleiben MiniLang. Die direkte Multiplikation eines negativen
Nullwerts mit einem Integer verliert im eingefrorenen Compiler das Vorzeichen;
der Port bewahrt es im Winkelpfad ausdrücklich und prüft es gegen C.

Die räumlichen Entity-Felder bilden noch keinen vollständigen Netzwerkcodec.
`SV_PointContents` bewahrt die Originalverwendung von `s.origin`/`s.angles`,
während Link/Trace aktuelle räumliche Koordinaten benutzen. Schnittstellen und
weitere Grenzen stehen in [SERVER_COLLISION.md](SERVER_COLLISION.md).

Das Originalprofil ist für temporäre Kapsel-Zielmodelle festgelegt: kontrollierter
Fehler bei Handle 254. Eine Korrektur des Originalfehlers würde ein zusätzliches
Erweiterungsprofil erhalten und ist keine Voraussetzung für Gleichheit mit dem
festgehaltenen C-Stand. Die inzwischen geprüften Teleport-Übergänge und ihre Grenze
an der Schadensfunktion sind im folgenden Abschnitt beschrieben.

## EntityState, Trigger-Erkennung und Teleport-Übergänge

`test_entitystate.py` prüft 16.384 Fälle mit 2.916.352 identischen Ergebniswörtern
und weiteren 851.968 unveränderten Codec-Wörtern. Der vollständige `entityState_t`
hat 28 Felder und 208 Bytes. Die C-Referenz bestätigt 36 aufgelöste Feldpositionen
einschließlich der beiden Trajektorien. Beide `BG_PlayerStateToEntityState`-
Varianten, externe/gepufferte Ereignisse, Sequenzbits, lebende/tote Spieler,
Powerups, unberührte Felder und `SetClientViewAngle` werden verglichen. Zwei
zusätzliche Proben weisen abgeschnittene Puffer und negative Offsets zurück.

`test_transitions.py` verbindet die vollständigen Originalfunktionen
`G_TouchTriggers`, `TeleportPlayer`, `G_KillBox`, `G_TempEntity`,
`SetClientViewAngle`, die Platzverwaltung sowie die beiden Push-/Teleporter-
Touch-Funktionen mit dem originalen SV-/CM-/Pmove-Code. Enthalten sind:

- Geometrische Box-/BSP-Kontakte, gedrehte Modelle, der Item-Sonderfall,
  Zuschauer-/Bot-Filter und Touch-Callback-Reihenfolge.
- Wiederholte Sprungpad-Kontakte, Verlassen, erneuter Eintritt sowie Teleports
  während einer bereits laufenden Kandidatenschleife.
- Temporäre Ereignis-Entities, genaue und abgeschnittene Positionen, Blickwinkel-
  Deltas, Teleport-Bit, Knockback-Zeit und Unlink-/Link-Reihenfolge.
- Aktive Target-Namen, Groß-/Kleinschreibung, die ersten 32 Kandidaten und das
  native Win32-Rand-Profil; außerdem Freigabe, Wachstum, Sperrfrist und `neverFree`.

Beide Kurvenprofile zusammen vergleichen 147.136 Operationen und 24.340.128
identische 32-Bit-Wörter. Darin enthalten sind 16.384 Pmove-/Link-/Touch-Befehle
und 3.072 aufgezeichnete Telefrag-Schadensaufrufe. Die Bewegungsfolgen haben
4.608 Frames mit aktivem und 11.776 Frames mit zurückgesetztem Sprungpad-Merker.
Beide Profile verwenden dasselbe MiniLang-Testbinary
(`77c505b7e9666a9a17f03470986affb9262c53bd5d79bac914af2d29c1deec07`).

Die Tests initialisieren Game-Entities gezielt auf allen 31 CD-Karten und einer
assetfreien Karte. Das Pmove/Link/Touch-Protokoll stammt aus dem Vergleichshost;
es ersetzt noch keinen vollständigen `ClientThink`-/Serverframe und kein
ursprüngliches Spawn-Parsing. Ereignis-Entities erhalten die Originalmerker für
spätere Freigabe; ihre automatische Entfernung ist inzwischen in der gesonderten
Target-/Entity-Schleifenprüfung abgedeckt. Client- und Spielmodul-Frames sind
inzwischen separat geprüft; durchgängige Engine-/Match-Replays bleiben offen.

**Telefrag-Grenze:** Kandidaten, Aufrufreihenfolge, Schaden 100.000, Flags und
`MOD_TELEFRAG` stimmen mit `G_KillBox` überein. Die Funktion `G_Damage` ist hier
eine aufgezeichnete Callback-Grenze. Dieser ältere Test deckt keine Schadensfolgen ab; die zusätzliche Kampfprüfung
unten vergleicht inzwischen Schaden, Rüstung, Teamschutz und Telefrag-Integration.
Die Spieler-Todesregeln und Score-Einbindung werden inzwischen in der gesonderten
Todesprüfung bis `G_Damage → player_die` verglichen. Ein vollständiger
KillBox-/Match-Replay mit dieser Folge bleibt offen. Ein fehlender Schadenscallback
wird in MiniLang bei einem betroffenen Client als Fehler behandelt.

Der Original-Allocator bricht im vollen Normalbereich auch bei einem zu kürzlich
freigegebenen Platz ab; seine nominelle zweite Suchrunde erreicht diese Grenze
nicht. Zwei separate C-Läufe prüfen diesen Fehler, fünf MiniLang-Vertragsproben
prüfen Erschöpfung, Wiederverwendung genau nach 1.000 ms und Teleport ohne Client.
Details der Schnittstellen stehen in [GAME_TRANSITIONS.md](GAME_TRANSITIONS.md).

## Spawn-Parsing, Worldspawn und verzögerte Zielausrichtung

Die neue Referenz kompiliert das vollständige ursprüngliche `g_spawn.c`.
`test_spawn_values.py` vergleicht 4.096 Fälle, 800.360 Ergebniswörter und
1.767.499 String-Bytes für alle 20 Feldregeln und die Spawn-Getter. Doppelte
Schlüssel, Groß-/Kleinschreibung, Backslash-Regeln, Vorgabewerte, partielle Getter-
Vektoren und CRT-Zahlengrenzen sind enthalten. Sechs separate C-Läufe bestätigen
Parserfehler; 30 Laufzeitverträge prüfen weitere Grenzen der MiniLang-Schnittstelle,
einschließlich fehlender Frame-Handler, überlanger Shader-Remap-Namen, fehlendem
Speaker-Noise-Schlüssel und NULL-Configstring-Speicherung.
1.024 direkte `G_RunThink`-Vergleiche stimmen in 2.048 Wörtern überein, darunter
Zeitwerte an der binary32-Grenze um 16.777.216 und an den signed-int-Grenzen.
Ein separater C-Lauf bestätigt den Fehler eines fälligen, fehlenden Think-Callbacks.

`test_spawn.py` prüft 168 Karten-/Spielmodus-Replays: alle 31 CD-Karten in den
fünf Modi FFA, Tournament, Single Player, Team Deathmatch und CTF; zusätzlich
eine konstruierte Karte mit zehn Moduswerten und drei Schwerkraftvarianten.
16.469.869 Wörter und 2.052.662 String-Bytes stimmen exakt. Nach 849 Kontaktproben
an tatsächlich geladenen Triggern tragen 754 PlayerStates einen Sprungpad-Merker
und 139 das Teleport-Bit. Eine Probe kann durch überlappende Trigger beide Merker
tragen; diese Zahlen zählen Ergebniszustände, nicht die Zahl einzelner Callbacks.
Feld-, Think- und Kartenprüfung verwenden dasselbe MiniLang-Testbinary
(`eb2b7b0a14844c61c0833ec957124a4bd48a515daf5841705cd3d1c12c3eacf5`).

Alle 48 Spawn-Klassen führen übertragene Originalfunktionen aus.
Worldspawn-Effekte, alle Spielmodusfilter, die frühe Brush-Modell-Verlinkung,
die 100-ms-Zielausrichtung der Sprungpads und komplette PlayerStates nach
Trigger-Kontakten sind enthalten. Einige originale Positions-/CTF-Spawn-Funktionen
sind leer; manche andere geben ihre Entity unmittelbar frei. Die Abnahme bewahrt
diese Funktionen, ohne damit bereits Spieler-Respawn oder CTF-Regeln zu behaupten.

**Mover-Abnahme:** Die acht Mover-Klassen laufen inzwischen durch echte Spawn- und
Framepfade. Lineares und rotierendes Schieben, Client-Yaw, Rückrolldaten und
Areaportal-Referenzzähler besitzen Laufzeitverträge; drei `func_rotating`-Achsen
werden außerdem exakt gegen das unveränderte C-Orakel verglichen. Alle 35 Item-Aufrufe laufen durch `G_SpawnItem`; Platzierung und
späteres Verhalten prüft die gesonderte Item-Suite. Der Testhost stellt Speicher
und Configstring-/Cvar-Schnittstellen bereit; Netzwerkverteilung und vollständige
Karten-Replays komplexer Blockaden des Mover-Schiebekerns bleiben offen. Die Item-Suite prüft inzwischen
Aufnahme, Pickup-Targets und Respawn. Ereignisfreigabe wird in
der nachfolgend beschriebenen Entity-Schleife geprüft.

Unvollständige Feldvektoren und ein abschließender `G_NewString`-Backslash haben
im Original kein verlässlich initialisiertes Ergebnis und werden im Port
abgewiesen. Getrennte Referenzprofile wären für andere CRTs, Locales oder QVM-
Zahlentext-Konvertierungen nötig. Schnittstellen und Details: [SPAWNING.md](SPAWNING.md).

## Target-Ketten, Ereignisse und Entity-Schleife

`test_targets.py` vergleicht 28 Szenarien mit 9.691 Aktionen, 40.453.187 identischen
32-Bit-Wörtern und 4.721.815 identischen String-Bytes. Ausgeführt werden originale
Use-/Think-/Spawn-Funktionen für `target_delay`, `target_relay`,
`target_teleporter`, `trigger_multiple`, `trigger_always`, `target_speaker`,
`target_push`, `func_timer` und `target_location`, außerdem
`G_UseTargets`, Shader-Remaps, `G_AddEvent` und `G_Sound`.

Die Fälle prüfen die laufende Suche nach Targets, veränderte Namen, entfernte
Ziele, sofort wiederverwendete Plätze und während eines Frames angelegte Entities.
1.024 Verzögerungsproben decken native Zufallszahlen, doppelt genaue
Zwischenrechnungen und große Zeitwerte ab. Teamfilter, überschriebene Auslöser,
einmalige Trigger, Ereignis-Sequenzbits, temporäre Sounds und Teleports sind
enthalten. Shader-Tests prüfen Halbwerte, signed zero, kleine/große Floats,
128 Remaps und die ursprünglichen Ausgabegrenzen. Die Windows-C-Laufzeit wird
mit der zur MSVC-Referenz passenden Standardrundung aufgerufen; eine native
Implementierung von Spielregeln wurde dafür nicht ergänzt.

Die Erweiterung prüft alle 16 Speaker-Flag-Kombinationen, Loop-/Ereignispriorität,
Dateinamensgrenzen, Wait-/Random-Konvertierung und fehlende Noise-Schlüssel.
Push-Targets werden mit Richtungen, Speed, Scheitelpunkten, allen sieben
Bewegungstypen, Flight sowie gemeinsam benutzter Soundsperre verglichen.
512 zusätzliche Timer-Präzisionsproben ergänzen Start-On, sofortiges Auslösen,
Ausschalten und Änderungen während der Target-Kette. Zwei gesonderte Fehlerläufe
bestätigen den späteren fehlenden Think-Callback eines durch sein Target
freigegebenen Timers. 71 Ortsmarkierungen prüfen verzögerten Listenaufbau,
fehlende Nachrichten, die fehlende Inuse-/64er-Begrenzung und spätere Freigaben.
Die lokale NULL-zu-Leerstring-Behandlung des Configstring-Hosts bildet den
entsprechenden Vertrag aus `SV_SetConfigstring` ab; dessen vollständige Original-
Implementierung und Netzwerkverteilung werden noch nicht verglichen.

Für `frame.runEntities` wird der Entity-Schleifenblock unverändert aus
`G_RunFrame` extrahiert. Geprüft sind der strikte Ablauf nach mehr als 300 ms,
Freigabe-/Unlink-Priorität, `neverFree`, ausbleibende Think-Aufrufe für temporäre
Entities und die Auswahl der weiteren Handler. In diesem Target-Test bleiben die
Missile-, Item-, Mover- und Client-Handler aufgezeichnete Aufrufgrenzen. Die
gesonderten Projektil- und Item-Prüfungen führen ihre jeweiligen Zweige mit der
echten portierten Verarbeitung aus. Dies ist
**keine vollständige G_RunFrame-Abnahme**: Cvar-/Zeitverwaltung, ClientEndFrame,
Matchende und Votes werden inzwischen durch die getrennten Frame-/Gameplay-Suiten
geprüft. Die vollständige Serverintegration bleibt offen.
Schnittstellen und genaue Grenzen: [TARGETS_AND_EVENTS.md](TARGETS_AND_EVENTS.md).

## Schadensberechnung und Karten-Gefahren

`test_combat.py` vergleicht 57 Szenarien mit 19.543 Aktionen,
31.607.620 identischen 32-Bit-Wörtern und 1.790.052 String-Bytes.
Dabei werden 2.681 Sichtlinien-/Laser-Traces vollständig beobachtet. Enthalten sind die
baseq3-Spielregeln von `G_Damage`, `CheckArmor`, `OnSameTeam`,
`Team_CheckHurtCarrier`, `CanDamage`, `G_RadiusDamage`, `LogAccuracyHit`,
`trigger_hurt`, `target_kill` und `target_laser`. Der Vergleich erfasst
Gesundheit, Rüstung, Rückstoß, Trefferzähler, Schadensakkumulatoren,
Battlesuit-Ereignisse, CTF-Trägerdaten sowie Pain-/Death-/Mover-Aufrufe in
Originalreihenfolge. Der Träger-Zeitmerker wird als Float-Bits verglichen.

Die Fälle prüfen unter anderem Schutzkombinationen, Selbstschaden, Handicap,
negative Werte, 1024 numerische Schadensproben, große Spielzeiten, alle 32
Hurt-Flags und gemeinsame Trigger-Sperrzeiten. Räumliche Trigger-Kontakte und
KillBox-/Teleport-Folgen sind mit der tatsächlichen SV-/CM-Kollision und der
echten Schadensfunktion verbunden. Acht zusätzliche Laufzeitverträge prüfen
die Bindung, die Float-Parametergrenzen und kontrollierte Fehler bei fehlenden
oder ungültigen Handlerzuständen.

Pain-, Death- und Mover-Callbacks beobachten in dieser isolierten Suite ihre
Argumente und Eintrittszustände; einzelne Test-Callbacks geben die Entity frei.
Die anschließende Todes-Suite verwendet stattdessen den echten `player_die`-Port.
Die [Baseq3-Waffen](WEAPONS.md) verbinden inzwischen die Treffer- und
Genauigkeitsregeln mit echtem Schaden. Die vollständige Engine-Serverintegration bleibt offen. Schadensfeedback am Frame-Ende ist
inzwischen durch die gesonderte ClientEndFrame-Prüfung abgedeckt.
`G_Printf`-Diagnosen und Missionpack gehören nicht zu dieser Abnahme.
Der Rüstungsport verwendet die CRT-Mathematikfunktion `ceil`; die Spielregeln
bleiben MiniLang und die Projekt-DLL bleibt unverändert.
Schnittstellen, numerisches Profil und offene Grenzen: [COMBAT.md](COMBAT.md).

Die Erweiterung beobachtet alle Sichtlinien-/Laser-Traces mit Eingaben und
vollständigen Ergebnisfeldern. Echte Inline-BSP-Hindernisse erzwingen die
ursprünglichen ein bis fünf Sichtlinien-Abfragen; Radiusgrenzen, 512 numerische
Radius-Proben, lebend veränderte Kandidaten und der Treffer-Rückgabewert vor
Schutzregeln sind enthalten. Laser-Tests prüfen Start/Umschaltung, das erste
aktive Ziel, fortlaufende Zielverfolgung, Entity 0, Owner-Filter und 256
Subnormal-Proben für die doppelt genauen `VectorMA`-Zwischenrechnungen.
Sichtlinien und Radius-Schaden werden zusätzlich auf allen 31 CD-Karten verglichen.

**Kontrollierte Abweichung:** Ein Test-Callback gibt den angreifenden Laser frei.
Das Original verlinkt ihn danach mit `s.number = 0` und benutzt damit fremde
Server-Metadaten. MiniLang weist die unpassende Entity-/Slot-Nummer weiterhin ab.
Der Ablauf stimmt bis zu dieser Grenze überein; sein restlicher C-Pfad wird
nicht als portiert gezählt. Der gesonderte Fehlerlauf und seine Eingaben sind
im Nachweis festgehalten.


## Projektile, Grappling-Hook und Shooter

`test_missiles.py` vergleicht 71 Szenarien mit 20.623 Aktionen,
51.274.574 identischen 32-Bit-Wörtern und 2.612.912 String-Bytes.
1.260 vollständige Traces verbinden Projektilflug, reale SV-/CM-Kollision und
die Schadensfunktion. Alle 31 CD-Karten werden mit Kurven geprüft.

Enthalten sind alle fünf baseq3-Projektil-Erzeugungen, `G_RunMissile`,
`G_BounceMissile`, `G_MissileImpact`, `G_ExplodeMissile`, die Hook-Think-/Free-
Funktionen, drei Shooter-Klassen sowie deren Item-Suche und Registrierung.
670 Erzeugungen, 512 numerische Abprallproben, 256 Shooter-Präzisionsfolgen,
Direkt-/Radius-Treffer, Schutzregeln, Callback-Änderungen, Owner-Filter,
Start-in-Solid, Metall/Himmel, Timeouts und Ereignisfreigabe werden verglichen.
Acht zusätzliche Laufzeitverträge prüfen Felder und kontrollierte Fehlergrenzen.

Eine absichtlich im Pain-Callback freigegebene Projektil-Entity reproduziert
die bekannte Link-Grenze: C verwendet danach fremde Server-Metadaten, MiniLang
weist die falsche Entity-/Slot-Nummer zurück. Dieser separate Ablauf zählt
ausschließlich bis zur kontrollierten Abweichung als verglichen.

Die neuen Richtungsproben haben außerdem die NaN-Vorzeichenerhaltung der
Float-Subtraktion korrigiert. Zusätzlich zu den 101.445 binären Ergebnissen
prüft der Zahlentest nun 20.289 tatsächliche `fsub`-Aufrufe.
Details, Schnittstellen und verbleibende Abnahmen: [MISSILES.md](MISSILES.md).

## Spawnpunkte und Leichenverwaltung (Schritt 6)

`scripts/test_bodies.py --data-root D:/Quake3` besteht mit **65 Szenarien**,
**10.333 Aktionen**, **51.664.671 exakt gleichen 32-Bit-Wörtern**,
**5.772.168 String-Bytes** und **305 Traces**. Darin enthalten
sind gezielte Spawnpunkt-/Leichenproben mit echter BSP-Geometrie aus allen 31
CD-Karten. Zehn Laufzeitverträge und die beidseitige Zurückweisung einer fehlenden
Spawnposition ergänzen die gültigen Vergleichsfälle.

Übertragen sind Deathmatch-, Initial-, Team- und Zuschauer-Auswahl,
`FindIntermissionPoint`, die acht Leichenplätze, `BodySink`, `LookAtKiller`,
`GibEntity` und `body_die`. Die Entity-Schleife führt den Nicht-Item-Leichenpfad
von `G_RunItem` mit echtem Server-Trace, Think-/Link-Reihenfolge und Abprall aus.
Die Tests vergleichen auch alle EntityState-Felder, alte Leichengesundheit,
Ringumlauf, No-Blood/No-Drop, Zufallsendpunkt und signierte Zeitgrenzen.

Test-Binary: `eb2b7b0a14844c61c0833ec957124a4bd48a515daf5841705cd3d1c12c3eacf5`. Regeln, Grenzen und Quellzuordnung stehen in
[PLAYER_LIFECYCLE.md](PLAYER_LIFECYCLE.md). Die Überschreitung des ursprünglichen
128er-Deathmatch-Arrays wird kontrolliert zurückgewiesen; dieser undefinierte
C-Pfad wird nicht als identisches Verhalten ausgewiesen. `player_die` und der
Respawn-Wrapper sind inzwischen in [DEATHS.md](DEATHS.md) integriert; Item-Entities
und ihre Physik sowie Pickup-Regeln stehen in [ITEMS.md](ITEMS.md). `ClientSpawn`
ist inzwischen separat geprüft. Die Client-Frames sind in
[CLIENT_THINK.md](CLIENT_THINK.md) und [CLIENT_FRAMES.md](CLIENT_FRAMES.md)
verglichen; vollständige Engine-/Match-Replays bleiben offen.

## Punkte, Ranglisten und Matchende (Schritt 6)

`scripts/test_scores.py` besteht mit **53 Szenarien**,
**6.241 Aktionen**, **66.851.297 exakt gleichen 32-Bit-Wörtern**,
**2.606.540 String-Bytes**, **412 Servernachrichten**
und **70 Logzeilen**. Zwölf Laufzeitverträge ergänzen die gültigen
Vergleichsfälle. Geprüft werden nach jeder Aktion alle 64 vollständigen
Client-PlayerStates, Client-/Level-Felder, Entity-Zustände, Empfänger,
Configstrings und die Reihenfolge der Nachrichten und Übergangsargumente.

Übertragen sind `ScorePlum`, `AddScore`, `SortRanks`, `CalculateRanks`,
`DeathmatchScoreboardMessage`, `Cmd_Score_f`,
`SendScoreboardMessageToAllClients`, `ScoreIsTied`, `CheckExitRules`,
`LogExit` und `CheckIntermissionExit`. Die Vergleichsfälle umfassen
Bots, Zuschauer, verbindende Clients, bis zu 64 Clients, Score-Überlauf,
Warmup, Scoreboard-Texte an der Grenze von exakt 1.024/1.025 Bytes,
Sudden Death, Limit-Priorität, Bereitschaft und signierte Zeitgrenzen.

Die Rangsortierung verwendet einen MiniLang-Port des Vergleichs- und
Partitionierungsablaufs des nativen Windows-UCRT-Profils. Die C-Referenz ruft
ihr tatsächliches `qsort` auf. SDK-Version, Quell-, Compiler- und
statischer Runtime-Hash sind im Bericht festgehalten. Die separate
QVM-Sortierung ist nicht als reihenfolgegleich abgenommen.

Der ursprüngliche Reset schreibt über sein Array mit zwei Team-Wählerzählern
hinaus und löscht im geprüften nativen Layout zusätzlich `spawning` und
`numSpawnVars`. MiniLang bildet diese beobachteten Nebenwirkungen durch sichere
Feldzuweisungen ab. Ein eigener Vergleichsfall und Layout-Prüfungen im
Referenzadapter sichern dieses ausdrücklich auf den nativen Build begrenzte
Verhalten ab; es ist keine Zusage definierten oder portablen C-Verhaltens.

Test-Binary: `eb2b7b0a14844c61c0833ec957124a4bd48a515daf5841705cd3d1c12c3eacf5`. Regeln und Grenzen stehen in
[SCORES.md](SCORES.md). `BeginIntermission` und `ExitLevel` bleiben explizite
Callbacks; geprüft werden die Entscheidungen und Zustandsänderungen vor und
nach ihrem Aufruf. Logtexte und Serverbefehle werden an der Aufrufgrenze
beobachtet. Zeitstempel und Log-Ausgabereihenfolge sind inzwischen separat in
[GAME_LOGGING.md](GAME_LOGGING.md) geprüft. Tatsächliche Kartenwechsel,
Datei-/Netzwerkzustellung und Scoreboard-Grafik sind noch offen. Spieler-Tod,
Team-Fragboni, Drop-Entscheidungen und der Respawn-Wrapper binden diese
Bausteine inzwischen ein. Item-Aufnahme und CTF-Capture verwenden sie ebenfalls;
vollständige Client-/Server-Pfade
bleiben offen.

## Spieler-Tod, Team-Fragboni und Respawn-Wrapper (Schritt 6)

`scripts/test_deaths.py` besteht mit **23 Szenarien**, **330 Aktionen**,
**3.887.033 exakt gleichen 32-Bit-Wörtern** und **40.921 String-Bytes**.
Acht Laufzeitverträge ergänzen die gültigen Vergleichsfälle. Nach jeder Aktion
werden die vollständigen Score-/Entity-/PlayerState-Daten sowie Todesfelder,
Handler, Feind- und Hook-Referenzen verglichen.

Übertragen sind `TossClientItems`, `CheckAlmostCapture`, `CheckAlmostScored`,
`player_die`, `OtherTeam`, `TeamName`, `Team_FragBonuses`, `SV_inPVS` und der
`respawn`-Wrapper. Die Tests umfassen alle Obituary-Namen, Welt-, Eigen-, Team-
und normale Kills, Gauntlet/Excellent, Team- und Flaggenträgerboni, PVS-/
Distanzgrenzen, Flaggenpriorität, No-Drop, Todesanimationen, Gibs, Blutoption,
Hook-Freigabe, Zuschauer-Scoreboards und den tatsächlichen Pfad
`G_Damage → player_die`. Der originale Trägerschutz überschreibt einen
Entfernungsvektor; dieses beobachtete Baseq3-Verhalten wird exakt bewahrt.

`Drop_Item` und `Team_ReturnFlag` laufen in diesen Todesfällen als echte portierte
Entity-Pfade. Der C-Host protokolliert weiterhin `PrintMsg` und den für diese
isolierte Suite eingesetzten `ClientSpawn`-Override;
Score-, Body-, Hook-, BSP-/PVS- und Entity-Code laufen tatsächlich. Der
Respawn-Test verändert im `ClientSpawn`-Callback absichtlich Position und
Clientnummer und weist dadurch nach, dass der nachfolgende Teleport-Effekt die
Rückgabewerte verwendet. Der normale Respawn führt inzwischen den echten
MiniLang-`ClientSpawn` aus. Item-Aufnahme und CTF-Capture sind separat verbunden;
Client-Frames, Netzwerkzustellung und Missionpack bleiben offen. Details:
[DEATHS.md](DEATHS.md).

## ClientSpawn (Schritt 6)

`scripts/test_client_spawn.py` besteht mit **21 Szenarien**, **5.766 exakt
gleichen 32-Bit-Wörtern**, **23.190 Ausgabe-Bytes** und **144 geordneten
Host-/Link-Ereignissen**. Acht Laufzeitverträge prüfen die Initialisierung,
Info-Strings, fehlende Pflichtgrenzen und die Standardverbindung aus `respawn`.

Der Port deckt FFA-, Initial-, CTF-, Team- und Zuschauerpositionen,
Bot-/Human-Filter, Persistenz und Transient-Reset, Handicap, Spawnzähler,
Startwaffen, Gesundheit, Teleport-/Vote-Flags, KillBox, Verlinkung, Spawn-Targets,
Waffenwahl und beide PlayerState-zu-EntityState-Konvertierungen ab. Die gemeinsame
Info-Schlüsselsuche und die 1.023-Byte-Userinfo-Kopie sind auch mit wechselnder
Schreibweise, Duplikaten und abgeschnittenen Handicap-Werten geprüft. Die native
Referenz führt den unveränderten `ClientSpawn`-Funktionskörper aus.
`trap_GetUserinfo`, `trap_GetUsercmd`, `ClientThink`, `ClientEndFrame` und
`MoveClientToIntermission` bleiben in dieser isolierten ClientSpawn-Suite
explizit beobachtete Host-Grenzen; der normale MiniLang-Pfad ruft inzwischen
die portierten Think-/Frame-Abschlüsse und Intermission-Platzierung auf. Details:
[CLIENT_SPAWN.md](CLIENT_SPAWN.md).

## ClientBegin (Schritt 6)

`scripts/test_client_begin.py` besteht mit **zehn Szenarien**, **3.637 exakt
gleichen 32-Bit-Wörtern**, **15.163 Ausgabe-Bytes** und **116 geordneten
Host-/Configstring-/Link-Ereignissen**. Fünf Laufzeitverträge prüfen Slotgrenzen,
Pflichtschnittstellen und die Registrierung als Standard-Callback.

Der Vergleich führt `ClientBegin`, `ClientSpawn` und `CalculateRanks` auf beiden
Seiten als echte Implementierungen aus. Geprüft sind Unlink/Reinitialisierung,
persistent gebundener Client, vollständiger PlayerState-Reset mit erhaltenen
`eFlags`, Spawn, Teleport-In-Ereignis, Eintrittsmeldung, Log und Ränge. Tournament,
Zuschauer, Intermission, CTF, ein weiterer Ranglisten-Client und 32-Bit-Zeitgrenzen
sind enthalten, ebenso die gemeinsame Userinfo-Suche und die ursprüngliche
Puffergrenze im Eintrittspfad. Details: [CLIENT_BEGIN.md](CLIENT_BEGIN.md).

## Userinfo, Spielernamen und Teamwahl (Schritte 3 und 6)

`scripts/test_client_info.py` besteht mit **195 Szenarien**, **1.947 Aktionen**,
**7.925.495 exakt gleichen 32-Bit-Wörtern**, **32.887.041 Ausgabe-Bytes** und
**722 geordneten Nebenwirkungen**. 18 Laufzeitverträge und zwei native
Fehlerfälle ergänzen den Vergleich.

Geprüft sind `ClientCleanName`, `ClientUserinfoChanged`, `TeamLeader`, `PickTeam`,
`Info_ValueForKey` und `Info_Validate`: bytegenaue Namen/Farben/Leerzeichen,
ASCII-Schlüsselsuche, originale Puffergrenzen, lokaler Clientstatus, Vorhersage,
Umbenennungsreihenfolge, Handicap, Modelle, Bot-Anzeigeteam, Overlay und exakte
Spieler-Configstrings samt Log. Jeder Host-Aufruf und jede zustandsändernde
Aktion vergleicht sämtliche 117 PlayerState-Wörter aller 64 Clients, relevante
Client-/Sitzungs-/Entity-Felder, Spieler-Configstrings und Team-Vote-Zustand.
Reine Hilfsfunktionen haben eigene Ergebnisvergleiche.

Die tatsächliche Standardverbindung aus `SetLeader` läuft in vollständigen
roten und blauen Team-Vote-Folgen; Userinfo-Änderungen steuern anschließend auch
die echten Overlay-Nachrichten. Engine-Userinfo-Zustellung, Serverbefehle,
Configstring-Netzwerktransport und Logdatei bleiben Host-Grenzen. `ClientConnect`
und Sitzungs-Persistenz sind inzwischen separat portiert; deren Suite prüft
zusätzlich nicht normalisierte Leiterwerte. Details: [CLIENT_INFO.md](CLIENT_INFO.md).

## ClientConnect und Sitzungsdaten (Schritt 6)

`scripts/test_client_connect.py` besteht mit **268 Szenarien**, **377 Aktionen**,
**26.734.597 exakt gleichen 32-Bit-Wörtern**, **111.455.661 Ausgabe-Bytes** und
**1.771 geordneten Nebenwirkungen**. 27 Laufzeitverträge ergänzen den Vergleich.

`ClientConnect`, alle fünf Funktionen aus `g_session.c` und `BroadcastTeamChange`
sind gegen ihre unveränderten Originalkörper geprüft. Enthalten sind IP-/
Passwortreihenfolge, die Passwortausnahme anhand des bestehenden Bot-Flags,
vollständiger Reset aller modellierten Clientfelder, Sitzungsinitialisierung
und -lesen, Bot-Rückgabe, echte Userinfo-Verarbeitung, Teamnachrichten und echte
Rangberechnung. Alle 66 modellierten Clientfelder in sämtlichen 64 Slots,
einschließlich aller 117 PlayerState-Wörter, sowie Sitzungs-Cvars, Ränge und
Configstrings werden an jeder Host-Grenze und nach jeder Aktion verglichen.

Sitzungsfälle prüfen sieben native CRT-`%i`-Konvertierungen, Hex-/Oktalwerte,
Integergrenzen und unveränderte Leiter-Integer, automatische Teamwahl,
Spielerkapazität, das erhaltene `newSession`-Flag und das Speichern ausschließlich
verbundener Clients. Schreiben → Level-Neuaufbau → Wiederverbindung erhält die
tatsächliche MiniLang-Registry. Die Verbindung mit registrierten und aktualisierten
`g_teamAutoJoin`-/`g_maxGameClients`-Kopien ist zusätzlich geprüft.

Der native Host modelliert Session-Cvar-Speicherung und behält seinen
beobachteten IP-Override. Die portierten IP-Filter liefern jetzt die
Standardentscheidung und sind separat geprüft; zusätzliche Connect-Verträge
prüfen echte Ban-/Whitelist-Ablehnungen. Bot-Userinfo und Setup-Einstellungen laufen
standardmäßig durch `G_BotConnect` und den portierten `BotAISetupClient`-
Ressourcenpfad. `BotAIShutdownClient` ist ebenfalls Lifecycle-Default; die einzelnen
Botlib-, Userinfo-, Server- und Logdienste bleiben explizite Host-Schnittstellen. Unvollständige
Scans werden vor einer MiniLang-Zustandsänderung kontrolliert abgewiesen;
der Originalcode würde dabei nicht initialisierte lokale Variablen lesen.
Vollständiger Engine-/Modullebenszyklus, Engine-Mapausführung,
Dateipersistenz und Netzwerk bleiben offen. Die Intermission-Steuerung,
Teamwechsel und `ClientDisconnect`
sind im folgenden Nachweis separat erfasst.
Details: [CLIENT_CONNECT.md](CLIENT_CONNECT.md).

## Teamwechsel und ClientDisconnect (Schritt 6)

`SetTeam`, `StopFollowing`, `Cmd_Team_f` und `ClientDisconnect` bestehen
**227 Szenarien**, **266 Aktionen**, **78.057.316 exakt gleiche Wörter**,
**318.595.344 Ausgabe-Bytes** und **3.494 geordnete Nebenwirkungen**.
Weitere **15 Laufzeitverträge** prüfen Bindungen, Pflichtschnittstellen und
`g_teamForceBalance`-Refresh. Teamgrößen/Kapazitäten, Leichen, Waffen-/Powerup-
Drops, CTF-Rückgaben, Leiterwechsel, Cooldown/Überläufe, Duell-Siegpunkte und
Zuschauerfreigabe laufen mit tatsächlichen portierten Spielabläufen.

Alle modellierten Clientfelder aller 64 Slots, alle PlayerStates, die EntityStates
sämtlicher allokierter Entities und ausgewählte private/räumliche Felder werden
bei jedem Host-Aufruf und nach jeder Aktion verglichen. Dazu kommen Rang-,
Configstring-, Item- und Leichenwarteschlangen-Zustände. Ein Null-Clientlimit-Fall
belegt die Korrektur einer rückwärts laufenden Zuschauer-Schleife in `playerDie`.

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
Bot-Queue/-Shutdown und Engine-Zustellung bleiben Pflichtschnittstellen;
Bewegung, Endframe und Intermission werden in dieser Integrationssuite beobachtet.
Follow-Befehle und Tournament-Nachrücken sind inzwischen separat geprüft.
Die tatsächlichen Intermission-/Levelende-Funktionen sind separat verbunden.
Die vollständige [ClientCommand-Verteilung](CLIENT_COMMANDS.md) ist separat geprüft;
Engine-Mapausführung bleibt offen.
Details: [TEAM_CHANGES.md](TEAM_CHANGES.md).

## Follow-Befehle und Duell-Warteschlange (Schritt 6)

`SanitizeString`, `ClientNumberFromString`, beide Follow-Handler,
`AddTournamentPlayer`, `RemoveTournamentLoser`, `RemoveTournamentWinner` und
`AdjustTournamentScores` bestehen **192 Szenarien** mit **331 Aktionen**,
**28.312.377 exakt gleichen Wörtern**, **115.548.855 Ausgabe-Bytes** und
**1.034 geordneten Nebenwirkungen**. **23 Laufzeitverträge** ergänzen Bindungen,
Puffer-/Slotgrenzen und begrenzte Fehlerpfade für problematische Originaleingaben.

Die Vergleiche führen tatsächliche Teamwechsel, Tod, Leichen-/Itemverwaltung,
Userinfo, Begin/Spawn und Ränge aus. Die Zuschauer-Angriffstaste verwendet den
echten `SpectatorThink`-/Pmove-Pfad. Duellfolgen vergleichen Nachrücken,
Gewinner-/Verliererwechsel und Countdown/Restart über den tatsächlichen
`CheckTournament`-Ablauf. **Vier originale Richtungsfehler** vergleichen auch
den Zustand nach allen vorherigen Änderungen. Die Original-Namenssuche behält
`^`-Farbcodes und entfernt wegen signed-char-Semantik Bytes ab 128.

Ein abschließendes ESC, leere Clientspannen und ungültige Zyklus-Startslots ohne
Kandidaten können in C ungültig lesen oder endlos suchen. MiniLang meldet dafür
begrenzte Fehler; diese Pfade zählen nicht als native Verhaltensgleichheit.
Spawn-Think-/Endframe-/Intermission-Callbacks bleiben hier beobachtet;
Die Intermission-/Levelende-Funktionen sind im nächsten Nachweis direkt verbunden.
Die vollständige [Befehlsverteilung](CLIENT_COMMANDS.md) ist separat geprüft.
Engine-Zustellung bleibt offen.
Details: [FOLLOW_TOURNAMENT.md](FOLLOW_TOURNAMENT.md).

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.

## Intermission und Levelende (Schritt 6)

`MoveClientToIntermission`, `BeginIntermission` und `ExitLevel` bestehen
**85 Szenarien** mit **182 Aktionen**, **14.213.657 exakt gleichen Wörtern**,
**57.981.936 Ausgabe-Bytes**, **503 geordneten Nebenwirkungen** und
**18 Laufzeitverträgen**.

Die Standardaufrufe aus Matchende-Prüfung und `ClientSpawn` verwenden nun die
tatsächlichen Ports. Verglichen sind Follow-Bereinigung, Kamera mit Ziel/Fallback,
echter Respawn, neue Clients während der Intermission, Duell-Siege/Niederlagen,
Verliererentfernung und Nachrücken, Scoreboards sowie Sitzungsspeicherung vor
`CON_CONNECTING`. Unterschiedliche `maxclients`-/Cvar-Limits, wiederholtes Begin/Exit,
Bereitschaft, Wartezeiten, Punktelimits und alle Sitzungs-Cvars sind eingeschlossen.
Die neue Integration ergänzt auch die zuvor fehlende `G_PickTarget`-Diagnose
bei vorhandenem Print-Host.

Der Einzelspieler-Postgame-/Podiumspfad ist als echter Standard implementiert,
mit 22 Verträgen geprüft und stimmt in fünf direkten Szenarien mit 1.343 Wörtern
gegen das unveränderte `g_arenas.c`. Bot-Interbreeding läuft standardmäßig über
den portierten Bot-Lifecycle-Kern. Die Engine
erhält `map_restart` beziehungsweise `vstr nextmap`, führt diese Befehle im Port
aber noch nicht als vollständigen Kartenwechsel aus. Spawn-Think-/Endframe bleiben
hier isolierte Overrides. Details: [INTERMISSION.md](INTERMISSION.md).

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.

## ClientCommand, Chat und Spielkommandos (Schritt 6)

`scripts/test_client_commands.py` besteht mit **221 Szenarien**, **687 Aktionen**, **42.518.499 exakt gleichen 32-Bit-Wörtern**, **1.333 geordneten Nebenwirkungen** und **203.944.229 Ausgabe-Bytes**.
**43 Laufzeitverträge** prüfen zusätzliche Speicher-/Schnittstellengrenzen.
Ein originaler Com_Error-Abbruch nach Startsolid beim Item-Give wird
einschließlich Diagnose, Freigabe und erreichtem Teilzustand verglichen.

Die aktuelle erweiterte Gesamtsuite besteht mit **61/61 Gates** einschließlich
aller **46 regulären Gates** und der zusätzlichen CD-Kartenvergleiche.

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
Fixture-Karte: `22631605b62b568cab3cec99ccfdf71a64ce9964f12b5e4256329ef30a769c3c`.

Alle 37 Funktionskörper aus g_cmds.c sind im nativen Vergleichshost
enthalten. Der neue Dispatcher verbindet die bisherigen Score-, Team-,
Follow- und Vote-Ports mit Textchat/Voice, Taunts, Cheats, Item-Give,
Suicide, Levelshot, Teamtask und Setviewpos. Argumente und Servermeldungen
werden bytegenau, Zustände vor und nach jeder Host-Zustellung verglichen.
Info-Mutation, Ortsfarben, native Formatdiagnosen, Userinfo-Speicherung
und Cheat-/Dedicated-Cvar-Spiegel sind integriert. Netzwerkzustellung,
Engine-Tokenizer/Command-Buffer, VM-Neuladen und weitere Spielsysteme
bleiben offen. Details und bewusste Grenzen: [CLIENT_COMMANDS.md](CLIENT_COMMANDS.md).

## Serververwaltung und Karteninitialisierung (Schritt 6)

| Bereich | Szenarien | Aktionen | Exakte Wörter | Geordnete Effekte |
| --- | ---: | ---: | ---: | ---: |
| [Spielarena und Spawn-Strings](GAME_MEMORY.md) | 53 | 1.566 | 125.480 | 412 |
| [Item- und Entity-Teaminitialisierung](GAME_INITIALIZATION.md) | 71 | 223 | 202.891 | 189 |
| [IP-Sperren und VM-Persistenz](IP_FILTERS.md) | 99 | 1.057 | 3.671.989 | 652 |
| [Serverkonsole und echte Teamwechsel](SERVER_COMMANDS.md) | 182 | 315 | 51.110.232 | 1.543 |

19 weitere Originalfunktionen sind portiert: sämtliche elf Funktionen aus
g_svcmds.c, drei Arena-Funktionen sowie fünf Funktionen für Item-Registrierung,
CTF-Initialisierung und Entity-Teams. G_NewString und der normale F_LSTRING-
Spawnpfad verwenden jetzt die echte MiniLang-Spielarena. Die Standardentscheidung
bei ClientConnect verwendet die portierten IP-Filter. forceteam führt tatsächliche
Team-, Todes-, Spawn- und Rangabläufe aus.

107 zusätzliche Laufzeitverträge prüfen definierte Schnittstellengrenzen.
Die Initialisierung normalisiert ausdrücklich 18 einzelne undefinierte CTF-Bytes;
die unveränderten nativen Rohbytes sind archiviert. Dafür wird keine exakte
Parität behauptet. Boterstellung und Botliste benötigen weiterhin ihre
ausdrücklichen Schnittstellen; Registry, Spawnqueue und Connect-Glue sind portiert,
und der Podium-Abbruch besitzt den echten Baseq3-
Standardpfad. [Modulstart/-shutdown](GAME_LIFECYCLE.md) ist
inzwischen verbunden; Engine-Kartenwechsel und VM-Neuladen, die vollständige Mover-Differentialabnahme,
Netzwerk, Darstellung und Bot-KI bleiben offen.

## Spielmodulstart, Shutdown und Protokollausgabe (Schritt 6)

| Bereich | Szenarien | Aktionen | Exakte Wörter | Geordnete Effekte |
| --- | ---: | ---: | ---: | ---: |
| [G_InitGame und G_ShutdownGame](GAME_LIFECYCLE.md) | 95 | 371 | 378.489.370 | 10.053 |
| [G_LogPrintf](GAME_LOGGING.md) | 106 | 783 | 12.779 | 1.359 |

Die Orchestrierung ruft die realen portierten Cvar-, IP-, Arena-, Session-,
Bodyqueue-, Spawn-, Item- und Teamfunktionen auf. Getrennte Level-/Entity-/
Clientresets, wiederholte Aufrufe im selben Modul, Logöffnung/-schluss,
Ressourcenregistrierung und die Bot-Schnittstellenreihenfolge werden gegen
unveränderte Originalkörper verglichen. 110 Lifecycle- und 13 Loggerverträge
prüfen zusätzlich Speicher-, Argument- und Hostgrenzen. Der Logger besitzt
4.148 ergänzende semantische Assertions; Konsole und Datei werden bytegenau
verglichen, einschließlich negativer Zeitstempel und rekursiver Callbacks.

Der integrierte Vergleich korrigierte die Startup-Versionsmeldung, die
schrittweise Ersetzung der acht Bodyqueue-Pointer und fehlende Spawn-Diagnosen.
Neun zusätzliche IP-Fälle sichern tatsächliche VM-Pufferkopien bei unverändertem
sichtbarem Text/Zähler ab. Drei zusätzliche Cvar-Fehlerfälle vergleichen den
bereits geänderten Zähler vor dem Abbruch bei 256 Bytes, während alte Werte und
Pufferinhalt erhalten bleiben; 1.615 Wörter, 24 semantische Assertions und neun
Mini-Verträge ergänzen die bisherigen Cvar-Nachweise.

Zehn einzelne undefinierte erste CTF-Statusbytes werden im Lifecyclevergleich
normalisiert und mit den nativen Rohbytes archiviert. Das ist kein Anspruch
auf Parität mit undefiniertem C-Speicher. Tatsächliches Engine-VM-Neuladen,
Kartenwechsel, Betriebssystem-Dateidienste, Bot-KI und die vollständige Mover-Abnahme
bleiben offen. Der Port ist weiterhin nicht spielbar.

## Weitere Karten-Targets und Portale (Schritt 6)

`scripts/test_map_objects.py` vergleicht **186 definierte Szenarien**, **2.699
Aktionen**, **647.091.128 exakte 32-Bit-Wörter** und **14.943 geordnete
Game-Delivery-Effekte**. 122 MiniLang-Verträge ergänzen diesen Vergleich.
Drei NULL-Formatierungsfälle mit 11.226.198 gleichen Wörtern sind getrennte
MSVC-CRT-Profilnachweise. Drei weitere Fälle archivieren native `va`-Überlappung
mit 11.962.468 Wörtern; sie zählen nicht als C-definierte Parität. Die Rohtexte
bleiben unverändert archiviert. 19 erste undefinierte CTF-Statusbytes werden
wie im Lifecycle-Host einzeln normalisiert und gesondert aufbewahrt.

Test-Binary: `7b533b848fa3047ebd278fec9647ae759744503d964087afd99c1f58897dd27f`.
Native x86-Oracle: `2cc10cbf9091f16d57da37d4d6bc08ab3275bfd224a7cd1a36d9af1abf133992`.
Kanonischer Bericht: `build/reference/map_objects/result.json`.

Die vier [Give-/Powerup-/Score-/Print-Targets](MAP_TARGETS.md) und die beiden
[Portal-Klassen](PORTALS.md) schließen die verbliebenen Nicht-Mover-Klassen.
Die zentrale Spawn-Auswahl enthält damit alle 48 Baseq3-Klassen und weiterhin
alle 35 Karten-Items. Die acht Mover-Klassen besitzen echte Spawn- und Framepfade.

Der neue Vergleich startet über das tatsächliche `G_InitGame` und führt die
unveränderten nativen Use-/Think-Körper aus. Item-Aufnahme, Flaggenrückgabe,
Punktevergabe, Teamfilter, Zufallszielsuche und Server-/Kollisionsverlinkung
laufen über die vorhandenen Originalports. Modellierter Zustand, konkrete
Callback-Identität, Meldungsbytes und geordnete Game-Delivery-Effekte werden
beobachtet. Die internen Trace-Payloads werden in den bestehenden Item-,
Combat- und Kollisionssuiten separat geprüft.

Die Portalregeln bewahren insbesondere den Link vor Flags und Entity-Typ,
fehlende und leere Targets, zwei getrennte Zufallsziehungen, Winkelverbrauch
im Fallback und die Double-Zwischenrechnung des Rollwinkels. `target_give`
löscht den Think-Termin und entfernt das Item aus der Serverweltverlinkung,
auch wenn die Aufnahme verweigert wurde. `target_remove_powerups` führt höchstens eine Flaggenrückgabe
mit Rot-vor-Blau-vor-Neutral-Vorrang aus und löscht danach sämtliche Powerups.
Die bisher fehlende NULL-Basisdiagnose von `Team_ReturnFlagSound` ist ergänzt.
Die CD-Spawn-Replays beobachten nun zusätzlich die Originaldiagnosen, darunter
Timer-/Multiple-Warnungen und fehlende Path-Corner-/Teleporter-/Laserziele;
entsprechende bisher stumme MiniLang-Pfade sind ergänzt. Bei identischen
Kartendaten und Eingaben bleiben 55 der 168 Spawnströme unverändert. 113
ändern sich durch 279 ersetzte Klassen-Aufrufgrenzen und 228 nun beobachtete
Diagnosen. Die Mover-Funktionen werden ebenfalls direkt durch das C-Orakel gebaut.
`scripts/test_mover_push.py` vergleicht fünf Schiebeszenarien mit der unveränderten
Originaldatei: linearen Erfolg, 90-Grad-Rotation mit Client-Yaw, blockierten
Rollback, `EF_MOVER_STOP` und den vollständigen Rollback eines zweiteiligen Teams.
Alle 545 verglichenen Zustandswörter stimmen exakt; 30 native Area-, Trace-, Link-
und Callback-Beobachtungen sind zusätzlich fest geprüft.

Verschachtelte `va`-Pufferüberlappung bei mehrfachem Teamempfang ist kein
ISO-C-definierter Vergleichsfall. Native Beobachtungen werden getrennt geführt;
MiniLang stellt den gespeicherten Text allen passenden Spielern zu.
Nicht darstellbare Roll-Casts und überlaufende Formatpuffer erhalten eigene
Verträge. `scripts/test_retail_movers.py` prüft zusätzlich die echten Entity-Lumps
von `q3ctf4`, `q3dm15` und `q3dm0`: Bobbing, drei Pendel, zwei rotierende Mover,
ein aktiviertes zweiteiliges Türteam und ein Button stimmen in 77.073.336 Wörtern
und 1.684 geordneten Effekten. q3ctf4 trägt zusätzlich einen gelinkten Spieler und
ein physikalisches Item über fünf vollständige Original-/MiniLang-Frames jeweils
664 Einheiten. Netzwerkzustellung und Portalansichten in Cgame/Renderer bleiben offen.

## Baseq3-Waffen (Schritt 6)

`scripts/test_weapons.py` besteht mit **235 Szenarien**,
**1.080 Aktionen**, **47.541.055 exakt gleichen 32-Bit-Wörtern**,
**589 Waffentraces**, **528 geordneten Nebenwirkungen**
und **226.841.083 Ausgabe-Bytes**. **14 Laufzeitverträge** prüfen
zusätzliche Schnittstellen- und Zustandsgrenzen. Der separate Protokollleser
bestätigt tatsächlich erreichte Treffer, Schaden, NoImpact-Flächen, Rail-Limit
und die einmalige Accuracy-Gutschrift bei direktem Raketen- plus Explosionsschaden.

Test-Binary: `5d0271914116e682bfda6552e0dc0384b03368f1e7b81268ae01767b6796da1b`.
Native x86-Oracle: `70862eaa75de21973c006a95d3ab96e2e606ba3949faa33ae085fdacc1fc843b`.
Fixture weapons-0.bsp: `98064ce978246d76db75ff41849a23f2bb76dea5c5513da16a85eb60c7c16657`.
Fixture weapons-16.bsp: `075c0ae49b3ad2148fde3426f66bf869c3f0228085afe850006bb6c6074ab391`.

Alle 21 Baseq3-Funktionen aus g_weapon.c sind zugeordnet; 17 davon kommen
in diesem Abschnitt hinzu. Die Standardaufrufe aus ClientEvents und
ClientThink führen echte Schadens-/Todes- und Projektilpfade aus.
Die gemeinsame Zielbasis, Mündung, Quad-Faktor, Zufallsfolge, Schuss- und
Trefferzähler werden mit dem unveränderten C-Code verglichen.
Ein dabei gefundener Aliasfehler wurde korrigiert: Pmove erhält eine eigene
Usercmd-Kopie, sodass TALK die später gelesenen ursprünglichen Tasten
nicht verändert. Netzwerk, Darstellung, Modulneustart und Missionpack
bleiben offen. Details: [WEAPONS.md](WEAPONS.md).

## Vollständiger Spielserverframe (Schritt 6)

`scripts/test_full_frame.py` besteht mit **sechs Szenarien**, **3.231 exakt
gleichen 32-Bit-Wörtern** und **12.992 Ausgabe-Bytes**. Drei Laufzeitverträge
prüfen Pflichtgrenzen, Clientlimit und Restart-Frühabbruch.

Geprüft sind Framezähler und Zeit, Cvar-Aktualisierung, die vorhandene
Entity-Schleife, Client-Endframes, die echten Tournament- und Matchende-Prüfungen
und anschließend Teamstatus, globale und Team-Votes sowie Cvar-Nachverfolgung. Auch
die 1.024 Einträge von `g_listEntity` und dessen Cvar-Reset laufen in der
Originalreihenfolge. Globale und Team-Votes führen inzwischen ihre portierten
Regeln aus; aktive Vote-Framefolgen sind zusätzlich in `test_votes.py` geprüft.
Teamstatus und `CheckCvars` führen inzwischen ebenfalls ihre portierten Regeln
aus; aktive Overlay-/Passwortfolgen sind in `test_team_status.py` geprüft.
`G_UpdateCvars` nutzt standardmäßig die portierte Engine-Registry und wird
zusätzlich in `test_game_cvars.py` in Frames ohne aktive Entities verglichen.
Die älteren Gameplay-Suiten behalten einen expliziten Refresh-Override;
Mover-/sonstige Physics-Ausführung bleibt eine Callback-Grenze. Details:
[FULL_FRAME.md](FULL_FRAME.md).

## Tournament und Warmup (Schritt 6)

`scripts/test_tournament.py` besteht mit **zwölf Szenarien**, **115 exakt
gleichen 32-Bit-Wörtern** und **547 Ausgabe-Bytes**. Drei Laufzeitverträge prüfen
Spawn-Zustand, leere Warteschlange ohne Override und Clientlimit.

Der unveränderte C-Code und MiniLang stimmen für Zwei-Spieler-Tournament,
FFA-/Team-Bereitschaft, CTF-Teamvoraussetzungen, `g_warmup`-Änderungen,
Countdown, Configstring/Log und `map_restart` überein. Auch der ursprüngliche
32-Bit-Zeitüberlauf ist abgedeckt. Die isolierte Suite verwendet einen
Promotion-Override; standardmäßig läuft der separat verglichene echte
`AddTournamentPlayer`-Ablauf. Engine-Zustellung bleibt eine Host-Grenze. Details: [TOURNAMENT.md](TOURNAMENT.md).

## Abstimmungen und Teamleiter (Schritt 6)

`scripts/test_votes.py` besteht mit **211 Szenarien**, **241 Aktionen**,
**85.655 exakt gleichen 32-Bit-Wörtern**, **363.153 Ausgabe-Bytes** und **456
geordneten Nebenwirkungen**. Elf Laufzeitverträge ergänzen die Differenzprüfung.

Geprüft sind `CheckVote`, `CheckTeamVote`, `PrintTeam`, `SetLeader` und
`CheckTeamLeader`: Mehrheiten, Timeout, verzögerte globale und sofortige
Team-Befehle, Configstring-Löschung, alle Empfänger, Leiterwechsel und die beiden
originalen Suchschleifen der automatischen Leiterwahl. Die Tests vergleichen
Vote-Zeiten an Host-Aufrufen und sämtliche Vote-/Team-/Leiterdaten nach jeder
Aktion. Echte Framefolgen prüfen die Einbindung in `G_RunFrame`.

`scripts/test_vote_commands.py` ergänzt **337 Szenarien**, **428 Aktionen**,
**967.073 exakt gleiche 32-Bit-Wörter** und **1.149 geordnete Nebenwirkungen**.
Weitere **19 Laufzeitverträge** prüfen Pflichtschnittstellen, Speichergrenzen und
die Integration mit registrierten Engine-/VM-Cvars.

Die vier ursprünglichen globalen/Team-Befehlshandler werden einschließlich
Argumentkopien, Berechtigungsreihenfolge, Maprotation, Namenssuche, Anzeigen,
Zählern und Flags verglichen. Jeder Host-Aufruf und jede Aktion prüft den
Vote-Zustand, alle 64 Clients und sämtliche zwölf Vote-Configstrings.
Aufruf, Stimmabgabe, Auflösung und fällige Befehlsausführung laufen gemeinsam.
Die originalen Besonderheiten bei `msg[1]`, nicht erhöhten Aufrufzählern und
vorzeitig ausgeführten Alt-Votes bleiben erhalten. Das mögliche Überlaufen
von `strcat` bei Teamargumenten wird kontrolliert abgewiesen.

Die isolierten Vote-Suiten verwenden einen `ClientUserinfoChanged`-Override;
die reale Standardverbindung mit Spieler-Configstrings wird jetzt separat in
`test_client_info.py` geprüft. Der vollständige [ClientCommand-Dispatcher](CLIENT_COMMANDS.md)
samt Intermission-Verhalten ist inzwischen verbunden. Kommando-Tokenisierung und
Netzwerk-/Engine-Zustellung bleiben offen. Details: [VOTES.md](VOTES.md).

## Teamstandorte, Overlay und Passwortstatus (Schritt 6)

`scripts/test_team_status.py` besteht mit **80 Szenarien**, **618 Aktionen**,
**59.233 exakt gleichen 32-Bit-Wörtern**, **275.011 Ausgabe-Bytes** und **288
geordneten Nebenwirkungen**. Zwölf Laufzeitverträge ergänzen die Differenzprüfung.

Die unveränderten Funktionen `Team_GetLocation`, `SortClients`,
`TeamplayInfoMessage`, `CheckTeamStatus` und `CheckCvars` werden mit der echten
originalen PVS-/Areaportal-Prüfung verglichen. Enthalten sind Float-Distanzen
und Gleichstände, strikt mehr als 1.000 ms Aktualisierungsabstand, getrennte
Cvar-/Level-Clientlimits, 32er-Overlay und Slot-Reihenfolge, Empfängerfilter,
alle Standorte vor dem ersten Paket, Passwortzähler und Modulzustand über
Level-Resets. Aktive Framefolgen prüfen die Einbindung.

Der Engine-Cvar-Refresh ist inzwischen separat portiert; Netzwerkzustellung und Clientanzeige bleiben offen;
formatierte Ortsnamen über `Team_GetLocationMsg` sind inzwischen mit den
[Chat- und Tell-Befehlen](CLIENT_COMMANDS.md) portiert und geprüft.
Details und Zustandslebensdauer: [TEAM_STATUS.md](TEAM_STATUS.md).

## Engine- und Spiel-Cvars (Schritte 3 und 6)

`scripts/test_game_cvars.py` besteht mit **94 Szenarien**, **1.087 Aktionen**,
**961.431 exakt gleichen 32-Bit-Wörtern**, **4.196.674 Ausgabe-Bytes** und
**20.271 geordneten Nebenwirkungen**. 13 Laufzeitverträge und vier native
Fehlerfälle prüfen zusätzlich ungültige Handles, Speichergrenzen und
Modulinitialisierung.

Geprüft sind die originale Engine-Registry mit `Cvar_Register`/`Cvar_Update`,
sämtliche 46 Baseq3-Cvar-Zeilen und 43 VM-Kopien sowie `G_RegisterCvars` und
`G_UpdateCvars`. Enthalten sind Latching, Neu-Registrierung, exakte Meldungen,
Warnung und Rücksetzen bei ungültigem Spielmodus, Zählerüberlauf, erhaltene
Snapshots und die Zuordnung zu den portierten Gameplay-Feldern. Der
standardmäßige Registry-Pfad läuft außerdem in `G_RunFrame`-Vergleichen ohne
aktive Entities; der Native-Host begrenzt Match-/Vote-Pfade auf den inaktiven Zustand.

Der Baseq3-Körper von `G_RemapTeamShaders` ist leer. Modulstart/-shutdown ist
inzwischen separat integriert. `cvar_restart` sowie `toggle`, `set`, `sets`,
`setu`, `seta`, `reset`, `cvarlist` und der direkte Cvar-Befehl laufen über den
produktiven Engine-Commandpuffer. Elf exakte Originaldatensätze und 15 Verträge
prüfen dabei Ausgabe, Flags, Mehrwortwerte, Filter, Reset und Latch-Anzeige.
Missionpack, Engine-VM-Neuladen und weitere QVM-Trap-Zustellung bleiben offen.
Details und Build-Datumsprofil: [GAME_CVARS.md](GAME_CVARS.md).

## ClientThink (Schritt 6)

`scripts/test_client_think.py` besteht mit **27 Szenarien**, **7.357 exakt
gleichen 32-Bit-Wörtern**, **29.702 Ausgabe-Bytes** und **77 geordneten
Nebenwirkungen**. Drei Laufzeitverträge prüfen die fehlende Usercmd-Schnittstelle,
echtes Raketenfeuer ohne Waffen-Override und Kontakt-Deduplizierung.

Enthalten sind Befehlszeit-Klemmung und feste Zeitschritte, vollständiges Pmove
mit dynamischer Kollision, normale/Noclip-/tote Spieler, freie und folgende
Zuschauer, Inaktivität, Regeneration, Haste, Gesten, Gauntlet, Hook-Freigabe,
Snapshots, Trigger/Kontakte, Button-Latches, Fallschaden, Waffenereignis, Medkit
und Teleporter mit Flag-Drop. `ClientThink` und `G_RunClient` sind als äußere
Zeitplaner geprüft. Die Referenz führt alle neun unveränderten Funktionskörper
aus `g_active.c` aus. Details: [CLIENT_THINK.md](CLIENT_THINK.md).

## ClientEndFrame (Schritt 6)

`scripts/test_client_frame.py` besteht mit **17 Szenariogruppen und 272
Frame-Ausführungen**, **51.275 exakt gleichen 32-Bit-Wörtern**, **205.122
Ausgabe-Bytes** und **sechs geordneten Nebenwirkungen**. Zwei Laufzeitverträge
prüfen die unabhängige vollständige PlayerState-Kopie und den isolierten
`ClientBegin`-Aufruf. Dieser ist inzwischen mit dem portierten Eintrittspfad verbunden.

Enthalten sind Powerup-Ablauf, Schadensrichtung, 255er-Kappung, Pain-Debounce,
Godmode/Tod, Noclip, Ertrinken, Lava/Slime, Battlesuit, Loop-Sound,
Intermission, normale und extrapolierte EntityStates, vorhersagbare
Ereignis-Entities sowie direktes und teambezogenes Zuschauer-Follow. Eine
256-Fälle-Matrix variiert Schadensvektor, -summe, -rückstoß, Godmode und Debounce.
Die native Referenz führt die unveränderten Funktionskörper von
`ClientEndFrame`, `SpectatorClientEndFrame`, `P_WorldEffects`,
`P_DamageFeedback`, `G_SetClientSound` und
`SendPendingPredictableEvents` aus. Details:
[CLIENT_FRAMES.md](CLIENT_FRAMES.md).

## Items, Pickups und CTF-Flaggen (Schritt 6)

`scripts/test_items.py` besteht mit **20 Szenarien**, **307 Aktionen**,
**451.312 exakt gleichen 32-Bit-Wörtern** und **30.625 String-Bytes**. Zwölf
Laufzeitverträge ergänzen die gültigen Vergleichsfälle. Nach jeder Aktion werden
vollständige Entity-/Client-/Level-Zustände, Configstrings, Registrierungsbits,
Nachrichten und der Zufallszustand verglichen.

Übertragen sind `RegisterItem`, `G_SpawnItem`, `FinishSpawningItem`, `RespawnItem`,
`Use_Item`, `Touch_Item`, sämtliche Baseq3-`Pickup_*`-Funktionen, `LaunchItem`,
`Drop_Item`, der ET_ITEM-Zweig von `G_RunItem`, `G_BounceItem` sowie Flaggenstatus,
Basis-Reset, Take-/Return-/Capture-Sounds und die vollständigen CTF-Punkte- und
Assist-Effekte. Die Fälle umfassen alle 35 Baseq3-Items, Aufnahmegrenzen,
Powerup-Denial, Ereignisse, Targets, Respawn, Teamketten, Abprall und echte
Serverkollision. Die Todes-Suite verwendet dieselben Drop-/Flaggenpfade.

[`ClearRegisteredItems`, `SaveRegisteredItems` und `G_CheckTeamItems`](GAME_INITIALIZATION.md)
sind inzwischen separat geprüft. Die native Paritätsprüfung
nichtnulliger Item-Deaktivierungs-Cvars, tatsächliche `PrintMsg`-Netzwerkzustellung
und Missionpack bleiben offen. Details: [ITEMS.md](ITEMS.md).

## Nachrichten-Huffman (Schritt 7)

`test_huffman_message.py` prüft den adaptiven Grundcodec aus `huffman.c` und
den mit 1.053.340 Baseq3-Häufigkeitsreferenzen initialisierten
`MSG_WriteBits`-/`MSG_ReadBits`-Pfad. Acht direkte Datensätze vergleichen
vollständige Bitströme und Ergebnisse aus unveränderten C-Funktionskörpern;
83 Verträge ergänzen Baumzustand, alle gültigen Breiten, Vorzeichen, Cursor und
Überlauf. Skalare, Usercmd-, EntityState- und PlayerState-Deltacodecs sind
inzwischen separat direkt gegen `msg.c` geprüft.
Details: [MESSAGE_IO.md](MESSAGE_IO.md).

## Entity-/PlayerState-Deltas (Schritt 7)

`message_state_delta.ml` bildet alle 51 Entity- und 48 Player-Netfields in
Originalreihenfolge ab. 108 direkte Orakeldatensätze vergleichen vollständige
Huffman-Paketbytes und die rekonstruierten Zustandswörter. Sie decken Skip,
Force, Remove, frühe und späte `lc`-Grenzen, Null-, integrale und vollständige
Floats, signierte Felder sowie alle vier Arraymasken ab. 28 MiniLang-Verträge
ergänzen Strukturgrenzen, Kopiersemantik und ungültige Feldzähler.

## Netchan-Sequenzen und Fragmentierung (Schritt 7)

`test_netchan.py` kompiliert fünf unveränderte Funktionskörper aus
`qcommon/net_chan.c` in einem isolierten Host und vergleicht sie mit
`qcommon/netchan.ml`. 29 Datensätze mit vollständigen hexadezimalen Paketbytes prüfen Setup, Client-/Serverheader, qport,
leere und kurze Nachrichten, 1300-Byte-Grenze, Null-Endfragment, Dropzählung,
Duplikate, Fragmentlücken, Retries, Sequenzwechsel während Teilmontagen und
vollständige Empfangsmontage. 29 MiniLang-Verträge ergänzen Dienst- und
Puffergrenzen sowie einen `message.ml`-Integrationstest. Der Zielpuffer wird
bewusst einschließlich des rekonstruierten Vier-Byte-Sequenzheaders geprüft;
damit schließt der Port einen Vier-Byte-Überlauf der Originalroutine. Der echte UDP-Versand bleibt im
Netchan als `sendPacketFn` injiziert. Der Client-Payloadcodec ist separat geprüft. Die
Client-Schicht aus `client/cl_net_chan.c` ist nun mit
allen fünf `CL_Netchan_*`-Funktionen portiert: neun direkte C-Orakeldatensätze
vergleichen vollständige Bytes und Zustände, 18 Verträge sichern Encode/Decode,
EOF, Fragmentweitergabe, Process und Größenfortschreibung. UDP und OOB bleiben
Hostgrenzen des Protokollmoduls. Details: [NETCHAN.md](NETCHAN.md).

`client/connectionless.ml` bildet Client-OOB und Resend aus `cl_main.c` ab.
17 direkte Datensätze führen `CL_CheckForResend`, `CL_DisconnectPacket` und
`CL_ConnectionlessPacket` unverändert aus; 27 Verträge prüfen Zustände,
Adressen, Timeouts, Callbacks und die vollständige Connect-Nutzlast. UDP-Empfang
und die Browserdatenhaltung bleiben eigene Grenzen. Details:
[CLIENT_CONNECTIONLESS.md](CLIENT_CONNECTIONLESS.md).

Die Serverschicht `server/netchan.ml` portiert alle fünf `SV_Netchan_*`-Pfade:
XOR-Encode/Decode, Process, `svc_EOF`, Fragmentfortsetzung und die unkodierte
FIFO mit sequenzabhängiger Kodierung beim Pop. Zwölf direkte Datensätze führen
die unveränderten Serverkörper gemeinsam mit den unveränderten Netchan-, MSG-
und Huffman-Körpern aus und vergleichen vollständige Paketbytes sowie Cursor-,
Sequenz-, Fragment- und Queuezustände. 26 Verträge prüfen zusätzlich beide
Process-Headerbreiten, Schlüsselsonderzeichen, Queuefehler und mehrstufigen
Fragmentdrain. Die interne Offset-null-Sicht hinter dem byteausgerichteten
4-/6-Byte-Header ist separat abgenommen und byteidentisch zum globalen C-Bitzeiger.

Die [Windows-UDP-Plattform](UDP_PLATFORM.md) implementiert den darunterliegenden
rohen Transport als kleine x64-DLL um Winsock 2.2 und als MiniLang-Wrapper.
Zwei nichtblockierende Localhost-Sockets übertragen in 13 Verträgen exakte
9- und 2.048-Byte-Payloads in beide Richtungen; Quelladresse, Quellport und
leere Receive-Queue werden ebenfalls geprüft. Noch offen ist die Live-Verkabelung
dieser Plattformaufrufe mit den `sendPacketFn`-Callbacks und dem Engine-Polling.

## Reproduzieren

Aus dem MiniQuake3-Verzeichnis, mit Python 3 und Visual Studio C++-Toolchain:

```powershell
python scripts/inventory.py
python scripts/assets.py D:/Quake3
python scripts/build_reference.py
python scripts/build_qvms.py
python scripts/reference_smoke.py D:/Quake3 --vm interpreter
python scripts/build_reference.py --observer
python scripts/reference_replay.py D:/Quake3
python scripts/build.py
python scripts/test_numeric.py
python scripts/test_math.py
python scripts/test_core.py
python scripts/test_vm.py
python scripts/test_retail_vm.py
python scripts/test_retail_vm.py --qvm-root build/reference/qvms
python scripts/test_archives.py --data-root D:/Quake3
python scripts/test_maps.py D:/Quake3
python scripts/test_rejections.py
python scripts/test_brush.py
python scripts/test_patches.py D:/Quake3
python scripts/test_collision.py D:/Quake3 --no-curves
python scripts/test_collision.py D:/Quake3
python scripts/test_movement.py D:/Quake3 --count 4096 --no-curves
python scripts/test_movement.py D:/Quake3 --count 4096
python scripts/test_pmove.py D:/Quake3 --count 4096 --no-curves
python scripts/test_pmove.py D:/Quake3 --count 4096
python scripts/test_runtime_trace.py D:/Quake3
python scripts/test_runtime_pmove.py D:/Quake3
python scripts/test_spatial.py D:/Quake3 --no-curves
python scripts/test_spatial.py D:/Quake3
python scripts/test_visibility.py D:/Quake3
python scripts/test_runtime_spatial.py D:/Quake3
python scripts/test_shared_game.py
python scripts/test_server_world.py D:/Quake3 --no-curves
python scripts/test_server_world.py D:/Quake3
python scripts/test_entitystate.py
python scripts/test_transitions.py D:/Quake3 --no-curves
python scripts/test_transitions.py D:/Quake3
python scripts/test_spawn_values.py
python scripts/test_game_memory.py
python scripts/test_initialization.py
python scripts/test_ip_filters.py
python scripts/test_server_commands.py
python scripts/test_targets.py
python scripts/test_combat.py --data-root D:/Quake3
python scripts/test_missiles.py --data-root D:/Quake3
python scripts/test_bodies.py --data-root D:/Quake3
python scripts/test_scores.py
python scripts/test_deaths.py
python scripts/test_items.py
python scripts/test_votes.py
python scripts/test_vote_commands.py
python scripts/test_team_status.py
python scripts/test_game_cvars.py
python scripts/test_full_frame.py
python scripts/test_spawn.py D:/Quake3
```

`inventory.py` aktualisiert bewusst den eingefrorenen Compilerstand. Für die
Wiederholung derselben Vergleichsbasis diesen ersten Befehl auslassen.
Tests und Builds nacheinander ausführen: Windows sperrt geladene native DLLs.
Vergleichsdaten und Logs liegen in `build/reference/` und `artifacts/reference/`.
Original-CD-Dateien werden ausschließlich gelesen; lokale Auszüge werden nicht eingecheckt.

Der Brush-Test isoliert den unveränderten Funktionskörper von
`CM_TraceThroughBrush` aus der Originaldatei in eine generierte C-Datei.
Seine Abhängigkeiten bleiben die Originalheader. Testfälle übergeben vorbereitete
Brush-Planes und Trace-Parameter; das ist keine vollständige `CM_BoxTrace`-Abnahme.
Die zusätzliche Kartenprüfung baut die vollständigen ursprünglichen Kollisionsdateien;
ihr Testhost stellt nur Speicher, Dateizugriff, Cvars und Diagnoseausgaben bereit.
Ein nicht verwendeter Debug-Callback bricht ab, falls er unerwartet aufgerufen wird.
Der abschließende CLI-Test prüft den gesamten Weg von `pak0.pk3` über den
MiniLang-Lader bis zur formatierten Trace-Ausgabe gegen zwölf ursprüngliche C-Felder.
Der dabei aufgezeichnete Binary-Hash bezeichnet den finalen Build; reine
Ausgabeformatänderungen können einen neueren Hash als der vorherige Kern-Testlauf haben.
### Server-Snapshot-Deltakette

`src/mq3/server/snapshot_build.ml` portiert `SV_AddEntToSnapshot`,
`SV_QsortEntityNumbers`, `SV_AddEntitiesVisibleFromPoint` und
`SV_BuildClientSnapshot`. Sechs Hostcallbacks grenzen Collision-Leafs, PVS,
Areabits und Area-Verbindungen ab. Fünf direkte Szenarien führen die vier
unveränderten Originalkörper aus und stimmen bei Entityfiltern, Broadcast,
Portalrekursion, Deduplizierung, Sortierung, Viewpoint, Areabit-Invertierung
und zirkulärer Ringablage überein. Hinzu kommen 26 MiniLang-Verträge.

`src/mq3/server/snapshot_runtime.ml` stellt die produktive Adaptergrenze zu
`collision.world`, `collision.visibility`, `server.world` und den Game-Level-
Entities her. 16 assetfreie Verträge prüfen Mapping, Synchronisierung, Wachstum,
Schrumpfen, Zählererhalt und Fehlergrenzen. Ein Retail-Lauf auf `q3dm0` verwendet
den Player-Spawn `(-984, -1056, 128)`, löst Leaf 2623, Cluster 1287 und Area 3
auf und kodiert die PVS-sichtbare Entity 64 plus Broadcast-Entity 65 als
sendefertiges 62-Byte-Paket. Der geprüfte BSP-Hash ist
`05e9540c598c9b1704c9853d61f2cd60c571735abcbf166609fcb4931fcde39b`.

`src/mq3/server/snapshot_delta.ml` portiert den sortierten Packet-Entity-Merge
aus `SV_EmitPacketEntities` einschließlich Baseline-Add, Remove, unverändertem
Skip, Entity-Delta, Ring-Wrap und Protokollterminator. Außerdem bildet das Modul
die unmittelbar anschließende Snapshot-Payload mit `svc_snapshot`, Serverzeit,
Lastframe, Flags, Areabits, Playerstate und Packetentities ab. Die Auswahl und
Speicherung der Clientframes sowie UDP-Scheduling bleiben Server-Hostgrenzen.

`test_snapshot_delta.py` extrahiert den unveränderten Originalkörper aus
`code/server/sv_snapshot.c` und vergleicht sechs vollständige komprimierte
Bytefolgen. Alle sechs Orakel-Datensätze und 26 MiniLang-Verträge sind grün.
`src/mq3/server/reliable_commands.ml` portiert außerdem
`SV_UpdateServerCommandsToClient`, die 64er-Ringadressierung und die zugehörige
Sequenz-/Acknowledgement-Semantik. Sieben komprimierte Streams aus dem
unveränderten Originalkörper stimmen vollständig überein; 19 MiniLang-Verträge
decken Resend, Acknowledge-Grenze, Einfügeüberlauf, Ring-Wrap und Hostfehler ab.
`src/mq3/server/snapshot_send.ml` führt den vollständigen Nachrichtenpfad vom
Client-Command-Acknowledgement bis zum Netchan-Callback aus. Die Deltaauswahl,
Rate-/Inactive-Flags, Padding, Downloadreihenfolge, `svc_EOF`, Frame-Metadaten
und Rate-/Snapshot-Terminierung liegen dabei in MiniLang. Sechs vollständige
komprimierte Nachrichten aus den unveränderten Funktionen
`SV_UpdateServerCommandsToClient`, `SV_WriteSnapshotToClient` und
`SV_EmitPacketEntities` stimmen bytegenau überein; 25 Verträge decken zusätzlich
Loopback/LAN, Rategrenzen, Inaktivität, Bot-Skip, Übertragungsgrenze und Fehler ab.
Der dabei aufgerufene Downloadcallback besitzt nun eine MiniLang-Implementierung
in `src/mq3/server/download.ml`. Zwölf direkte Datensätze aus unverändertem
`SV_WriteDownloadToClient`, `SV_NextDownload_f` und `SV_CloseDownload` stimmen
einschließlich komprimierter Paketbytes und Zustandsübergänge überein. 19
Verträge prüfen Achtblockfenster, 2.048-Byte-Blöcke, EOF, Acks, Timeout-Resend,
Rate- und Nachrichtenbudget sowie Ablehnungen.
`src/mq3/client/snapshot_parse.ml` ergänzt den Gegenpfad aus `CL_DeltaEntity`
und `CL_ParsePacketEntities`; 15 Verträge dekodieren darunter denselben
gemischten Original-Serverstream vollständig und prüfen Ring-, Baseline-,
Remove-, Tail-Copy-, Reihenfolge- und Trunkierungssemantik.

`src/mq3/client/snapshot_command.ml` bildet den davon getrennten äußeren
`CL_ParseSnapshot`-Zustandsübergang ab. `test_snapshot_command.py` extrahiert
`CL_DeltaEntity`, `CL_ParsePacketEntities` und `CL_ParseSnapshot` unverändert aus
`client/cl_parse.c`. Vier vollständige Übergänge prüfen Vollsnapshot, gültiges
Delta, ungültiges und dennoch vollständig konsumiertes Delta sowie die
Parse-Entity-Altersgrenze. Zehn Verträge ergänzen Header, 32-Byte-Areamask,
Clientframe-Ring, Lückenentwertung, Ping, Demo-Warteflag und Wertkopiersemantik.
`src/mq3/client/server_message.ml` portiert darüber `CL_ParseCommandString` und
`CL_ParseServerMessage`. Drei direkte Übergänge aus den unveränderten
Originalkörpern prüfen einen vollständigen Reliable-plus-Snapshot-Stream,
veraltete Acknowledgement-Reparatur, Duplikatunterdrückung, Ringmaskierung und
Gamestate-/Download-Dispatch. Zehn Verträge ergänzen `nop`, `EOF`, Trunkierung
und ungültige Opcodes. `src/mq3/client/download.ml` portiert zusätzlich
`CL_ParseDownload` mit Block-/Größenprüfung, Serverfehlertext, Dateiübergängen,
`stopdl`/`nextdl`, Zähler und EOF-Acknowledgement. Vier direkte unveränderte
C-Zustandsfolgen und 20 Verträge bestehen.
`src/mq3/client/gamestate.ml` ergänzt `CL_ParseGamestate`. Ein unveränderter
Original-C-Übergang und zwölf Verträge decken Configstring-Offsets und den
16000-Byte-Speicher, BigString, Baselines, Servercommand-Sequenz, `clientNum`,
`checksumFeed`, Reset und Abschlusscallbacks ab. `src/mq3/client/system_info.ml`
portiert die anschließende `CL_SystemInfoChanged`-Policy: Server-ID und Demo-
Schranke, Cheat-Reset, geladene und referenzierte Pure-Paks, geordnete Cvar-
Übernahme, case-insensitive `fs_game`-Erkennung/-Leerung und den über
`Cvar_VariableValue` gelesenen Pure-Zustand. Fünf Übergänge führen den
unveränderten Originalkörper samt unveränderten Info-Helfern aus; 22 Verträge
prüfen zusätzlich Fehler- und Gamestate-Bindungsgrenzen. Konkrete Cvar-/
Dateisystemdienste, Dateisystem-Neustart und Downloadinitialisierung bleiben Hostdienste.
`src/mq3/client/protocol_runtime.ml` installiert die konkreten Gamestate- und
Downloadhandler im Dispatcher und synchronisiert danach Baselines, Reliable-
Sequenz und Snapshotzustand. Zwölf Integrationsverträge führen Gamestate,
Downloadblock und Snapshot in einer Nachricht aus. Echte
Dateizugriffe und Live-Netzwerkzustellung bleiben Hostgrenzen.

`src/mq3/client/demo.ml` portiert das Protocol-68-Dateiframing von
`CL_WriteDemoMessage`, die Namensbildung von `CL_DemoFilename` und die
Wiedergabeübergänge von `CL_ReadDemoMessage`. Zwölf direkte Datensätze führen
diese drei Funktionskörper unverändert aus und vergleichen vollständige
Datensatzbytes, fünf Namensfälle sowie Erfolg, EOF und drei Trunkierungsgrenzen.
27 MiniLang-Verträge ergänzen Headerentfernung, verkettete Datensätze,
Größenablehnung, Sequenz-/Zeitstatus und den synthetischen Start-Gamestate. Die
historische Rückgabe `demo9999.tga` für ungültige Nummern ist dabei ausdrücklich
abgenommen. Dateisystemintegration und die laufende Demo-/Timedemo-Schleife sind
noch offen.

### Produktiver Client-Input

`src/mq3/client/input_command.ml` portiert den zusammenhängenden
`CL_CreateCmd`-Eingabekern aus `client/cl_input.c`: Zwei physische Quellen pro
Taste, zeitanteilige `CL_KeyState`-Werte, Lauf-/Gehgeschwindigkeit,
Tastaturwinkel, Mausfilter und -beschleunigung, die von
`CG_SETUSERCMDVALUE` gelieferte Sensitivität, Joystickachsen, kurz innerhalb
eines Frames gedrückte Buttons, Catcher-/Any-Key-Bits, die 90-Grad-Pitchgrenze
und die abschließenden Usercmd-Felder sind vorhanden. Die produktive
Retail-QVM-Vorschau erzeugt ihre Befehle über diesen Pfad statt über feste
WASD- und Mausformeln. Fünf Datensätze führen `CL_KeyState`, `CL_KeyMove`,
`CL_MouseMove` und `CL_JoystickMove` unverändert aus und vergleichen exakte
Floatbits und Befehlsfelder; 31 Verträge ergänzen Fehler- und Zustandsgrenzen.
Der native Retail-QVM-Lauf mit `D:/Quake3` besteht weiterhin mit 2.393
Dreiecken, 18 Texturen, 35 HUD-Quads und 125 Sounds. Die Windows-Abfrage
liefert derzeit gesampelte Übergänge; vollständig zeitgestempelte Plattform-
Events und frei konfigurierbare Bindings bleiben als Hostarbeit offen.

### OOB-Challenge und Direct Connect

`src/mq3/server/oob_connect.ml` portiert `SV_GetChallenge` und den Kern von
`SV_DirectConnect`: 1.024er Challenge-Ring, Wiederverwendung und ältester Slot,
LAN-/Authorize-Timeout, Protokoll 68, Challenge-/Ping-/Reconnect-Prüfung sowie
öffentliche, private und lokale Bot-Slotwahl. 13 direkte Datensätze führen beide
unveränderten Baseq3-Körper aus; 26 Verträge prüfen zusätzliche Ring-, Slot- und
Fehlergrenzen. `src/mq3/server/connectionless.ml` ergänzt den unveränderten
Dispatch von `SV_ConnectionlessPacket`: OOB-Markierung, tokenbasierte und
case-insensitive Befehlswahl, Connect-Dekompression ab Byte 12 sowie direkte
Anbindung von `getchallenge` und `connect` an den portierten OOB-Kern. Acht
exakte C-Dispatch-Datensätze und 18 Verträge decken `getstatus`, `getinfo`,
`getchallenge`, `connect`, `ipAuthorize`, `rcon`, `disconnect` und unbekannte
Befehle ab. UDP-Empfang, Status-/Info-Payloadaufbau, Rcon-Ausführung, externe
Autorisierung und Game-VM-Aufnahme sind explizite Hostdienste.

### Client packet event and live UDP transport

`src/mq3/client/packet_event.ml` portiert den sequenzierten Paketeingang aus
`CL_PacketEvent` mit Adressprüfung, Netchan-Process, Serversequenz sowie
Parse- und Demo-Reihenfolge. Neun direkte Datensätze aus dem unveränderten
C-Körper und 23 Verträge decken OOB, Runt, falsche Absender, abgelehnte
Sequenzen, erfolgreiche Pakete und Demo-Wait ab.

`src/mq3/qcommon/net_transport.ml` verbindet die Protokollschichten mit dem
geprüften Winsock-Wrapper. 15 echte UDP-Verträge prüfen Netchan-Callback,
Quelladresse, OOB-Marker, Text und den komprimierten Connect-Roundtrip.
`Huff_Compress` und `Huff_Decompress` stimmen im erweiterten unveränderten
C-Orakel bytegenau überein; das Huffman-Gate umfasst nun zehn Datensätze und
83 Verträge.

### Network runtime integration

`src/mq3/qcommon/network_pump.ml` leert beide nichtblockierenden UDP-Sockets
mit explizitem Framebudget und alternierender Priorität. 20 Verträge verwenden
echte Localhost-Sockets und prüfen FIFO, Fairness, leere Queues, Restbudget,
beide Richtungen und Binärdaten bis 2.048 Byte.

`src/mq3/server/packet_event.ml` portiert `SV_PacketEvent`: OOB-Routing,
Runt- und Adressprüfung, qport-Clientsuche, NAT-Portkorrektur, Netchan,
Zombie-Regel, Zeitstempel und ClientMessage-Callback. Zehn unveränderte
C-Datensätze und 28 Verträge sind grün. Der äußere Parser
`src/mq3/server/client_message.ml` ergänzt Server-ID-, Download- und
Acknowledgement-Policy, wiederholte ClientCommands, EOF sowie Move/NoDelta.
13 unveränderte C-Datensätze und 15 Verträge bestehen. Der anschließende
`SV_ExecuteClientCommand`-Dispatcher fängt alle acht Engine-Befehle ab und
leitet unbekannte Befehle nur bei aktivem Spielzustand und bestandener
Floodprüfung an die Game-VM weiter. Neun unveränderte C-Datensätze und 16
MiniLang-Verträge bestehen.

Der Reliable-Rumpf `SV_ClientCommand` behandelt Duplikate, Sequenzlücken,
Floodschutz und den für die Netchan-XOR-Kodierung maßgeblichen letzten Befehl.
Elf unveränderte C-Datensätze und 20 Verträge bestehen. Der produktive
`server.network_ingress`-Adapter führt UDP-Pump, PacketEvent, Netchan und
ClientMessage in 19 echten Localhost-End-to-End-Verträgen zusammen.

Der echte Localhost-Handshake besteht 20 weitere Verträge vom `getchallenge`
bis zum ersten serverseitig dekodierten Netchan-Paket. Dabei wurden quoted
Userinfo-Tokenisierung und das gültige OOB-Datagrammende ohne NUL gegen die
Originalsemantik korrigiert. `SV_UserMove` ergänzt keyed Usercmd-Decodierung,
Frame-Ack, Pure/CP-Gates, EnterWorld und ClientThink; zwölf unveränderte
C-Datensätze und 30 Verträge bestehen. 14 weitere Integrationsverträge
schließen ClientMessage, Reliable-Command, Dispatcher und UserMove über einen
gemeinsamen Clientzustand zusammen.

Der Client-Ingress verbindet den NetworkPump mit `CL_PacketEvent`,
Client-Netchan und `CL_ParseServerMessage`; 21 echte Localhost-Verträge prüfen
Reliable Commands, OOB, Demo-Grenze und beide Pumpseiten. Der Desktop-Framehost
ergänzt in 25 Verträgen Winsock-Lebenszyklus, Socket-Bindings, Pumpbudget,
gekappte Framezeit, Server-/Client-Reihenfolge, Rollback und Shutdown.
`SV_CalcPings` stimmt in vier unveränderten C-Datensätzen überein und besteht
16 MiniLang-Verträge. `SV_CheckTimeouts` ergänzt sechs unveränderte C-Fälle und
24 Verträge, `SV_CheckPaused` 23 und 22 sowie `SV_SendClientMessages` mit
`SV_RateMsec` drei und 19. Die äußere `SV_Frame`-Komposition stimmt in neun
unveränderten C-Datensätzen überein und besteht 28 Verträge, einschließlich
Kill/Restart, Residualzeit, Info-Config, Bot-/Game-Frames und Heartbeat.

`src/mq3/client/network_match_loop.ml` schließt den laufenden sequenzierten Pfad
in beiden Richtungen. Sieben echte Localhost-Winsock-Clientframes führen
Usercmds über `CL_SendCmd`, Netchan, Server-Ingress und `SV_UserMove`; der Server
antwortet mit Reliable Commands und Full-/Delta-Snapshots. Ein absichtlich
verlorenes Clientpaket wird durch `cl_packetdup 1` im Folgetelegramm
nachgeliefert, ohne dass ein später erneut eingespeistes Duplikat die Spieleingabe
zweimal ausführt. Nach einem verlorenen Server-Snapshot akzeptiert der Client den
nächsten Delta-Snapshot über die ältere, weiterhin gültige Basis; duplizierte
Snapshots verwirft er. `cl_nodelta` erzwingt anschließend die vollständige
Recovery. Neun Originalanker und 48 Live-Verträge prüfen Sequenzen,
Dropped-Zähler, Reliable-Ringe, Checksum-Key, OutPacket/Ping, Snapshot-Acks,
Command-Time und Rekonstruktionsbasen. Ein zweiter echter Client teilt denselben
Server-Ingress, behält jedoch eigene Socket-, QPort-, Netchan-, Reliable-, Usercmd-
und Snapshot-Zustände; beide Clients parsen die Entity des jeweils anderen.
Vor der Aktivierung absolvieren beide Sockets `getchallenge`,
`challengeResponse`, komprimiertes `connect` und `connectResponse`; Adresse,
Challenge, QPort und Server-Slot werden geprüft. Elf Originalanker plus 67
Live-Verträge prüfen den vollständigen Pfad. Ein anschließender 384-Frame-Lauf
liefert 768 Usercmds genau einmal aus, kompensiert 22 verlorene Clientpakete und
20 verlorene Snapshots, verwirft 16 Client- und 13 Snapshot-Duplikate und lässt
die Reliable-Ringe mit 77 Client- sowie 65 Serverbefehlen mehrfach umlaufen.
`network_match_loop` synchronisiert dabei die UDP-Verbindungszustände mit den
produktiven `CL_Frame`-/`SV_Frame`-Timeoutentscheidungen. Die Abnahme über das
öffentliche Internet bleibt offen.

### QVM-Renderfx und First-Person-Tiefenbereich

`src/mq3/renderer/qvm_scene_geometry.ml` bewahrt nun `refEntity_t.renderfx`
durch die produktive MD3-, Sprite-, Beam-, Rail- und Lightning-Expansion sowie
durch Portal-Clipping. `src/mq3/renderer/qvm_scene_batch.ml` trennt
`RF_DEPTHHACK`-Dreiecke in einen eigenen retained Material-Batch und zeichnet
ihn wie `RB_RenderDrawSurfList` mit dem Baseq3-Tiefenbereich 0..0.3; danach wird
der normale Weltbereich auch auf Fehlerpfaden wiederhergestellt. Damit nutzt
auch die unveränderte cgame-QVM für ihre First-Person-Waffen den vorgesehenen
Tiefenbereich. Neun Batch-Verträge prüfen Trennung, Geometrieerhalt und einen
Renderfx-Wechsel im Refresh-Pfad; 22 Portal-Verträge prüfen zusätzlich den
Metadatenerhalt beim Clipping. Der Batch-Benchmark mit 1.728 Dreiecken und 20
Refresh-Frames bleibt grün. `RF_SHADOW_PLANE` erzeugt jetzt zusätzlich für
animierte QVM-MD3-Flächen die Projektion aus `RB_ProjectionShadowDeform`: die
Vertices folgen der Entity-Lichtrichtung bis zur übergebenen horizontalen
Schattenebene, flache Lichtvektoren werden wie im Original auf 0,5 begrenzt,
und ein zweiseitiges, transparent-schwarzes Decal mit Polygon-Offset verhindert
Z-Fighting. 37 Geometrie- und 19 Materialverträge prüfen Projektion, Clamp,
produktive Draw-Surface sowie Blend-, Sortier- und Offsetzustand. Die
Stencil-Shadow-Volumes aus `RB_ShadowTessEnd`/`RB_ShadowFinish` und die
vollständige `RF_NOSHADOW`-Policy bleiben offen.

### QVM-Inline-Brushmodelle

`R_LoadSubmodels`/`R_AddBrushModelSurfaces` besitzen nun einen produktiven
MiniLang-Pfad. Die Cgame-Registrierung von `*N` extrahiert exakt den im
BSP-`dmodel_t` angegebenen Bereich aus `firstSurface` und `numSurfaces` statt
nur einen String-Platzhalter abzulegen. Planare Flächen, Triangle-Soups und
Patches behalten Shadernamen, Vertexfarben, Basis- und Lightmap-UVs,
Lightmapindex sowie Fogindex. Beim QVM-Frame werden sie mit Origin und Achsen
der `refEntity_t` in Weltkoordinaten überführt und durch denselben
Mehrstufen-Materialbatch wie MD3-Entities gezeichnet. Der vorhandene
q3dm12-Beleg umfasst 63 Inline-Modelle, 200 Flächen und 425 vollständig
lightmapped Dreiecke. Ihr BSP-Fogindex speist jetzt außerdem im Haupt- und
Portalblick denselben abschließenden Nebel-Overlay und die stufenabhängige
Nebelabschwächung wie die statische Welt; der Retained-Refresh baut die
Nebelkoordinaten nach jeder Bewegung aus den aktuellen Weltpositionen neu auf.
`R_SetupFrustum` erzeugt aus `fov_x`, `fov_y`, Ursprung und Viewachsen die vier
originalen Seitenebenen. `R_AddBrushModelSurfaces` prüft die aus dem BSP-Modell
bewahrten Bounds mit `R_CullLocalBox` bereits vor der Transformation und lässt
vollständig außerhalb liegende Brushmodelle sowohl im Haupt- als auch im
Portalblick aus. Dadurch erreichen unsichtbare Türen und Plattformen weder
Geometrieexpansion noch Materialbatch. Der produktive QVM-Pfad übernimmt zudem
die BSP-`SURF_NODLIGHT`/`SURF_SKY`-Entscheidung und hängt nur deckende
Brushflächen an den vorhandenen `ProjectDlightTexture`-Pass. Bewegte Flächen
aktualisieren dabei ihre Projektionsgeometrie, Entity-Origin und Achsen pro Frame.
Wie `R_TransformDlights` wird jedes Weltlicht vor der S/T-Projektion und
Z-Abschwächung in das lokale Koordinatensystem auch gedrehter Brushmodelle
transformiert; die gezeichneten Vertices bleiben in Weltkoordinaten. MD3-Modelle
verbleiben auf ihrem eigenen Lightgrid-/Entity-Lichtpfad. Vor der Projektion
bildet der Port außerdem die drei achsenweisen Vergleiche von `R_DlightBmodel`
gegen die um den Lichtradius erweiterten lokalen Modellgrenzen nach. Dadurch
erreichen entfernte Lichter die Brushflächen nicht. Zwei unveränderte
C-Datensätze aus `R_TransformDlights`/`R_DlightBmodel`, 13 direkte
Dynamic-Light-Verträge, 63 BSP-, 42 Geometrie-, 15 Batch-,
15 unveränderte C-View-Math-Datensätze, 39 View-Math- und 23
Portalverträge prüfen zusätzlich Parsing, Transformation, Retained-Refresh und
Clipping der neuen Metadaten sowie sichtbare und rückwärtige Bounds.

### BSP-Lichtflares

`MST_FLARE`-Flächen werden jetzt wie `ParseFlare` aus Shader-/Fogindex,
`lightmapOrigin`, `lightmapVecs[0]` als Farbe und `lightmapVecs[2]` als Normale
in einen eigenen Katalog übernommen. Nach Welt und Cgame-Geometrie liest der
produktive Win32-Rasterizer die tatsächliche Augenraumtiefe am Flare-Mittelpunkt,
wendet die strikte 24-Einheiten-Sichtbarkeit aus `RB_TestFlare` an und führt den
zustandsbehafteten linearen `r_flareFade`-Übergang getrennt für Haupt- und
Portalansichten. Sichtbare Flares verwenden Baseq3s
`viewportWidth * (r_flareSize/640 + 8/-eyeZ)`-Größe, Normalenausrichtung,
additives Blending und das echte `flareShader`-Bild aus dem Retail-PK3. Fehlt
dieses Bild, wird kein Ersatz gezeichnet. Der archivierte `r_flares`-Cvar behält
den Originalstandard `0`; der Pass wird erst bei gesetztem Cvar aktiv. Wie
`RB_RenderFlare` reicht der Port den behaltenen Fogindex an den additiven
Flare-Shaderpfad weiter: die Baseq3-Fogdichte moduliert dabei RGB, während Alpha
unverändert bleibt. `RB_AddDlightFlares` läuft nun ebenfalls im produktiven
Cgame-Pfad: jedes Szenenlicht wird anhand der ersten einschließenden axialen
BSP-Foggrenzen oder Fog null eingeordnet und verwendet ohne
Oberflächen-Normalenfaktor denselben Tiefentest, Fadezustand und Flare-Shader.
Haupt- und Portalansichten halten dafür getrennte Zustände, sodass Waffen-,
Projektil- und sonstige Cgame-Lichter nicht zwischen Ansichten flackern. 22
Verträge prüfen Parsing, Fogoffset, Tieftoleranz, Ein-/Ausblenden, Größe,
Normalenfaktor, Fogmodulation, inklusive Foggrenzen, unabhängige dynamische
Ansichtszustände und das Verwerfen nicht erneut eingereichter Lichtslots. Der native `/W4 /WX`-Lifecycle-Test prüft zusätzlich gelöschte,
gesetzte und außerhalb liegende Depth-Samples. Ein explizit mit `r_flares 1`
abgenommener sichtbarer Retail-Lauf bleibt offen.

### Adaptive BSP-Patchgitter

Der produktive Weltpfad verwendet für `MST_PATCH` jetzt den Kern von
`R_SubdividePatchToGrid`: den senkrechten Abstand des Bézier-Mittelpunkts von
der Endpunktsehne, wiederholte de-Casteljau-Halbierung derselben Spanne, die
originale 65-Punkte-Grenze je Achse, den transponierten zweiten Achsendurchlauf,
`PutPointsOnCurve`, ganzzahlige Byte-Farbmittelung und das Entfernen kollinearer
Kontrollzeilen und -spalten. `MakeMeshNormals` rekonstruiert anschließend jede
Patchnormale aus bis zu acht Richtungen, sucht bis zu drei Punkte weit durch
degenerierte Nachbarn und verbindet geschlossene Patchränder wie das Original.
Die Auswahl sichtbarer Weltflächen berechnet ihr
Dreiecksbudget aus demselben adaptiven Gitter und kann deshalb keine anders
tessellierte Schätzung mehr verwenden. 63 BSP-Verträge prüfen unter anderem
das 5x5-Gitter einer stark gekrümmten Fläche, den groben 3x3-Fall, die Reduktion
einer ebenen 3x3-Fläche auf zwei Dreiecke und die Zwischenwerte. Der bewahrte
`q3dm1`-Probe verarbeitet 2.097 Flächen, davon 113 Patches, zu 17.723
Dreiecken. 75 auf sechs Dezimalstellen verglichene Datensätze aus der
unveränderten C-Funktion prüfen zusätzlich ein gekrümmtes und ein geschlossenes
5x5-Normalenfeld sowie eines mit degenerierten Nachbarn.
LOD-Fehlertabellen und das Stitching benachbarter LOD-Gruppen, die
Tristrip-Ausrichtungsoptimierung sowie `R_GridInsertRow/Column` bleiben offen.

### QVM-Modelllicht ohne Weltmodell

`playable_light_grid.noWorldEntitySample` bildet nun den Fallback aus
`R_SetupEntityLighting` für `RDF_NOWORLDMODEL` nach: bei der im Softwarepfad
verwendeten `identityLight` 1.0 sind dies 150 Einheiten Umgebungs- und
gerichtetes Licht, der im Original bedingungslos aktive 32er Mindestlichtanteil
und die normalisierte Standard-Sonnenrichtung `(0.45, 0.3, 0.9)`. Aktive
dynamische Lichter werden wie im C-Pfad anschließend aufaddiert. Die produktive
QVM-Geometrie wählt diesen Pfad für Menü- und modellfreie Refdefs. Der produktive
Lightmap- und Light-Grid-Decoder verwendet außerdem die unveränderte
`R_ColorShiftLightingBytes`-Rechnung: ohne Hardware-Gammaramp wird Baseq3s
Standarddifferenz `r_mapOverBrightBits(2) - tr.overbrightBits(0)` angewandt und
helle RGB-Werte werden proportional normalisiert statt weiß abgeschnitten. Sieben
unveränderte C-Datensätze, 63 BSP-, 23 Light-Grid- und 42 QVM-Geometrieverträge
prüfen Konstanten, Bytewerte, Richtung, dynamisches Licht und die tatsächlichen
MD3-Vertexfarben. Map-spezifische `q3map_sun`-Richtungen und die Laufzeitbindung
frei konfigurierbarer Overbright-Cvars bleiben als Teil der vollständigen
Renderer-Parität offen.
