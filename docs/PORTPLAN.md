# MiniQuake3: Portplan in zehn Schritten

## Ziel und verbindliche Vergleichsbasis

Portiert wird der [festgehaltene Originalstand](UPSTREAM.md) von Quake III Arena
nach MiniLang, mit möglichst identischem beobachtbarem Verhalten. Erste Plattform
ist Windows x64, erste vollständige Spielabnahme `baseq3`. Vollständigkeit umfasst
Engine, Dedicated-/Listen-Server, Client, Spielcode, UI, Bots, Grafik, Audio und
Demo-Wiedergabe. Team Arena (`MISSIONPACK`, unter anderem `code/ui`) erhält eine
eigene Abnahmematrix in Schritt 10. Q3Radiant, q3map, bspc, lcc und q3asm bleiben
zunächst originale Entwicklungswerkzeuge; eine MiniLang-Neufassung dieser Werkzeuge
ist ein Folgeprojekt. Original-QVMs müssen ausführbar bleiben; ein MiniLang-zu-QVM-
Compiler ist für die native MiniLang-Portierung nicht vorausgesetzt.

Jeder Schritt liefert Quellzuordnung, Tests und einen Ergebnisbericht. Fortschritt
wird erst nach bestandenem Abnahmekriterium markiert. Referenzdaten fixieren
Quellrevision, Build, Architektur, FP-Modus, Spieldaten-Hashes, Cvars, Seed,
Ereignisfolge und Simulationszeit. Der unveränderte C-Stand liefert das Orakel;
notwendige Build-Patches werden getrennt versioniert und inhaltlich geprüft.

Protokoll- und Dateibytes, diskrete Zustände, Ereignisse und Syscalls werden exakt
verglichen. Für Fließkommawerte wird zuerst dieselbe Rundung wie im gewählten
Referenzpfad verlangt. Verbleibende Unterschiede durch Referenzarchitektur oder
GPU werden pro Messgröße begründet; keine pauschale Epsilon-Freigabe für Physik.
Screenshots erhalten definierte Masken und Grenzwerte, Audio wird vor dem Gerät
als PCM verglichen. Performanceoptimierungen folgen erst nach Verhaltensnachweis.

## 1. Referenz reproduzierbar bauen und Quellumfang inventarisieren

**Arbeit:** Originale Engine, Dedicated-Server sowie `qagame`, `cgame` und `ui`
als Referenz aufbauen. Historische 32-Bit-Annahmen und Compilerabhängigkeiten
explizit erfassen; einen heutigen x64-C-Build nicht ungeprüft als Original erklären.
Ein verbindliches Referenzprofil festlegen, einschließlich QVM-Interpreter und
gegebenenfalls nativer Module. Einen Satz kurzer Demos, Eingabefolgen und
Serverläufe mit festgelegten Spieldaten aufnehmen.

Alle Quelldateien in einem `PORT_LEDGER.json` nach Laufzeit, Werkzeug, Plattform,
Drittbibliothek und Missionpack einordnen. Pro Datei Originalsymbol, MiniLang-Ziel,
Status und Vergleichstest führen. Compiler, Standardbibliothek und lokale Änderungen
mit Hashes einfrieren; Quake-/Quake2-Helfer nur nach Semantikprüfung übernehmen.

**Ergebnis:** `docs/reference/`, `tests/reference/`, `PORT_LEDGER.json`, reproduzierbare
Referenz-Buildskripte und ein minimaler MiniLang-Build mit assetfreiem Testlauf.

**Abnahme:** Zwei Referenzläufe mit identischer Ereignisfolge liefern dieselben
normalisierten Zustandsprotokolle. Jede Originaldatei ist erfasst; notwendige
Build-Patches und offene Compilerlücken sind sichtbar. Abhängigkeiten: keine.

## 2. C-Zahlenverhalten, Speicher und MiniLang-Plattformgrenze sichern

**Quellen:** `code/game/q_shared.h`, `q_shared.c`, `q_math.c`,
`code/qcommon/qfiles.h`, `code/win32/` und `code/unix/`.

**Arbeit:** Explizite Helfer für vorzeichenbehaftete/vorzeichenlose 8-/16-/32-Bit-
Werte, Wraparound, Shifts, Casts, IEEE-754-binary32, Float-Bitcasts, Byteordnung,
C-Strings und gepackte Bytepuffer entwickeln. Operationen und Zwischenrundungen
gegen kleine C-Proben prüfen, einschließlich `Q_rsqrt`, Vektormathematik und
Float-zu-Integer-Snapping. Native x64-Pointer strikt von 32-Bit-QVM-Adressen trennen.
Pointerarithmetik, Aliasing und Lebensdauer durch dokumentierte Puffer/Handles abbilden.

MiniLang dokumentiert `extern` mit `double`, Integern, Pointern und Bytepuffern;
eine direkte C-`float`-ABI ist dort nicht zugesichert. Daher Float-Aufrufe und
Callback-/Varargs-Bedarf zuerst praktisch prüfen und gegebenenfalls einen kleinen
ABI-Adapter oder eine gezielte Compilererweiterung liefern. OS-Brücken für Fenster,
Eingabe, monotone Zeit, Dateien, UDP, Audio und OpenGL getrennt halten. Keine
Spielregeln in diese Brücken verlagern. GC-Lebensdauer bei nativen Puffern testen.

**Ergebnis:** `src/compat/`, `src/platform/`, begrenztes `native/` und numerische
Differentialtests mit Grenzwerten und zufällig erzeugten Fällen.

**Abnahme:** Alle festgelegten C-Proben bestehen bitgenau; ein Fenster- und ein
Headless-Test können Ereignisse, Timer und Puffer sicher verarbeiten. Compiler-
Fehlstellen sind behoben oder als begrenzte Ausnahme erfasst. Voraussetzung: 1.

## 3. Engine-Kern, Konsole und virtuelle Dateisysteme portieren

**Quellen:** `code/qcommon/common.c`, `cmd.c`, `cvar.c`, `files.c`, `unzip.c`
und die gemeinsamen Parser aus `code/game/q_shared.c`.

**Arbeit:** Initialisierung, Frame-/Event-Schleife, Fehlerpfade, Speicherarenen,
Command-Buffer, Tokenizer, Aliase soweit vorhanden, Cvars einschließlich Flags,
Latching und Config-Persistenz übernehmen. PK3/ZIP-Suche, Verzeichnisreihenfolge,
Mod-Suchpfade, Dateinamenvergleich, Checksummen und Pure-Server-Dateilisten abbilden.
Native ZIP-Helfer nur mit festgelegter Grenze; Such- und Pure-Logik bleibt MiniLang.

**Geprüfter Teilstand:** Die [Engine-/VM-Cvar-Registrierung und -Aktualisierung](GAME_CVARS.md)
ist einschließlich stabiler Handles, Latching und Spielmodul-Tabelle portiert.
Die gemeinsame [Info-Schlüsselsuche und -Validierung](CLIENT_INFO.md) ist gegen
die Originalfunktionen geprüft und mit Userinfo sowie `ClientSpawn` verbunden.
`Info_RemoveKey` und `Info_SetValueForKey` ergänzen inzwischen die über
[`teamtask`](CLIENT_COMMANDS.md) geprüfte Userinfo-Mutation.
Der Engine-Command-Buffer ist einschließlich Tokenisierung, Argumentzugriff,
Quote-/Kommentargrenzen, Registrierung, Move-to-front-Dispatch und den eingebauten
`cmdlist`-, `exec`-, `vstr`-, `echo`- und `wait`-Pfaden portiert. Datei-, Cvar-,
Client-, Server- und UI-Übergänge sind explizite Dienste. 28 Puffer-/Tokenizer-
und 16 Registry-Differentialdatensätze sowie 16 MiniLang-Verträge vergleichen
die Originalkörper. Die Startup-Kommandozeile trennt zusätzlich Quotes, Plus-,
CR-/LF-Grenzen und höchstens 32 Abschnitte, verbraucht `safe`/`cvar_restart`,
setzt frühe `set`-Cvars und reiht verbleibende Befehle in den Command-Buffer ein;
10 direkte Differentialdatensätze und 16 Verträge decken diesen Ablauf ab.
Die benannte [QVM-Laufzeitverwaltung](VM_RUNTIME.md) ergänzt drei Slots,
case-insensitive Wiederverwendung, Call-Kontext, Restart und Freigabe in 17
Verträgen. Die Ausführung von `cvar_restart`, Config-Persistenz und die
vollständige Client-Schleife bleiben offene Teile dieser Abnahme.

**Ergebnis:** Headless-Engine mit Konsole, Configs und PK3-Lesezugriff;
synthetische Archive und Parser-Testfälle ohne kommerzielle Daten.

**Abnahme:** Identische Befehlsfolgen liefern identische Cvar-Zustände und
Dateiauflösungen; Checksumme und Pure-Listen entsprechen der Referenz.
Fehlerhafte Archive und Suchpfadkonflikte sind getestet. Voraussetzungen: 1–2.

## 4. QVM und Modulverträge kompatibel machen

**Quellen:** `code/qcommon/vm*.c`, `vm_local.h`, `code/game/g_public.h`,
`code/cgame/cg_public.h`, `code/ui/ui_public.h` sowie die jeweiligen Syscall-Dateien.

