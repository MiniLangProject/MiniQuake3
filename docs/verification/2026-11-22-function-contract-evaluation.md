# MiniLang-Funktionsverträge und Inlining: Evaluationsprotokoll

Stand: 22. November 2026. Compilerbasis für produktive Tests ist das gepinnte,
veröffentlichte MiniLang **1.3.9**. Ein direkter Probe-Build mit diesem Compiler
hat `function inline addOne(x as int) returns int` erfolgreich kompiliert und
ausgeführt. Die lokal vorhandenen 1.3.10-Artefakte und das Compiler-Repository
mit nicht committeten Änderungen sind keine reproduzierbare Produktionsbasis;
für diesen Versuch ist kein Pin-Upgrade nötig.

## Vollständige Signatur-Inventur, gezielte Vertragswahl

`python scripts/audit_function_contracts.py --output
build/reports/function_contract_inventory.json` indexiert alle internen
MiniLang-Funktionen in `src/mq3`. Vor den Änderungen dieses Pakets hatte
Commit `213c7ca` **12.618 Funktionen in 597 Dateien und 31.660 Parameter**;
kein interner Parameter, Rückgabewert oder Funktionskörper war ausdrücklich
typisiert bzw. als `inline` markiert. Native `extern function`-Deklarationen
sind separat durch ihre FFI-Signaturen festgelegt und fehlen bewusst in dieser
Zählung. Die Inventur erfasst auch mehrzeilige Signaturen, optionale/generische
Typen, Struct-Methoden und statische Aufrufstellen. Ein synthetischer
Parser-Test prüft diese Formen.

Die Rückgabe-Klassifikation ist eine **konservative lexikalische Triage**, keine
Typinferenz: 1.189 mögliche Void-Funktionen, 948 Funktionen mit ausschließlich
literal-skalaren Rückgabeausdrücken, 2.449 potenzielle Fehlerpfade und 8.022
dynamische/unbewiesene Funktionen im Ausgangsstand. 10 weitere enthalten
verschachtelte Funktionsdeklarationen. Statische Aufrufstellen zählen
lexikalische, importaufgelöste Aufrufe im Quellcode; sie sind **keine**
Laufzeitaufrufe. Gleichnamige Funktionen können die lokale Zählung verzerren.
Laufzeit-Priorität erfordert einen instrumentierten Replay-Lauf.

MiniLang-Typannotationen sind überprüfte Laufzeitverträge. Ein falscher Wert
liefert Fehler 1308 und kann damit das Spielverhalten ändern. Insbesondere
können Float-Operationen ein als `int` getaggtes Ergebnis erzeugen, und viele
Portfunktionen geben je nach Eingabe `void` oder `error` zurück. Deshalb wird
kein automatischer Masseneingriff aus der Inventur erzeugt.

## Messprotokoll

1. Für Hotspot-Priorität das produktive q3dm0-Replay mit unveränderten
   Retail-PK3/QVMs unter `--profile-calls` bauen. Das Test-Entry-Point ruft
   nach dem Replay `callStats()` auf. Im Retail-Replay gibt MiniLang 1.3.9
   voll qualifizierte Modulnamen aus. Bloße Namen aus Top-Level-Fixtures
   werden nur bei eindeutiger Zuordnung übernommen.
2. Vor jeder Änderung eine unveränderte Baseline-EXE, Compiler-SHA, Quell-SHA,
   Checksummen und Rohzeiten sichern. Typen nur für bewiesene Wertebereiche
   hinzufügen, dann dieselben Differential- und Retail-Tests ausführen.
3. Isolierte A/B-Messungen alternierend mit Aufwärmläufen, mehreren Samples
   und identischem Fixture/Compiler durchführen. `scripts/benchmark_numeric_contracts.py`
   prüft `u32`, `i32`, `add32`, `mul32` mit identischen Integer-Eingaben und
   verlangt gleiche Checksummen. Einzelwerte und Median werden als JSON
   gespeichert. Die Prozessstartzeit ist enthalten.
