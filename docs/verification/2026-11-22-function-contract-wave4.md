# Vierte Compiler-Hotpath-Runde: Renderer-Prädikate

Ausgangspunkt ist Commit `d473910` mit gepinntem MiniLang 1.3.9 und der
lokalen Retail-`pak0.pk3`. Die instrumentierte q3dm0-Aufrufzählung aus der
[dritten Runde](2026-11-22-function-contract-wave3.md) trennte die ersten
20 Frames vom 2.200-Frame-Lauf. `playable_world_batch.isSky` wurde insgesamt
9.039.837-mal aufgerufen, davon 4.176.340-mal nach Frame 20.
`qvm_scene_batch.depthHack` wurde 7.071.575-mal aufgerufen, davon
6.997.896-mal nach Frame 20. Beide gaben bereits `bool` zurück;
`isSky` nahm bereits ein typisiertes `array` für die Flags. Der konkrete
Triangle-Typ bleibt dynamisch, weil beide Helfer Strukturwerte aus
verschiedenen Renderer-Paketen erhalten.

Beide einzeiligen Funktionen sind nun explizit `inline`. Mit
`tests/typed_render_predicate_bench.ml` wurde die Baseline aus einer Kopie
des vorherigen `src`-Baums und der Kandidat aus dem unveränderten aktuellen
Baum mit demselben Compiler gebaut.
`scripts/benchmark_render_predicate.py` prüfte die gleichen Checksum-Ausgaben
und wechselte die Reihenfolge für 15 Paare à drei Millionen Aufrufe. Der
Binär-SHA ist im Bericht `build/reports/function_contract_wave4_predicate_ab.json`
festgehalten.

| Isolierte Operation, Median | Vorher | Inline |
| --- | ---: | ---: |
| `isSky` | 67,18 ms | 55,30 ms |
| `depthHack` | 59,02 ms | 49,84 ms |
| Beide in derselben Schleife | 107,78 ms | 104,26 ms |

Die isolierten Tests enthalten Prozessstart; sie beweisen keinen
entsprechenden Gewinn im vollständigen Spiel. Die produktiven
`test_playable_world_batch.py`- und `test_qvm_scene_batch.py`-Gates bestanden
mit 63 beziehungsweise 24 Verträgen. Der Kandidat bestand einen
2.200-Frame-Hardware-OpenGL-Replay auf der RTX 5080 mit Original-QVMs,
Retail-q3dm0, Bot, 540 Positionsänderungen, 1.150 Angriffen und
100 Munitionsabnahmen.

Danach wurden die eingefrorenen Wave-3- und Wave-4-Replay-EXEs dreimal
abwechselnd mit identischen Retail-/QVM-Hashes und 20-ms-Simulationsschritt
ausgeführt. Alle sechs Läufe hatten dieselben Spielzähler.

| Median von je drei 2.200-Frame-Läufen | Vorher | Inline |
| --- | ---: | ---: |
| FPS | 62,99 | 63,51 |
| Framezeit p50 / p95 / p99 | 14 / 30 / 41 ms | 14 / 30 / 40 ms |
| Längster Frame, Median | 47 ms | 49 ms |

Der dritte Kandidatenlauf hatte einen einzelnen 65-ms-Frame; die einzelnen
FPS reichten bei der Baseline von 60,97 bis 64,55 und beim Kandidaten von
61,29 bis 66,34. Der gemessene FPS-Unterschied von 0,52 liegt innerhalb
dieser Streuung. **Ein Gesamtspielgewinn ist nicht nachgewiesen.** Das
Inlining bleibt als kleiner, isoliert schneller Hotpath ohne festgestellte
Spielsemantik-Regression; mehr FPS erfordern weitere Arbeit außerhalb dieser
beiden Prädikate. Vollständige Einzelwerte, EXE-, PK3- und QVM-SHA sowie
Rohlogs stehen unter `build/reports/function_contract_wave4_game_ab.json`
und `build/reports/function_contract_wave4_game_ab_logs/`.

Der vollständige Windows-Produktbuild mit MiniLang 1.3.9 bestand danach.
`test_default_exe_startup.py` erreichte mit lokalem Retail-`baseq3` und
Null Argumenten das Original-Hauptmenü in **0,53 s**. Die Gesamtparität des
Spiels bleibt offen.
