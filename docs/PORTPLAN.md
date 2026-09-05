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

## 5. BSP-Kollision und gemeinsame Spielphysik exakt übertragen

**Geprüfter Zwischenstand 2026-09-05:** BSP-/Kurvenkollision, transformierte Modelle,
temporäre Boxen, PVS-/Areaportal-Funktionen, dynamische Server-Kollision,
Bewegungsbahnen, geometrische Trigger-Abfragen, Sprungpad-/Teleport-Zustandswechsel
und der vollständige baseq3-Pmove-
Befehlszyklus sind in MiniLang implementiert und gegen C geprüft. `--pmove-map`
spielt Textbefehle auf Originalkarten ab; `--trace-model` und `--inspect-visibility`
prüfen die neuen räumlichen Abfragen. Für die gesamte Schritt-Abnahme fehlen
die Einbindung in vollständige Server-/Client-Frames und die Schadens-/Todesfolgen
von Telefrags aus Schritt 6. Dynamische Entities, Trigger-Erkennung und
Sprungpad-/Teleport-Replays sind bereits mit Pmove verbunden; Ereignis-Entities,
Blickwinkel-Deltas und die Auswahl/Aufrufreihenfolge der Telefrag-Kandidaten werden
gegen C geprüft. Die aktuelle Grenze der Schadensfunktion ist ausdrücklich
[dokumentiert](GAME_TRANSITIONS.md). Der temporäre
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
Klassen-/Item-Auswahl. 19 Spawn-Klassen einschließlich Sprungpads und Teleportern,
deren spätere Zielausrichtung sowie `G_RunThink` sind übertragen. Die 29 weiteren
Klassen und Item-Spawns bleiben ausdrücklich offene Aufrufgrenzen; siehe
[SPAWNING.md](SPAWNING.md). Als Nächstes folgen diese Spielobjekte, die Einbindung
in vollständige Serverframes mit Ereignisfreigabe, Schadens-/Todesregeln und
Mover-Pushing. Der vollständige Server bleibt bis zu dieser Integration offen.

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

**Abnahme:** Repräsentative Originalkarten zeigen keine fehlenden Materialien,
Modelle oder Effekte. Szenen-/Draw-Traces stimmen überein; Bildvergleiche bestehen
vorab festgelegte, begründete Toleranzen. CPU-Geometrie und Shader-Auswertung
werden zusätzlich unabhängig vom GPU-Bild verglichen. Voraussetzungen: 5–7.

## 9. Bots, Audio, Menüs und Cinematics vervollständigen

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
