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

## Wiederverwendung einzelner BSP-Flächen

Nach der ersten Änderung sank die Zahl der mindestens 35 ms langen
instrumentierten `q3dm1`-Frames von 229 auf 57. Ein neuer Satz von
Einschlagflächen verursachte weiterhin einzelne Mark-Traps bis 33 ms.
Der Cache aktiviert die zusätzliche Wiederverwendung erst, wenn eine
vollständige, nicht abgeschnittene Flächenliste mehr als 768 Dreiecke
liefert. Danach dekodiert er jede unveränderte BSP-Fläche bei Bedarf einmal
und stellt neue geordnete Listen aus diesen Dreiecken zusammen. Er hält
höchstens 16.384 solcher Dreiecke pro BSP und verwirft sie bei Karten-
oder Datenpufferwechsel. Die bestehenden 32 Slots für vollständige Listen
bleiben erhalten. Doppelte Flächen werden wie im Original nur einmal
ausgegeben; Polygon-Clipping bleibt pro Einschlag neu.

Ein erster Versuch aktivierte den Flächencache auf allen Karten. Drei
abwechselnde `q3dm1`-Paare ergaben 78,43→79,31 FPS und P99 45→37 ms im
Median. Auf `q3dm0` sank aber in drei weiteren Paaren der FPS-Median von
79,31 auf 74,68. Daraufhin wurde die Aktivierung auf große Listen begrenzt.
Rohdaten der verworfenen Variante:
`build/reports/mark_face_geometry_q3dm1_ab.json` und
`build/reports/mark_face_geometry_q3dm0_ab3.json`.

Drei neue abwechselnde 3.200-Frame-`q3dm1`-Paare verglichen die bedingte
Variante mit der schon veröffentlichten 4.096-Dreiecke-Version:

| Paar | Vorher FPS / P99 / Maximum | Nachher FPS / P99 / Maximum |
| --- | ---: | ---: |
| 1 | 91,27 / 41 / 66 ms | 97,45 / 32 / 46 ms |
| 2 | 96,13 / 40 / 66 ms | 92,42 / 34 / 47 ms |
| 3 | 92,71 / 41 / 64 ms | 96,31 / 33 / 50 ms |
| Median | **92,71 / 41 / 66 ms** | **96,31 / 33 / 47 ms** |

Der Kandidat hatte in allen Paaren dieselben 759 Positionswechsel,
1.650 Angriffskommandos und 159 Munitionsabnahmen. Cgame sank im Median
von 2,64 auf 2,41 ms pro Frame. Auf `q3dm0` ergaben drei Kontrollpaare
81,58→82,00 FPS und unverändert P99 44 ms im Median bei ebenfalls gleichen
Spielereignissen (752 Positionswechsel, 1.650 Angriffskommandos,
160 Munitionsabnahmen). Ein einzelner Kandidatenlauf hatte dort einen
77-ms-Maximalframe statt 62 ms in der entsprechenden Baseline; diese
Einzelspitze ist nicht beseitigt. Die Median-Maxima waren 62→64 ms.

Fünf Original-C-Datensätze, 30 Verträge einschließlich Duplikaten, einer
900-Dreiecke-BSP-Fläche und einer 16.385-Dreiecke-Fläche über dem
Cache-Limit sowie die Retail-Projektion bestanden.
Der produktive Hardware-Replay mit 3.200 Frames lief mit 98,05 FPS,
P99 32 ms und maximal 45 ms durch. Rohdaten:
`build/reports/mark_face_cache_conditional_q3dm1_ab.json` und
`build/reports/mark_face_cache_conditional_q3dm0_ab.json`.

Nach einem zusätzlichen Grenzfallfix für doppelte Flächen über dem
16.384-Dreiecke-Limit liefen beide produktiven Replays erneut durch:
`q3dm1` mit 95,98 FPS, P99 34 ms, Maximum 47 ms und `q3dm0` mit
80,02 FPS, P99 44 ms, Maximum 62 ms. Die Spielereigniszähler blieben
in beiden Fällen identisch. Das sind Einzelkontrollen, keine neuen
A/B-Messungen.

## Verbleibende Spitzen auf q3dm0

Ein gesonderter instrumentierter 3.200-Frame-Retail-Lauf mit Bot und
Spiegelportal erfasste 100 Frames ab 35 ms. In diesen Frames entfielen im
Mittel 16,6 ms auf das Zeichnen und 9,2 ms auf die Portal-Vorbereitung;
Cgame benötigte 3,3 ms. Um Frame 2.550 erreichten einzelne Portal- und
Draw-Phasen 23 beziehungsweise 35 ms. 29 der 100 Frames hatten einen
GC-Zyklus, die übrigen nicht. Dieser Diagnosebuild erreichte P99 46 ms
und maximal 72 ms. Instrumentierung beeinflusst die Bildrate; die Werte
beschreiben die verbleibenden Zeitanteile, keine neue FPS-Abnahme.
Rohdaten: `build/reference/controls_render_replay/q3dm0_after_face_cache_profile/`.
