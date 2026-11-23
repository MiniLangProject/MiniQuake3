# Wolken-Zenit und späte Botkampf-Frames

Geprüft am 23. November 2026 mit der legalen Retail-Kopie
`build/baseq3/pak0.pk3`, den drei Original-QVMs, dem veröffentlichten
MiniLang 1.3.9 und Hardware-OpenGL auf der NVIDIA RTX 5080. Die früher
verwendete Installation unter `D:/Quake3` ist derzeit nicht vorhanden.

## Sichtbarer quadratischer Himmelsfleck

Der produktive Himmel berechnete die Wolken-UVs bislang aus Yaw und Pitch
über einem festen Bildschirmraster von 12 × 8 Zellen. Direkt am Zenit ist
Yaw undefiniert; die anschließende U-Entfaltung änderte einzelne Zellen
sprunghaft. Die quadratische Grenze im Benutzerbild entspricht einer solchen
Rasterzelle.

`tr_sky.c::R_InitSkyTexCoords` schneidet stattdessen den Sichtstrahl mit einer
Wolkenkugel um den Radius 4096 und verwendet `acos` der normalisierten
X- und Y-Komponenten. Der produktive MiniLang-Pfad verwendet jetzt diese
Formel und liest die Wolkenhöhe aus `skyparms`. Der q3dm1-Retail-Shader
`tim_hell` hat 384, die zwei weiteren geprüften Retail-Himmel 512. Die
alte U-Entfaltung wurde aus den produktiven nativen und MiniLang-Batchpfaden
entfernt. Die übrige Bildschirmraster-Geometrie bleibt eine Annäherung an
Quakes nach sichtbaren Sky-Polygonen begrenzte Würfelflächen.

35 Himmel-Verträge bestehen, darunter 405 Vergleiche mit den fünf sichtbaren
Original-Sky-Faces. Drei Retail-Karten laden sechs echte Wolkenschichten mit
den erwarteten Höhen. Die Hardware-Aufnahme mit echtem `tim_hell` bei
senkrechtem Blick nach oben (`tests/playable_sky_zenith_capture.ml`,
ignoriertes Artefakt `build/reports/sky_zenith.png`) zeigt den vorherigen
quadratischen Übergang nicht mehr. Die Aufnahme ist eine gezielte
Zenit-Gegenprobe, keine Abnahme aller Karten, Blickwinkel oder Auflösungen.

Ein 1.200-Frame-A/B-Botkampf auf q3dm1 ergab 115,28 FPS/P99 26 ms für den
eingefrorenen Winkelpfad und 116,08 FPS/P99 26 ms für die Kugelprojektion.
Für den Himmel ist damit kein relevanter FPS-Effekt belegt.
Der 60-Frame-Vorbereitungsbenchmark meldete 0,267 ms pro Frame für
frische Raster-UVs und 0 ms für Treffer im achtfachen Kamera-Cache;
dieser Mikrobenchmark enthält keine GPU-Zeit.

## Profil der verbleibenden Hänger

Die 3.200-Frame-QVM-/CPU-Probe auf q3dm1 erreichte 90,37 FPS,
P99 36 ms und maximal 53 ms. Von 40 Frames ab 35 ms traten 24 zusammen
mit einem GC-Zyklus auf. Einzelne langsame Frames verbrachten über 17 ms
in `CG_CM_MARKFRAGMENTS` oder `CG_R_ADDPOLYTOSCENE`; weitere Zeit lag in
Spiel-Traces, Szenenaufbereitung und Zeichenpässen. Die instrumentierte
Probe ist nicht direkt mit uninstrumentierten FPS-Läufen vergleichbar.

Ein experimenteller QVM-Polygon-Pool verringerte kurzlebige Vertexobjekte,
zeigte in zwei umgekehrt angeordneten vollständigen Vergleichspaaren aber
keinen belastbaren FPS-Vorteil: 87,33→94,59 FPS und 92,23→97,16 FPS
(jeweils vorher→Pool). Das zweite Paar begünstigte den vorherigen Pfad;
der Pool wurde wegen seines zusätzlichen Referenz-Lebensdauerrisikos
verworfen.

