# MiniQuake3: überprüfter Stand

Stand: 2026-09-05. Der Port ist **in Arbeit und noch nicht spielbar**.
Ein erfolgreicher Referenzlauf ist ein Lauf der ursprünglichen C-Engine,
kein Nachweis einer schon portierten MiniLang-Engine.

| Schritt | Stand | Vorliegender Nachweis / noch fehlende Abnahme |
| --- | --- | --- |
| 1. Referenz | Grundabnahme bestanden | Originale x86-Engine, drei native Module, drei neu gebaute QVMs; MiniLang-Build; 1.409 Dateien inventarisiert; 120 Frames mit zwei Bots aufgezeichnet und zweimal bytegleich wiedergegeben |
| 2. Zahlen/Plattform | In Arbeit | 101.125 binäre Float-Ergebnisse, 53.248 bisherige q_math-Ergebnisse, 65.536 AngleVectors-/SnapVector-Fälle und 26 Snap-Grenzfälle stimmen; Windows-Dateizugriff vorhanden; Fenster, Eingabe, UDP und Audio noch offen |
| 3. Engine-Kern/VFS | In Arbeit | 513 Cvar-Operationen, 448 Parseraufrufe, 84 ZIP/DEFLATE-Vergleiche bestanden; Command-Buffer, vollständige Suchpfade/Pure-Checksummen und Engine-Schleife fehlen |
| 4. QVM | In Arbeit | 392 Vergleiche mit dem Originalinterpreter; drei begrenzte Einstiegspunkte echter CD- und neu gebauter QVMs; vollständige Engine-Traps und Modulinitialisierung fehlen |
| 5. Kollision/Pmove | In Arbeit | BSP-/Kurvenkollision, transformierte Modelle, temporäre Boxen, PVS-/Areaportal-Verwaltung und Pmove exakt geprüft; dynamische Entity-Einbindung, integrierte Sprungpad-/Teleport-Replays und eine gesonderte Behandlung des ursprünglichen Kapsel-Handle-Fehlers bleiben offen |
| 6. Spiel/Server | Offen | Noch keine MiniLang-Implementierung |
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
  Das Verknüpfen bewegter Entities, Türsteuerung und Rendering sind noch offen.
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
