# MiniQuake3: überprüfter Stand

Stand: 2026-09-05. Der Port ist **in Arbeit und noch nicht spielbar**.
Ein erfolgreicher Referenzlauf ist ein Lauf der ursprünglichen C-Engine,
kein Nachweis einer schon portierten MiniLang-Engine.

Die zuletzt vollständig ausgeführte erweiterte Regression besteht aus 41 bestandenen
Prüfbereichen (`verify.py --data-root D:/Quake3 --extended`), einschließlich
der Spawnpunkt-/Leichenprüfung, der Punkte-/Ranglisten-/Matchende-Regeln und
der integrierten Spieler-Todesfolge, der Item-/Flaggen-Entity-Prüfung sowie den
vollständigen `ClientSpawn`-, `ClientThink`- und `ClientEndFrame`-Abläufen.
Der anschließend ergänzte `G_RunFrame`-Vergleich und seine angrenzenden
Spawn-/Client-Regressionen bestehen zusätzlich; der nächste erweiterte Gesamtlauf
wird ihn als 42. Prüfbereich aufnehmen.
Der finale MiniQuake3-Build hat SHA-256
`3a8c6f394b337404511f826e34404d0fd5f9c3011af6b7a4b2a96cc5321d99fb`.
Der Gesamtbericht und die Einzelbelege sind in `reference/evidence.json` archiviert.

| Schritt | Stand | Vorliegender Nachweis / noch fehlende Abnahme |
| --- | --- | --- |
| 1. Referenz | Grundabnahme bestanden | Originale x86-Engine, drei native Module, drei neu gebaute QVMs; MiniLang-Build; 1.409 Dateien inventarisiert; 120 Frames mit zwei Bots aufgezeichnet und zweimal bytegleich wiedergegeben |
| 2. Zahlen/Plattform | In Arbeit | 101.445 binäre Float-Ergebnisse, 53.248 bisherige q_math-Ergebnisse, 65.536 AngleVectors-/SnapVector-Fälle und 26 Snap-Grenzfälle stimmen; Windows-Dateizugriff vorhanden; Fenster, Eingabe, UDP und Audio noch offen |
| 3. Engine-Kern/VFS | In Arbeit | 513 Cvar-Operationen, 448 Parseraufrufe, 84 ZIP/DEFLATE-Vergleiche bestanden; Command-Buffer, vollständige Suchpfade/Pure-Checksummen und Engine-Schleife fehlen |
| 4. QVM | In Arbeit | 404 Vergleiche mit dem Originalinterpreter; drei begrenzte Einstiegspunkte echter CD- und neu gebauter QVMs; vollständige Engine-Traps und Modulinitialisierung fehlen |
| 5. Kollision/Pmove | In Arbeit | BSP-/Kurvenkollision, räumliche Abfragen, dynamische Entities, Bewegungsbahnen, geometrische Trigger-Erkennung, Sprungpad-/Teleport-Replays, ClientBegin und G_RunFrame-Einbindung geprüft; komplette Match-Telefrag-Replays fehlen |
| 6. Spiel/Server | In Arbeit | Entity-Verwaltung, Spawn-Regeln, Worldspawn, 34 Spawn-Klassen und alle 35 Item-Spawns, Target-Ketten, Speaker-/Push-Targets, Timer, Ortsmarkierungen, Shader-Remaps, `G_RunFrame` samt Entity-/Client-Schleifen sowie Schaden/Rüstung/Rückstoß, Hurt-/Kill-/Laser-Objekte, Radius-/Sichtlinien-Treffer, Raketen/Granaten/Plasma/BFG, Grappling-Hook, Shooter, Telefrag-Integration, vollständiger Client-Lebenszyklus, Leichen, Items, Punkte, Ränge, Matchende und CTF vorhanden; weitere Klassen, Mover-Pushing und Tournament-/Team-/Vote-/Cvar-Wartungsimplementierungen fehlen |
| 7. Netzwerk/Client | Offen | Noch keine MiniLang-Implementierung |
| 8. Renderer/Cgame | Offen | Noch keine MiniLang-Implementierung |
| 9. Bots/Audio/UI | Offen | Noch keine MiniLang-Implementierung |
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
  noch kein zugesicherter Kompatibilitätsumfang. PK3-Pfadpriorität und Pure-Server-
  MD4-Checksummen sind noch nicht implementiert. CRC32 allein ersetzt diese nicht.
