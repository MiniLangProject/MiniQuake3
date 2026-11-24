# Botkampf: Mark-Fragment-Projektion ohne Scratch-Arrays in den Ablehnprüfungen

Die produktive Original-Cgame-QVM ruft `CG_CM_MARKFRAGMENTS` (Host-Trap 27)
im Botkampf auf `q3dm1` wiederholt mit derselben geordneten Flächenliste auf.
Die seit dem 23. November über den Flächencache wiederverwendeten Listen
umfassen bis zu **3.184 Dreiecke**. Pro Aufruf lief die alte
Projektionsschleife über jedes dieser Dreiecke und baute zuerst ein
Drei-Punkte-Array `vertices`, erst danach prüften die Bounds- und die
Patch-Normalen-Ablehnung. Zusätzlich erzeugten `projectionBounds`,
`projectionPlanes` und `eligibleFace` pro Punkt beziehungsweise pro Kante
Scratch-Arrays über die Helfer `subtract`, `cross`, `normalize`, `faceNormal`
und `planeCrossesBounds`. Die `clipPlane` des Benutzers verzichtete
bereits auf die temporären distances-/sides-Arrays (identische
Gleitkommaoperationen); dieser Bericht misst den Ausbau desselben Stils auf
die frühen Prüfungen des Trap-Pfads. Akzeptierte Dreiecke erzeugen weiterhin
ihre Clip-Eingaben und Fragment-Ausgaben; die Projektion ist insgesamt nicht
allokationsfrei.

## Änderung

Der produktive Code ändert sich nur in `src/mq3/renderer/mark_fragments.ml`;
die Verträge und die Dokumentation dieses Berichts kommen hinzu. Alle
Float-Rechnungen bleiben in Wert **und Reihenfolge** identisch; die Ausgaben
sind in allen geprüften Fällen bit-genau gleich — die begrenzten
Differentialfixtures stützen das, ersetzen aber keine globale Beweisführung:

- `triangleBoundsOverlap(first, second, third, mins, maxs)` liest die drei
  Dreieckspositionen direkt; das `vertices`-Array entsteht erst, nachdem die
  billigen Ablehnungen (Bounds, Patch-Normal) bestanden sind.
- Die Patch-Dreiecksnormalen-Prüfung rechnet Kreuzprodukt, Länge und Skalar-
  produkt inline als Skalare; der Sonderfall `length <= 0` setzt wie das
  Original eine Nullnormale (NaN-Sicherheit), die Schranken −0,05/−0,1 je
  nach Dreiecksindex bleiben erhalten.
- `projectionBounds` bildet die projizierten und zurückversetzten Punkte je
  Achse als Skalare statt als Arrays.
- `projectionPlanes` inline-isiert Kreuzprodukt und Normalisierung je Kante
  (identische Operationen zu `cross`/`normalize`).
- `eligibleFace` liest die planare Flächennormale und den Stützvertex als
  Skalare und rechnet die Ebenen-/Bounds-Prüfung direkt aus; die Helfer
  `subtract`, `cross`, `boundsOverlap`, `planeCrossesBounds` und `faceNormal`
  sind entfallen.
- Die `clipPlane` des Benutzers bleibt unverändert übernommen.

Für Dreiecke, die die Prüfungen passieren, ändert sich nichts: Sie erzeugen
weiterhin das Eingabe-Array des Clippers sowie die Clip- und
Fragment-Ausgaben.

## Differentialtests

Alle Läufe mit MiniLang 1.3.9 Release-Toolchain (`MQ3_BUILD_TOOLCHAIN=release`):

- `scripts/test_mark_fragments.py --pak build/baseq3/pak0.pk3`:
  **5 exakte Baseq3-Datensätze + 33 Verträge** grün. Die Verträge enthalten
  die neue Patch-Fixture `patchFaceMap` (3×3-Kontrollgitter in der z=0-Ebene)
  mit den Fällen zugewandte Projektion (Dreiecke werden geclippt) und
  abgewandte Projektion (Dreiecke werden vor dem Clipping abgelehnt); sie
  vergleichen gegen das C-Original `R_MarkFragments` aus `tr_marks.c`.
- Retail-Projektion auf `q3dm1`: `fragments=1 points=4 candidates=10
  attempts=1` unverändert.
