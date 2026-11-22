# Profilgestützte Typisierung und Inlining: dritte Runde

Stand: 22. November 2026. Ergänzung zu den [ersten](2026-11-22-function-contract-evaluation.md)
und [zweiten](2026-11-22-function-contract-wave2.md) Messrunden. Der
veröffentlichte MiniLang-Compiler 1.3.9 wurde für Produkt- und Test-EXEs
verwendet; Retail-Daten stammen aus der lokalen `build/baseq3/pak0.pk3`.

## Auswahl anhand echter MiniLang-Aufrufzähler

`scripts/profile_function_contracts.py` kompiliert den produktiven
q3dm0-Original-QVM-Replay mit `--profile-calls`. Die Instrumentierung zählt
Aufrufe, ist aber selbst **kein FPS-Benchmark**. Die 20- und
2.200-Frame-Läufe nutzen denselben 20-ms-Simulationsschritt und legen ihre
Rohdaten unter `build/reports/function_call_profile/summary_20.json` und
`summary_2200.json` ab.

| Funktion | Erste 20 Frames | 2.200 Frames | Nach Frame 20 |
| --- | ---: | ---: | ---: |
| `playable_materials.shaderSeconds` | 107.868 | 4.871.116 | 4.763.248 |
| `playable_materials.shaderMilliseconds` | 107.868 | 4.871.116 | 4.763.248 |
| `snd_mem_resample.signed16` | 4.300.013 | 4.300.013 | 0 |
| `snd_mem_resample.write16` | 4.335.678 | 4.335.678 | 0 |
| `qvm_scene_batch.depthHack` | 73.679 | 7.071.575 | 6.997.896 |
| `playable_world_batch.isSky` | 4.863.497 | 9.039.837 | 4.176.340 |

Shader-Zeit ist damit ein dauerhafter Render-Hotpath; PCM-Konvertierung
fällt hier vollständig beim Laden an. `depthHack` und `isSky` haben bereits
einen booleschen Rückgabevertrag, aber ihre Dreiecksargumente sind
packageübergreifende Strukturen. Ein pauschaler skalarer Typ dafür wäre
kein sicherer Vertrag.

## Übernommene und verworfene Kandidaten

`shaderSeconds` und `shaderMilliseconds` geben nun explizit `float` zurück.
Die Aufrufer übergeben teils Integer und teils Float, deshalb bleiben die
Parameter dynamisch. Nur `shaderMilliseconds` ist explizit `inline`:
das generierte Test-EXE änderte sich. Zusätzliches Inline für
`shaderSeconds` ergab **denselben** EXE-SHA-256-Wert und wurde verworfen.

`snd_mem_resample.signed16` nimmt `bytes` und einen Integer-Offset und gibt
`int` zurück. `write16` blieb untypisiert: seine Parametertypen verlangsamten
die isolierte Schreibschleife, und der kombinierte Lese-/Schreibpfad gewann
nicht. Explizites Inline für die PCM-Helfer brachte keinen stabilen
zusätzlichen Gewinn und blieb ebenfalls weg.

Die Quellinventur zählt damit **57/31.660 typisierte Parameter**,
**33/12.618 Rückgaben**, **17 vollständige Signaturen** und **5 explizite
Inline-Funktionen**. Das ist eine überprüfte Teilauswahl; die noch offenen
Funktionen sind nicht automatisch typisierbar.

## Isolierte, abwechselnde A/B-Läufe

Die Fixture `tests/typed_render_audio_bench.ml` führt pro Operation drei
Millionen Aufrufe aus. Baseline und Kandidat wurden mit demselben gepinnten
Compiler und demselben Quellstand außerhalb dieser vier Funktionen gebaut;
die Checksum-Werte sind jeweils gleich. Das finale Paar umfasst 15
abwechselnde Läufe je Variante. Rohdaten mit EXE-SHA-256:
`build/reports/function_contract_wave3_selective_ab.json`.

| Operation, Median | Ausgang | Ausgewählte Änderung |
| --- | ---: | ---: |
| Shader-Zeit | 340,02 ms | 315,43 ms |
| PCM-Lesen | 42,80 ms | 43,22 ms |
| PCM-Schreiben (unverändert) | 39,17 ms | 39,67 ms |
| PCM-Lesen und Schreiben | 70,31 ms | 70,20 ms |

