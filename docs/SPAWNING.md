# Karten-Entities und Spawn-Funktionen

`game/spawn.ml` überträgt den Kontrollfluss aus dem vollständigen ursprünglichen
`g_spawn.c`: Entity-Tokens, Spawn-Variablen, Feldzuweisung, Spielmodusfilter,
Worldspawn und die Auswahl von Item-/Klassen-Spawn-Funktionen. Die generierten
Tabellen enthalten 20 Feldregeln, 48 baseq3-Klassen und 35 Items. Sie werden aus
den gepinnten Originalquellen erzeugt und gegen die ursprüngliche C-Tabelle geprüft.

**Stand der Klassen:** Alle 48 Klassen und alle 35 Item-Einträge führen übertragene
Originalregeln aus. Die zuletzt ergänzten Mover `func_plat`, `func_button`,
`func_door`, `func_static`, `func_rotating`, `func_bobbing`, `func_pendulum` und
`func_train` besitzen Binärzustände, Teambewegung, Blockieren/Zurückrollen,
Touch-Auslösung, Sounds und `path_corner`-Ketten. Rotationsbedingtes Mitschieben,
Client-Yaw und Areaportal-Umschaltung sind implementiert; die linearen und rotierenden
Schiebepfade sind implementiert. `G_SpawnItem` und `FinishSpawningItem` erzeugen echte
Item-Entities. `Touch_Item` und sämtliche Baseq3-Pickups sind inzwischen separat
gegen C geprüft. Die Testkarten sind wegen der übrigen Client-/Serverpfade noch
keine vollständigen, spielbaren Game-Server.

| Aufruf | Verhalten |
| --- | --- |
| `spawn.create(level, text)` | Neuer Spawn-Kontext für den Entity-Text; setzt `level.spawner` und bindet die echte Schadensfunktion für KillBox |
| `spawn.parseVars(state)` | Nächste Gruppe mit höchstens 64 Paaren und 4.096 gespeicherten Bytes |
| `spawn.getString`, `getInt`, `getFloat`, `getVector` | Originale Such- und Konvertierungsregeln mit Vorgabewert und Found-Flag |
| `spawn.parseField(key, value, ent)` | Alle 20 Einträge aus `fields[]`, einschließlich `angle`, ignoriertem `light` und Shader-Namen |
| `spawn.fromVars`, `callSpawn`, `load` | Platzverwaltung, Filter, Positionsübernahme, Klassenaufruf und vollständige Textschleife |
| `spawn.worldspawn` | Game-Version, Startzeit, Musik, Kartentext, MOTD, Schwerkraft, Dust/Breath und Warmup |
| `spawn_values.configIndex`, `modelIndex`, `soundIndex` | Indexsuche, Wiederverwendung, Kapazität und Configstring-Anlage |
| `spawn_functions.setBrushModel`, `initTrigger` | Inline-Modellgrenzen, die ursprüngliche frühe Verlinkung und Trigger-Flags |
| `spawn_functions.setMovedir`, `aimAtTarget` | Auf-/Abwärts-Sonderwinkel und Sprunggeschwindigkeit zum Zielscheitelpunkt |
| `spawn_functions.runThink` | Originales `G_RunThink`, einschließlich Float-Rundung des Integer-Zeitpunkts |

Bereits umgesetzte Klassen: `info_player_start`, `info_player_deathmatch`,
`info_player_intermission`, `info_null`, `info_notnull`, `info_camp`, `func_group`,
`trigger_push`, `trigger_teleport`, `target_position`, `light`, `path_corner`,
`misc_teleporter_dest`, `misc_model`, die vier `team_CTF_*player/*spawn`-Klassen
und `item_botroam`. Hinzugekommen sind `target_delay`, `target_relay`,
`target_teleporter`, `trigger_multiple`, `trigger_always`, `target_speaker`,
`target_push`, `func_timer` und `target_location`; ihre Use-/Think-
Abläufe sind unter [Targets und Ereignisse](TARGETS_AND_EVENTS.md) beschrieben.
`trigger_hurt`, `target_kill` und `target_laser` verwenden die [portierte Schadensberechnung](COMBAT.md).
Die drei [Shooter-Klassen](MISSILES.md) erzeugen Raketen, Granaten und Plasma
mit ursprünglicher Zielsuche und Streuung. Die vier
[Give-/Powerup-/Score-/Print-Targets](MAP_TARGETS.md) verwenden die tatsächlichen
Item-, Flaggen- und Scoreabläufe. [Portalflächen und -kameras](PORTALS.md)
übernehmen Mirror-/Kameradaten, verzögerte Zielsuche und Richtungskodierung;
die Darstellung durch Renderer und Cgame bleibt offen.
Manche dieser Originalfunktionen sind leer oder geben die
Entity sofort frei; auch dieses Verhalten bleibt erhalten.

