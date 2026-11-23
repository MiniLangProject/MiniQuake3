# Botkampf: große Einschlagspuren auf Arena Gate

Die produktive Original-Cgame-QVM auf `q3dm1` erzeugt nach längerem Kampf
mehrere `CG_CM_MARKFRAGMENTS`-Aufrufe pro Frame. Ein 3.200-Frame-Replay mit
festem 20-ms-Spielschritt, Retail-`pak0.pk3`, Original-QVMs und Hardware-OpenGL
auf der RTX 5080 hatte ohne Änderung P99 66 ms und 71,69 FPS. In Frame 3030
benötigte `CG_DRAW_ACTIVE_FRAME` rund 71 ms Hostzeit, davon 62 ms in drei
Mark-Traps. Die Karte hatte dabei **keine** Portal-Batch-Neubauten.

Eine nur in einer ignorierten Quellkopie instrumentierte Projektion zerlegte
322 Aufrufe ab 10 ms: 317 betrafen mehr als 256 Dreiecke. Bei diesen Aufrufen
lag die Geometrie-Extraktion im Median bei 14 ms, maximal bei 40 ms. Die
wiederkehrende Flächenmenge umfasste 3.184 Dreiecke; nur wenige passierten
die anschließende Bounds- und Clipping-Prüfung. Der bisherige Cache speicherte
höchstens 256 Dreiecke und extrahierte die identische BSP-Geometrie erneut.

Der Cache speichert nun bis zu **4.096 Dreiecke** pro geordneter Flächenliste.
BSP-Objekt- und Datenpufferwechsel, die Flächenreihenfolge und das
32-Slot-Limit behalten ihre bisherigen Invalidierungsregeln. Projektions-
und Clipping-Ebenen werden für jede Einschlagspur neu berechnet.

## Abwechselnder Retail-A/B-Vergleich

Beide Replay-EXEs wurden mit dem veröffentlichten MiniLang 1.3.9 aus
demselben Produktivpfad gebaut. Nur die Cache-Grenze unterscheidet sich.
Jeder Lauf bewegte den Spieler 759-mal, sendete 1.650 Angriffe und zählte
159 Munitionsabnahmen. Die sechs Läufe wechselten die Reihenfolge.

| Paar | Vorher FPS / P99 / Maximum | Nachher FPS / P99 / Maximum |
| --- | ---: | ---: |
| 1 | 68,86 / 65 / 100 ms | 84,59 / 43 / 68 ms |
| 2 | 66,96 / 69 / 93 ms | 84,08 / 42 / 63 ms |
| 3 | 66,49 / 68 / 97 ms | 87,78 / 44 / 73 ms |
| Median | **66,96 / 68 / 97 ms** | **84,59 / 43 / 68 ms** |

Cgame sank im Median von 5,64 auf 2,81 ms pro Frame. Bis Frame 3000
meldete die Laufzeit in allen drei Baseline-Läufen 122 GC-Zyklen, in allen
drei Kandidatenläufen 87. Die erfassten Live-Daten lagen dort bei etwa
123–124 MiB beziehungsweise 125 MiB. Der Cache hält etwas mehr Geometrie,
reduziert jedoch wiederholte Dekodierungen und Allokationen.

Fünf aus dem unveränderten Original-C-Code gewonnene Datensätze,
26 Mark-Verträge einschließlich einer 300-Dreiecke-BSP-Fläche und die
Retail-`q3dm1`-Projektion bestanden. Der vollständige Kandidaten-Replay
lief durch. Rohdaten liegen unter
`build/reports/mark_geometry_4096_q3dm1_ab.json` und
`build/reference/controls_render_replay/mark_phase_profile/moving.log`.

Zwei zusätzliche abwechselnde Paare auf `q3dm0` verwendeten 752
Positionswechsel, 1.650 Angriffe und 160 Munitionsabnahmen je Lauf. Der
FPS-Median lag bei 74,43→75,58, P99 bei 48,5→45 ms und das Maximum bei
69,5→64 ms. Der einzelne erste Kandidatenlauf war bei FPS langsamer;
die zwei Paare erlauben keine starke Aussage über die Bildrate dieser Karte.
Rohdaten: `build/reports/mark_geometry_4096_q3dm0_ab.json`.

Diese Messung beweist keine konstante Bildrate in jeder Karte oder jedem
Kampfzustand; weitere Bot- und Render-Spitzen bleiben zu untersuchen.
