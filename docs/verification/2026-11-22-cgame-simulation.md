# Cgame im Einzelspieler-Kampf

Vergleichsbasis ist `620c498`. Das Replay spielt auf `q3dm0` gegen Crash mit
festen Eingaben und 20 ms Spielzeit pro Frame. Es läuft mit den Original-QVMs,
Retail-`pak0.pk3` und dem Hardware-Renderer in 1280 × 720 auf der
NVIDIA GeForce RTX 5080 (Treiber 610.88). Die 2.200 dargestellten Frames
enthalten 880 Server-Ticks. Die FPS ergeben sich aus der verstrichenen
Echtzeit.

## Wo die Zeit hingeht

In zwei Einzelläufen mit gesperrtem Compiler verbrachte
`CG_DRAW_ACTIVE_FRAME` vorher 1.099 ms in der QVM und 7.575 ms in den
Engine-Aufrufen, nachher 1.012 ms und 5.208 ms. Das sind vor der
Optimierung rund 87 % der Zeit dieses Cgame-Aufrufs auf der Engine-Seite.
Beide Läufe führten 248.494.845 Cgame-QVM-Instruktionen aus und übergaben
1.757.943-mal die Kontrolle an die Engine.
Besonders teuer waren Weltkollision, Szenenpolygone, Einschlagspuren und
HUD-Bilder. Die Zeitmessung an den Übergängen zur Engine erhöht die Framezeit.
Die Zahlen unten aus den instrumentierten Läufen dienen zur Zuordnung.

| Cgame-Aufruf | Aufrufe je Lauf | Engine-Zeit vorher / nachher, ms insgesamt |
| --- | ---: | ---: |
| Weltkollision mit Box | 34.287 | 1.636 / 1.397 |
| Polygon zur Szene hinzufügen | 147.367 | 870 / 408 |
| Einschlagspur auf BSP-Flächen projizieren | 3.434 | 931 / 527 |
| HUD-Bild zeichnen | 264.874 | 884 / 421 |
| Modell oder Effekt zur Szene hinzufügen | 74.911 | 535 / 129 |
| Transformierte Kollisionsabfrage | 79.213 | 761 / 674 |

Für jede an die Engine übergebene Zeicheneinreichung legte der Port einen
Protokolleintrag an und kopierte die bisherigen Einträge der Szene. Dieses
Protokoll hatte keinen Leser. Die echte Zeichenwarteschlange und die
Aufrufzähler bedienen weiterhin dieselben Schnittstellen. Die QVM-Prüfung
für Polygonpuffer benötigt außerdem keine bitweise Division mehr.

Bei Einschlagspuren nutzt die Engine bereits dekodierte Dreiecke erneut,
wenn die geordnete Liste der getroffenen BSP-Flächen übereinstimmt.
Projektionsrichtung, Schnittpunkte und Ausgabelimits gelten für jede Spur
einzeln. Der Cache hat 32 Plätze für jeweils höchstens 256 Dreiecke. Ein
Wechsel des BSP-Objekts oder seines Datenpuffers verwirft die Einträge.
Bei der Patch-Kollision geht die gewählte Box-Ecke direkt ins Skalarprodukt.
Beim Durchlaufen des BSP-Baums kommt der Box-Ebenen-Test ohne zwei temporäre
Vektoren pro Knoten aus.

## Herkunft der langen Frames

Im isolierten Lauf der Ausgangsversion gab es zwei Frames ab 50 ms.
Bei Frame 1.583 von insgesamt 57 ms benötigte ein einzelner serverseitiger
`trap_Trace` 32,0 ms. Bei Frame 1.818 von 56 ms dauerte eine
Bot-Sichtprüfung für ein Itemziel (`trap_BotItemGoalInVisButNotVisible`)
31,4 ms. Cgame beanspruchte in diesen Frames 5 und 4 ms. Die GC-Zähler
änderten sich bei beiden nicht. Der isolierte Lauf der neuen Version
erreichte maximal 41 ms. Die Trap-Zeiten messen verstrichene Zeit und
enthalten mögliche Unterbrechungen des Spielthreads.

Im ersten Diagnoselauf der Ausgangsversion entfielen bei Frame 1.650 von 106 ms insgesamt 73 ms
auf Cgame. Darin kosteten 69 Modell- und Effekteinreichungen 47,6 ms.
In diesem Frame änderten sich die GC-Zähler nicht. Bei Frame 1.808 lag die
Ursache an anderer Stelle. Von 152 ms entfielen 84 ms auf das Zeichnen,
27 ms auf die Bildausgabe und 9 ms auf Cgame. Bei 24 der 80 Frames ab
50 ms änderte sich mindestens ein GC-Zähler. Das misst zeitliches
Zusammentreffen und erlaubt keine Zuordnung einzelner Millisekunden zur GC.
Für den historischen 59-ms-Frame liegt keine Einzelmessung vor.