4. Für `inline` den resultierenden EXE-Hash und nach Möglichkeit den
   generierten Callsite-Code prüfen. Ein identischer Hash belegt, dass die
   explizite Markierung keinen Codegewinn brachte; eine kleine Laufzeitdifferenz
   ist dann Messrauschen. Nur wenn der Code sich sinnvoll ändert, folgt ein
   erneuter A/B- und Gesamtspiel-Vergleich.
5. Abschließend den 2.200-Frame-Retail-Replay bei gleicher Eingabefolge,
   Grafikauflösung und Buildkonfiguration vergleichen: FPS, p50/p95/p99,
   Maximalframezeit und Spielzustandszähler. Instrumentierte Call-Profile
   werden nicht als FPS-Benchmarks verwendet.

Der Compiler optimiert bereits kleine voll typisierte skalare Helfer
automatisch. Explizites `inline` ist eine begrenzte Anfrage: nur direkte
Aufrufe von Top-Level-Funktionen oder Struct-Methoden, keine Rekursion,
Closures, Schleifen, `switch`, verschachtelte Funktionen oder `defer`;
standardmäßig höchstens 4.096 Byte Expansion je Callee. Die normale
aufrufbare Funktion bleibt für indirekte Aufrufe erhalten.

## Erste isolierte Collision-Ergebnisse

Der separate 1.3.9-Collision-Benchmark des Collision-Agenten führte je
50 Millionen Aufrufe mit identischen Ergebnissen aus. PVS: untypisiert
1.031,7 ms, typisiert 794,8 ms. Brush-Dot: 2.423,7 ms zu 2.269,1 ms.
Die explizit `inline` markierte Version hatte denselben EXE-SHA-256 wie die
typisierte Version (`2010be820ffc313892e733f15a2a7b6704e520804c4ad76c58f1956325a0a818`);
ihre wenigen Prozent Zeitdifferenz sind daher **kein** nachgewiesener
Inlining-Effekt. Rohdaten liegen lokal unter
`build/collision_bench_{before,typed,inline}.json` und werden nicht versioniert.
Diese Mikrobenchmarks sagen noch nichts über die FPS des gesamten Spiels aus.

## Integer-Hotpath und lokales Compiler-Artefakt

Der isolierte Benchmark `tests/typed_numeric_hotpaths_bench.ml` führte je
3 Millionen Aufrufe von `u32`, `i32`, `add32` und `mul32` aus. Alle vier
Prüfsummen blieben beim Wechsel von untypisiert zu neun `int`-Verträgen
gleich. Unter zeitweise fremder Compilerlast ergaben neun alternierende
1.3.9-Messungen folgende Medianwerte in Millisekunden:

| Helfer | Ohne Typen | Mit Typen | Differenz |
| --- | ---: | ---: | ---: |
| `u32` | 26,79 | 18,32 | −31,6 % |
| `i32` | 28,47 | 28,32 | −0,5 % |
| `add32` | 60,81 | 56,55 | −7,0 % |
| `mul32` | 84,18 | 69,34 | −17,6 % |

Die EXE-SHA-256 wechselte von
`6e638ee4acd8d056d001fd6e9f391928554346a07f5d3566dafe57ade3fc0aa80`
auf `fdc09003e8574334fac46b4343d1d542fbbeedde261de9991ef4e6134c045cc3`.
Rohwerte: `build/reports/typed_numeric_exploratory_under_load.json`.

Ein explizites `inline` bei `u32` ergab dieselbe EXE wie nur typisierte
Funktionen. Bei `i32` änderte es den Code; im zweiten alternierenden
1.3.9-Durchlauf sanken `i32` von 29,69 auf 22,20 ms und das davon abhängige
`add32` von 57,13 auf 43,71 ms. `u32` und `mul32` blieben innerhalb des
Messrauschens. Checksummen waren wieder gleich. Rohwerte:
`build/reports/typed_numeric_i32_inline_exploratory.json`. Wegen zeitweiser
Fremdlast sind diese Werte explorativ und müssen vor einer FPS-Aussage im
Gesamtspiel bei ruhigem Rechner wiederholt werden.

