# Fünfte Hotpath-Runde: Binary32-Bits und NaN-Prädikat

Ausgangspunkt ist Commit `de3b98e`. Die instrumentierte Original-QVM-
Spielschleife trennte den ersten 20-Frame-Start vom 2.200-Frame-Retail-Lauf.
Danach entfielen 22.014.525 Aufrufe auf `fadd`, 23.209.679 auf
`bitsFloat`, 17.080.932 auf `floatBits` und 9.784.518 auf `isNaNBits`.
Die Profilzähler dienen zur Auswahl der Kandidaten, nicht als FPS-Messung.
Die Profile liegen in `build/reports/function_call_profile/`.

## Verträge und Auswahl

`isNaNBits` nimmt ausschließlich 32-Bit-Integer-Bitmuster und gibt einen
Booleschen Wert zurück. Der Helfer trägt nun `value as int` und `returns bool`.
Er und die kleinen Binary32-Wrapper `fadd`, `bitsFloat` und `floatBits` sind
explizit `inline`. Die Float-Eingänge bleiben dynamisch: beispielsweise ist
`fadd(1, 0.5)` gültig und ein `as float`-Parameter würde das verwehren.
Mit dem gepinnten veröffentlichten MiniLang 1.3.9 sind die Baseline-,
nur typisierte und Inline-Test-EXE binär verschieden. Der genaue
Quellstand vor der Änderung wurde für A/B-Builds unter
`build/tmp/function_wave5_baseline/src` gesichert; er wird nicht versioniert.

`mantissa` und `exponent` wurden ebenfalls als Integer-Parameter und
-Rückgaben erprobt. Bei 3 Millionen Aufrufen waren die isolierten Mediane
gegenüber der Baseline jeweils langsamer (39,55 statt 38,12 ms und 38,27
statt 36,86 ms). Diese beiden Verträge wurden wieder entfernt. Die finale
Inventur umfasst 12.618 Funktionen, 58 von 31.660 typisierten Parametern,
34 typisierte Rückgaben, 18 ganze Signaturen und 11 explizite Inline-Marker.
Rohinventur: `build/reports/function_contract_wave5_inventory.json`.

## Isolierte Messung und Differentialtests

`tests/typed_numeric_bits_bench.ml` wurde unverändert gegen die Baseline und
den Kandidaten gebaut. `scripts/benchmark_numeric_contracts.py` verglich
15 alternierende Paare mit je 3.000.001 Aufrufen pro Operation und
identischen Prüfsummen. Die finale Messung liegt unter
`build/reports/typed_numeric_bits_retained_ab.json`:

| Operation, Median | Baseline | Kandidat |
| --- | ---: | ---: |
| `isNaNBits` | 31,77 ms | 23,57 ms |
| `fadd` | 55,18 ms | 51,67 ms |
| `bitsFloat` | 82,78 ms | 68,95 ms |
| `floatBits` | 93,79 ms | 77,97 ms |
| `mantissa` (unverändert) | 37,36 ms | 36,71 ms |
| `exponent` (unverändert) | 35,59 ms | 36,96 ms |

Die Prozessstartzeit ist enthalten. Die Zwischenberichte
`typed_numeric_bits_baseline_vs_typed.json` und
`typed_numeric_bits_typed_vs_inline.json` trennen Typ- und Inline-Versuche.
`test_numeric.py` bestand 101.445 exakte C-Binary32-Vergleiche;
`test_vm_native.py` bestand 26.934 QVM-Float-/Grenzverträge und
`test_math_contracts.py` bestätigte die `DotProduct`-Tags und Fehlerpfade.

## Produktiver Retail-Pfad

Ein 2.200-Frame-`q3dm0`-Replay mit den unveränderten Original-QVMs,
Retail-`pak0.pk3`, Bot, Bewegung und Kampf bestand auf Hardware-OpenGL
(RTX 5080, 1280 × 720, 20-ms-Simulationsschritt): 540 Positionswechsel,
1.150 Angriffe und 100 Munitionsabnahmen. Sein einzelner Lauf erreichte
68,03 FPS, p99 39 ms, maximal 50 ms.

Danach liefen die eingefrorenen Wave-4- und Wave-5-Replay-EXEs dreimal
abwechselnd ohne Kompilation im Messloop. Alle sechs Läufe hatten gleiche
Spielzähler. Die Medianwerte aus
`build/reports/function_contract_wave5_game_ab.json` sind:

| 2.200-Frame-Replay | Baseline | Kandidat |
| --- | ---: | ---: |
| FPS | 71,43 | 71,83 |
| Framezeit p50 / p95 / p99 | 12 / 27 / 36 ms | 12 / 27 / 36 ms |
| Längster Frame | 43 ms | 44 ms |

Die einzelnen FPS lagen bei 68,65–74,74 (Baseline) und 68,17–73,55
(Kandidat). Der Medianunterschied von 0,40 FPS ist innerhalb der
Laufstreuung. **Ein Gesamtspielgewinn ist nicht nachgewiesen.** Der
isolierte Nutzen rechtfertigt die kleinen Inline-Helfer; die weitere
Performance-Arbeit muss die größeren Renderer- und Simulationskosten
adressieren. Die sechs Rohlogs sowie EXE-, PK3- und QVM-Hashes liegen beim
A/B-Bericht. Vollständige Spielparität und breite Langzeitabnahme bleiben offen.

Der vollständige Windows-Produktbuild mit MiniLang 1.3.9 bestand. Der
Null-Argument-Start mit lokalem Retail-`baseq3` erreichte das Originalmenü
in 0,53 Sekunden. Der C-Binary32-Test wurde auf dem finalen Quellstand erneut
bestanden. Die Gesamt-Suite wurde in dieser Runde nicht erneut vollständig
durchlaufen; ihr zuletzt dokumentierter Stand steht im dritten Bericht.
