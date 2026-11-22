# Funktionsverträge und Inlining: zweite Messrunde

Stand: 22. November 2026. Ergänzung zu
[`2026-11-22-function-contract-evaluation.md`](2026-11-22-function-contract-evaluation.md).
Alle EXE-Vergleiche verwenden den veröffentlichten MiniLang-Compiler 1.3.9;
die lokale historische Frozen-Compilerdatei wurde nicht verändert. Die
Retail-Tests nutzen die lokal vorhandene `build/baseq3/pak0.pk3`.

## Geprüfte Signaturen

Die Inventur umfasst weiterhin 12.618 Funktionen und 31.660 Parameter.
Nach dieser Runde sind 55 Parameter, 30 Rückgaben und 16 ganze Signaturen
explizit typisiert; vier Funktionen tragen ein explizites `inline`. Das ist
ein geprüfter Teil des Ports, keine Aussage über eine vollständige
Typisierung. Die Rohinventur liegt unter
`build/reports/function_contract_wave2_inventory.json`.

* `mq3.compat.numeric`: Die Float-Wrapper liefern auch für ganzzahlige Werte
  zur Laufzeit einen als `float` getaggten Wert. Deshalb tragen neun Wrapper
  einen `returns float`-Vertrag und `floatBits` einen `returns int`-Vertrag.
  Eingabeparameter bleiben dynamisch: `f32(0)` ist ein gültiger Aufruf, den
  ein `as float`-Parameter abweisen würde. `fsub` und `fmul` wurden explizit
  als inline markiert, weil sich ihr generierter Code ändert. `types` und
  `errors` der Benchmark-Fixture prüfen Tags und die unveränderten
  FFI-Fehlercodes `1001:1001:1001`; `scripts/test_numeric.py` vergleicht
  101.445 exakte Werte mit C.
* `mq3.platform.playable_window`: `writeBatchColor`,
  `writeBatchPositionVertex` und `updateStageVertex` besitzen geprüfte
  Parameterverträge. Rückgaben bleiben dynamisch, weil Native- und
  Byte-Grenzfehler propagiert werden. Die neue
  `scripts/test_playable_window_contracts.py` prüft diese Fehlerpfade.
  `writeBatchI32` blieb unverändert, weil sein isolierter Typversuch langsamer
  war; explizites Inline erzeugte hier keinen anderen Binärcode.
* `mq3.shared.math.DotProduct` nimmt zwei Arrays und liefert einen Float.
  Die fertige Signatur bestand 4.096 C-Referenzfälle mit 53.248 exakten
  Resultaten, 36 zusätzliche C-Beobachtungen und 51 Laufzeitverträge.
  `scripts/test_math_contracts.py` prüft zusätzlich den Float-Tag und beide
  Array-/Argumentfehler.
  Explizites Inline erzeugte denselben EXE-SHA-256-Wert und blieb daher weg.

## Isolierte A/B-Messungen

Die Benchmarks führen Ausgangs- und Kandidaten-EXE abwechselnd aus und
vergleichen jeweils den Checksum-Wert. Während dieser Runde belastete ein
**fremder** `mlc-windows`-Prozess den Rechner dauerhaft mit CPU- und
Speichernutzung. Diese Werte sind explorativ; sie belegen weder einen
zuverlässigen Geschwindigkeitsvorteil noch höhere FPS im Spiel.

| Pfad und Umfang | Ausgang, Median | Kandidat, Median | Rohdaten |
| --- | ---: | ---: | --- |
| `writeBatchColor`, 1 Mio. Aufrufe × 15 Paare | 38,36 ms | 35,99 ms | `build/reports/playable_window_contract_final_ab.json` |
| `writeBatchPositionVertex`, 1 Mio. × 15 | 41,05 ms | 40,78 ms | ebenda |
| `updateStageVertex`, 1 Mio. × 15 | 47,00 ms | 46,02 ms | ebenda |
| `DotProduct` nur Array-Parameter, 3 Mio. × 9 | 155,25 ms | 157,94 ms | `build/reports/typed_math_dot_ab.json` |
| `DotProduct` Parameter und Float-Rückgabe, 3 Mio. × 11 | 156,25 ms | 142,64 ms | `build/reports/typed_math_dot_full_ab.json` |