- `scripts/test_cgame_collision_cache.py`: **42 Verträge** grün
  (Trap-27-Memoisierung unverändert).
- `scripts/test_cgame_marks.py`: **5 C-Datensätze + 23 Mark-Verträge +
  29 Partikelverträge** grün.

## Abwechselnder Retail-A/B-Vergleich

Beide Varianten wurden aus demselben Produktivpfad mit dem veröffentlichten
MiniLang 1.3.9 gebaut: die Basislinie als eingefrorener Quellbaum unter
`build/reference/source_mark_alloc_base` (HEAD-Stand plus die clipPlane des
Benutzers), der Kandidat aus dem Arbeitsbaum. Sechs Läufe à 6.000 Frames mit
festem 20-ms-Schritt, Retail-`pak0.pk3`, Original-QVMs und Hardware-OpenGL
auf der RTX 5080, strikt alternierend (Basis, Kandidat, Basis, Kandidat,
Basis, Kandidat). Jeder Lauf zählte **1.327 Positionswechsel, 3.000
Angriffskommandos und 265 Munitionsabnahmen** — in allen sechs Läufen
identisch, kein Gameplay-Unterschied.

| Paar | Basis FPS / P95 / P99 / Maximum | Kandidat FPS / P95 / P99 / Maximum |
| --- | ---: | ---: |
| 1 | 96,18 / 22 / 31 / 53 ms | 98,20 / 21 / 31 / 46 ms |
| 2 | 97,40 / 21 / 32 / 50 ms | 98,09 / 21 / 32 / 50 ms |
| 3 | 97,54 / 21 / 31 / 52 ms | 96,00 / 21 / 32 / 50 ms |
| Median | **97,40 / 21 / 31 / 52 ms** | **98,09 / 21 / 32 / 50 ms** |

Die Bildrate lag im Median 0,7 FPS höher und im Median sank das Maximum um
2 ms; beide Unterschiede liegen innerhalb der Streuung dieser sechs
Läufe (96,00–98,20 FPS) und älterer Botkampfmessungen und belegen keine
allgemeine Bildratenverbesserung. Die stabileren Indikatoren sind die
Phasenmittel und die CPU-Zyklen: Die Cgame-Phase sank im Median von 2,19 auf
2,15 ms pro Frame (−1,9 %), die Cgame-CPU-Zyklen von 9,37 auf 9,20 Millionen
pro Frame (−1,8 %). In den Paaren 1 und 2 sanken die Cgame-Zyklen jeweils um
2,1 %; der dritte
Kandidatenlauf war global langsamer (Game- und Geometrie-Zyklen gleichermaßen
erhöht, Bildrate 96,00), sodass sein Cgame-Wert über dem Basisniveau lag —
das entspricht der bekannten Systemlast-Streuung, nicht einem Messwert der
Änderung.

Der GC- und Heapbefund blieb unverändert: alle sechs Läufe beendeten mit
91 GC-Zyklen (alle nebenläufig), der Heap lag am Ende zwischen 363,6 und
369,0 MiB belegt bei 368 MiB committet zur letzten Phase. Die weggefallenen
Scratch-Allokationen der Ablehnprüfungen sind in dieser Zählung nicht
sichtbar; die feste 128-MiB-Schwelle blieb unangetastet.

Rohdaten: `build/reports/mark_alloc_ab_q3dm1_6000.json` (Median-, GC- und
CPU-Werte je Lauf, Binär- und Asset-Hashes) sowie die sechs Logs
`build/reports/mark_alloc_ab/{base,cand}_{1..3}.log`.

## Verbleibende Ruckler

Die Zahl der langsamen Frames änderte sich nicht (32/30/40 gegenüber
33/35/37 Frames ≥ 35 ms). Die verbleibenden Spitzen dominieren weiterhin die
Draw-Phase (bis 33 ms) und die Expand-Phase (bis 24 ms bei bis zu ~150 Mio.
Geometrie-Zyklen pro Frame) sowie die GC-Zyklen; diese Arbeit bleibt von der
vorliegenden Änderung unberührt. Die Bildrate dieser Messung liegt mit 96–98
FPS im Bereich der bisherigen Streubreite; ein allgemeiner FPS-Gewinn ist
durch diese Änderung nicht belegbar. Die Entlastung des Trap-27-Pfads zeigt
sich im Cgame-Median (−1,9 %) und in zwei von drei Paaren.