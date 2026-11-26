# Gebündelte Specular-Passes, 23. November 2026

Der q3dm0-Retail-Probe zufolge beanspruchten drei unverformte
`lightingSpecular`-Passes mit 1.635, 664 und 1.709 Dreiecken zusammen
178 ms für 20 Aktualisierungen. Der bisherige MiniLang-Pfad berechnete
Position, UV und Farbe je Vertex erneut und rief die native Batch-Grenze
für jeden Vertex einzeln auf. Das geschah auch bei festen UVs und ohne
Deformation.

Für genau solche Passes speichert der Builder die unveränderlichen
Vertex-Normalen als binäre 32-Bit-Werte. Bei Sichtwechsel berechnet ein
einziger nativer Aufruf die Quake-III-Specular-Alphas für den ganzen Pass
und schreibt sie in die vorhandenen 128-Byte-Dreiecksrecords. Er bewahrt
die Reihenfolge der binären 32-Bit-Rechenoperationen und Quakes
`Q_rsqrt`. Der Retained-World-Selektor sammelt die zugehörigen Normalen
in derselben Face-Reihenfolge wie die Draw-Records. Verformte, animierte,
UV-modulierte oder nebelmodulierte Passes verwenden weiter den allgemeinen
MiniLang-Pfad. Die OpenGL-Ausgabe bleibt Fixed Function; diese Änderung
verlegt CPU-Shaderarbeit in einen gebündelten nativen Aufruf und ist kein
GLSL-Vertexshader.

Nachweise:

- Der Bytevergleich des nativen gegen den vorherigen Vertexpfad prüfte
  128 Dreiecke mit verschiedenen Positionen und Normalen aus drei
  Kamerapositionen sowie eine Aktualisierung nach Geometrie-Refresh.
- Derselbe vollständige Record-Bytevergleich bestand mit echten
  Retail-Shadern auf q3dm0 für acht Passes/4.265 Dreiecke und auf
  q3ctf1 für drei Passes/108 Dreiecke. Die q3dm1-Probe bestand ebenfalls;
  sie enthielt keinen für diesen Pfad geeigneten Pass.
- `test_shader_compute_colors.py` bestand 21 unveränderte Baseq3-
  ComputeColors/Specular-Records und 14 Verträge.
- `test_retained_world_batch.py --data-root build` bestand 54 Verträge
  und 432 Retail-Differentialfälle auf q3dm1, q3ctf1 und q3dm0. Der
  native Gather-Test deckt auch Reihenfolge, Grenzen und Alias-Schutz
  der 36-Byte-Normalenrecords ab.
- Der q3dm0-Materialtest bestand 68 World-Batch-Verträge und die
  Retail-Materialprobe. Die Hardware-Renderer- und 43 Portal-Verträge
  bestanden. `build_release.py` erstellte die Windows-EXE mit dem
  veröffentlichten MiniLang 1.3.9; `test_default_exe_startup.py`
  erreichte das Originalmenü mit lokalem `baseq3` im abschließenden
  Build in 0,44 s.
- Die isolierte q3dm0-Probe mit 20 Updates aller 107 dynamischen Passes
  sank von 317 auf 135 ms; die drei großen Specular-Passes von zusammen
  178 auf 7 ms. Die Werte sind Einzelproben, keine Framezeiten.
- Zwei abwechselnde produktive 3.200-Frame-Botkampfpaare auf der
  NVIDIA RTX 5080 ergaben 82,01/80,33 FPS für den vorherigen Quellstand
  und 82,82/83,80 FPS für den Batchpfad. P99 lag bei 43/44 statt
  40/40 ms; der längste Frame bei 64/64 statt 61/61 ms.
  Bewegungs-, Angriffs- und Munitionszähler blieben jeweils
  752/1.650/160, bei 1.790 Retained-World-Selektionen ohne Fallback.
- Nach dem abschließenden Wechsel auf einen wiederverwendeten
  Normalenpuffer ergaben zwei weitere Paare für den vorherigen Stand
  77,30/77,37 FPS und für den endgültigen Code 76,32/84,76 FPS.
  Diese Gesamt-FPS sind also nicht in jedem Paar besser. Die mittlere
  Renderphase sank in beiden Paaren von 3,95/3,93 auf 3,24/2,99 ms;
  P99 von 46/44 auf 42/41 ms und der längste Frame von 68/62 auf
  62/57 ms. Im schwächeren Kandidatenlauf stiegen zugleich die
  unberührten Simulations- und Geometriezeiten, was den FPS-Vergleich
  überlagert. Die Spielzähler blieben gleich.

Die starken Gewinne der isolierten Shaderpasses übertragen sich nur
teilweise auf den ganzen Botkampf; ein durchgehend höherer Gesamt-FPS-Wert
ist nicht nachgewiesen. Cgame, Geometrieaufbereitung, andere
Shaderpasses und gelegentliche CPU-Spitzen bleiben offen. Die A/B-Werte
beweisen keine vollständige Ruckelfreiheit oder 1:1-Performanceparität.
Ignorierte Rohlogs: `build/reports/specular_batch_{baseline,candidate}_{a,b}.log`
und `build/reports/specular_batch_{baseline,candidate}_final*.log` sowie
`build/reports/specular_batch_stage_probe.log`.
Der begonnene Gesamtlauf `verify.py --data-root build` wurde nach 24
bestandenen Gates während `test_server_download.py` beendet. Er ist
damit ausdrücklich kein vollständiger Verify-Nachweis; das Rohlog liegt
unter `build/reports/specular_batch_verify.log`.