Die Float-Wrapper-Varianten einschließlich des Inline-Versuchs stehen unter
`build/reports/float_return_contract_exploratory.json` und
`build/reports/float_inline_both_exploratory.json`. Ihr Gewinn liegt in den
isolierten Schleifen ungefähr im Bereich der Messstreuung.

## Compiler-Gate und produktiver Pfad

Die beiden dichten `switch tr.trType`-Blöcke in `trajectory.ml` erzeugten
beim Import in größere Oracle-Fixtures mit MiniLang 1.3.9 und dem lokal
vorliegenden 1.3.10 einen unaufgelösten `switch_case_body`-Patch. Sie sind
als geordnete `if`-Zweige mit gleicher Default-Fehlermeldung umgesetzt.
Danach kompilierten Minimalimport, Message-State-, Snapshot-Build- und
Retail-QVM-Match-Fixtures. 16.384 Bewegungs- und Winkelvergleiche,
2.113.536 exakte C-Wörter und sechs Fehlerfälle bestätigten die
Trajectory-Semantik. Dieser Compiler-Workaround ist unabhängig vom
Typisierungsgewinn.

Der produktive Windows-Build lief mit der lokalen Retail-PK3 auf einer
NVIDIA GeForce RTX 5080 durch einen 2.200-Frame-`q3dm0`-Replay mit
Original-QVMs, Bewegung und Bot. Er meldete 540 geänderte Positionen,
1.150 Angriffe und 100 Munitionsabnahmen, ohne Abbruch. Unter der laufenden
Fremdlast erreichte dieser einzelne Kandidatenlauf 63,02 FPS, p99 41 ms
und maximal 50 ms. Sechs **abwechselnde** Läufe mit der vorherigen,
unveränderten Typisierungs-EXE ergaben identische Spielzähler:

| Median, je drei 2.200-Frame-Läufe | Vorher | Zweite Runde |
| --- | ---: | ---: |
| FPS | 62,73 | 63,00 |
| Framezeit p50 / p95 / p99 | 14 / 30 / 40 ms | 14 / 30 / 41 ms |
| Längster Frame | 52 ms | 51 ms |

Die Abweichung von 0,27 FPS liegt klar in der Laufstreuung. Ein
Gesamtspielgewinn ist damit **nicht nachgewiesen**. EXE-, PK3- und QVM-SHA-256,
die Spielzähler und die sechs Log-SHA-256 sind unter
`build/reports/function_contract_wave2_game_ab.json` aufgezeichnet. Der
damalige Benchmarktreiber schrieb die Rohlogs in einen gemeinsam genutzten
Ordner; die dritte Messrunde überschrieb sie. Die ursprünglichen sechs
Wave-2-Rohlogs sind daher nicht mehr verfügbar. Der Treiber verwendet
inzwischen pro Ergebnisdatei einen eigenen Log-Ordner. Der
einzelne produktive Replay liegt unter
`build/reference/controls_render_replay/types_wave2_2200/moving.json`.

Der 30-Frame-Starttest bestand zusätzlich auf **30/30 Retail-Arenen** mit
sichtbarer Geometrie; der langsamste Kartenstart lag unter der parallelen
Last bei 5.921 ms (`q3ctf2`). Diese kurzen Durchläufe beweisen weder
Langzeitstabilität noch volle Spielparität. Bericht:
`build/reports/all_retail_levels.json`.
**32/32 benannte Retail-Bots** spawnten und sendeten in jeweils 120 Frames
aktive Kommandos. Das ist ein Aktivitätstest, kein Beweis für vollständige
Kampf-KI oder lange Matches; Bericht: `build/reports/all_retail_bots.json`.
Der gesonderte Retail-QVM-Match-Test meldete in acht Frames 2.127
texturierte Dreiecke, null untexturierte und null nicht unterstützte
Entitäten sowie aktive Prediction-Traces; Rohlog:
`build/reports/function_contract_wave2_qvm_match.log`.

`python scripts/verify.py --data-root build` überschritt die vorherige
Compilerblockade: `test_message_state_delta.py` und
`test_snapshot_build.py` bestanden mit dem gepinnten 1.3.9-Compiler.
Die Suite läuft weiter; ihr vollständiger Ausgang ist erst nach Abschluss
unter `build/reports/function_contract_wave2_verify.log` belegt.