**Arbeit:** Zuerst den QVM-Interpreter in MiniLang portieren: Header, Code/Data/BSS,
Instruktionsdecodierung, Stack, Sprünge, Speicherzugriffe und Float-Instruktionen.
`vmMain`, Trap-Nummern, Argumentbreiten, Float-Bitübergabe und Engine-Callbacks
unverändert nachbilden. Eine gemeinsame Modulgrenze erlaubt wahlweise Original-QVM
oder portierte MiniLang-Module. Noch fehlende Engine-Traps im Vertragstest mit
aufgezeichneten Antworten bedienen; dies ausdrücklich nicht als Spielabnahme zählen.
JIT erst nach Interpreterparität erwägen, native Fremdmodule gesondert behandeln.

**Ergebnis:** `src/vm/`, Moduladapter und kleine QVM-Testprogramme samt C-Orakel.

**Abnahme:** Opcodes, Stack und Syscalls stimmen in Instruktionstraces überein;
Originalmodule laden und bestehen Initialisierungs-/Vertragstests. Fehlerhafte
QVMs werden kontrolliert behandelt; vollständige Integration folgt in 6–10.
Voraussetzungen: 2–3.

Der QVM-Lebenszyklus verwaltet jetzt drei benannte, ohne Groß-/Kleinschreibung
wiederverwendete Slots, sichere Call-Kontexte, Image-Restart, Freigabe und
Generationen. 17 Verträge ergänzen die 404 Interpreter-Differentialfälle. Die
gemeinsame QVM-Syscallgrenze für qagame, cgame und UI umfasst Print/Error/Zeit,
Cvars, Befehlsargumente, Konsolenbefehle und Datei-I/O einschließlich der exakten
272-Byte-`vmCvar_t`-ABI. Vier direkte C-Datensätze und 32 Verträge sind grün.
Der qagame-Dispatcher ergänzt 18 servereigene Traps für Spielspeicher, Clients,
Configstrings, Userinfo/Serverinfo, Brushmodelle, PVS/Portale, Entity-Linking,
Bot-Slots und Entity-Token. Die qagame-Startsequenz bildet `GAME_INIT`, Restart,
Shutdown und alle elf Exports ab. Dafür bestehen weitere 14 direkte ABI-Werte
und 54 Verträge. Als nächste VM-Schritte fehlen die großen binären Trace-/Usercmd-
Traps sowie die Dispatcher von cgame und UI. Der cgame-Modulstart einschließlich
Pure-QVM-Zwang, `CG_INIT`, sämtlicher neun Exports und Shutdown ist mit zwölf
direkten ABI-Werten und 20 Verträgen bereits abgenommen. Der cgame-Dispatcher
ergänzt 19 Traps für Befehle, Rendererregistrierung, GLConfig, Gamestate,
Snapshots, Serverkommandos und Usercmds mit vier exakten x86-Layoutdatensätzen
und 37 Verträgen. Die binären qagame-Welttraps ergänzen Trace/TraceCapsule,
PointContents, EntitiesInBox, EntityContact/EntityContactCapsule und GetUsercmd
mit fünf ABI-Datensätzen und 37 Verträgen. Der UI-Modulstart verhandelt die
API-Versionen 4/6, erzwingt Pure-QVMs und bildet alle zehn Exports sowie Shutdown
ab; 14 direkte Headerwerte und 22 Verträge sind grün. Der UI-Dispatcher ergänzt
39 Traps für 2D-Rendering, Tasten/Bindings, Clipboard, GL-/Clientzustand,
Configstrings und den LAN-Serverbrowser; sieben ABI-Datensätze und 58 Verträge
sind grün. Weitere 16 Medien-/Spezialtraps decken Sound, Musik, `qtime_t`,
Cinematics, Shader-Remap, CD-Key, FS-Seek und PB-Kompatibilität mit fünf
ABI-Datensätzen und 42 Verträgen ab.

**Integrationsmeilenstein 2026-09-13:** Die unverändert aus dem festgehaltenen
1.32b-Quellstand gebauten Module laufen erstmals gemeinsam in MiniLang. `qagame.qvm` besteht
`GAME_INIT`, `GAME_CLIENT_CONNECT`, `GAME_CLIENT_BEGIN` und fortlaufende
`GAME_RUN_FRAME`-Aufrufe. Die über `trap_LocateGameData` veröffentlichten
Player-/Entity-Speicher werden in einen Snapshot übertragen; `cgame.qvm` liest
ihn und reicht seine echten Asset-, 3D-Szenen-, Licht-, 2D- und Soundbefehle an
MiniLang-Queues weiter. Der zweite Integrationsschnitt liest das originale
808-Byte-`gentity_t`-Layout, synchronisiert `entityShared_t` bei Link/Unlink und
Brushmodel-Änderungen mit der dynamischen BSP-Serverwelt und beantwortet Trace,
PointContents, EntitiesInBox, EntityContact, PVS und Areaportal-Traps daraus.
Snapshots werden nun nach Area/PVS und `svFlags` gefiltert. Ein 64er-Usercmd-Ring
treibt `GAME_CLIENT_THINK` und anschließend die lokale cgame-Prediction; deren
Point-, Box-, transformierte und Capsule-Kollision läuft ebenfalls gegen die
MiniLang-Kollisionswelt. Der Retail-Smoke beobachtet 28 räumlich verlinkte
Entities, davon 13 im Sichtbarkeitssnapshot, einen bis CommandTime 1400 bewegten
Originalspieler, neun Prediction-Traces, 354 Assetregistrierungen, 19
Szenen-Entities, 58 2D-Befehle und 175 Soundbefehle. Die gemeinsame
QVM-libc-Grenze enthält Speicher-, Trigonometrie-, Matrix- und Vektorhelfer. Der
Pfad ist über `--qvm-match` und `scripts/test_retail_qvm_match.py`
reproduzierbar. Noch offen sind vollständige Dekodierung und Wiedergabe aller
3D-/Soundbefehle sowie die Ausgabe dieser Queue im interaktiven Fenster.

## 5. BSP-Kollision und gemeinsame Spielphysik exakt übertragen

**Geprüfter Zwischenstand 2026-09-05:** BSP-/Kurvenkollision, transformierte Modelle,
temporäre Boxen, PVS-/Areaportal-Funktionen, dynamische Server-Kollision,
Bewegungsbahnen, geometrische Trigger-Abfragen, Sprungpad-/Teleport-Zustandswechsel
und der vollständige baseq3-Pmove-
Befehlszyklus sind in MiniLang implementiert und gegen C geprüft. `--pmove-map`
spielt Textbefehle auf Originalkarten ab; `--trace-model` und `--inspect-visibility`
prüfen die neuen räumlichen Abfragen. Für die gesamte Schritt-Abnahme fehlen
durchgängige Match-Replays im vollständigen Engine-/Serverbetrieb. Die äußere
`G_RunFrame`-Reihenfolge ist inzwischen eingebunden. Dynamische Entities, Trigger-Erkennung und
Sprungpad-/Teleport-Replays sind bereits mit Pmove verbunden; Ereignis-Entities,
Blickwinkel-Deltas und die Auswahl/Aufrufreihenfolge der Telefrag-Kandidaten werden
gegen C geprüft. Die inzwischen ergänzte Schadensberechnung ist mit KillBox
verbunden; die tatsächlichen [Todes-/Score-Folgen](DEATHS.md) sind ebenfalls
portiert und integriert geprüft. Der temporäre
Kapsel-Handle folgt dem festgelegten Originalprofil: kontrollierter Fehler wie
im unveränderten C-Stand; eine Korrektur wäre ein separates Erweiterungsprofil.
Zahlen, Grenzen und Testumfang:
[Prüfbericht](PARITY_AUDIT.md).

**Quellen:** `code/qcommon/cm_*.c`, `code/game/bg_pmove.c`, `bg_slidemove.c`,
`bg_misc.c` und `bg_public.h`.

**Arbeit:** BSP46, Brushes, Leaf-/Area-Verknüpfungen, Patch-Kollision, Box-/Capsule-
Traces, Contents und bewegte Kollisionsmodelle umsetzen. Pmove-Zeitschritte,
`pmove_fixed`/`pmove_msec`, Beschleunigung, Reibung, Luftkontrolle, Treppen,
Sprünge, Wasser, Knockback, Waffenzeit und Playerstate-Ereignisse übernehmen.
Pmove zwischen Server und Client gemeinsam verwenden; Konstanten und Reihenfolge
der Rechenoperationen bewahren.

**Ergebnis:** `src/collision/`, `src/game/bg_*.ml` und aufgezeichnete Usercmd-Traces
für Rampen, Kanten, Kurven, Sprungpads, Teleporter und Waffenwechsel.

**Abnahme:** Jeder Tick liefert Referenzposition, Geschwindigkeit, Trace-Ergebnis,
Flags und Ereignisse. Lange Bewegungsfolgen zeigen keine kumulative Drift;
Abweichungen blockieren die nächste Spielabnahme. Voraussetzungen: 2–4.

## 6. Spielregeln und Server vollständig portieren

