# Framezeiten im Einzelspieler-Kampf auf q3dm0

Vergleichsstand ist `2aa0031`. Alle Messungen verwenden die lokale Retail-PK3,
die gleichen drei Original-QVMs, die RTX 5080 mit Hardware-OpenGL in
1280 × 720 und einen festen Simulationsschritt von 20 ms. In jedem Lauf über
2.200 Frames wurden 540 Positionsänderungen, 1.150 Angriffseingaben und
100 Munitionsabnahmen gemessen.

## Ursachen und Änderungen

Im instrumentierten Ausgangslauf dauerten 21 Frames mindestens 30 ms.
Bei allen 21 änderte sich während des Frames ein Zähler der Speicherbereinigung.
Das zeigt zeitliche Überschneidung. Die Phasenmessung enthält die Kosten der
Laufzeit im jeweils unterbrochenen Abschnitt. Bei acht Frames entfiel der
größte gemessene Anteil auf das Aufbereiten der Zeichenpuffer und bei sechs
auf die Modellgeometrie. Frame 1788 verbrachte 22 von 36 ms im Spielserver,
davon rund 16 ms in der Bot-Verarbeitung.

Der BSP-Durchlauf in MiniLang bestimmt weiterhin die Besuchsreihenfolge der
Teilbäume und verwirft Bereiche hinter dem ersten Treffer. Wo ein Segment eine
Ebene schneidet, berechnet eine native Hilfsfunktion die Koordinaten und den
Zeitanteil beider Teilsegmente gemeinsam. Ein lokaler, bei Bedarf wachsender
Bytepuffer hält die Endpunkte. Damit entfallen zwei temporäre Vektoren und
ein separates Array für jeden zurückgestellten Teilbaum.

Der Renderer zählt normale Geometrie, Waffenmodell und Empfänger dynamischen
Lichts gemeinsam. Ein zweiter Durchlauf verteilt die Dreiecke in Katalogreihenfolge.
Ändert sich die Anzahl der Dreiecke, übernimmt die betroffene Gruppe ihre weiterhin
benötigten Vertex-Datensätze. Die Zeichenpuffer anderer Gruppen kann sie weiterverwenden.

## Wirkung der Codeänderungen

Vier abwechselnde Vorher/Nachher-Paare liefen ohne Detailprofiler und mit den
gleichen GC-Einstellungen. Die Tabelle zeigt den Median der vier Läufe pro
Version. Die letzte Zeile betrifft den jeweils langsamsten Frame eines Laufs.

| Messwert | Vorher | Nachher |
| --- | ---: | ---: |
| FPS | 83,06 | 90,02 |
| Simulation pro Frame | 5,25 ms | 4,34 ms |
| Davon Spielserver einschließlich Bots | 2,31 ms | 1,71 ms |
| Davon Cgame | 2,93 ms | 2,61 ms |
| Aufbereiten der Szenen-Zeichenpuffer | 1,66 ms | 1,54 ms |
| Gesamte Geometriephase | 3,63 ms | 3,64 ms |
| Framezeit P95 | 24 ms | 21,5 ms |
| Framezeit P99 | 31 ms | 28,5 ms |
| Längster Frame je Lauf | 43 ms | 40 ms |

Die einzelnen Maxima lagen bei 40/40, 37/41, 47/35 und 46/40 ms
(vorher/nachher). Die Bildrate stieg in allen vier Paaren. Das höchste
Einzelbild verbesserte sich in zwei Paaren, blieb einmal gleich und wurde
einmal länger. Bis Frame 2.000 zählte die Laufzeit in jedem Ausgangslauf
64 Speicherbereinigungen und in jedem Vergleichslauf 57.

Ein separates Paar mit CPU- und QVM-Profiler lief anschließend ohne parallelen
Build. Von 2.200 Frames erreichten vorher 34 und nachher 18 die Schwelle von
30 ms. Davon überschnitten sich 30 beziehungsweise 17 mit Speicherbereinigung.
Der längste Frame dauerte in beiden Läufen 43 ms. In der neuen Version
entfielen bei diesem Frame 18 ms auf die Modellgeometrie und 10 ms auf das
Zeichnen. Die phasenweisen Einzelprotokolle liegen unter
`build/reports/frame_tail_short_pair/`.

## Separater Versuch mit größerem GC-Intervall

Mit identischem optimiertem Code wurden 64 und 128 MiB für `--gc-limit`
verglichen. Drei abwechselnde Paare ergaben 87,43 gegenüber 89,34 FPS,
29 gegenüber 28 ms P99 sowie 36 gegenüber 41 ms beim Median der längsten
Frames. Im ersten Paar überschnitt sich der erste Lauf mit dem Ende eines
separaten Tests. Auch in den beiden folgenden Paaren war der Effekt auf
die Spitzen unterschiedlich (36/41 und 46/37 ms). Bei Frame 2.000 hatte
die Laufzeit mit dem größeren Intervall 368–384 statt 288 MiB Heap
zugesichert. Für die Windows-Spielversion bleiben deshalb 64 MiB eingestellt.
Die Einzelläufe stehen in `build/reports/trace_frame_gc_ab.json`.

## Spiegelportale im längeren Kampf

Der Lauf über 2.200 Frames enthält keinen sichtbaren Portal-Durchlauf. Im
6.600-Frame-Replay baute der Renderer dagegen 161 Portal-Weltbatches und
verwendete weitere 252 erneut. Vor der Portaloptimierung erreichte ein
Einzelbild hier 92 ms. Im separaten Detailprofil kostete bei 37 von 76
Frames ab 50 ms die Portalvorbereitung am meisten Zeit. Mehrere Spitzen
lagen zwischen Frame 2.540 und 2.570.