Die anschließende **ruhige isolierte A/B-Wiederholung** bestätigte den
Effekt bei gleicher 1.3.9-Compiler- und Fixture-Basis. Finale Variante:
neun typisierte Integer-Helfer und nur `i32` explizit `inline`. Die
untypisierte Vergleichs-EXE wurde vor allen Änderungen gesichert. Je
3 Millionen Aufrufe, neun alternierende Durchläufe, zwei Warmläufe und
identische Prüfsummen:

| Helfer | Untypisiert (ms) | Final (ms) | Differenz |
| --- | ---: | ---: | ---: |
| `u32` | 26,93 | 18,53 | −31,2 % |
| `i32` | 29,66 | 21,81 | −26,5 % |
| `add32` | 60,10 | 41,97 | −30,2 % |
| `mul32` | 82,97 | 67,60 | −18,5 % |

Rohwerte: `build/reports/typed_numeric_final_ab.json`. In einem eigenen
ruhigen Vergleich von nur typisiert gegen typisiert plus `i32 inline`
sanken `i32` von 28,57 auf 21,41 ms (−25,1 %) und `add32` von 56,69
auf 42,45 ms (−25,1 %); `u32` und `mul32` blieben innerhalb kleiner
Schwankungen. Rohwerte: `build/reports/typed_numeric_inline_final_ab.json`.
Die finale EXE hat SHA-256
`d4f74f8775f54531d6813225fc7933b8fc13cb91418d8ed21cab0e942f350868`,
die nur typisierte EXE
`fdc09003e8574334fac46b4343d1d542fbbeedde261de9991ef4e6134c045cc3`.
Auch diese ruhigen Mikrobenchmarks belegen für sich keine FPS-Steigerung.

Das lokale Archiv `../MiniLangCompilerML/build/releases/`
`MiniLangCompilerML-1.3.10-windows-x64.zip` ist in sich konsistent:
ZIP-SHA-256 `e2cbc9a4d312bfbb1369d947c5f815786acde8c2b857aa094b5f0c87a6d7ca0f`
stimmt mit seiner `.sha256`-Datei überein, die ZIP-CRC-Prüfung besteht, und
das enthaltene `mlc.exe` hat den in `BUILD_INFO.json` und der Versionsmatrix
verzeichneten SHA-256
`d58437fc45cf01bfbbf3a69fa129cca57db1fbb2b5429fb8c58c67200a864abe`.
Das Archiv verweist auf Quellrevision `d0b1a4f`; die aktuelle lokale
Compiler-Arbeitskopie hat jedoch weitere uncommittete Änderungen. Das
Archiv ist damit für einen **separaten lokalen 1.3.10-Versuch** prüfbar,
aber nicht als veröffentlichte Produktionsversion bestätigt. Der Spielbuild
bleibt auf der veröffentlichten und gepinnten 1.3.9-Basis.

## Retail-Callprofil statt statischer Vermutung

`scripts/profile_function_contracts.py` erzeugte einen **nur im Test** um
`callStats()` erweiterten Entry Point. Das eigentliche
`src/mq3/client/qvm_preview_app.ml` blieb unverändert. Ein bewegtes
q3dm0-Replay mit originalen QVMs, Retail-`pak0.pk3`, 2.200 Frames und
20-ms-Fixschritt bestand. Der Compiler 1.3.9 zählte 2.095 aufgerufene
MiniLang-Funktionen; 2.001 davon ließen sich eindeutig auf die Inventur
abbilden. 432 Funktionen hatten wenigstens 10.000 Aufrufe und erhielten
in der Inventur Priorität P1. Die Rohzähler liegen unter
`build/reports/function_call_profile/summary.json`, die priorisierte
Inventur unter `build/reports/function_contract_inventory.json`.

| Funktion | Aufrufe in 2.200 Frames |
| --- | ---: |
| `mq3.compat.numeric.i32` | 78.264.313 |
| `mq3.compat.numeric.u32` | 51.575.593 |
| `mq3.compat.numeric.readU32` | 47.553.473 |
| `mq3.compat.numeric.fsub` | 39.184.392 |
| `mq3.compat.numeric.readI32` | 33.911.568 |
| `mq3.compat.numeric.fmul` | 32.584.999 |
| `mq3.compat.numeric.f32` | 25.787.320 |
| `mq3.platform.playable_window.writeBatchI32` | 13.196.852 |
| `mq3.vm.syscall_common.argument` | 10.465.721 |