**Vorliegende Grundlage:** Die räumliche Server-Verlinkung, vollständigen
EntityState-Speicherfelder, PlayerState-Umwandlung, Entity-Platzverwaltung,
Target-Auswahl und Trigger-/Teleport-Übergänge sind umgesetzt. Das Spawn-Parsing
umfasst jetzt alle Feldregeln, Spielmodusfilter, Worldspawn und die originale
Klassen-/Item-Auswahl. Alle 48 Spawn-Klassen einschließlich Sprungpads, Teleportern,
verzögerter Targets, Relays, Mehrfach-/Always-Trigger, Sound-/Push-Targets,
schaltbarer Timer, Ortsmarkierungen, Hurt-/Kill-/Laser-Objekte, drei Shooter-Klassen,
[Give-/Powerup-/Score-/Print-Targets](MAP_TARGETS.md) sowie
[Portalflächen und -kameras](PORTALS.md) sind übertragen.
`G_Damage`, Rüstung, Rückstoß, Teamschutz, Battlesuit und CTF-Trägerdaten sind
gegen C geprüft und mit Telefrags verbunden. `CanDamage`, `G_RadiusDamage`,
`LogAccuracyHit` und die Lasersteuerung verwenden die tatsächliche Server-Kollision;
siehe [Schaden](COMBAT.md).
Target-Ketten, Shader-Remaps und die Entity-Schleife mit Ereignisfreigabe sind
gegen den Originalcode geprüft; siehe [Targets und Ereignisse](TARGETS_AND_EVENTS.md).
`G_RunThink` und die spätere Sprungpad-Ausrichtung sind enthalten. Alle 35
Karten-Items werden inzwischen als echte Entities angelegt; auch die acht
Mover-Klassen laufen durch echte Spawn- und Framepfade; siehe [SPAWNING.md](SPAWNING.md).
Die Item-Aufnahme einschließlich CTF-Capture ist inzwischen verbunden.

Die Mover-Implementierung umfasst gemeinsame Entityfelder, Binärzustände,
Team-Rollback, den `G_RunFrame`-Zweig, Buttons, statische, rotierende und periodische
Mover, Türen und Plattformen samt Triggern sowie Züge mit ihren `path_corner`-Ketten.
Der Schiebekern ist in fünf isolierten Szenarien direkt gegen das unveränderte
`g_mover.c` geprüft: linearer Erfolg, Rotation mit Client-Yaw, blockierter Rollback,
`EF_MOVER_STOP` und verketteter Team-Rollback. Dabei stimmen 545 Zustandswörter
exakt; 30 native Trap-/Callback-Beobachtungen sind zusätzlich fest geprüft.

Die Retail-Mover-Abnahme umfasst `q3ctf4`, `q3dm15` und `q3dm0`. Damit laufen
`func_bobbing`, drei Pendel, zwei rotierende Mover, ein zweiteiliges Türteam und
ein Button über originale BSP- und Entity-Lumps. Acht Mover-Master stimmen in
77.073.336 Zustandswörtern und 1.684 geordneten Effekten exakt. Der Vergleich deckte eine
falsch gespeicherte Pendeldauer auf; sie ist jetzt wie in `SP_func_pendulum`
vor `InitMover` in `s.pos.trDuration` gesetzt.

Der Bot-Lifecycle-Kern für Setup, Map-Reset, Shutdown und Interbreed-Matchende ist
mit 24 Verträgen geprüft und als Standard in Lifecycle und Intermission verdrahtet.
Das Einzelspieler-Postgame samt Podium, Siegesmodellen und Abbruch ist ebenfalls
eingebunden und stimmt in fünf direkten `g_arenas.c`-Szenarien exakt.

Aktive Retail-Mover sind nun ebenfalls abgenommen. Das `q3dm0`-Türteam läuft über
Trigger-Touch, Use, beide Reached-Enden und Rückfahrt; ein Button nutzt einen
echten `q3dm0`-Inline-Brush über Spawn, Touch, Use und Rückkehr nach POS1. Die
gesamte Retail-Suite vergleicht 77.073.336 Wörter und 1.684 Effekte. Ein echter
Spieler und ein physikalisches Item werden über fünf vollständige `G_RunFrame`-
Frames vom q3ctf4-Bobbing-Mover jeweils exakt 664 Einheiten getragen.

Bot-/Arena-Registry, Spawnqueue, Bot-Connect, Queueprüfung, Minimum-Player-Regel,
Bot-Erzeugung/-Entfernung, `addbot`, `botlist` und Einzelspieler-Spawns sind portiert.
Lifecycle, ClientConnect, ClientDisconnect und Frame verwenden die echten Defaults,
solange kein Test-Hook installiert ist. Die Registry stimmt zusätzlich in fünf
direkten `g_bot.c`-Szenarien mit 596 Wörtern exakt. `BotAISetupClient` und
`BotAIShutdownClient` besitzen vollständige Botlib-Ressourcenpfade samt
Teilfehler-Cleanup und sind als Lifecycle-Defaults verdrahtet.
`BotAIStartFrame`, regelmäßige Itemaktualisierung und die Snapshot-, Entity- und
Client-State-Grenzen sind ebenfalls portiert. Sieben direkte C-Szenarien erfassen
42 Beobachtungen; 25 zusätzliche Frameverträge prüfen Timing, Filter, Botcadence
und den zentralen Default-BotAI-Aufruf.