Wenn sich die Liste sichtbarer BSP-Flächen änderte, schnitt der Renderer
die komplette Auswahl erneut an der Spiegelebene. Er behält jetzt für die
aktuelle Ebene das Ergebnis jeder bereits besuchten Weltfläche. Eine neue
Auswahl übernimmt die zugeschnittenen Dreiecke in der angeforderten
Reihenfolge. Jede Patch-Detailstufe hat ihren eigenen Flächenindex. Beim
Wechsel der Ebene werden die Einträge verworfen, beim Kartenwechsel entsteht
ein neuer Cache. Bewegliche Objekte werden weiter aus dem aktuellen Frame
zugeschnitten.

38 Portaltests prüfen unter anderem wechselnde Flächenauswahl, doppelte und
leere Einträge, Patch-Metadaten und Änderungen an Normalen oder Abstand.
Ein Differentialtest mit 8.192 Eingabedreiecken verglich alle 8.193
Ausgabedreiecke. Auf der RTX 5080 waren beim sichtbaren Spiegel in Frame
2.545 alle RGB-Pixel mit dem Ausgangsstand identisch. Der RGB-SHA-256 ist
`2332c95f18cb9c7d5aaf785b846e852cb09a3bc46a446cf7aea4d1b1b89abda8`.

Zwei abwechselnde Paare über 6.600 Frames verglichen die fertige Version
direkt mit `2aa0031`. Jeder Lauf lieferte 1.440 Positionsänderungen,
3.300 Angriffseingaben und 297 Munitionsabnahmen. Die Bildrate stieg von
73,54 auf 77,97 FPS, die Simulation sank von 4,82 auf 4,12 ms pro Frame.
P95 sank von 29,5 auf 28,5 ms. Bei P99 lagen die beiden Versionen bei
47 beziehungsweise 48 ms. Die Maxima waren 72/76 und 71/73 ms.
Die Portalvorbereitung lag über alle Frames bei 0,329 beziehungsweise
0,325 ms. Die seltenen langen Frames in diesem Abschnitt bleiben offen.

## Korrektheitsprüfungen

- 2.684 Welt- und Submodell-Kollisionsfälle auf q3dm0 und q3dm1 stimmten
  bei eingeschalteter Kurvenkollision mit Original-C überein. Weitere
  4.096 Fälle prüften die Kollisionsmathematik gegen Original-C.
- 35 Traversierungsprüfungen vergleichen Reihenfolge und Abbruch mit dem
  bisherigen MiniLang-Durchlauf, einschließlich einer Baumtiefe von 80.
  100 Fälle prüfen die gepackten Endpunkte, Seitenwahl und Puffergrenzen.
- 28 Szenen-, 64 World-Batch- und 16 MD3-Vertex-Prüfungen bestanden. Die
  Szenentests vergleichen die erzeugten Zeichenbefehle beim Vergrößern und
  Verkleinern einer Gruppe mit einem frischen Aufbau. Sie prüfen auch
  Ersatz-Vertex-IDs und das Entfernen des letzten dynamischen Lichtempfängers.
- Das q3dm1-Szenenprofil erwartete noch fünf Modelle mit 524 Dreiecken. Der
  separat aus `2aa0031` gebaute Test und die neue Version lieferten bei Frame
  120 beide neun Modelle, 1.408 Dreiecke, 1.817 Transformations-Cache-Misses
  und 256 Cache-Einträge. Mit dem korrigierten Sollwert bestand auch der
  Bytevergleich der erneut gepackten Zeichenbefehle.
- Hardware-Bildvergleiche verglichen alle RGB-Pixel bei 1280 × 720. Nach
  180 Frames auf q3dm0 und 90 Frames auf q3dm1 stimmten die Bilder beider
  Versionen überein. Die Aufnahmen liegen unter
  `build/reports/trace_frame_tail_capture/`.

Die Rohmessungen einschließlich der Einzelwerte und Binärdatei-Hashes liegen
lokal unter `build/reports/trace_frame_tail_ab.json`.

Für eine erneute Diagnose mit lokalen Retail-Daten und den bereits gebauten
Original-QVMs protokolliert der erste Befehl die einzelnen Frames ab 30 ms.
Der zweite baut das Replay für Zeitvergleiche ohne Detailprofiler.

```powershell
python scripts/test_ingame_controls_render.py --published-compiler --data-root build --map q3dm0 --singleplayer --mode moving --frames 2200 --fixed-step-ms 20 --cpu-profile --qvm-profile --profile-min-ms 30 --label frame_tail_after
python scripts/test_ingame_controls_render.py --published-compiler --data-root build --map q3dm0 --singleplayer --mode moving --frames 2200 --fixed-step-ms 20 --label frame_tail_reuse
```

Der direkte Langvergleich verwendet die eingefrorene Ausgangs-EXE mit ihren
DLLs und die endgültige Replay-EXE. Die Laufprotokolle enthalten auch
Speicherstände, Simulationszähler und den Namen des OpenGL-Geräts.

```powershell
python scripts/test_ingame_controls_render.py --published-compiler --data-root build --map q3dm0 --singleplayer --mode moving --frames 6600 --fixed-step-ms 20 --label frame_tail_portal
python scripts/benchmark_function_contract_game.py --baseline build/reference/frame_tail_old_runtime/controls_render_replay_sim_host_reuse.exe --candidate build/controls_render_replay_frame_tail_portal.exe --frames 6600 --repeat 2 --output build/reports/trace_portal_combat_ab.json
```
