# CPU-Ruckler im Botkampf: Portal-, Licht- und Nebelpfade

Geprüft am 23. November 2026 mit der Retail-Datei `build/baseq3/pak0.pk3`,
den drei Original-QVMs in `build/reference/qvms`, dem veröffentlichten
MiniLang-Compiler 1.3.9 und dem produktiven Windows-OpenGL-Pfad auf einer
NVIDIA RTX 5080. Der reproduzierbare Lauf verwendet `q3dm0`, Einzelspieler,
3.200 Frames Bewegung und Kampf mit festem 20-ms-Simulationsschritt. Er ist
ein Funktions- und CPU-Profil, kein deterministischer GPU-Benchmark.

## Ursache der verbleibenden Bildspitzen

Im Ausgangslauf `portal_cull_cpu_profile` dauerten 144 Frames mindestens
35 ms. In diesen langsamen Frames entfielen im Mittel 18,0 ms auf die
Zeichenphase, 8,4 ms auf Portalvorbereitung, 3,8 ms auf Geometrieexpansion,
3,8 ms auf Szenenbatches und 2,3 ms auf die Weltselektion. Die native
Renderer-Aufzeichnung `build/reports/portal_cull_native_profile.txt` zeigt
im Kampfabschnitt der Frames 2500–2700 durchschnittlich 4,39 ms in den
nativen Zeichenaufrufen; weitere 11,53 ms lagen zwischen `beginFrame` und
`present` außerhalb dieser Aufrufe und des Buffertauschs. In einem zweiten
Lauf (`deferred_lights_native_profile.txt`) erreichten einzelne Abschnitte
25–30 ms außerhalb der nativen Zeichenaufrufe bei 4–6 ms darin. Diese
Messung grenzt den Engpass auf die CPU-Vorbereitung und die vielen
MiniLang-Aufrufe für Shaderpasses ein; sie misst keine GPU-Ausführungszeit.

Ein einzelner Lauf mit der ersten Lichtänderung hatte bei Frame 2666 eine
806-ms-Zeichenphase und 849 ms Gesamtzeit. Der unmittelbar folgende Lauf
mit nativer Instrumentierung hatte maximal 69 ms. Damit ist diese einmalige
Spitze bisher nicht reproduziert und nicht als behobene Ursache gewertet.

## Übernommene Änderung und Gegenproben

* `SurfIsOffscreen`: Die Portalvorbereitung verwirft jetzt Dreiecke, deren
  erstes Vertex vom Betrachter weg zeigt. 43 Portalverträge bestehen; der
  3.200-Frame-Retail-Lauf behielt 144 Portalbauten und 239 Cachetreffer.
  Das ist ein Paritätsfix ohne gemessenen q3dm0-Performanceeffekt.

Bedarfsgesteuerte dynamische Lichtquellen, gespeicherte Nebelpräsenz und ein
wiederverwendeter Nebelindex-Puffer bestanden 63 experimentelle
Retained-World-Verträge und 432 bytegenaue Retail-Vergleichsfälle.
Diese Änderungen wurden wegen der folgenden Laufwerte **zurückgenommen**.

Die Laufwerte der profilierten Fassungen sind stark von der wechselnden
Systemlast beeinflusst:

| Lauf | FPS | P99 Arbeit | Maximum |
| --- | ---: | ---: | ---: |
| Ausgangsfassung A | 66,34 | 48 ms | 66 ms |
| Licht + Nebelpräsenz A | 74,81 | 48 ms | 88 ms |
| Ausgangsfassung B | 77,14 | 45 ms | 61 ms |
| Licht + Nebelpräsenz B | 73,91 | 50 ms | 86 ms |
| Zusätzlich wiederverwendeter Nebelpuffer, erster Lauf | 60,91 | 68 ms | 1.156 ms |
| Derselbe Nebelpuffer, warmer Folgelauf | 57,41 | 61 ms | 95 ms |
| Unmittelbarer Rückvergleich mit Ausgangsfassung C | 75,88 | 47 ms | 61 ms |

