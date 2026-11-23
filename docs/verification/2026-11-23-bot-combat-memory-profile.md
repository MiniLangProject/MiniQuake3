# Botkampf: Speicher und periodische Frame-Einbrüche

Geprüft am 23. November 2026 mit der legalen Retail-Kopie
`build/baseq3/pak0.pk3`, den drei Original-QVMs, dem veröffentlichten
MiniLang 1.3.9 und Hardware-OpenGL auf der NVIDIA RTX 5080. `D:/Quake3`
ist auf diesem Rechner zurzeit nicht vorhanden.

## Befund

Der 6.000-Frame-Lauf auf q3dm1 simulierte 1.327 Positionsänderungen,
3.000 Angriffsframes und 265 Munitionsabnahmen mit einem Bot. Nach dem
Asset-Aufbau blieb der committed Heap der bisherigen 128-MiB-GC-Konfiguration
von Frame 4.000 bis 6.000 bei 368 MiB. Nach GC lebten etwa 122–130 MB.
Der GC-Zähler stieg in diesem Abschnitt von 62 auf 91. Das zeigt keinen
stetig volllaufenden Heap in diesem etwa einminütigen Test; es ist kein
mehrstündiger Leak-Nachweis.

Im ersten CPU-Profil trafen alle 39 Frames ab 35 ms mit einem GC-Zyklus
zusammen. In einem unmittelbaren Wiederholungslauf waren es 49 von 50.
Das belegt eine starke zeitliche Überlagerung, nicht die isolierte Ursache
jedes Spikes: Die langsamen Frames enthielten zugleich Arbeit in
`qagame`/Cgame, Geometrieausbau, Szenen-Batching und OpenGL-Zeichnen.
Zwischen Frame 2.500 und 3.500 stiegen die Simulations- und Geometriekosten
mit dem Kampfgeschehen, danach gingen sie wieder zurück. Das passt zum
gemeldeten wechselnden Spieltempo.

## Geprüfte Änderungen

`scene_queue.ml` hängt Entitäten und dynamische Lichter jetzt an
Kapazität behaltende `std.ds.list.List`-Puffer an, statt bei jeder Einfügung
das ganze Array zu kopieren. Beim Frame-Reset werden Referenzen gelöscht;
fertige `View`-Snapshots erhalten eigene Array-Ausschnitte. 42
Szenenverträge und die vollständigen `tr_scene`-Verträge bestehen. Diese
Änderung beseitigt quadratisches Kopieren, ist im kompletten Botkampf aber
kein belegter FPS-Fix.

| 6.000 Frames, q3dm1, Bot | FPS | P99 Arbeit | Maximum | Frames ab 35 ms | GC-Zyklen | Heap committed bei Frame 6.000 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Bisheriges Array, erster Lauf | 95,43 | 32 ms | 46 ms | 39 | 91 | 368 MiB |
| Neue Liste, erster Lauf | 88,23 | 33 ms | 53 ms | 49 | 91 | 384 MiB |
| Bisheriges Array, direkter Gegenlauf | 91,26 | 33 ms | 61 ms | 50 | 91 | 368 MiB |
| Neue Liste, direkter Gegenlauf | 92,66 | 34 ms | 58 ms | 57 | 91 | 368 MiB |
| Neue Liste, experimentell 256-MiB-GC | 86,46 | 32 ms | 57 ms | 40 | 47 | 496 MiB |

Die A/B-Reihenfolge und gleichzeitige Systemlast verändern die absoluten
Werte deutlich. Bei 256 MiB halbierten sich die GC-Zyklen ungefähr, aber
der zusätzliche Speicherbedarf von 128 MiB brachte keinen verlässlichen
Gesamtgewinn. Die produktive GC-Schwelle bleibt deshalb bei 128 MiB.
Die Ruckler sind nicht behoben; nächste Kandidaten sind die in den
`CPU_FRAME`-Zeilen sichtbaren Cgame-, Geometrie- und Draw-Spitzen.

## Reproduktion

```powershell
python scripts/test_scene_queue.py
python scripts/test_tr_scene_complete.py
python scripts/test_ingame_controls_render.py --data-root build --map q3dm1 --singleplayer --mode moving --frames 6000 --fixed-step-ms 20 --cpu-profile --profile-min-ms 35 --published-compiler --label scene_list
```

Die Profilinstrumentierung und feste 20-ms-Simulationsschritte machen die
FPS-Werte nicht zu einer interaktiven Langzeitabnahme. Vollbild, andere
Karten, Treibereinstellungen und lange Kämpfe können anders ausfallen.
Der aktuelle Release-Build und der Start ohne Argumente bestanden; das
Originalmenü erschien im Starttest nach 0,42 s. `verify.py --data-root build`
brach mit der hier veränderten archivierten Compiler-Prüfsumme bereits im
ersten Gate ab. Mit `MQ3_BUILD_TOOLCHAIN=release` bestanden die ersten 18
Gates; der umfassende Lauf wurde während Gate 19 beendet. Das ist kein
bestandener vollständiger Verify-Lauf. Die gezielten Szene-/Renderer-Gates,
das Paritätsinventar und der Retail-Botkampf bestanden separat.