Die behaltene Änderung befüllt vorhandene dynamische Dreiecksrecords für
Cgame-Polygone direkt. Ein isolierter Vergleich mit 250.000 wiederholten
Polygon-Dreiecken sank von 78 auf 16 ms. 60 Geometrieverträge prüfen
neue und wiederverwendete Records sowie das Zurücksetzen aller Modell-,
Licht-, Fog- und Shader-Metadaten. Der vollständige q3dm1-Lauf ohne Pool
bestand mit 759 Positionswechseln, 1.650 Angriffsframes, 159
Munitionsabnahmen und unverändert 3.007 Dreiecken im letzten Frame. Er
erreichte 98,15 FPS, P99 33 ms, Maximum 47 ms. Ein warmer vorheriger
Vergleichslauf hatte 97,16 FPS, P99 33 ms und Maximum 48 ms; diese Werte
belegen keinen klaren FPS-Gewinn des neuen Pfads im Gesamtspiel. Die
isolierte Aufbereitung ist jedoch deutlich schneller.

Die zweite 3.200-Frame-Probe auf q3dm0 mit Portal und Bot bestand ebenfalls:
752 Positionswechsel, 1.650 Angriffsframes und 160 Munitionsabnahmen.
Der optimierte Lauf erreichte 84,41 FPS, P99 39 ms und maximal 81 ms;
der eingefrorene vorherige Pfad erreichte 88,11 FPS, P99 41 ms und
maximal 64 ms. Die Reihenfolge und Systemlast können diese Differenz
beeinflussen. Ein allgemeiner FPS-Gewinn ist damit nicht belegt.
Der 81-ms-Frame bei 2540 traf vier erstmals benutzte Szenentexturen und
einen GC-Zyklus; 14 ms entfielen auf Portale, 19 ms auf das Zeichnen.
Der eingefrorene Pfad lud am selben Frame ebenfalls vier Texturen, aber
ohne GC-Zyklus und in 44 ms. Das belegt eine Überlagerung von Arbeiten,
keinen isolierten 37-ms-Effekt des neuen Polygondreieck-Pfads.

## GC-Schwelle im produktiven Windows-Build

Mit weiterhin nebenläufigem GC wurde die Schwelle von 64 auf 128 MiB
angehoben. Zwei q3dm0-Proben mit 64 MiB vor und nach dem 128-MiB-Lauf,
jeweils mit identischer Bewegung und 3.200 Frames, ergaben 84,41 und
85,45 FPS, P99 39/44 ms und 65/78 langsame Frames ab 35 ms. Dazwischen erreichte
128 MiB 90,12 FPS, P99 37 ms, maximal 62 ms und 50 langsame Frames.
Der GC-Zähler bei Frame 3000 fiel von 98 auf 52. Der betroffene Frame
2540 mit vier neuen Texturen dauerte nun 44 statt 81 ms und fiel nicht
mehr mit GC zusammen. Das ist ein konkreter Gewinn im Portal-Level;
die absolute FPS-Zahl bleibt von Systemlast und Reihenfolge abhängig.

Auf q3dm1 ergab 128 MiB 92,59 FPS/P99 33 ms/Maximum 45 ms; ein danach
gemessener 64-MiB-Lauf ergab 94,62 FPS/P99 33 ms/Maximum 54 ms. Langsame
Frames ab 35 ms blieben mit 26/27 nahezu gleich. Hier ist kein mittlerer
FPS-Vorteil nachweisbar, aber auch kein P99-Rückschritt. Der GC-Zähler
bei Frame 3000 sank von 84 auf 44.