`mq3.format.deflate.readBits` wurde 36.091.487-mal gezählt, davon bereits
35.887.132-mal in einem separaten 20-Frame-Smoke. Das ist überwiegend
einmalige Asset-Ladezeit und kein Beleg für eine pro Frame anfallende
Last. Der Replay lief in dieser Arbeitsumgebung mit dem vorhandenen
Retail-Archiv `build/baseq3/pak0.pk3`; der ältere Pfad `D:/Quake3` ist
hier zurzeit nicht gemountet. Instrumentierung und Profilerzähler
verändern die Laufzeit und dienen nur der Priorisierung, nie als FPS-Wert.

## Bytezugriffe mit Fehlerpfaden

Das Profil zeigte `readU32` mit 47,6 Millionen, `readI32` mit 33,9
Millionen und `writeU32` mit 23,9 Millionen Aufrufen. Die beiden ersten
Routinen lesen einen Bytepuffer und können bei ungültigem Offset
`error(3001)` zurückgeben; `writeU32` kann dasselbe tun. Ihre Rückgabewerte
bleiben daher dynamisch. Nur die nachgewiesenen ganzzahligen Offsets und
der ganzzahlige Schreibwert tragen nun `as int`.

`tests/typed_numeric_io_bench.ml` prüft gültige Puffer mit je drei
Millionen Lese- bzw. Schreibzugriffen, identische Prüfsummen sowie fünf
ungültige Grenzfälle einschließlich Fehlerweitergabe durch `readI32`.
Alle Fehlerprüfungen bestanden sowohl vor als auch nach dem Eingriff. Bei
neun alternierenden Messungen mit gepinntem 1.3.9 ergaben sich folgende
Medianzeiten (ms) für die **finale** Variante gegenüber der gesicherten
unveränderten EXE:

| Helfer | Ausgang | Final | Differenz |
| --- | ---: | ---: | ---: |
| `readU32` | 68,06 | 60,31 | −11,4 % |
| `readI32` | 91,38 | 70,49 | −22,9 % |
| `writeU32` | 59,72 | 58,19 | −2,6 % |

Die EXE-SHA-256 änderte sich von
`557f9010d202ee994c91ff1a977d789b88fff97943b8a76c31279fa0f2e5b60f`
auf `1cb9a4c8c19cb7aae67ae6615118615687494b66bd6d6d97cabb78c29a5f27f3`.
Rohwerte stehen unter `build/reports/typed_numeric_io_final_vs_baseline.json`.
Die Typverträge allein reduzierten `readU32` von 65,02 auf 61,31 ms;
`readI32` von 86,32 auf 84,77 ms. Das zusätzliche explizite `inline`
bei `readI32` änderte den Binärcode und senkte den isolierten Median von
86,11 auf 68,97 ms. `inline` bei `readU32` und `writeU32` ergab
jeweils eine byteidentische EXE und wurde entfernt. Ein Teil der
Schwankungen zwischen den drei Durchläufen kommt von Prozessstart und
Systemlast; die Gesamtspielmessung ist weiterhin ausschlaggebend.

`python scripts/test_numeric.py` mit dem 1.3.9-Release-Pfad bestand
**101.445 exakte C-Binary32-Vergleiche** nach den Änderungen. Die
Bytezugriffs-Probe ist eine isolierte Funktionsmessung, keine gemessene
FPS-Verbesserung.

## DEFLATE, VM und Renderer: weitere priorisierte Verträge