- BSP-Lesen, Welt-/Inline-Modellkollision, Kurvenflächen, Transformationen,
  temporäre Boxen, Sichtbarkeitsdaten und Areaportale haben eigene Vergleichstests.
  Bewegte Entities sind mit Pmove verbunden; Türsteuerung, Mover-Pushing und
  Rendering sind noch offen.
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
Target-/Entity-Schleifenprüfung abgedeckt. Der vollständige Serverframe bleibt offen.

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
16.494.497 Wörter und 2.047.218 String-Bytes stimmen exakt. Nach 849 Kontaktproben
an tatsächlich geladenen Triggern tragen 754 PlayerStates einen Sprungpad-Merker
und 139 das Teleport-Bit. Eine Probe kann durch überlappende Trigger beide Merker
tragen; diese Zahlen zählen Ergebniszustände, nicht die Zahl einzelner Callbacks.
Feld-, Think- und Kartenprüfung verwenden dasselbe MiniLang-Testbinary
(`eb2b7b0a14844c61c0833ec957124a4bd48a515daf5841705cd3d1c12c3eacf5`).

34 der 48 Spawn-Klassen führen bereits die übertragenen Originalfunktionen aus.
Worldspawn-Effekte, alle Spielmodusfilter, die frühe Brush-Modell-Verlinkung,
die 100-ms-Zielausrichtung der Sprungpads und komplette PlayerStates nach
Trigger-Kontakten sind enthalten. Einige originale Positions-/CTF-Spawn-Funktionen
sind leer; manche andere geben ihre Entity unmittelbar frei. Die Abnahme bewahrt
diese Funktionen, ohne damit bereits Spieler-Respawn oder CTF-Regeln zu behaupten.

**Aufrufgrenzen:** Die 14 noch nicht portierten Klassen werden in diesen Replays
aufgezeichnet und erzeugen keine vereinfachten Ersatzregeln. Alle 35 Item-Aufrufe
laufen dagegen durch `G_SpawnItem`; Platzierung und späteres Verhalten prüft die
gesonderte Item-Suite. Ohne gesetzten `unportedFn` bricht MiniLang an einer noch
nicht portierten bekannten Klasse kontrolliert ab. Der Testhost stellt Speicher
und Configstring-/Cvar-Schnittstellen bereit; Netzwerkverteilung, vollständige
Frames und Mover-Pushing bleiben offen. Die Item-Suite prüft inzwischen
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
**keine vollständige G_RunFrame-Abnahme**: Cvar-/Zeitverwaltung, die Einbindung von ClientEndFrame,
die Frame-Einbindung der Matchende-Regeln, Votes und vollständige Serverintegration fehlen.
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
Offen sind weitere Waffentreffer und die vollständige Waffensteuerung,
weitere Teamregeln und Serverintegration. Schadensfeedback am Frame-Ende ist
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
ist inzwischen separat geprüft; Client-Frames bleiben offen.

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
beobachtet. Tatsächliche Kartenwechsel, Logdatei-Zeitstempel/-Ausgabe,
Netzwerkzustellung und Scoreboard-Grafik sind noch offen. Spieler-Tod,
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

`scripts/test_client_spawn.py` besteht mit **17 Szenarien**, **4.666 exakt
gleichen 32-Bit-Wörtern**, **18.766 Ausgabe-Bytes** und **116 geordneten
Host-/Link-Ereignissen**. Acht Laufzeitverträge prüfen die Initialisierung,
Info-Strings, fehlende Pflichtgrenzen und die Standardverbindung aus `respawn`.

