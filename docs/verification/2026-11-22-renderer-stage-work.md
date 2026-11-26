# Weniger Arbeit pro Shaderstufe

Die Vergleichsversion ist Commit `7c7fd0b`. Das Retail-Aufrufprofil zählte im
Abschnitt nach Frame 20 jeweils 4,76 Millionen Aufrufe von `shaderSeconds` und
`shaderMilliseconds`. Beide Funktionen waren schon einzeln optimiert.
Im Renderer berechnete `updatePassAxesFog` die Zeit erneut für jedes Dreieck
und für jeden noch nicht im Vertex-Cache gefundenen Eckpunkt.

Der Renderer verwendet die berechnete Shaderzeit und den zugehörigen
Animationsslot für aufeinanderfolgende Dreiecke mit gleicher Entity-Zeit.
Eine abweichende Zeit am Eckpunkt wird separat ausgewertet. Die Wiederverwendung
endet mit dem Shaderdurchlauf, sodass neue Frames, Ansichten und Shader-Remaps
ihre eigenen Werte bekommen.

Bei einem Cache-Treffer übernimmt der Renderer direkt die fertige Position,
Texturkoordinate und Farbe. Bei einem Cache-Miss wendet er die vom Material
angeforderten Deformationen und Texturtransformationen an. Eine konstante
Stufenfarbe wird einmal erzeugt. Positionsabhängige Farben und Nebel werden
weiter am jeweiligen Eckpunkt berechnet. Die Lichtwerte für BSP-Lightmaps
gehen wie zuvor in den Zeichenpuffer. Eine zweite Kopie dieser Werte im
Stufenobjekt hatte keinen Leser und konnte entfallen.

## Korrektheit

- 64 World-Batch- und 24 QVM-Szenentests bestanden. Der neue Test gibt einem
  einzelnen Eckpunkt eine andere Zeit und kontrolliert Position und Wellenfarbe
  im ausgegebenen Zeichenpuffer.
- 54 Tests für wiederverwendete Weltgeometrie und 432 Retail-Differentialfälle
  auf q3dm0, q3dm1 und q3ctf1 bestanden, einschließlich Nebel und dynamischer
  Beleuchtung.
- Zwei getrennte Hardware-Bildvergleiche mit `MQ3_CAPTURE` ergaben bei
  1280 × 720 jeweils null abweichende RGB-Pixel. Nach 180 Frames auf q3dm0 war
  der RGB-SHA-256 `5283dba98e5b627e629324985c825245bff7d85969782442297e4aa4ef1d3e74`,
  nach 90 Frames auf q3dm1 `d9f6792a0b70bea8f606b1a49f8447f0e2fba94fec88a63a5fcb3fdd2e4069b2`.
  Die Bilder liegen lokal unter `build/reports/stage_work_capture/`.

## Kampf-Replay auf der RTX 5080

Vier abwechselnde Paare spielten je 2.200 Frames auf Retail-q3dm0 mit Bot,
Original-QVMs, 1280 × 720 und 20 ms Simulationsschritt. Compiler (1.3.9),
Laufzeitoptionen und generierter Replay-Code stimmen laut Build-Protokoll
überein. Zwischen den beiden ausführbaren Dateien unterscheiden sich genau
die zwei bearbeiteten Renderermodule. Alle acht Läufe zählten je 540
Positionswechsel, 1.150 Angriffskommandos und 100 Munitionsabnahmen.

| Median der vier Läufe je Version | Vorher | Nachher |
| --- | ---: | ---: |
| Bilder pro Sekunde | 63,61 | 67,82 |
| Framezeit p50 / p95 / p99 in ms | 13,5 / 30,5 / 40,5 | 13 / 27,5 / 36 |
| Längster Frame je Lauf, Median in ms | 53,5 | 49,5 |
| Renderphase in ms pro Frame | 4,15 | 3,17 |
| Geometrieaufbereitung in ms pro Frame | 4,24 | 4,17 |
| Simulation einschließlich Cgame in ms pro Frame | 6,89 | 6,87 |
| Zugesicherter MiniLang-Heap bei Frame 2.000 | 304 MiB | 288 MiB |
| Speicherbereinigungen bis Frame 2.000 | 78 | 72 |

| Paar | FPS vorher / nachher | Längster Frame vorher / nachher in ms |
| --- | --- | --- |
| 1 | 65,67 / 66,51 | 57 / 59 |
| 2 | 61,55 / 65,94 | 50 / 53 |
| 3 | 57,54 / 69,13 | 68 / 46 |
| 4 | 68,76 / 70,56 | 49 / 43 |

Die Renderphase war in allen vier Paaren schneller. Der FPS-Median stieg
in dieser Kampfszene um 6,6 %. Einzelne lange Frames blieben, mit bis zu
59 ms in der neuen Version. Der größte gemessene Zeitanteil liegt nun in
der Simulation, darunter 4,25 ms pro Frame für Cgame. Der Test der neu
gebauten Windows-EXE erreichte mit lokalem `baseq3` das Originalmenü in 0,53 s.

Der Vergleich lässt sich mit den lokal gebauten Replay-EXEs wiederholen.
Das Skript speichert die einzelnen Laufprotokolle und die Hashes der EXEs,
PK3 und QVMs neben dem JSON-Bericht.

```powershell
python scripts/benchmark_function_contract_game.py --baseline build/controls_render_replay_types_wave5_numeric_2200.exe --candidate build/controls_render_replay_stage_work_reuse.exe --repeat 4 --output build/reports/renderer_stage_work_game_ab.json
```