Die zusätzlichen Laufwerte des Nebelpuffers zeigen einen deutlichen
FPS- und P99-Rückschritt gegenüber dem unmittelbaren Rückvergleich.
Der warme native Profillauf verzeichnete in einzelnen
Kampfframes 32–40 ms außerhalb der nativen Draw-Aufrufe; diese brauchten
4–9 ms. Die genaue Ursache des Rückschritts ist bei schwankender
Systemlast noch nicht isoliert; die experimentelle Änderung bleibt deshalb
außerhalb des Ports. Die Spielzähler blieben in jedem
vollständigen Replay gleich: 752 Positionsänderungen, 1.650 Angriffsframes,
160 Munitionsabnahmen, 1.789 neue Weltselektionen, 144 Portalbauten und
239 Portaltreffer.

Die experimentelle Fassung bestand 63 Retained-World-Verträge, 432
Retail-Differentialfälle, 64 Weltbatch-Verträge, 14 Nebelverträge samt
q3ctf1-Retailprobe und die q3dm0-Materialprobe (101 Materialien, 218
Shaderpasses). Die produktiven Botkämpfe und ein Windows-Build mit
MiniLang 1.3.9 liefen durch. Das Testprogramm erreichte das Originalmenü
in 0,44 s. Relevante PowerShell-Befehle:

```powershell
$env:MQ3_BUILD_TOOLCHAIN='release'
python scripts/test_retained_world_batch.py --data-root build
python scripts/test_portal_render_pass.py
python scripts/test_playable_world_materials.py --pak (Resolve-Path build/baseq3/pak0.pk3).Path --map maps/q3dm0.bsp
python scripts/test_ingame_controls_render.py --published-compiler --data-root build --map q3dm0 --singleplayer --mode moving --frames 3200 --fixed-step-ms 20 --cpu-profile --profile-min-ms 35
python scripts/build_release.py
python scripts/test_default_exe_startup.py
```

Der vollständige `verify.py`-Lauf wurde nach 33 grünen Gates bei
`test_protocol_runtime.py` beendet; damit liegt für diesen Stand kein
vollständiger Verify-Durchlauf vor. Der Standardmodus von `verify.py`
verweigerte zuvor das veränderte historische Compiler-Artefakt; die
gestartete Teilprüfung nutzte `MQ3_BUILD_TOOLCHAIN=release`.

Nach Rücknahme der Experimente wurde `MiniQuake3.exe` erneut mit dem
veröffentlichten Compiler gebaut. `test_default_exe_startup.py` erreichte
das Originalmenü in 0,53 s. Der wiederhergestellte Retained-World-Pfad
bestand erneut 54 Verträge und 432 Retail-Differentialfälle; die
Portalprüfung bestand 43 Verträge. Das unveränderte Portal-Backface-Replay
mit 3.200 Frames erreichte im abschließenden Lauf 77,86 FPS, P99 44 ms und
maximal 66 ms bei identischen Spielzählern. Das ist ein Einzelwert zur
Funktionskontrolle, kein Nachweis einer allgemeinen FPS-Verbesserung.

Zwei untersuchte Alternativen wurden verworfen: Ein GC-Limit von 128 statt
64 MiB halbierte die Zyklen bis Frame 3000 (104 auf 55), verschlechterte
aber in einem der zwei abwechselnden Paare P99 von 46 auf 57 ms und erhöhte
den committed Heap von 335 auf 403 MiB. Eine skalare Umsetzung der
Environment-UV-Berechnung lag in zwei Paaren jeweils leicht hinter der
Ausgangsfassung. Beide Änderungen sind nicht im Quellcode enthalten.

Die verbleibende Arbeit betrifft vor allem Shaderpass-Vorbereitung und
zusätzliche Portalansichten in langen Botkämpfen. Der Port hat hier noch
keine 1:1-Performanceparität mit Quake III Arena.
