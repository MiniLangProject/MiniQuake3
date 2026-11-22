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

## Spiegel und erstes Auftauchen des Hologramms

Ausgangspunkt für diesen Vergleich ist `9466c94`. Eine separat instrumentierte
Kopie des Renderers zerlegte die Portalvorbereitung beim Abspielen des
Retail-Kampfs. Unter den ersten 3.000 Frames hatten 172 Portalansichten eine
nichtleere BSP-Auswahl. In den 80 Ansichten zwischen 51.900 und 53.500 ms
Spielzeit kostete das Zusammenstellen des Welt-Batches im Schnitt 5,67 ms
(Maximum 21 ms), das Beschneiden seiner BSP-Flächen 0,07 ms (Maximum 1 ms).
Die Portalansicht enthielt in diesem Fenster im Schnitt 1.503 Szenendreiecke.

In Frame 2540 kamen die Texturen des Hologramms und des Röntgenmodells erstmals
ins Bild. Beide MD3-Dateien sind in der Retail-BSP von `q3dm0` als `model2`
für rotierende Objekte eingetragen. Beim Kartenstart dekodiert der Port jetzt
die Shaderbilder der vom Server angekündigten und von Cgame registrierten
MD3-Modelle. Der erste sichtbare Materialdurchlauf vergibt die Textur-Slots
und lädt die Bilder in den Grafikspeicher. Ein Retail-Test prüft beide
Hologramm-Texturen, die Wiederverwendung bei mehreren Modell-LODs, einen
unregistrierten Modellpfad und die Slotbelegung.

Bei aufeinanderfolgenden Welt- oder Modelldreiecken mit demselben Material
bestimmt der Renderer die erste Shaderstufe einmal. Ein nativer Aufruf
schreibt die drei Eckpunkte, beide UV-Sätze und die Farben in den bestehenden
128-Byte-Zeichenbefehl. Ein Bytevergleich mit dem bisherigen Feldschreiber
deckt auch vorzeichenbehaftete Slotnummern und die Farbgrenzen ab.
Beim Portal-Clipping vergleicht der Port zuerst alle drei Eckpunkte mit der
Spiegelebene. Nur Dreiecke, die sie schneiden, benötigen eine Interpolation.

### Sechs Läufe über je 6.600 Frames

Ausgangs- und Messversion liefen in wechselnder Reihenfolge auf derselben
RTX 5080 mit Hardware-OpenGL, 1280 × 720 und festem 20-ms-Simulationsschritt.
Alle sechs Läufe meldeten 1.440 Positionsänderungen, 3.300 Angriffsframes
und 297 Munitionsabnahmen. Die Framezeiten messen die Arbeit der Spielschleife,
die FPS ergeben sich aus der gesamten abgelaufenen Zeit.

| Laufpaar | FPS vorher → nachher | P95 (ms) | P99 (ms) | Langsamster Frame (ms) |
| --- | ---: | ---: | ---: | ---: |
| 1 | 68,32 → 67,50 | 32 → 32 | 51 → 49 | 75 → 71 |
| 2 | 66,49 → 81,10 | 33 → 27 | 53 → 43 | 80 → 67 |
| 3 | 69,59 → 81,37 | 31 → 28 | 52 → 43 | 91 → 82 |
| Median | **68,32 → 81,10** | **32 → 28** | **52 → 43** | **80 → 71** |

Das Vorbereiten der Szenen-Batches sank im Median von 2,25 auf 1,51 ms
pro Frame, die Portalvorbereitung von 0,358 auf 0,261 ms. Das erste Paar
zeigte einen leichten FPS-Rückgang. Auch die Simulationszeiten schwankten.
Die gemessene Startphase der Karte einschließlich Weltaufbau, Modellbildern
und initialem Upload dauerte im Median 3.089 ms vorher und 3.145 ms danach.
Der langsamste einzelne Frame der neuen Version dauerte 82 ms.

Die vollständigen Zahlen und Prüfsummen schreibt der folgende Vergleich nach
`build/reports/portal_command_warm_long.json`. Die Ausgangs-EXE lief mit den
im vorherigen Replay erfassten Windows-, QVM- und ABI-DLLs.

```powershell
python scripts/test_ingame_controls_render.py --published-compiler --data-root build --map q3dm0 --singleplayer --mode moving --frames 3200 --fixed-step-ms 20 --label portal_command_warm
python scripts/benchmark_function_contract_game.py --baseline build/reference/portal_pack_baseline/controls_render_replay_frame_tail_portal.exe --candidate build/controls_render_replay_portal_command_warm.exe --frames 6600 --repeat 3 --output build/reports/portal_command_warm_long.json
```