Die Feldzuweisung liest alle Paare in Reihenfolge; bei doppelten Feldern gewinnt
die letzte Zuweisung. Die `G_Spawn*`-Getter verwenden dagegen den ersten passenden
Schlüssel, ohne Beachtung der ASCII-Großschreibung. Sie suchen auch bei
`state.spawning == false` weiter in den noch gespeicherten Paaren, wie der Code
es tatsächlich tut. Klassennamen und Configstring-Namen bleiben case-sensitive.
Der `gametype`-Filter benutzt eine Teilstringsuche. `notsingle`, `notteam`,
`notfree` und `notq3a` folgen dem baseq3-Profil; `notta` filtert hier nicht.

`G_NewString` wandelt `\n` um; bei anderen Backslash-Paaren bleibt nur ein
Backslash. Worldspawn-Strings kommen direkt aus den Spawn-Variablen und durchlaufen
diese Feldkonvertierung nicht. `atoi`, `atof` und die drei `%f`-Konvertierungen
verwenden dieselbe Windows-C-Laufzeit wie die native Referenz. Die MiniLang-Seite
übergibt die drei Ausgabepuffer über die x64-Varargs-ABI an
`__stdio_common_vsscanf`; die eigene native DLL bleibt bei drei Zahlen-ABI-Helfern.
Dies ist kein Nachweis eines QVM- oder abweichenden Locale-/Retail-CRT-Profils.

Unvollständige Feldvektoren würden in C uninitialisierte Stack-Werte übernehmen.
Ein abschließender Backslash kann bei `G_NewString` den NUL-Abschluss verlieren.
Beides weist MiniLang kontrolliert zurück. Ein unvollständiger Vektor im
`G_SpawnVector`-Getter lässt dagegen die nicht eingelesenen Komponenten unverändert;
das ist definiert und wird gegen C geprüft. Parser- und Speichergrenzen sowie
noch nicht implementierte Klassen werden getrennt geprüft.

`state.effectFn(state, kind, index, key, value)` beobachtet Configstring-Setzen
(`kind=1`), Cvar-Setzen (`2`) und die Warmup-Logmeldung (`3`). Die Werte werden
im lokalen Configstring-Feld bzw. im vorhandenen Cvar-Register gespeichert.
Ihre Verteilung an Netzwerkclients ist weiterhin Teil der späteren Serverarbeit.
`state.unportedFn(state, ent, kind, index)` bezeichnet bei `kind=2` einen noch
nicht portierten Klassenindex ab 0 aus `spawn_tables.ml`.

`state.gravity` entspricht dem zwischengespeicherten `g_gravity.value` des
Game-Moduls. Ein `trap_Cvar_Set` aktualisiert diesen VM-Wert im Original nicht
sofort; der echte Frame aktualisiert ihn vor der Think-Verarbeitung. Die Tests
führen dieselbe Aktualisierung vor den Think-Aufrufen aus. Ein Sprungpad plant
`AimAtTarget` für `level.time + 100`; erst dann sind später im Text angelegte
Targets verfügbar. Fehlende Targets oder eine Flugzeit von null geben es frei.

Die C-Prüfung kompiliert `g_spawn.c` vollständig und bindet unveränderte
Server-/Kollisionsdateien sowie extrahierte vollständige Game-Funktionen ein.
Der Host stellt Speicher, Configstrings, Cvar-Effekte und die ausdrücklich
markierten offenen Klassen bereit. Nach dem Laden vergleicht er alle bisher
modellierten Entity-Felder und Aufrufreihenfolgen vor, am und nach dem Think-Termin.
Die neuen privaten Schadensfelder werden zusätzlich in `test_combat.py` geprüft. Danach werden
Spieler in die geladenen Trigger gesetzt und komplette PlayerStates verglichen.
Der reguläre Spawn-Vergleich beobachtet auch `G_Printf`-Diagnosen. Dazu gehören
die ursprünglichen Warnungen zu Timer-/Multiple-Zufallswerten, fehlenden
Path-Corner-Namen und Teleporter-/Laserzielen. Der
Zeitpräfix des Server-Loggers wird separat geprüft; die Warmup-Logmeldung
bleibt in der isolierten Spawn-Suite ein roher Aufruf.
Dies prüft noch keine vollständigen ClientThink-/Serverframes. Der Mover-Framezweig
und lokale Spawn-/Bewegungsverträge sind enthalten. `scripts/test_mover_push.py`
vergleicht den Schiebekern zusätzlich in fünf isolierten Erfolgs-, Rotations-,
Blockade-, Stop- und Team-Rollback-Fällen direkt mit `G_MoverPush`/`G_MoverTeam`.
Vollständige Karten-Replays stehen noch aus. Die zusätzliche Item-Prüfung deckt Initialisierung, Respawn,
Drop-Entities, Pickups, CTF-Abläufe und Physik ab; die Target-/Ereignisprüfung deckt die Entity-Schleife
mit automatischer Ereignisfreigabe ab.

```powershell
python scripts/test_spawn_values.py
python scripts/test_targets.py
python scripts/test_map_objects.py
python scripts/test_combat.py --data-root D:/Quake3
python scripts/test_missiles.py --data-root D:/Quake3
python scripts/test_items.py
python scripts/test_spawn.py D:/Quake3
```