Die größere Schwelle erhöht den zugesicherten Speicher: q3dm0 meldete
bei Frame 3000 403 statt 336 MiB committed, q3dm1 386 statt 302 MiB.
Nach der abschließenden nativen Viewport-Korrektur und bei höherer
gleichzeitiger Systemlast ergab ein weiteres q3dm0-Paar 77,07 FPS/P99
43 ms/Maximum 62 ms mit 128 MiB und direkt danach 74,42 FPS/P99
44 ms/Maximum 65 ms mit 64 MiB. Der relative Vorteil blieb bestehen,
die stark abweichenden absoluten FPS belegen die Lastabhängigkeit.
Die Tests umfassen je 3.200 Frames mit festem 20-ms-Simulationsschritt,
keinen mehrstündigen interaktiven Lauf. Ruckelfreiheit bleibt offen:
selbst die neue q3dm0-Probe hatte P99 37 ms und einen 62-ms-Frame.
Eine zusätzliche q3dm1-Probe mit 6.000 Frames und Botkampf bestand bei
95,43 FPS, P99 32 ms und maximal 46 ms. Zwischen Frame 5500 und 6000
blieb der committed Heap bei 386 MiB; 1.327 Positionswechsel und 3.000
Angriffsframes wurden ausgeführt. Auch das ist keine Abnahme eines
stundenlangen interaktiven Spiels.

## Reproduktion

Aus dem Repository mit `build/baseq3/pak0.pk3` und den unveränderten
Original-QVMs unter `build/reference/qvms`:

```powershell
$env:MQ3_BUILD_TOOLCHAIN='release'
python scripts/test_playable_sky.py --pak build/baseq3/pak0.pk3
python scripts/test_qvm_scene_geometry.py
python scripts/test_shader_runtime.py --data-root build
python scripts/benchmark_playable_sky.py --prepare-only
python scripts/build.py --source tests/qvm_poly_geometry_benchmark.ml --output qvm_poly_geometry_benchmark.exe
./build/qvm_poly_geometry_benchmark.exe old
./build/qvm_poly_geometry_benchmark.exe direct
python scripts/test_ingame_controls_render.py --data-root build --map q3dm0 --singleplayer --mode moving --frames 3200 --fixed-step-ms 20 --cpu-profile --published-compiler --label gc128
python scripts/build_release.py
python scripts/test_default_exe_startup.py
```

Die zusätzliche Himmel-Aufnahme entstand mit
`tests/playable_sky_zenith_capture.ml`, `MQ3_CAPTURE` und dem produktiven
WGL-Backend; ihre BMP/PNG-Dateien unter `build/reports/` sind ignorierte
lokale Prüfartefakte. Für den GC-Vergleich wurden dieselben Replay-Argumente
mit 64-MiB- und 128-MiB-Binaries verwendet; die vollständigen Frame-Logs
und JSON-Zusammenfassungen liegen ebenfalls nur unter `build/reports/`.

Die anschließende native Verifikationsfolge fand einen unabhängig davon
vorhandenen Viewport-Rückgabefehler: Ein vollständig außerhalb der
Zeichenfläche liegender World-Batch meldete fälschlich alle Dreiecke als
gezeichnet. Der Pfad gibt jetzt null zurück. Der zuvor scheiternde
`playable_world_batch_native.c`-Vertrag sowie die gesamte
`playable_window_build_test.py`-Gruppe bestehen nach der Korrektur.
Die Verifikationsfolge ab `test_playable_sky.py` erreichte diesen zunächst
roten nativen Gate. Nach der Korrektur bestanden ab dort insgesamt 24 Gates,
einschließlich der Retail-Game-VM-Verträge bis `test_g_target_complete.py`;
die übrigen, für diese Änderung nicht nötigen Gates wurden in diesem Lauf
nicht ausgeführt. Ein vollständiger `verify.py`-Gesamtlauf ist damit nicht
behauptet. Der finale q3dm0-Botkampf mit der neu gebauten DLL bestand.