Die Einzelzeiten enthalten auch Prozessstart und zeigen keinen Nachweis
für eine entsprechende Verbesserung der gesamten Spiel-FPS. Der frühere
Typversuch ohne selektives Inline steht unter
`build/reports/function_contract_wave3_typed_ab.json`; die zusätzliche
Inline-Variante unter `function_contract_wave3_inline_vs_typed_ab.json`.

## Funktions- und Original-C-Prüfungen

`test_audio_snd_mem_resample.py` bestand mit acht exakten unveränderten
Baseq3-Resampling-Datensätzen und 22 Verträgen, darunter neue Prüfungen für
den Integer-Tag sowie Bounds- und Typfehler von `signed16`.
`test_playable_materials.py` bestand mit 65 Materialverträgen.
`test_shader_entity_translate.py` bestand mit 16 exakten
Baseq3-Entity-Zeit-Datensätzen und 104 Verträgen einschließlich QVM-Scene-
und World-Batch-Gates.

Der vorherige breite `verify.py`-Lauf hatte nach 115 Gates bei
`test_client_frame_input.py` wegen veralteter Textanker abgebrochen:
Der produktive Server-Loop hat inzwischen eine zusätzliche Pause-/Step-
Bedingung, die UI einen eigenen Zeitwert und `drawFrame` ein `demoTime`-
Argument. Der Test extrahiert jetzt die tatsächliche Schleife, prüft die
aktuelle UI-Zeit und übergibt `void` für den normalen Frame. Er respektiert
auch `MQ3_BUILD_TOOLCHAIN=release`. Danach bestanden 95 Eingabe-, 29
Routing-, sieben Original-C- und 20 Retail-Frame-Verträge. Das war ein
Test-Fixture-Defekt, kein beobachteter Spielabsturz.

## Produktiver Retail-Replay

Die aktuelle EXE bestand einen 2.200-Frame-`q3dm0`-Replay mit Original-QVMs,
Hardware-OpenGL auf der RTX 5080, Bewegung und Bot. 540 Positionen änderten
sich, 1.150 Angriffe und 100 Munitionsabnahmen wurden gezählt. Der einzelne
Kandidatenlauf erreichte 69,39 FPS, p99 39 ms und maximal 49 ms. Für eine
Leistungsentscheidung zählt der anschließende Vergleich von drei
abwechselnden Läufen je eingefrorener EXE mit demselben Asset- und QVM-SHA:

| Median von je drei 2.200-Frame-Läufen | Vorher | Dritte Runde |
| --- | ---: | ---: |
| FPS | 73,31 | 72,54 |
| Framezeit p50 / p95 / p99 | 12 / 27 / 37 ms | 12 / 27 / 36 ms |
| Längster Frame | 47 ms | 47 ms |

Die -0,77 FPS liegen innerhalb der Laufstreuung; der isolierte Shader-Gewinn
ist **nicht** als Gesamtspielgewinn nachgewiesen. Alle sechs Läufe hatten
identische Spielzähler. EXE-, Retail-PK3- und QVM-Hashes sowie Mediane:
`build/reports/function_contract_wave3_game_ab.json`. Die sechs Rohlogs
liegen unter `build/reports/function_contract_wave3_game_ab_logs/` und
stimmen mit den im JSON gespeicherten SHA-256-Werten überein. Der
Benchmarktreiber benutzt nun einen eigenen Log-Ordner je Ergebnisdatei,
damit spätere Runden sie nicht überschreiben. Der einzelne Produktivlauf
liegt unter `build/reference/controls_render_replay/types_wave3_2200/moving.json`.

## Test- und Buildpfad

Der fortgesetzte `verify.py`-Lauf erreichte nach dem reparierten
`test_client_frame_input.py` das MD3-Gate. Dort war `public` als lokaler
Bezeichner der Retail-Fixture mit Compiler 1.3.9 ein reserviertes Wort.
Die Fixture heißt nun `publicModel`; `test_md3_packed.py` wählt bei
`MQ3_BUILD_TOOLCHAIN=release` den gepinnten Compiler und dessen Stdlib.
Das gezielte Gate bestand anschließend mit **365 Retail-MD3-Dateien,
40 Negativfällen, 6.162.725 Vertexwerten und 3.684 nativen Prüfungen**.