Der Port deckt FFA-, Initial-, CTF-, Team- und Zuschauerpositionen,
Bot-/Human-Filter, Persistenz und Transient-Reset, Handicap, Spawnzähler,
Startwaffen, Gesundheit, Teleport-/Vote-Flags, KillBox, Verlinkung, Spawn-Targets,
Waffenwahl und beide PlayerState-zu-EntityState-Konvertierungen ab. Die native
Referenz führt den unveränderten `ClientSpawn`-Funktionskörper aus.
`trap_GetUserinfo`, `trap_GetUsercmd`, `ClientThink`, `ClientEndFrame` und
`MoveClientToIntermission` bleiben in dieser isolierten ClientSpawn-Suite
explizit beobachtete Host-Grenzen; der normale MiniLang-Pfad ruft inzwischen
die portierten Think- und Frame-Abschlüsse auf. Details:
[CLIENT_SPAWN.md](CLIENT_SPAWN.md).

## ClientBegin (Schritt 6)

`scripts/test_client_begin.py` besteht mit **acht Szenarien**, **2.907 exakt
gleichen 32-Bit-Wörtern**, **12.111 Ausgabe-Bytes** und **92 geordneten
Host-/Configstring-/Link-Ereignissen**. Fünf Laufzeitverträge prüfen Slotgrenzen,
Pflichtschnittstellen und die Registrierung als Standard-Callback.

Der Vergleich führt `ClientBegin`, `ClientSpawn` und `CalculateRanks` auf beiden
Seiten als echte Implementierungen aus. Geprüft sind Unlink/Reinitialisierung,
persistent gebundener Client, vollständiger PlayerState-Reset mit erhaltenen
`eFlags`, Spawn, Teleport-In-Ereignis, Eintrittsmeldung, Log und Ränge. Tournament,
Zuschauer, Intermission, CTF, ein weiterer Ranglisten-Client und 32-Bit-Zeitgrenzen
sind enthalten. Details: [CLIENT_BEGIN.md](CLIENT_BEGIN.md).

## Vollständiger Spielserverframe (Schritt 6)

`scripts/test_full_frame.py` besteht mit **sechs Szenarien**, **3.301 exakt
gleichen 32-Bit-Wörtern** und **13.217 Ausgabe-Bytes**. Drei Laufzeitverträge
prüfen Pflichtgrenzen, Clientlimit und Restart-Frühabbruch.

Geprüft sind Framezähler und Zeit, Cvar-Aktualisierung, die vorhandene
Entity-Schleife, Client-Endframes, die echte Matchende-Prüfung und anschließend
Tournament, Teamstatus, globale und Team-Votes sowie Cvar-Nachverfolgung. Auch
die 1.024 Einträge von `g_listEntity` und dessen Cvar-Reset laufen in der
Originalreihenfolge. Die noch nicht portierten Wartungsfunktionen sowie
Mover-/sonstige Physics-Ausführung bleiben geordnete Callbacks. Details:
[FULL_FRAME.md](FULL_FRAME.md).

## ClientThink (Schritt 6)

`scripts/test_client_think.py` besteht mit **27 Szenarien**, **7.357 exakt
gleichen 32-Bit-Wörtern**, **29.702 Ausgabe-Bytes** und **77 geordneten
Nebenwirkungen**. Drei Laufzeitverträge prüfen die Usercmd-/Waffenfeuer-
Schnittstellen und Kontakt-Deduplizierung.

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

`ClearRegisteredItems`, `SaveRegisteredItems`, die native Paritätsprüfung
nichtnulliger Item-Deaktivierungs-Cvars, tatsächliche `PrintMsg`-Netzwerkzustellung
und Missionpack bleiben offen. Details: [ITEMS.md](ITEMS.md).

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
python scripts/test_targets.py
python scripts/test_combat.py --data-root D:/Quake3
python scripts/test_missiles.py --data-root D:/Quake3
python scripts/test_bodies.py --data-root D:/Quake3
python scripts/test_scores.py
python scripts/test_deaths.py
python scripts/test_items.py
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