View-Winkel, Delta-Angles, `BotInputToUserCommand`, Action-/Button-/Weapon-Mapping,
Signed-Char-Bewegung, verzögerter Sprung und Respawn-Hack sind inzwischen ebenfalls
als Frame-Default portiert. Sechs C-Szenarien und 17 MiniLang-Verträge sind grün.
Der Default-BotAI-Pfad verarbeitet außerdem `print`, `chat` und `tchat`, entfernt
Farbcodes und erzeugt LTG-Status-Configstrings und Team-Berichte. Sechs native
Szenarien mit 31 Beobachtungen sowie 26 Verträge sind grün.
Der erste `ai_dmq3.c`-Kampfblock deckt Entity-/Powerup-Prädikate, CTF-Tragen,
Teleport-, Todes-, Intermission- und Gefahrenzustand, Aggressionsbewertung,
Rückzug/Verfolgung, Rocket-Jump-Freigabe und das zweiachsige Sichtfeld ab.
Zwölf native Szenarien mit 68 exakten Beobachtungen sowie 35 MiniLang-Verträge
sind grün; Inventar, Waffe, Ursprung und Teleportzustand liegen im zentralen BotState.
Darauf bauen Feindersuche, sichtbares und letztes bekanntes Ziel, Reaktions- und
Feuerratensteuerung, Gauntlet-Reichweite, Sichtfeld/Hindernisse, Teamschutz,
Radialschaden-Selbstschutz und Fire-on-release auf. Zehn native Szenarien mit
25 exakten Beobachtungen und 24 weitere MiniLang-Verträge sind grün.
`BotChooseWeapon` und `BotUpdateBattleInventory` ergänzen Waffenwechselzeit,
Auswahldispatch sowie C-abgeschnittene Gegnerhöhe/-distanz; 13 direkte
Datensätze und sieben Verträge sind grün.
`BotUpdateInventory` projiziert außerdem den vollständigen Baseq3-PlayerState-Bestand
aus Waffen, Munition, Gesundheit, Rüstung, Holdables, Powerups und CTF-Flaggen.
Vier Datensätze vergleichen 60 Werte; zehn Verträge sind grün.
Die restlichen Zielkorrekturen decken den Bewegungs-Cache, exakte AAS- und
lineare Projektilvorhersage, kurze Strafeschritte, dreistufig geprüfte
Splash-Bodenziele samt Selbstschutz sowie vorhergesagte Raketen-/Granaten-/BFG-
Eckenschüsse ab. Sechs native Szenarien mit 19 exakten Beobachtungen und 13
weitere MiniLang-Verträge sind grün.
`BotAttackMove` schließt die lokale Kampfbewegung mit Chase-Ziel, Skill-Grenze,
Gauntlet-/Distanzbändern, Sprung-/Duck-Cooldowns und adaptivem Zweiversuch-
Strafing. Zwölf native Szenarien erfassen 21 exakte Beobachtungen; 15
MiniLang-Verträge sind grün.
Der höhere `Battle_Fight`-Zustand verbindet diese Bausteine jetzt in der
Originalreihenfolge: Zustandswechsel, Feindersuche, Todes-/Unsichtbarkeits- und
Chatpfade, letzter erreichbarer Gegnerort, Kampfinventar, Sichtverlust mit
Chase, Item- und Waffenwahl, `BotAttackMove`, Blockadebehandlung, Zielen,
Angriff und Rückzug. 13 native Szenarien erfassen 26 exakte Beobachtungen;
14 MiniLang-Verträge sind grün. `Battle_Chase`, `Battle_Retreat` und
`Battle_NBG` sind ebenfalls vollständig verbunden: letzte Gegnerposition,
Zehnsekunden-Chase, LTG-/NBG-Wechsel, Sichtverlust, Bewegungsansicht,
Bewegungswaffe und Rückkehr in Kampf oder Rückzug folgen der Baseq3-Reihenfolge.
19 native Szenarien mit 43 exakten Beobachtungen und 24 MiniLang-Verträge sind
grün; das C-Orakel kompiliert dazu die bytegenau extrahierten Originalkörper.
Der `BotAI`-Pfad ruft nach dem Deathmatch-Setup außerdem den begrenzten
Node-Dispatcher auf: maximal 50 Zustandswechsel, erneuter Dispatch bei `false`,
Leerlauf für Node null und ein harter Fehler für unbekannte gesetzte Nodes. Ein
Frame-Vertrag weist den Weg vom `BotAIStartFrame` bis zum konfigurierten
Battle-Node nach.
Der natürliche Langzeitziel-Einstieg ist nun ebenfalls geschlossen:
`AIEnter_Seek_LTG` und `AINode_Seek_LTG` führen vom Frame über Feindersuche in
`Battle_Fight` oder `Battle_Retreat`, andernfalls über Team-, LTG-, NBG- und
Hindernisentscheidungen bis zur AAS-Bewegung. Dabei bleiben die Baseq3-Bits
WAITING/VIEWSET/WEAPON als 4/8/16 und `BFL_IDEALVIEWSET` als 32 getrennt. Das
unveränderte C-Orakel prüft zusammen mit `Seek_NBG`, `Seek_ActivateEntity`,
`Stand`, `Respawn`, `Observer` und `Intermission` nun 43 Szenarien mit 101
Beobachtungen; 38 MiniLang-Verträge schließen den vollständigen
`BotAIStartFrame`-Dispatcherpfad und die gekoppelten Zustandswechsel ein.
Die ersten fünf `ai_team.c`-Helfer decken außerdem Teamführerprüfung,
Teamzählung und stabile Angreifer-/Verteidigerpräferenzen ab. Sechs direkte
Differentialdatensätze und neun zusätzliche Verträge sind grün.
Fünf weitere Team-Kommunikationsfunktionen bilden Self-Queue, gerichtete Tell-
Nachrichten und die drei Baseq3-Voice-No-ops ab; sieben direkte Datensätze und
fünf Verträge stimmen.
`BotCTFOrders` und `BotCreateGroup` wählen darüber hinaus teamrelativ alle vier
Flagstatuspfade und bauen Selbst-/Fremdführergruppen in Originalreihenfolge;
16 direkte Datensätze und elf Verträge stimmen.
`FindHumanTeamLeader` ergänzt die 64-Slot-Auswahl eines menschlichen Leiters samt
Bot-/Sperr-/Teamfilter und bedingter Standardverteidigung; drei Szenarien mit
sechs Beobachtungen und sechs Verträge sind grün.
Sechs weitere `ai_dmq3.c`-Abfragefunktionen bilden Team/Gegnerteam,
Teamgleichheit, farbbereinigte Namensauflösung und PlayerState-Tod ab; neun
direkte Datensätze und elf Verträge sind grün.
Der erste Navigationsblock setzt den Botlib-Bewegungszustand bitgetreu auf,
behandelt besondere Auf-/Ab-Mover-Richtungen sowie zufällige Ausweichbewegung
und sagt AAS-Mover-Hindernisse samt Aktivierungsziel voraus. Inzwischen sind
auch `BotAlternateRoute` und `BotGetAlternateRouteGoal` portiert: Rot-/Blau-
Routenwahl, Zufallsindex-Klemmung, Zielgrenzen, Reisezeit unter 20 und der
persistente Erreicht-Zustand wurden um die Aktivierungsziel-Ausführung ergänzt.
Der originale Acht-Slot-Heap, LIFO-Push/Pop/Clear, Routingbereich-Freigabe,
Zwei-Sekunden-Wiederverwendungsschutz und `BotGoForActivateGoal` sind zentral
verfügbar. `BotGetActivateGoal` löst nun außerdem den blockierenden Mover zum
BSP-Entity zurück, behandelt beschießbare, startoffene und bereits bewegte
Türen, sortiert Mover-Areas in zwei Durchläufen und folgt Button-/Trigger-/
Relay-/Delay-Bäumen samt Duplikat- und Reisezeitprüfung. Insgesamt prüfen 36
native Szenarien 136 Beobachtungen; 54 MiniLang-Verträge waren grün. Der
allgemeine Zielwahlblock ergänzt `BotGoCamp`, `BotWantsToCamp`, `BotDontAvoid`
und `BotGoForPowerups` samt Cooldown, Wahrscheinlichkeits-, Aggressions- und
Waffenprüfung, 150er-Reisezeitlimit und fünf Powerup-Avoid-Resets. Navigation
ist nun um die zusammenhängende `ai_dmnet.c`-Route aus `BotGetAirGoal`,
`BotGoForAir`, `BotNearbyGoal`, `BotReachedGoal` und
`BotGetItemLongTermGoal` erweitert. Wasseroberflächen-Projektion,
NBG-Ausweichziele, Flagträger-Reichweite, Zielabschluss und LTG-Erneuerung
folgen der Originalreihenfolge über explizite Dienste. Darauf bauen nun
`BotGetLongTermGoal` und `BotLongTermGoal` auf: Hilfe/Begleitung, Verteidigung,
Kill/GetItem, Camp, Patrouille und die Baseq3-CTF-Ziele sowie Führungsabbruch,
Sicht-, Rückwärts- und Distanzlogik verwenden den zentralen Botzustand. Das
C-Orakel kompiliert beide unverändert extrahierten Originalkörper. Navigation
steht damit bei 79 nativen Szenarien, 244 Beobachtungen und 104 Verträgen.

Die vierte detaillierte CTF-Auftragspolitik `BotCTFOrders_BothFlagsAtBase` ist
nun ebenfalls vollständig und als Standard eingebunden. Passive und aggressive
Verteilungen decken alle Teamgrößenpfade, Präferenzsortierung, die gerundeten
50/40- beziehungsweise 40/50-Prozent-Bänder sowie die Caps 5/4 und 4/5 ab.
Vierzehn exakte Datensätze aus dem unveränderten Originalfunktionskörper und
17 MiniLang-Verträge sind grün. Damit sind alle vier durch `BotCTFOrders`
gewählten Baseq3-Flagstatuspolitiken detailliert portiert.

**Nächster Arbeitsblock:** `Seek_NBG`, Aktivierungs-, Stand- und Respawn-Routen
an den jetzt geschlossenen Seek-LTG-/Battle-Dispatcher anbinden. Die Retail-Mapausführung besitzt inzwischen eine direkte Mover-Abnahme auf drei Karten;
parallel den PK3-Downloadtransport und die Netzwerkdienste anbinden.
`ClientSpawn` setzt Spielerzustand, Startinventar, Handicap, Bot-/Human-Filter,
Spawn-Targets, Verlinkung und Snapshots in der Originalreihenfolge um.
`ClientEndFrame` verarbeitet inzwischen Powerup-Ablauf, Umwelt- und
Schadensfeedback, Zuschauer-Follow, Snapshots und vorhersagbare Ereignis-Entities.
`ClientThink`, `ClientThink_real` und `G_RunClient` verbinden inzwischen Usercmd,
Zeitklemmung, Pmove, dynamische Kollision, Trigger, Spielerereignisse, Timer,
Zuschauer, Button-Latches, Respawn und Snapshots. `ClientBegin` verbindet
Unlink/Reinitialisierung, den echten Spawn, Eintrittsereignis, Log und
Rangberechnung; Tournament-, Zuschauer- und Intermissionzweige sind gegen den
unveränderten C-Ablauf geprüft. [`CheckTournament` und `TeamCount`](TOURNAMENT.md)
steuern inzwischen Promotion, Bereitschaft, Warmup-Countdown und Maprestart an
der ursprünglichen Stelle im Frame. [Vote-Aufrufe, Stimmabgabe, Auflösung und
Teamleiterwahl](VOTES.md) sind ebenfalls portiert. Vollständige Aufruf-/Stimm-/
Ergebnisfolgen und die Einbindung der Auflösung in echte Frames sind geprüft.
[Teamstandorte, Overlay und Passwortstatus](TEAM_STATUS.md) laufen inzwischen
an den ursprünglichen Frame-Positionen. [Namen, Userinfo und Teamwahl](CLIENT_INFO.md)
aktualisieren jetzt Spielerangaben und Configstrings, auch innerhalb echter
Team-Vote-/Leiterwechsel-Folgen. `ClientSpawn` verwendet dieselbe geprüfte
Info-Schlüsselsuche und die ursprüngliche Userinfo-Puffergrenze.
[`ClientConnect` und alle fünf Sitzungsfunktionen](CLIENT_CONNECT.md) verbinden
jetzt Passwortprüfung, Client-Reset, Sitzung, Userinfo und Rangberechnung.
Speichern, Level-Neuaufbau und Wiederverbindung sind gegen C geprüft;
[IP-Filter](IP_FILTERS.md) sind jetzt als Standardentscheidung eingebunden;
Bot-Userinfo wird standardmäßig über den portierten `G_BotConnect`-Pfad ausgewertet.
Die `BotAISetupClient`-/`BotAIShutdownClient`-Ressourcen sind portiert und zentral
verdrahtet; die darunterliegenden Botlib-Dienste bleiben explizite Engine-Schnittstellen.
[Teamwechsel, `team`, `StopFollowing` und `ClientDisconnect`](TEAM_CHANGES.md)
führen inzwischen die tatsächlichen Todes-, Item-/Flaggen-, Leichen-, Leiter-,
Userinfo-, Spawn- und Rangabläufe zusammen. 227 Szenarien vergleichen jeden
Host-Aufruf und alle abschließenden Zustände mit C.
[Follow-Befehle und Tournament-Nachrücken](FOLLOW_TOURNAMENT.md) sind ebenfalls
portiert: 192 Szenarien verbinden Zielsuche, Angriffstaste, Duell-Warteschlange,
Gewinner-/Verliererwechsel und Warmup mit den tatsächlichen Spielabläufen.
[Intermission und Levelende](INTERMISSION.md) verbinden diese Helfer inzwischen
mit der Kameraplatzierung, echtem Respawn, Scoreboards und Sitzungsspeicherung.
Die Spielregeln fordern Maprestart beziehungsweise `nextmap` in Originalreihenfolge an;
die Ausführung durch die Engine bleibt offen. Die vollständige
[Client-Befehlsverteilung](CLIENT_COMMANDS.md) verbindet jetzt alle Baseq3-Handler,
Textchat/Voice, Cheats, Item-Give, Suicide, Teamtask und Teleport.
[Alle Baseq3-Waffen](WEAPONS.md) sind mit echten Treffern, Schaden,
Genauigkeitsstatistik und den Standardaufrufen aus ClientThink verbunden.
Die [Serverkonsole](SERVER_COMMANDS.md) nutzt echte Teamwechsel, IP-Filter und
die [Spielarena](GAME_MEMORY.md). [Item-Registrierung, CTF-Initialisierung und
Entity-Teams](GAME_INITIALIZATION.md) sind mit [G_InitGame/G_ShutdownGame](GAME_LIFECYCLE.md)
und der [originalen Logausgabe](GAME_LOGGING.md) verbunden.
Die Mover-Klassen, lineares und rotierendes Mover-Pushing sowie Areaportal-Umschaltung
sind implementiert. Fünf direkte Vergleiche gegen das unveränderte `g_mover.c`
decken lineares Schieben, Rotation samt Client-Yaw, blockierten Rollback,
`EF_MOVER_STOP` und verketteten Team-Rollback ab. Drei vollständige Retail-Läufe
decken Bobbing, Pendel, Rotation und ein Türteam ab; aktiv ausgelöste Buttons und
Türen sowie der eigenständige Server fehlen weiterhin.