Parallel gestartete Produktbuilds entpackten zuvor dieselbe geprüfte
Compiler-ZIP erneut und versuchten unter Windows eine gerade ausgeführte
`mlc.exe` zu löschen (`WinError 5`). `build_release.prepare_compiler()`
validiert jetzt alle entpackten Dateien gegen die archivierten SHA-256-Werte
und verwendet eine vollständige, unveränderte Extraktion wieder.
`test_release_toolchain_cache.py` prüft Wiederverwendung ohne Löschversuch,
Byte-Manipulation, zusätzliche und fehlende Dateien; das Gate ist in
`verify.py` registriert. Die Produktbuild- und Startprüfung wird separat
protokolliert, weil die obigen Replay-EXEs bereits vor dieser Cache-Korrektur
gebaut waren.

Der danach vollständige `build_release.py`-Lauf schrieb `MiniQuake3.exe` neu.
Der Null-Argument-Windows-Start erreichte mit lokalem Retail-`baseq3` das
Original-Hauptmenü in **0,52 s** (`test_default_exe_startup.py`).

Die fortgesetzte Suite fand vier weitere überholte Testanker und keine
Änderung an den betroffenen produktiven Pfaden dieser Runde:

- `test_bsp_retained.py` verglich auch Patch-Tessellation mit dem Stand
  `98a4d50`, vor den Baseq3-Patchkorrekturen. Planar- und Meshflächen bleiben
  exakt gegen diese Referenz geprüft; Patchflächen vergleichen den aktuellen
  öffentlichen und speichersparenden Extraktor. Danach bestanden **31
  Retail-Maps, 387.141 Vergleiche**. Das separate `test_bsp_render_data.py`
  bestand **75 Original-C-Patchnormalen- und 47 Patchraster-Datensätze**.
- `test_collision_frontier.py` suchte `item = stack.pop()`, der produktive
  Ausdruck lautet `item=stack.pop()`. Das fehlende Instrumentierungsereignis
  lieferte fälschlich `peakPending=0`. Der Test fordert den Anker jetzt genau
  einmal und akzeptiert für den optimierten schmalen BSP-Pfad null wartende
  Äste. **35 Verträge** bestanden; die gemessenen Allokationen waren 344
  gegen 32.936 Bytes des alten Durchlaufs.
- `test_trace_query_storage.py` verwendete die lokalen `seen`-Variablen des
  neuen Scratch-Pfads ohne deren Initialisierung. Es extrahiert nun den echten
  Fallback-Zweig und prüft die Visit-Serial in `throughLeaf`; **23 Verträge**
  bestanden. `test_snapshot_storage.py` verifiziert die Ringkapazität nun in
  `snapshotInput` und deren Nutzung in beiden Konsumenten; **34 eingefrorene
  Snapshot-Fälle** bestanden.

Der Gesamtlauf ist über diese Gates hinweg fortgesetzt; ein vollständiger
grüner `verify.py`-Lauf wird erst nach Abschluss aller übrigen Gates behauptet.

Anschließend bestanden der 120-Frame-Retail-Spiel-Replay, 42 Cgame-
Kollisionscache-Verträge, 432 Retail-Welt-Renderer-Vergleiche und die
Hardware-Renderer-Gates auf der RTX 5080 sowie ein 120-Cgame-/240-UI-Frame-
Lebenszyklus. `test_qvm_menu_startup.py` erwartete noch den alten Variablennamen
`archive` am Start des Vollmatches; der produktive Pfad verwendet
`activeArchive`, damit Menüs eine aktive PK3-Auswahl weiterreichen. Der
aktualisierte Startanker bestand separat. Die Suite wurde ab dem
Desktop-Session-Gate fortgesetzt.

Die Desktop-Session bestand anschließend mit echtem `q3dm0`-Menü-,
Map-, Neustart-, Film- und Config-Übergang; der physische Konsolenfenster-
Test und die QShared-Differentialprüfung bestanden ebenfalls. Botlib-
Header-Gates prüften Retail-Routing über 30 Maps mit 96.758 Areas und
125.731 Reaches. Der nächste Stopp war ein Testsyntaxfehler in
`renderer_headers_oracle.ml` und `renderer_headers_contracts.ml`: der Alias
`public` ist für Compiler 1.3.9 reserviert. Beide Tests benutzen jetzt
`trPublic`; die vollständige Renderer-Header-Prüfung bestand anschließend:
377 GL-Einstiegspunkte, 334 Aliase, 61 lokale Typen, 159 Funktionen,
24 Verträge sowie Retail-QVM und BSP. Die Teilfortsetzungen von `verify.py`
liefen bis zu diesem Gate; eine einmalige vollständig grüne Gesamtsuite wurde
in dieser Runde nicht nachgewiesen.
