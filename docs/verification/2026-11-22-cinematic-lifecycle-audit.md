# Film- und UI-Wechsel: Code-Audit vom 22. November 2026

Verglichen wurden die produktiven Pfade `qvm_menu_app.ml`,
`desktop_session.ml`, `cinematic_runtime.ml` und `roq.ml` mit
`code/client/cl_cin.c` und dem Retail-UI-Befehl aus `ui_cinematics.c`.
Testdaten: eigenes `build/baseq3/pak0.pk3`, unveränderte 1.32b-QVMs.
`D:/Quake3` war bei diesem Lauf nicht verfügbar.

## Befunde und Korrekturen

- Der Desktop zeichnete jedes Filmframe direkt, ließ die zusätzlichen
  `Draw`-Einträge aber bis zum Filmende in der Runtime-Queue. Sie hielten
  dekodierte RGBA-Frames im Speicher. Der Desktop verwirft die Aufträge
  unmittelbar nach dem Zeichnen; die QVM-Zeichenqueue für Shader-Filme bleibt
  als Verbraucher erhalten.
- Chunkindex, Audio- und Draw-Queues wuchsen mit wiederholter
  Array-Konkatenation. `std.ds.list` erhält Reihenfolge und Ergebnisform und
  vermeidet die quadratischen Kopien. Ein synthetischer Film mit 4.096 Chunks
  prüft die Position des letzten Indexeintrags.
- `CL_HandleCinEnd` leert `nextmap` nach dem Abspielen. Der Desktop hatte den
  Wert in seine gespeicherten Cvars übernommen und beim nächsten UI-Start
  wieder eingespielt. Der Folgebefehl bleibt erhalten; die gespeicherte Cvar
  wird vor der nächsten UI-Shell geleert.
- Fehler bei Eingabe, Präsentation, Textur-Upload und Audio verließen den
  Filmpfad vor der gemeinsamen Freigabe. Diese Zweige schließen jetzt Audio,
  Film und temporäre Textur über denselben Cleanup-Pfad.
- Das Ledger bezeichnete die gesamte RoQ-Übersetzung als vollständig getestet,
  obwohl JPEG-/Packet-Chunks offen sind. Der Status ist jetzt `tested_subset`.

## Ausgeführte Prüfungen

| Prüfung | Ergebnis |
| --- | --- |
| `scripts/test_roq_cinematics.py` mit Retail-PK3 | 13 Medienverträge und 210 Retail-idlogo-Frames bestanden |
| `scripts/test_desktop_session_retail.py --published` | Original-QVM-Postgame, Film-Folgebefehl, neue UI-Shell ohne altes `nextmap` bestanden |
| `scripts/test_ui_cinematics.py` mit Retail-PK3 | 5 Original-C-Differentialdatensätze, 18 Verträge, 11 Retail-RoQs bestanden |
| `scripts/test_qvm_video_materials.py` mit Retail-PK3 | 16 Shader-Videoverträge bestanden |
| `scripts/build_release.py` | Spielbare EXE mit MiniLang 1.3.9 gebaut |
| `scripts/test_desktop_cinematic_retail.py --data-root build` | Sichtbarer Windows-Film und Rückkehr zur Levelauswahl bestanden |
| `scripts/test_default_exe_startup.py` | Original-Hauptmenü nach 0,41 s erreicht |

SHA-256 des geprüften `build/MiniQuake3.exe`:
`b87a5c3f68286be5384beb71b6579d7a05a06498d706bba793f4e0628041db42`.

Die vollständige `verify.py`-Suite und ein längerer interaktiver
Singleplayer-Abschluss wurden bei diesem Audit nicht erneut ausgeführt.
JPEG-/Packet-RoQ, längere Filme, gezielt injizierte Audio-/GPU-Fehler und
vollständige Spielparität bleiben offen.