Projektil-Erzeugung, Flug-/Aufprallregeln, Granaten-Abprall, Grappling-Hook und
Shooter-Objekte sind jetzt gegen C geprüft; siehe [Projektile](MISSILES.md). Die
Entity-Schleife führt Missile-Entities über die portierte Verarbeitung aus.
Die [Spawnpunkt-Auswahl und Leichenverwaltung](PLAYER_LIFECYCLE.md) ergänzen
Deathmatch-/CTF-/Zuschauerpositionen, acht Leichenplätze, Gibs und Leichenphysik.
[Punktevergabe, Ranglisten, Scoreboards und Matchende-Regeln](SCORES.md) sind
inzwischen ebenfalls gegen C geprüft. [`player_die`, Team-Fragboni,
Drop-Entscheidungen und der Respawn-Wrapper](DEATHS.md) verbinden diese Bausteine
nun mit realer Kollision, PVS, Hook- und Leichenverwaltung. [Karten-/Drop-Items,
Pickups, Respawn, Physik und vollständige CTF-Flaggenabläufe](ITEMS.md) laufen als
echte Entities. Log- und `PrintMsg`-Nutzlasten sind bis zu einer Host-Schnittstelle
geprüft; [`ClientSpawn`](CLIENT_SPAWN.md) und
[`ClientEndFrame`](CLIENT_FRAMES.md) sind ebenfalls gegen die unveränderten
C-Funktionskörper geprüft. [`ClientThink`](CLIENT_THINK.md) ist ebenfalls vollständig
in den MiniLang-Spielpfad eingebunden. [`ClientBegin`](CLIENT_BEGIN.md) verbindet
den Eintritt ab einem bereits angelegten Client. [`G_RunFrame`](FULL_FRAME.md) führt
ihn mit Entity-Schleife, Matchende und den geordneten Wartungsstufen zusammen.
Tournament/Warmup, globale/Team-Vote-Auflösung, Teamstatus und `CheckCvars`
sind portiert. [Cvar-Registrierung und Engine-/VM-Kopien](GAME_CVARS.md)
versorgen den Frame inzwischen über die vollständige Baseq3-Cvar-Tabelle.
Die vier Vote-Befehlshandler nutzen die registrierte `g_allowVote`-Kopie und
die tatsächliche `nextmap`-Cvar. `ClientUserinfoChanged`, `ClientCleanName`,
`TeamLeader` und `PickTeam` sind portiert; die Standardverbindung aus `SetLeader`
und die Userinfo-Steuerung des Teamoverlays sind zusammenhängend geprüft.
`ClientConnect`, Sitzungs-Persistenz in Engine-Cvars und Teamnachrichten sind
ebenfalls portiert; vor einer erneuten Anmeldung werden alle modellierten
Clientfelder zurückgesetzt. `SetTeam`, `Cmd_Team_f`, `StopFollowing` und
`ClientDisconnect` sind ebenfalls portiert. Die Verbindung zu Bot-Warteschlange
und Bot-Shutdown bleibt eine Pflichtschnittstelle. Follow-Befehle verwenden
bereits die tatsächlichen Teamwechsel; `SpectatorThink` und `CheckTournament`
verwenden standardmäßig den Follow-Zyklus beziehungsweise die Duell-Warteschlange.
Die Intermission- und Levelende-Funktionen verwenden diese Spielabläufe ebenfalls
direkt. Die Client-Befehlsverteilung ist ebenfalls verbunden und geprüft.
Engine-Mapwechsel/-Neustart und VM-Neuladen, tatsächliche Netzwerkzustellung,
Bot-/Einzelspieler-Ergebnissysteme und Netzwerkzustellung sind die nächsten Grenzen.
Der Baseq3-Waffenserver einschließlich Rail-Durchschüssen, Schrotstreuung und
Quad-Skalierung ist inzwischen verbunden. Im Callback freigegebene
Laser oder Projektile werden beim ungültigen erneuten Link kontrolliert
abgewiesen; diese Abweichungen sind im Prüfbericht festgehalten.

**Quellen:** `code/game/g_*.c` und `code/server/`.

**Arbeit:** Entity-Lebenszyklus, Spawn-Parsing, Targets, Mover, Items, Waffen,
Treffer, Schaden, Respawn, Scores, Teamregeln und Matchwechsel übernehmen.
Warmup, Tournament, FFA, Team Deathmatch und CTF inklusive Zeit-/Fraglimits
abdecken. Serverframes, Entity-Verlinkung, Configstrings, Baselines und Snapshot-
Auswahl mit der Modulgrenze verbinden. Original-qagame-QVM und MiniLang-Spielcode
mit derselben Eingabefolge gegeneinander ausführen.

**Ergebnis:** `src/server/`, `src/game/` und Dedicated-Server mit skriptbaren Matches.

**Abnahme:** Pro Tick stimmen Entities, Playerstates, Treffer, Ereignisreihenfolge,
Punktestand und Matchübergänge für alle baseq3-Spielmodi überein. Lokale
Vertragstests bestehen; echte Netzwerk-Interoperabilität wird in 7 abgenommen.
Voraussetzungen: 3–5.

## 7. Netzwerkprotokoll 68, Clientzustand und Demos implementieren

**Quellen:** `code/qcommon/msg.c`, `net_chan.c`, `huffman.c`,
`code/client/cl_*.c` sowie `code/server/sv_*.c`.

**Arbeit:** UDP, OOB/Challenge/Connect, Sequenzen, Reliable Commands, Fragmentierung,
Huffman-Bitstrom, Deltafelder, Usercmd-Kodierung, Downloads und Pure-Handshake
bytegenau umsetzen. Client-Snapshots, Zeitabgleich, Interpolation, Prediction und
Fehlerkorrektur integrieren. Demo-Aufzeichnung und Wiedergabe im Originalformat
portieren; aufgezeichnete Zeiten anstelle der aktuellen Wanduhr nutzen.

**Ergebnis:** `src/net/`, `src/client/`, Paket-Goldenfiles, Replay- und Netzfehlertests.

**Abnahme:** Originalclient ↔ MiniLang-Server und MiniLang-Client ↔ Originalserver
bestehen Connect, Mapwechsel und Matches. Paketbytes stimmen bei gleichen
Eingaben überein. Verlust, Duplikate, Umordnung und Reconnect funktionieren;
Originaldemos liefern gleiche normalisierte Snapshot-/Ereignisfolgen.
Voraussetzungen: 3–6.

