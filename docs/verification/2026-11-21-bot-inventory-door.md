# q3dm0: Bot-Inventar und bewegliche Tür

Retail-Daten: `build/baseq3/pak0.pk3`. Das zuvor genannte
`D:/Quake3/baseq3/pak0.pk3` war bei der Prüfung nicht vorhanden.
QVMs: `build/reference/qvms` aus dem unveränderten Originalquellcode.
Compiler: veröffentlichte MiniLang-Version 1.3.9.

## Fehlerursachen

- `code/game/inv.h` der hier gebauten 1.32b-QVM definiert beispielsweise
  `INVENTORY_BULLETS=19` und `INVENTORY_HEALTH=29`. Das Retail-Archiv definiert
  in `botfiles/inv.h` dagegen `16` und `24`. Die Botlib wertete die
  Retail-Gewichte direkt gegen das QVM-Inventar aus. Crash hatte laut
  `playerState_t` 100 Patronen und besaß das Maschinengewehr, wählte aber
  die Nahkampfwaffe. Die Zuordnung der Retail-Indizes erfolgt nun genau
  einmal beim Parsen der Item- und Waffenprofile im produktiven Match-Pfad.
- In `maps/q3dm0.bsp` belegt Weltmodell 0 die Flächen 0 bis 5016. Die
  beweglichen Türmodelle `*12` und `*13` belegen danach sechs weitere
  Flächen, die auch in den Blattflächen stehen. Die statische Auswahl und
  ihr Geometrie-Cache beschränken sich nun auf den Flächenbereich des
  Weltmodells. Die beweglichen Instanzen bleiben erhalten.

## Prüfungen

| Prüfung | Ergebnis |
| --- | --- |
| `python scripts/test_ai_weapon_combat.py --pak build/baseq3/pak0.pk3` | 15 native ABI-Beobachtungen, 17 Verträge, 10 Retail-Prüfungen; Crash wählt mit 100 Patronen das Maschinengewehr |
| `python scripts/test_retail_inventory_layout.py --data-root build` | Alle 19 unterschiedlichen Retail-Inventarpositionen mit `code/game/inv.h` abgeglichen |
| `python scripts/test_singleplayer_bot_retail.py --data-root build` | q3dm0: 39 Waffenereignisse mit Spielerfeuer; **41 ohne Spielerfeuer** und Gesundheitsverlust; q3dm1: Bot- und Scoreboard-Verträge bestanden |
| `python scripts/test_retail_door_world.py --data-root build` | zwölf bewegliche, null statische Türdreiecke; die Türflächen sind tatsächlich in der Roh-Blattliste |
| `python scripts/test_world_surface_selection.py` | 53 Verträge bestanden |
| `python scripts/test_retail_movers.py build` | q3dm0/q3dm15/q3ctf4: 77.073.336 exakte Wörter und 1.684 geordnete Effekte wie im C-Original |
| `python scripts/test_ai_item_weights.py` | 12 native Beobachtungen, 25 Verträge bestanden |
| `python scripts/build_release.py` | Windows-`MiniQuake3.exe` mit MiniLang 1.3.9 gebaut; QVMs im Build vorhanden |
| `python scripts/test_default_exe_startup.py` | Hauptmenü mit lokalem `baseq3` in 0,31 s erreicht |
| `python scripts/test_qvm_preview.py --data-root build` | Original-QVM-Frame mit 492 Dreiecken, HUD und Audio bestanden |

Die Prüfungen belegen den QVM-Spielpfad, die Bot-Eingaben und die
Renderer-Auswahl mit Retail-Daten. Eine erneute interaktive Sichtprüfung der
Tür im Windows-Fenster und eine Langzeitabnahme sind noch offen. Die
Gesamtparität ist weiterhin nicht erreicht.

`python scripts/verify.py --data-root build` wurde gestartet. Der Hauptbuild
und die Gates bis einschließlich `test_message.py` bestanden. Der sehr lange
Gesamtlauf wurde während `test_huffman_message.py` beendet; er gilt deshalb
nicht als vollständig bestanden. Die oben genannten betroffenen Gates wurden
einzeln vollständig geprüft.