`mq3.format.deflate.readBits` bekommt `reader as Bits` und `count as int`.
Der Rückgabetyp bleibt offen, damit ein abgeschnittener Bitstrom weiterhin
`error(3500)` liefert. Eine `returns int`-Probe zeigte keinen messbaren
Vorteil und wäre semantisch falsch; die Schleife verhindert explizites
Inlining. Ein aus dem Retail-Archiv stammender q3dm11-BSP-Bitstrom wurde
30-mal alternierend entpackt (3 Warmups): Median 145,077 zu 141,726 ms
(−2,31 %, 23 von 30 Paare schneller), gleiche 8.490.236 Ausgabebytes.
Zusätzlich bestanden 115 Fehler-/Recovery-Fälle, 84 Archiv-/DEFLATE-
Bytevergleiche und das Original-C-Unzip-Gate. Ein um ein Byte gekürzter
Retail-Stream lieferte vor und nach der Änderung genau den Fehler 3500.
Rohwerte: `build/deflate_ab_params_q3dm11.json`.

`mq3.vm.syscall_common.argument` bekommt nur `address as int` und
`index as int`: der VM-Parameter ist strukturell polymorph, und der
Rückgabepfad kann `error(3420)` sein. Bei 50 Millionen Aufrufen und
20 alternierenden Paaren sank der Median von 1.578,765 auf 1.520,779 ms
(−3,67 %, 20/20 Paare schneller) mit gleicher Prüfsumme. Die
explizite Inline-Markierung erzeugte byteidentischen Binärcode und
wurde entfernt. Vier Original-QVM-ABI-Datensätze, 44 Trap-Verträge,
115 Fehlerfälle und ein Retail-QVM-Match mit Original-Qagame/Cgame
bestanden. Rohwerte: `build/syscall_argument_ab.json`.

Im Renderer erhalten insgesamt neun häufige Helfer nur die jeweils
bewiesenen Array-, Struct-, Integer- und Bool-Verträge. Insbesondere
bleiben heterogene Triangle-Objekte dynamisch. 63 World-Batch- und
24 QVM-Szenenverträge bestehen unter 1.3.9. Die 360 Retail-q3dm1-
Rotationsframes (251 Faceset-Wechsel, null Budget-Drops) und eine
QVM-Szene mit 1.728 Dreiecken × 20 Frames waren in den A/B-Versionen
semantisch identisch. Die erweiterten Test-EXEs schrumpften jeweils um
1.024 Byte; die alternierenden Laufzeiten zeigten keinen stabilen
Renderer-Gewinn. Explizite Inline-Marker für die ersten fünf Helfer
erzeugten identischen Binärcode und wurden entfernt. Eine separate
Prüfung mit dem SHA-verifizierten lokalen 1.3.10-ZIP bestätigte 360
semantisch identische Retail-Frames; die produktive Compiler-Pin bleibt
auf der veröffentlichten 1.3.9. Rohwerte: `build/renderer_hotpath_ab/results.json`.

## Produktiver Windows-Build und Gesamtspiel-A/B

`python scripts/build_release.py` erstellte die Windows-EXE mit dem
gepinnten 1.3.9-Compiler. Ein 2.200-Frame-Retail-q3dm0-Replay mit den
unveränderten Original-QVMs, Hardware-OpenGL auf einer RTX 5080,
1280 × 720 Pixeln und 20-ms-Fixschritt bestand. Gegenüber der vor den
Typänderungen gesicherten Baseline waren die Spielzähler exakt gleich:
540 Positionswechsel, 1.150 Angriffe und 100 Munitionsabnahmen.

Anschließend liefen die eingefrorenen Replay-EXEs in drei alternierenden
Baseline/Kandidat-Paaren, ohne Kompilation im Messloop. Das Skript
`scripts/benchmark_function_contract_game.py` verlangt gleiche Spielzähler
in allen sechs Läufen und bewahrt die Rohlogs mit EXE-, Retail-PK3- und
QVM-SHA-256 auf. Der einzelne Finale-Replay zeigte 68,23 FPS, p99 38 ms,
maximal 49 ms; für den Vergleich zählen die wiederholten Paare:

| Messgröße, Median von drei Läufen | Ausgang | Typisiert |
| --- | ---: | ---: |
| FPS | 67,41 | 67,92 |
| Framezeit p50 | 13 ms | 13 ms |
| Framezeit p95 | 29 ms | 29 ms |
| Framezeit p99 | 39 ms | 38 ms |
| Längster Frame | 49 ms | 47 ms |