**Begonnener Grundblock:** Die [Nachrichtenpuffer und der Huffman-Bitstrom](MESSAGE_IO.md)
portieren `msg_t`-Zustand sowie Byte/Char/Short/Long/Data/C-String-Lesen und
-Schreiben aus `qcommon/msg.c`. 17 direkte Original-C-Differenzdatensätze und
24 Verträge decken Little Endian, Vorzeichen, Überlaufreserve, Lese-OOB und
Stringgrenzen ab. Der adaptive Huffman-Baum und der komprimierte
`MSG_WriteBits`-/`MSG_ReadBits`-Pfad ergänzen acht direkte Datensätze und 83
Verträge. Die skalaren Integer-/Float-/Key-Deltas und beide Usercmd-Codecs
ergänzen acht bytegenaue direkte Datensätze und 52 Verträge; abgedeckt sind
8-/32-Bit-Zeiten, XOR-Key, Winkel, signierte Bewegungswerte und der gemeinsame
Unchanged-Payload-Pfad. Die 51 EntityState- und 48 PlayerState-Netfields sind
nun ebenfalls inklusive
`lc`, Remove/No-Delta/Force, Float-Integraloptimierung und den vier
PlayerState-Arraymasken portiert. 108 vollständige direkte Paketdatensätze
und 28 Verträge sind grün; primitive Float-/Winkel-Helfer und die
eigenständige Ganzpuffer-Kompression bleiben offen.

Die Server-Snapshot-Deltakette bildet jetzt `SV_EmitPacketEntities`, den
Snapshot-Ring, Deltaframe-Verfall und die Payload aus Header, Areabits,
Playerstate und Packetentities ab. Sechs vollständige Paketstreams stimmen
bytegenau mit dem unveränderten Original überein; 26 Serververträge sind grün.
Der Frameaufbau aus `SV_AddEntToSnapshot`, `SV_QsortEntityNumbers`,
`SV_AddEntitiesVisibleFromPoint` und `SV_BuildClientSnapshot` ist ebenfalls
portiert. Fünf direkte Original-C-Szenarien und 26 Verträge decken PVS-/Area-
Filter, sämtliche Clientflags, Broadcast, Portalrekursion, Viewpoint,
Areabit-Invertierung, Sortierung und Ringablage ab. Collision/PVS/Area bleiben
explizite Hostdienste. Der konkrete Runtime-Adapter verbindet sie mit dem
geladenen BSP, `server.world` und den Game-Entity-/PlayerState-Strukturen.
16 assetfreie Verträge sowie ein `q3dm0`-Retail-Lauf vom tatsächlichen
Player-Spawn bis zum 62-Byte-Snapshotpaket sind grün.
Die davor liegende Reliable-Command-Einbettung portiert den 64er-Befehlsring,
Sequenz und Acknowledgement sowie das erneute Senden ausstehender Befehle. Sieben
weitere vollständige komprimierte Streams und 19 Verträge sind grün.
Die vollständige serverseitige Sendeorchestrierung verbindet Client-Ack,
Reliable-Befehle, Deltaauswahl, Flags, Payload, Padding, Downloadcallback und EOF
mit einer klaren Netchan-Übergabe. Sechs komplette Nachrichten und 25 Verträge
prüfen zusätzlich Frame-Metadaten sowie Rate-, Inaktiv-, Loopback- und LAN-Timing.
Die konkrete `server/pipeline.ml` verbindet Runtime-Frameaufbau, Frameslot und
Entity-Ringzähler mit Snapshot-Senden, Downloadfenster und Netchan. Elf
Integrationsverträge decken auch einen über zwei Fragmente gesendeten
2.048-Byte-Download ab.
Das serverseitige Downloadfenster ergänzt acht Ringslots, 2.048-Byte-Blöcke,
EOF, Block-Acks und Timeout-Resend. Zwölf direkte Originaldatensätze und 19
Verträge einschließlich Rate- und Nachrichtenbudget sind grün.
Der Client-Gegenpfad portiert `CL_DeltaEntity` und `CL_ParsePacketEntities` und
dekodiert den gemischten Original-Serverstream in fünf Entities; insgesamt
bestehen dort 15 Verträge. Davon getrennt portiert `CL_ParseSnapshot` Header,
Deltaframe-Gültigkeit, Areamask, Playerstate/Packetentities, Clientframe-Ring,
Lückenentwertung, Ping und Demo-Warteflag. Vier direkte Zustandsübergänge aus den
unveränderten Client-Funktionskörpern und zehn Verträge sind grün.
`CL_ParseCommandString` und `CL_ParseServerMessage` sind als äußerer Dispatcher
ergänzt. Drei direkte Original-C-Übergänge und zehn Verträge decken
Acknowledgement-Reparatur, Duplikate, 64er-Commandring sowie
`nop`/`snapshot`/`EOF` und den vollständigen Reliable-plus-Snapshot-Stream ab.
`CL_ParseDownload` ergänzt Blocknummer, Dateigröße/Serverfehler, Dateiöffnung,
`stopdl`/`nextdl`, Bytezähler und EOF mit Close/Rename, doppeltem Packet-Ack und
nächstem Download. Vier unveränderte C-Zustandsfolgen und 20 Verträge sind grün.
`CL_ParseGamestate` ergänzt Configstring-Speicher/-Offsets, BigString, Baselines,
Clientnummer und Checksum-Feed. Ein unveränderter C-Übergang und zwölf Verträge
sind grün. `CL_SystemInfoChanged` ergänzt Server-ID, Demo-Schranke, Cheat-Reset,
Pure-Pak-Listen, geordnete Cvar-Übernahme, `fs_game`-Korrektur und Pure-Status.
Fünf unveränderte C-Übergänge und 22 Verträge sind grün; konkrete Cvar- und
Dateisystemoperationen bleiben Hostdienste. Die konkrete `client/protocol_runtime.ml` verdrahtet Gamestate,
Download und Snapshot mit dem Server-Message-Dispatcher. Zwölf Integrationsverträge
prüfen Reset, Sequenzübernahme, Baseline-Synchronisierung und eine gemeinsame
Gamestate-/Download-/Snapshot-Nachricht. Das Demo-Dateiframing portiert `CL_WriteDemoMessage`,
`CL_DemoFilename` und `CL_ReadDemoMessage`. Zwölf direkte Datensätze aus den
unveränderten Funktionskörpern und 27 Verträge decken Dateibytes,
Netchan-Headerentfernung, Sequenz-/Zeitübergänge, EOF, Trunkierung, Größenlimits,
Dateinamen und den synthetischen Start-Gamestate ab. Reale Dateizugriffe,
die laufende Demo-/Timedemo-Schleife und Live-Netzwerkzustellung
bleiben offen.

Der serverseitige OOB-Kern portiert den 1.024er Challenge-Ring, LAN-/Authorize-
Policy, Protokoll-/Ping-/Reconnect-Prüfung und öffentliche, private sowie lokale
Bot-Slotwahl. 13 direkte Original-C-Datensätze und 26 Verträge sind grün;
DNS, Autorisierungsserver, Game-VM-Aufnahme und UDP bleiben Hostdienste.
Der connectionless Dispatcher portiert zusätzlich `SV_ConnectionlessPacket` und
verbindet `getchallenge` und `connect` mit diesem OOB-Kern. `getstatus`, `getinfo`,
`rcon`, `ipAuthorize`, unbekannte Befehle und die Connect-Dekompression laufen
über klar benannte Hostdienste. Acht exakte Dispatch-Datensätze aus dem
unveränderten C-Funktionskörper und 18 MiniLang-Verträge sind grün.