## Kampf ohne Profiler

Je vier Läufe pro Version, mit wechselnder Reihenfolge innerhalb jedes
Paares. Während dieser Messung war der Compiler gesperrt. Beide EXEs wurden
mit MiniLang 1.3.9, identischen Laufzeiteinstellungen und derselben
generierten Replay-Datei gebaut. Alle acht Läufe zählten 540 Positionswechsel,
1.150 Angriffskommandos und 100 Munitionsabnahmen.

| Median der Läufe | Vorher | Nachher |
| --- | ---: | ---: |
| FPS | 74,57 | 82,07 |
| Cgame in ms pro Frame | 3,88 | 3,01 |
| Spielsimulation einschließlich Cgame und UI in ms pro Frame | 6,33 | 5,34 |
| Serverseitiges Spiel in ms pro Frame | 2,44 | 2,32 |
| Framezeit p50 / p95 / p99 in ms | 11,5 / 26 / 35 | 11 / 23,5 / 31,5 |
| Längster Frame je Lauf, Median in ms | 46 | 41,5 |

| Paar | FPS vorher / nachher | Längster Frame vorher / nachher in ms |
| --- | ---: | ---: |
| 1 | 72,55 / 82,31 | 44 / 39 |
| 2 | 75,36 / 76,41 | 51 / 44 |
| 3 | 73,78 / 81,83 | 48 / 38 |
| 4 | 78,94 / 83,77 | 40 / 45 |

Im Vergleich zur historischen Messung mit 4,25 ms Cgame-Zeit war bereits
die erneut gemessene Ausgangsversion schneller. Im direkten Vergleich
sank die Cgame-Zeit um 22,3 %. Der höchste Einzelwert der neuen Version
betrug 45 ms. In einem der vier Paare stieg das Maximum. Andere Karten,
Botzahlen und längere Spielsitzungen können andere Spitzen zeigen.

Bei Frame 2.000 meldete die Laufzeit vorher 71 bis 72 Speicherbereinigungen
und 288 bis 304 MiB zugesicherten Heap. Nachher waren es in allen vier
Läufen 64 Bereinigungen und 304 MiB. Das vorbereitete Dreiecksarray bleibt
für spätere Projektionen im Speicher.

## Reproduktion

Die Prüfung der geänderten Pfade lieferte folgende Ergebnisse.

- 2.684 Welt- und Submodell-Kollisionsfälle mit aktivierten Kurven auf
  q3dm0 und q3dm1, 42.944 identische Ergebnisfelder gegenüber Original-C.
- 4.096 exakte C-Vergleiche für die Kollisionsmathematik, 35 Tests für
  die BSP-Traversierung und 159 Patch-Meshes gegen die Originalgeometrie.
- 5 exakte Original-C-Datensätze und 22 Verträge für Einschlagspuren,
  einschließlich verschobener Projektion, Cache-Kollision und BSP-Wechsel.
  Die Retail-Projektion auf q3dm1 lieferte ein Fragment mit vier Punkten.
- 23 Renderer-Trap-Verträge einschließlich VM-Puffergrenzen und extrem
  großer Polygonzahlen. Weitere 360 Retail-Cgame-Abfragen über 120 Frames
  lieferten beim Bytevergleich identische Spuren und Fragmentausgaben.
- Die frisch gebaute Windows-EXE erreichte mit dem benachbarten
  `baseq3` ohne Argumente in 0,53 s das Originalmenü.

Der Retail-PK3-Hash (SHA-256) ist
`7ce8b3910620cd50a09e4f1100f426e8c6180f68895d589f80e6bd95af54bcae`.
Die lokalen Laufprotokolle, die einzelnen Werte sowie EXE- und QVM-Hashes
liegen neben dem JSON-Bericht.

```powershell
python scripts/test_ingame_controls_render.py --published-compiler --data-root build --map q3dm0 --singleplayer --mode moving --frames 2200 --fixed-step-ms 20 --cpu-profile --qvm-profile --profile-frame 2178 --label sim_audit_after
python scripts/test_ingame_controls_render.py --published-compiler --data-root build --map q3dm0 --singleplayer --mode moving --frames 2200 --fixed-step-ms 20 --label sim_host_reuse
python scripts/benchmark_function_contract_game.py --baseline build/controls_render_replay_stage_work_reuse.exe --candidate build/controls_render_replay_sim_host_reuse.exe --repeat 4 --output build/reports/cgame_host_work_game_ab.json
```