Die FPS-Differenz von etwa 0,8 % liegt in der beobachteten
Laufstreuung. Hier ist kein großer Gesamtspielgewinn nachgewiesen,
obwohl einige isolierte Helfer klar schneller wurden. Asset-Laden,
QVM-Ausführung, Geometrie und GPU-Abgabe begrenzen weiterhin die
Gesamtleistung. Der finale Replay-Bericht liegt unter
`build/reference/controls_render_replay/types_final_2200/moving.json`,
die sechs A/B-Rohläufe unter
`build/reports/function_contract_game_ab.json`. Der Null-Argument-
Windows-Start erreichte außerdem das Originalmenü mit der lokalen
`build/baseq3/pak0.pk3`.

Mit der finalen Release-EXE bestanden danach auch **30/30 Retail-Arenen**
mit je 30 originalen QVM-Frames und sichtbaren Dreiecken/Texturen; der
langsamste Kartenstart lag bei 5.675 ms. **32/32 benannte Retail-Bots**
spawnten im Original-Qagame und lieferten in einem 120-Frame-Test aktive
Kommandos. Diese Tests prüfen kurze Start-/Aktivitätsfenster und ersetzen
keine mehrstündige Bot- oder Match-Abnahme. Berichte:
`build/reports/all_retail_levels.json` und
`build/reports/all_retail_bots.json`.

## Reichweite der Typisierung

Nach diesem Paket meldet die Inventur **39 von 31.660 Parametern** mit
Vertrag, **19 von 12.618 Rückgabewerten**, **15 vollständige Signaturen**
und **2 explizite Inline-Funktionen** (`i32`, `readI32`). Das ist eine
gezielte Hotpath-Migration, keine vollständige Typisierung. Die übrigen
Signaturen erfordern Datenflussprüfung, Polymorphie-Entscheidungen und
Fehlerpfadtests. Insbesondere dürfen `float`-Rückgaben, die zur Laufzeit
als `int` getaggt werden, und Funktionen mit `error`/`void` nicht
automatisch zu skalaren Verträgen umgeschrieben werden. Der
instrumentierte Callgraph priorisiert die nächsten Arbeiten; die
lexikalische Inventur beweist selbst keine sichere Annotation.

## Regressionen und reproduzierbare Grenze des Gesamtgates

Mit `MQ3_BUILD_TOOLCHAIN=release` bestanden nach dem finalen Build zusätzlich
die 101.445 numerischen C-Vergleiche, 4.096 Original-Brush-Traces mit
36.864 exakten Feldern, Sichtbarkeit auf allen 31 Retail-/Test-BSPs,
63 World-Batch-, 24 QVM-Szenen- und 44 VM-Syscall-Verträge, der Retail-
QVM-Match, 84 Archiv-/DEFLATE-Bytevergleiche und das Original-C-Unzip-
Gate mit 84 Retail-Archivfällen. `test_default_exe_startup.py` erreichte
das Originalmenü im Null-Argument-Windows-Start. Die Quellzuordnungs-
und Signaturinventur-Tests bestanden. Der Signaturinventur-Test ist nun
Bestandteil von `scripts/verify.py`.

Der vollständige `python scripts/verify.py --data-root build`-Lauf
stoppt unter dem gepinnten 1.3.9-Compiler beim bestehenden
`test_message_state_delta.py`: `CompileError: unknown data patch target:
switch_case_body_23053_0`. Ein Start ab dem nächsten Gate trifft
denselben Compilerfehler in `test_snapshot_build.py`. Beide Oracle-
Programme scheitern **auch mit einer getrennten Kopie des unveränderten
`HEAD`-Quellbaums** (`switch_case_body_23162_0` bzw.
`switch_case_body_23470_0`); diese Abbrüche wurden nicht durch die
neuen Typverträge ausgelöst. Die frühere lokale Frozen-Compilerdatei
unter `artifacts/toolchain/build/mlc_win64.exe` entspricht derzeit
nicht mehr ihrem dokumentierten SHA-256. Sie wurde weder ersetzt noch
für die produktiven Messungen benutzt. Die darüber hinausgehenden
Verifikationsgates sind damit **nicht** als bestanden ausgewiesen.
