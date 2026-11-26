# Portal-Sichtprüfung im Retail-Botkampf

Der Originalrenderer verwirft in `code/renderer/tr_main.c:SurfIsOffscreen`
Portale, deren gesamte Oberfläche außerhalb einer gemeinsamen Clip-Ebene
liegt. Der produktive MiniLang-Pfad in `portal_render_pass.prepare` prüfte
bisher nur die gröbere BSP-Flächenauswahl. Er konnte damit ein außerhalb
des Bilds liegendes Portal samt zweiter Weltansicht aufbauen.

`triangleInFrustum` prüft nun die vier seitlichen Clip-Ebenen der aktuellen
Kamera und die Nah-Ebene für jedes Dreieck der Portalfläche. Ein Dreieck wird
nur verworfen, wenn alle seine Vertices auf derselben Außenseite liegen.
Andere Dreiecke derselben Fläche bleiben prüfbar. Die originalen Backface- und
`portalRange`-Prüfungen sind noch nicht Teil dieses produktiven Pfads.

Die Cache-Diagnose verwendete 3.200 deterministische Frames auf `q3dm0`
mit der Retail-PK3, den unveränderten QVMs, einem Bot, Bewegung und Angriffen.
Sie protokollierte 413 Portal-Nachschläge, davon 161 Neubauten mit 160
unterschiedlichen Flächen-/Ebenen-Schlüsseln. Ein hypothetischer LRU-Cache
mit 2 bis 128 Einträgen hätte jeweils nur **einen** Neubau eingespart. Die
gezielte Vergrößerung des Portal-Caches ist daher verworfen.

Die Diagnose lokalisierte 147 Portalphasen ab 5 ms: 668 ms entfielen
zusammen auf Szenengeometrie, 572 ms auf Weltmaterialaufbau und 10 ms auf
Clipping. In 67 langsamen Weltmaterialaufbauten entfielen 532 ms auf
Shader-Pässe. Diese Summen stammen aus instrumentierten Läufen und sind
keine FPS-Messwerte.

## Gepaarter Produktivvergleich

Windows x64, NVIDIA RTX 5080, 1280×720, veröffentlichter MiniLang-Compiler
1.3.9, Original-QVMs und `build/baseq3/pak0.pk3`. Jeder Lauf nutzte 3.200
deterministische Frames auf `q3dm0` im Singleplayer, 20 ms festen Schritt.
Die Baseline ist der eingefrorene Build von `b1dfb994`; in jedem Paar lief
zuerst die Baseline, dann der Kandidat. Beide lieferten 752 Positionswechsel,
1.650 Angriffskommandos und 160 Munitionsabnahmen.

| Paar | Baseline FPS / P95 / P99 / Maximum | Mit Sichtprüfung FPS / P95 / P99 / Maximum |
| --- | ---: | ---: |
| 1 | 78,12 / 31 / 46 / 63 ms | 82,03 / 29 / 44 / 64 ms |
| 2 | 77,68 / 30 / 43 / 63 ms | 79,76 / 31 / 47 / 65 ms |
| 3 | 80,90 / 29 / 44 / 60 ms | 79,54 / 29 / 44 / 64 ms |
| Median | **78,12 / 30 / 44 / 63 ms** | **79,76 / 29 / 44 / 64 ms** |

Die Sichtprüfung reduzierte die Portal-Neubauten in jedem Lauf von 161 auf
144 und die Cache-Treffer von 252 auf 239: 30 unnötige Portalansichten
entfielen. Die mittlere FPS verbesserte sich im Median leicht. **P99 blieb
unverändert**, und die längsten Frames wurden nicht kürzer. Die verbleibenden
Ruckler im Botkampf sind offen. Der Vergleich liegt als Rohbericht unter
`build/reports/portal_frustum_q3dm0_ab.json`; 42 Portalverträge prüfen auch
Sichtflächen hinter und seitlich außerhalb der Kamera.

## Verifikationsumfang

`test_portal_render_pass.py` bestand 42 Verträge. `test_portal_view.py`
bestand drei Original-C-Datensätze und 17 Verträge, `test_tr_main_complete.py`
32/32 Symbole, drei C-Datensätze und 24 native Verträge.
`test_portal_clip_large.py` bestand zwei Großflächenverträge. Der
Windows-Hauptbuild mit MiniLang 1.3.9 gelang; SHA-256:
`ab32f8a64694b442915ba3e00d6c882fdfb69a59aa6b776c82defc17e73437dd`.
`test_default_exe_startup.py` erreichte das originale Menü beim direkten
Start der EXE in 0,42 s.

`MQ3_BUILD_TOOLCHAIN=release python scripts/verify.py --data-root build`
wurde zusätzlich gestartet. Die erreichten Grund-, Netzwerk-, Spiel-,
Bot- und Kartenobjekt-Gates waren grün. Der optionale Lauf wurde nach
`test_client_info.py` vor `test_client_connect.py` beendet; er ist **kein
abgeschlossenes Gesamttest-Ergebnis**. Die geänderten Portalpfade wurden
anschließend mit den genannten Einzel-Gates vollständig geprüft.