Der [deterministische Netchan-Kern](NETCHAN.md) ergänzt Setup, Sequenz- und
qport-Header, Versandaufteilung, das Null-Endfragment bei exakten 1300-Byte-
Vielfachen, Drop-/Duplikaterkennung und geordnete Empfangsmontage. 29 direkte
Baseq3-Differenzdatensätze mit vollständigen Paketbytes und 29 Verträge sind grün. `NET_SendPacket` bleibt
eine explizite UDP-Dienstgrenze. Die darauf aufbauende Client-Schicht portiert
alle fünf Funktionen aus `client/cl_net_chan.c`: neun unveränderte C-Übergänge
mit vollständigen Paketbytes und 18 Verträge prüfen Encode/Decode, EOF-Anhang,
Transmit, Fragmentfortsetzung und Process. OOB/Handshake und echte
Interoperabilität sind offen.
Der eingehende Client-OOB-Pfad portiert zusätzlich `CL_CheckForResend`,
`CL_DisconnectPacket` und `CL_ConnectionlessPacket`. 17 direkte unveränderte
C-Übergänge und 27 Verträge decken Proxy-Handoff, Connectvalidierung,
NetChan-Setup, Info/Status/Print, Disconnect-Spoofschutz, LAN-/WAN-Resend und die
exakte quotierte Connect-Nutzlast ab. UDP und Browserdatenhaltung bleiben
Hostgrenzen. Details: [CLIENT_CONNECTIONLESS.md](CLIENT_CONNECTIONLESS.md).
Die Serverschicht ergänzt XOR-Encode/Decode, `svc_EOF`, Fragmentfortsetzung und
die unkodierte FIFO für Nachrichten, die während eines Fragmentstroms entstehen.
Zwölf direkte Datensätze aus allen fünf unveränderten `SV_Netchan_*`-Körpern und
26 Verträge vergleichen vollständige Paketbytes und Zustände, einschließlich
beider Process-Headerbreiten und Queue-Pop nach dem letzten Fragment.
Die [Windows-UDP-Plattform](UDP_PLATFORM.md) stellt darunter eine kleine
Winsock-x64-DLL und einen MiniLang-Wrapper für Startup, nichtblockierende
IPv4-Sockets, Bind, Send/Receive und Close bereit. Zwei Localhost-Sockets
bestehen 13 Verträge mit exakten 9- und 2.048-Byte-Binärpayloads sowie
Adress-/Port-Roundtrip und leerer Receive-Queue. Die Live-Verkabelung der
Client-/Server-Netzwerkschleife mit dieser Plattformgrenze bleibt offen.
Der [UDP-Netztransport](NET_TRANSPORT.md) schließt nun die nächste Schicht:
IPv4-Konvertierung, Netchan-`sendPacketFn`, nichtblockierender Empfang,
Connectionless-Textpakete und der ab Byte 12 adaptive komprimierte
`connect`-Datensatz laufen über echte Localhost-Sockets. 15 Verträge sind
grün; `Huff_Compress` und `Huff_Decompress` erhöhen das unveränderte
Huffman-C-Orakel auf zehn Datensätze. Der Client-Paketeingang portiert außerdem
`CL_PacketEvent` mit neun direkten C-Datensätzen und 23 Verträgen. Offen ist
die Engine-Frame-Pollschleife, welche die Sockets fortlaufend leert.
Der [Network-Runtime-Block](NETWORK_RUNTIME.md) ergänzt inzwischen eine
budgetierte, faire Pollschleife, `SV_PacketEvent` und den äußeren
`SV_ExecuteClientMessage`-Parser und den Befehlsdispatcher
`SV_ExecuteClientCommand`. 20 Pump-Verträge, zehn direkte
Server-PacketEvent-C-Datensätze plus 28 Verträge sowie 13 direkte
ClientMessage-C-Datensätze plus 15 Verträge sowie neun direkte
Command-Dispatcher-C-Datensätze plus 16 Verträge sind grün. Ein echter
20-Verträge-Localhostlauf durchläuft Challenge, komprimierten Connect,
ConnectResponse und das erste sequenzierte, serverseitig XOR-dekodierte Paket.
Der Reliable-Rumpf von `SV_ClientCommand` stimmt in elf direkten C-Datensätzen
überein und besteht 20 Verträge. Der produktive Ingress-Adapter verbindet die
gesamte Kette über echte Localhost-Sockets und besteht 19 End-to-End-Verträge.
`SV_UserMove` stimmt in zwölf direkten C-Datensätzen überein und besteht 30
Verträge. Weitere 14 Integrationsverträge verbinden ClientMessage,
Reliable-Command, Dispatcher und UserMove über einen gemeinsamen Clientzustand.
Damit ist der sequenzierte Server-Eingabepfad geschlossen. Der Client-Ingress
führt echte UDP-Pakete zusätzlich bis `CL_ParseServerMessage`; 21 Verträge sind
grün. Der Desktop-Framehost verwaltet Winsock, beide Sockets, Pumpbudget,
Zeitfortschritt und Shutdown in 25 Verträgen. `SV_CalcPings` ergänzt vier
direkte C-Datensätze und 16 Verträge. `SV_CheckTimeouts` ergänzt sechs direkte
C-Datensätze und 24 Verträge, `SV_CheckPaused` 23 und 22 sowie
`SV_SendClientMessages`/`SV_RateMsec` drei und 19. Die äußere
`SV_Frame`-Komposition stimmt anschließend in neun direkten C-Datensätzen
überein und besteht 28 Verträge, einschließlich Heartbeat-, Restart-,
Info-Config-, Bot- und Game-Frame-Reihenfolge.

## 8. Renderer und Client-Präsentation originalgetreu portieren

**Quellen:** `code/renderer/`, `code/cgame/cg_*.c`, `code/qcommon/qfiles.h`.

**Arbeit:** Renderer-Frontend und -Backend in MiniLang übernehmen; ein dünner
OpenGL-Adapter transportiert API-Aufrufe. BSP46, PVS, Flächen-/Patch-Tessellation,
Lightmaps, Lightgrid, Shader-Skripte und ihre Sortier-/Blend-/Depth-Regeln,
Fog, Sky, dynamische Lichter, MD3-Tags und Animation umsetzen. Cgame-Effekte,
Waffenansicht, Marks, Trails, Schatten und HUD anschließen. Originale Textur-
Formate und Gamma-/Overbright-Verhalten berücksichtigen. Alternative Grafik-
Backends erst nach der klassischen Vergleichsbasis planen.

**Ergebnis:** `src/renderer/`, `src/cgame/` und ein deterministischer Screenshot-
Runner mit festgelegter Kamera, Zeit, Auflösung, Cvars und Treiberprofil.

Der erste [Renderer-Datenbaustein](RENDERER_FOUNDATION.md) portiert inzwischen
Shader-Hash, Textindex und Definitionensuche aus `tr_shader.c`. Zehn direkte
C-Datensätze und zehn Verträge sind grün. Shader-/Stage-/TexMod-Analyse ergänzt
30 direkte C-Datensätze und 32 Verträge; der TGA-Decoder weitere fünf und 22.
Resampling, Licht-/Gamma-Skalierung und beide Mipmap-Pfade ergänzen zehn direkte
C-Datensätze und 19 Verträge. `RB_SurfacePolychain` startet die CPU-Tessellation
mit drei direkten Datensätzen und 21 Verträgen. Die Bildregistrierung ist
inzwischen als CPU-seitiger Cache- und Uploadplan mit acht
direkten C-Datensätzen und 29 Verträgen vorhanden. `RB_SurfaceTriangles` und
`RB_SurfaceFace` ergänzen drei C-Datensätze und 30 Verträge. Die Texturzustände
`GL_Bind`, `GL_SelectTexture` und `GL_BindMultitexture` bestehen 18 direkte
C-Datensätze und 30 Verträge. `RB_SurfaceGrid` ergänzt fünf C-Datensätze und 30
Verträge; die Renderer-Commandqueue mit SetColor, StretchPic, DrawBuffer und Swap
weitere sieben und 29. MD3-Interpolation und Mesh-Einreichung ergänzen drei
direkte C-Datensätze und 31 Verträge. MD3-Tags/Modellgrenzen, View-Transformation
und Frustum-Culling sowie rotierte Sprite-Quads ergänzen 24 direkte C-Datensätze
und 93 Verträge. Als Nächstes folgen weitere Flächentypen und die tatsächliche
OpenGL-Ausgabe.

Die Szenenaufnahme verwaltet Polygone samt Fog, Referenzentities und dynamische
Lichter mit sechs Headerwerten und 24 Verträgen. Draw-Surfaces verwenden das
exakte QSORT-Bitlayout, einen maskierten Ringpuffer und stabile Sortierung; fünf
C-Datensätze und 34 Verträge sind grün.

Ein erster [spielbarer Preview-Vertical-Slice](PLAYABLE_PREVIEW.md) lädt BSP46
aus der Retail-PK3, wählt einen Deathmatch-Spawn und verbindet MiniLang-Kamera,
Near-Clipping, Brush-/Patchkollision, ein Bitmap-Menü und lichtgemappte
BSP-Dreiecke mit einem echten Win32-Fenster. Ein CPU-Rasterizer stellt
perspektivisch interpolierte UVs, Tiefenpuffer, Alpha und bis zu 64 Lightmaps
bereit. Kamera/Projektion bestehen 50, BSP-Wireframe 34 und Renderdaten samt
adaptiver Bezier-Patch-Tessellation 55 Verträge. Der WinMM-Pfad lädt außerdem PCM-WAV direkt aus `pak0.pk3`; 35
Parser-Verträge sowie native Build-/Lifecycle-Prüfungen sind grün. Der
Materialpfad wertet `map`, `clampMap` und das erste `animMap`-Bild aus und
multipliziert TGA/JPEG-Basistexuren mit BSP-Lightmaps; 20 Verträge sind grün.
Der spielbare Controller ergänzt Gravitation, Boden-/Luftbeschleunigung, Reibung,
 Sprung, Sliding und Stufen mit 26 Verträgen. Das spielbare HUD verwendet nun 32
 originale Baseq3-Texturen für Fadenkreuz, Ziffern, Sarge-Porträt, Health, Armor,
 Ammo, Waffen-, Pickup- und Frag-Anzeigen; 28 eigene Verträge und die bestehenden
 62 HUD-Verträge sind grün. Der Fenstertitel zeigt geglättete FPS. Der Retail-Smoke lädt für
`q3dm1` 78 Texturen aus 27 Shader-Skripten, tesselliert 113 Patches und beendet
 30 Frames erfolgreich. Vorberechnete Kameraprojektion, direkte MD3-Transformationen
 und ein scanline-begrenzter inkrementeller Rasterizer senken die gemessene Framezeit
 im gleichen 30-Frame-Lauf von etwa 292 auf 96 ms. Ein weiterer Gameplay-Slice lädt 18 q3dm1-Items direkt