Ein zweites Replay mit demselben CPU-Profiler auf beiden Ständen isolierte
Frame 2540. Gegenüber 98 ms vorher dauerte er danach 50 ms. Die
Materialauflösung sank von 20 auf 1 ms, die Portalvorbereitung von 31 auf
10 ms. Der neue Zähler für Bilddekodierungen sank von drei auf null. Vier
Textur-Slots wurden in beiden Versionen beim ersten Sichtkontakt belegt.
Diese Einzelmessung enthält Profilerkosten und ging nicht in die Tabelle ein.

Der Vergleich von Frame 2545 ergab denselben RGB-SHA-256 wie beim
Ausgangsbild (`2332c95f18cb9c7d5aaf785b846e852cb09a3bc46a446cf7aea4d1b1b89abda8`).
Die 432 Retail-Differentialfälle des Welt-Renderers, 40 Portalverträge,
64 Welt-Batch- und 28 Szenen-Batch-Verträge sowie neun Retail-Tests für
Modell- und Skinbilder bestanden. Die gebaute Windows-EXE erreichte das
Originalmenü aus einem anderen Arbeitsverzeichnis mit benachbartem
`baseq3` in 0,44 s.

### Einschlagmarken im Botkampf

Ein weiterer 3.200-Frame-Replay auf `q3dm0` mit Original-QVMs und Retail-PK3
zählte 4.965 Aufrufe von `CG_CM_MARKFRAGMENTS`. Die Fläche eines BSP-Blatts
kann mehrfach referenziert sein. Die bisherige Flächensuche legte für jede
Projektion eine neue Hash-Menge an. Sie verwendet nun pro geladenem BSP einen
wiederverwendbaren Byte-Zähler für bereits besuchte Flächen; beim Wechsel des
BSP-Bytepuffers und beim Zählerüberlauf wird er neu angelegt. Die Reihenfolge
der Flächen und die Original-Clipping-Regeln bleiben erhalten.

Die gemessene Hostzeit dieser Trap sank bei identischer Aufrufzahl von
1.095,57 auf 933,80 ms (220,66 auf 188,08 µs/Aufruf). Drei abwechselnde
A/B-Paare auf der RTX 5080, Hardware-OpenGL und 1280 × 720 ergaben:

| Paar | FPS vorher → nachher | P99 vorher → nachher | Längster Frame vorher → nachher |
| --- | ---: | ---: | ---: |
| 1 | 77,03 → 78,42 | 44 → 48 ms | 74 → 64 ms |
| 2 | 76,87 → 80,98 | 44 → 46 ms | 60 → 61 ms |
| 3 | 76,30 → 78,67 | 50 → 46 ms | 70 → 59 ms |
| Median | **76,87 → 78,67** | **44 → 46 ms** | **70 → 61 ms** |

Jeder Lauf enthielt 752 Positionsänderungen, 1.650 Angriffseingaben und
160 Munitionsabnahmen. Die 24 Mark-Fragment-Verträge einschließlich
Cache-Überlauf, fünf bitgenaue Original-C-Vergleiche und der Retail-Test auf
`q3dm1` bestanden. Der mittlere Durchsatz verbessert sich geringfügig; die
P99-Framezeit ist weiterhin nicht stabil verbessert. Die Ruckler bei Bots
bleiben offen. Rohlogs liegen unter `build/reports/mark_visit_cache_ab/`.

Der gleich lange Replay ohne Bot lag bei 138,20 FPS und P99 19 ms; mit Bot
waren es vor dieser Änderung 71,73 FPS und P99 47 ms. Im Botlauf benötigten
Simulation, Geometrie und Rendern im Mittel 4,67, 4,59 und 4,28 ms pro
Frame, ohne Bot 3,12, 2,05 und 1,79 ms. Von 51 Bot-Frames ab 45 ms
überlappten 47 mit einem GC-Ereignis, 30 enthielten mindestens 10 ms
Portalvorbereitung und 39 mindestens 15 ms Zeichenausgabe. Diese Zähler
zeigen eine Korrelation; sie beweisen keine einzelne Ursache der Pausen.

Ein separater Lauf mit dem nativen Render-Zeitmesser erfasste 3.200
Spielbilder nach sieben Startbildern. Im Mittel lagen 1,24 ms im nativen
OpenGL-Zeichnen und 3,06 ms zwischen Frame-Beginn, Zeichnen und Swap;
`SwapBuffers` selbst lag unter 0,05 ms. Bei den 17 Renderbildern ab 25 ms
lagen im Mittel 5,02 ms im nativen Zeichnen und 26,19 ms außerhalb von
Zeichnen und Swap, mit durchschnittlich 379 Draw-Calls. Ein Spitzenbild
bei Index 2566 benötigte 37,13 ms im Renderpfad, davon 5,58 ms native
Zeichenausgabe und 31,50 ms übrige Arbeit. Damit ist der OpenGL-Aufruf
allein keine Erklärung für die Ruckler; Portal-/Geometrieaufbau und
Simulation müssen getrennt weiter optimiert werden. Rohdaten:
`build/reports/mark_native_profile.txt` und
`build/reports/mark_native_profile_replay.log`.