aus dem BSP, simuliert Pickup und Respawn, aktualisiert das HUD und ergänzt eine
kollisionsgeprüfte Hitscan-Waffe mit Ammo/Cooldown. Die 18 q3dm1-Items werden
inzwischen als originale, texturierte und rotierende/bobbende MD3-Modelle
gezeichnet. Item-, Waffen- und Effektlogik bestehen 33, 34 und 31 Verträge; der gemeinsame
Retail-Smoke läuft 60 Frames. Fünf lokale Ziele aus den übrigen q3dm1-Spawns
ergänzen Health, Hitscan-Schaden, Frag-Score und Drei-Sekunden-Respawn. Sie
prüfen Sicht durch BSP-Traces, patrouillieren, verfolgen, strafet und greifen
den Spieler an. Armor-Schadensaufnahme, Tod, Spawnwechsel, Spawn-Schutz und
Respawn des Spielers sind integriert. Die First-Person-Ansicht wechselt mit dem
Pickup auf das jeweilige originale texturierte Waffen-MD3; Feuerintervalle und
Direktschäden folgen den Baseq3-Waffenprofilen. Rückstoß, Hitmarker und K/D
bestehen weitere 40 Verträge;
Spielerzustand und Gegner-KI weitere 24 und 17. Der echte Sarge wird aus Lower,
Upper und Head über `tag_torso` und `tag_head` zusammengesetzt, aus seiner
`animation.cfg` interpoliert und mit den beiden Default-Skinbildern texturiert.
Der Nahbereich zeichnet alle 795 Sarge-Dreiecke mit aufgelösten Skins und
Normalenlicht; mittlere und weite LODs behalten alle Modellflächen. 37 MD3-,
27 Animations-, 34 Assembly- und 25 Skin-Verträge sowie Retail-Assetproben
sichern den Pfad. Pro Ziel wählen Gameplay-Ereignisse nun Idle, Walk, Run,
Attack, Pain, Death und Respawn; 22 Ereignis- und 29 Zustandsverträge prüfen die
Übergänge. Ein quantisierter Pose-/LOD-Cache besteht 25 weitere Verträge. Die
Weltgeometrie wird vollständig gecacht und pro Kamera über Leaf/PVS, Frustum,
Distanz und Backface ausgewählt; q3dm1 nutzt am Testspawn 324 Flächen mit rund
1.766 Dreiecken aus insgesamt 12.203. Welt-
und Spielermaterialien teilen denselben Shaderindex und halbieren damit ungefähr
die gemessene Asset-Smoke-Zeit. Vollständige Shaderstufen, exakte cgame-
Animationsmischung, QVM-Entities und die Matchschleife folgen. Gegnerbewegung
wird inzwischen mit Spielerhülle, Wall-Slide, 18-Unit-Step und Bodenbindung
gegen das BSP aufgelöst. Angriffe verwenden nun den originalen 100-ms-Takt und
7 Schaden der sichtbaren Machinegun. Ein erneuter BSP-Trace nach der Bewegung
schirmt den Spieler hinter Wänden ab und liefert Tracer, Bullet-Mark sowie den
originalen Ricochet-Sound. Der Hitscan beginnt am animierten `tag_flash` und
stimmt mit Mündungsmodell und dynamischem Licht überein. Bewegung, Hitscan und
Darstellung bestehen weitere 22, 12 und 35 Verträge sowie eine
q3dm1-Kollisionsprobe.

Der äußere [Client-Frame](CLIENT_MAIN_FRAME.md) ist ebenfalls vorhanden:
Timeout, Userinfo, Menüs, AVI-Zeit und die SendCmd-/Resend-/Cgame-/Screen-/
Sound-/Cinematic-/Console-Reihenfolge stimmen in 13 direkten C-Datensätzen
überein und bestehen 28 Verträge. Renderer-, Audio- und UI-Callbacks sind nun
an einem produktiven Framevertrag anschließbar.

Die [Clientzeit](CGAME_TIME.md) verbindet Snapshots mit dem cgame-Frame. Reset-,
Fast- und Slow-Drift, erste aktive Snapshots, Pause, `timeNudge`, Demo-Freeze,
Timedemo und Demo-Nachladen bestehen vier direkte Headerwerte und 26 Verträge.

**Abnahme:** Repräsentative Originalkarten zeigen keine fehlenden Materialien,
Modelle oder Effekte. Szenen-/Draw-Traces stimmen überein; Bildvergleiche bestehen
vorab festgelegte, begründete Toleranzen. CPU-Geometrie und Shader-Auswertung
werden zusätzlich unabhängig vom GPU-Bild verglichen. Voraussetzungen: 5–7.

## 9. Bots, Audio, Menüs und Cinematics vervollständigen

Der erste [Audiokern](AUDIO.md) überträgt 24.8-Mixwerte exakt in Mono-/Stereo-
DMA-Ringpuffer mit 8/16 Bit. Sieben direkte C-Datensätze und 20 Verträge sind
grün. Das Kanalpainting aus 16-Bit-Quellen ergänzt sieben direkte C-Datensätze
und 32 Verträge; Streaming und das Windows-Audiogerät folgen.

**Quellen:** `code/botlib/`, `code/game/ai_*.c`, `code/q3_ui/`,
`code/client/snd_*.c`, `code/client/cl_cin.c` und die Eingabe-/Soundteile der Plattformschicht.

**Arbeit:** AAS-Navigation, Routing, Bot-Ziele, Waffenwahl, Chat, Skills und
Bot-Scheduling mit originalem Zufallszustand übertragen. Audio-Decoder, Mixer,
Resampling, räumliche Zuordnung, Loops und Musik sowie RoQ-Wiedergabe inklusive
Audio-/Video-Timing portieren. Menüs, Serverbrowser, Key-Bindings, Konsole,
Profile, Spielstart und Auflösungseinstellungen mit der Laufzeit verbinden.
Bot-Singleplayer einschließlich Arenafortschritt und Ergebnismenüs abdecken.

**Ergebnis:** `src/botlib/`, `src/audio/`, `src/ui/`, Cinematic-Modul und vollständig
bedienbare baseq3-Laufzeit.

**Abnahme:** Bei gleichem Seed und Framebudget stimmen Bot-Entscheidungs- und
Aktionsfolgen überein. PCM-Ausgabe vor dem Audiogerät besteht den Referenzvergleich;
RoQ-Timing und UI-Abläufe bestehen Replays. Ein kompletter Bot-Matchablauf kann
über das Menü gestartet, beendet und fortgesetzt werden. Voraussetzungen: 6–8.

## 10. Gesamtparität abnehmen, Leistung messen und Release vorbereiten

**Arbeit:** Eine Matrix aller verfügbaren baseq3-Karten, Spielmodi, Waffen, Items,
Bot-Skills, Demos und Config-Kombinationen ausführen. Team-Arena-Pfade vollständig
inventarisieren und mit vorhandenen missionpack-Daten separat testen; fehlende
Missionpack-Funktionen ausdrücklich als offene Erweiterungsarbeit veröffentlichen.
QVM-Mods über dokumentierte Engine-Traps prüfen; Kompatibilität zu beliebigen
nativen DLL-Mods nicht ohne eigene ABI-Abnahme behaupten.

Langzeitmatches, Maprotation, Neustarts, Netzwerkfehler, Ressourcenverbrauch und
fehlerhafte Dateieingaben prüfen. Danach Hotspots profilieren und jeweils unter
erneuter Differentialprüfung optimieren. Build, Compiler, Assets und Konfiguration
für Messungen fixieren; Framezeiten, Speicher und GC-Pausen dokumentieren.
Paketierung, Datenpfaderkennung, Lizenz-/Herkunftshinweise, Startanleitung und
`docs/PARITY_AUDIT.md` erstellen. Linux x64 als gesonderte Plattformabnahme durchführen.

**Ergebnis:** Reproduzierbares Windows-Release, vollständiger Quell-/Testnachweis,
Restabweichungsliste und separat ausgewiesener Missionpack-/Linux-Status.

**Abnahme:** Alle baseq3-Pflichtfälle bestehen, jeder Laufzeit-Originalbereich ist
implementiert oder als begründete Plattform-/Bibliotheksausnahme dokumentiert.
Keine C-Engine oder C-Spielmodule ersetzen unbemerkt MiniLang-Implementierungen.
Offene Abweichungen tragen Reproduktion, Schweregrad und betroffene Konfiguration;
ein Release mit solchen Abweichungen wird nicht als vollständige Parität bezeichnet.
Voraussetzungen: 1–9.

## Geplante Zielstruktur und Reihenfolge

`src/` enthält die in den Schritten genannten MiniLang-Module; `native/` nur
dokumentierte Brücken. `tests/` enthält assetfreie Tests und Runner für lokale
Originaldaten. `scripts/` enthält Build-/Vergleichsautomation, `docs/reference/`
die Referenzprofile. Diese Verzeichnisse werden bei der jeweiligen Implementierung
angelegt. Der geprüfte Implementierungsstand steht in [PARITY_AUDIT.md](PARITY_AUDIT.md).

Die zehn Schritte sind Abnahmephasen in dieser Reihenfolge. QVM und Modulverträge
erlauben während der Entwicklung einen schrittweisen Austausch; temporäre
Originalmodule werden im Ledger sichtbar geführt und zählen nicht als portiert.
